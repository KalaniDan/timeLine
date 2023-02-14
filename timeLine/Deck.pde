public class Deck{
  //length of deck
  public int o = 50;
  public int count = -1;
  Card[] cards = new Card[o];
  
  public Deck(){
    for(int i = 0; i < o; i++){
      cards[i] = new Card(i);  
    }
  }
  
  public void shuffle(){
    int f;
    int s;
    Card temp = new Card();
    for(int i = 0; i < o; i++){
        f = (int)random(o);
        s = (int)random(o);
        temp = cards[f];
        cards[f] = cards[s];
        cards[s] = temp;
      }
    }
  
  public Card currCard(){
    count++;
    return cards[count];
  }
  
  public String toString(){
    return cards[0].toString();  
  }
  
}
