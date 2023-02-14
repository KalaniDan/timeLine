public class Card{
  public String [] events = new String[50];
  public int[] years = new int[50];
  //public String[] events = {"Declaration of Independence", "American Civil War", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"};
  //public int[] years = {1776, 1860, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
  public String evt;
  public int yr;
  boolean xst = true;
  int x ;
  int y ;
  boolean isActive = false;
  

  public Card(){
    evt = "";
    yr = 0;
  }
  public Card(int y){
    for(int i = 0; i < 50; i++){
      events[i] = "" + i;
      years[i] = i;
    }
    evt = events[y];
    yr = years[y];
  }
  
  public int getYr(){
    return yr;  
  }
  
  public boolean getExistence(){
    return xst;  
  }
  
  public String toString(){
    return evt;  
  }
  
}
