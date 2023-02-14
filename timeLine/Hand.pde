public class Hand{
  Card[] h = new Card[7];
  int size = 7;
  
  public Hand(){
      for(int i = 0; i < 7; i++){
        h[i] = d.currCard();
        h[i].x = i*60;
        h[i].y = height - 100;
      }
  }
  
   public void placeCard(int card, int index){
     if(index > b.board.size() - 1 ){
       if(b.board.get(index - 1).getYr() < h[card].getYr()){
         b.board.add(index, h[card]);
         h[card].xst = false;
         size--;
       }else{
        // b.discard.add(h[card]);
         h[card] = d.currCard();  
       }
     }else{
       if(b.board.get(index).getYr() > h[card].getYr()){
         b.board.add(index, h[card]);
         h[card].xst = false;
         size--;
       }else{
        // b.discard.add(h[card]);
         h[card] = d.currCard();
       }
     }
  }
  
  public int getActive(){
    int output = -1;
    for(int i = 0; i < h.length; i++){
        if(h[i].isActive){
          output = i;  
        }
    }
    return output;
  }
  
  public String toString(){
    String output = "";
    //adds card names together
    for(int i = 0; i < size; i++){
      if(i != size - 1){
        output += h[i] + ", ";  
      }
      //just to remove the comma from the last card in the string
      else{
        output += h[i];
      }
    }
    return output;
  }
}
