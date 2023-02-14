public class Board{
  
  ArrayList<Card> board = new ArrayList<Card>();
  ArrayList<Card> discard = new ArrayList<Card>();
  
  public Board(){
    for(int i = 0; i < 1; i++){
      board.add(d.currCard());
    }
  }
  
  public Card getCard(int pos){
    return board.get(pos);
  }
  
  public String toString(){
    String output = "";
    for(int i = 0; i < board.size(); i++){
      if(i != board.size() - 1){
        output += board.get(i).toString() + ", ";  
      }else{
        output += board.get(i).toString();
      }
    }
    return output;  
   }
  
}
