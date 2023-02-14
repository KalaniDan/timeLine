

Deck d = new Deck();
Board b;
Boolean iLoveCoding = true;
int gameState = 0;
int rand = 0;
int player = 1;
Hand hOne, hTwo, hThree, hFour, current;

void setup(){
  background(0);
  size(1600,800);
  d.shuffle();
  b = new Board();
  
}

void draw(){
  if(gameState == 0){
    startScreen();
    if(keyPressed){
      if(key == '2'){
        gameState = 1;
      }if(key == '3'){
        gameState = 2;
      }if(key == '4'){
        gameState = 3;
    }if(key == '5'){
      gameState = 4;  
      }
    }
  }
  //TWO PLAYERS
  if(gameState == 1){
    if(iLoveCoding){
      Hand[] p = numPlay(2);
      hOne = p[0];
      hTwo = p[1];
      iLoveCoding = false;
    }
    if(player == 1){
      current = hOne;  
    }
    if(player == 2){
      current = hTwo;  
    }
    playState();
    System.out.println(d.count);
    endGame();
    if(keyPressed){
      if(key == '1'){
        player = 1;
      }
      if(key == '2'){
        player = 2;  
      }
    } 
  }
  //THREE PLAYERS
  if(gameState == 2){
    if(iLoveCoding){
      Hand[] p = numPlay(3);
      hOne = p[0];
      hTwo = p[1];
      hThree = p[2];
      iLoveCoding = false;
    }
    if(player == 1){
      current = hOne;  
    }
    if(player == 2){
      current = hTwo;  
    }
    if(player == 3){
      current = hThree;  
    }
    playState();

    if(keyPressed){
      if(key == '1'){
        player = 1;
      }if(key == '2'){
        player = 2;  
      }if(key == '3'){
        player = 3;
      }
    }
  }
    //FOUR PLAYERS
   if(gameState == 3){
    if(iLoveCoding){
      Hand[] p = numPlay(4);
      hOne = p[0];
      hTwo = p[1];
      hThree = p[2];
      hFour = p[3];
      iLoveCoding = false;
    }
    if(player == 1){
      current = hOne;  
    }
    if(player == 2){
      current = hTwo;  
    }
    if(player == 3){
      current = hThree;  
    }
    if(player == 4){
      current = hFour;
    }
    playState();
    endGame();
    if(keyPressed){
      if(key == '1'){
        player = 1;
      }if(key == '2'){
        player = 2;  
      }if(key == '3'){
        player = 3;
      }
    }
  }

  if(gameState > 3){
    endScreen();
  }
}


public Hand[] numPlay(int numPlay){
    Hand[] p = new Hand[numPlay];
    for(int i = 0; i < numPlay; i++){
      p[i] = new Hand();
    }
    return p;
}

/* OLD CODE; MADE MORE EFFICIENT METHOD
public Hand[] threePlay(){
    Hand[] p = new Hand[3];
    for(int i = 0; i < 3; i++){
      p[i] = new Hand();
    }
    return p;
}

public Hand[] fourPlay(){
    Hand[] p = new Hand[4];
    for(int i = 0; i < 3; i++){
      p[i] = new Hand();
    }
    return p;
}
*/

void emptyBoard(){
  line(0, height/2, width, height/2);
  line(0, height/2 + 100, width, height/2 + 100);
  for(int i = 0; i < width / 60 + 1; i++){
    line(i*60, height/2 - 10, i*60, height/2 + 110);  
  }
}
void drawBoard(){
  stroke(0);
  fill(0,0,255);
  for(int i = 0; i < b.board.size(); i++){
      rect(60+(i*60), height/2, 60, 100);
      text(b.getCard(i).toString(), 90+(i*60), height/2);
  }
}

/*void drawHand(Hand hh){
  //variable to keep shrink hand every time a card is removed
  int leng = 0;
  for(int i = 0; i < hh.size; i++){
    if(hh.h[i].getExistence()){
      rect(0+(leng*50), height - 100, 50, 100);
      text(hh.h[i].toString(), 25+(leng*50), height - 100);
      leng++;
    }
  }
}
*/
void playState(){

    background(0);
    stroke(255);
    emptyBoard();
    drawBoard();
    drawHand(current);
    takeTurn();
/*
    for(int i = 0; i < b.board.size(); i++){
      //compare the position of card to run addToBoard
      //START BACK HERE
      for(int j = 0; j < current.size; j++){
        if(current.h[j].xst && current.h[j].isActive  && current.h[j].x + 30 < b.board.get(i).x + 60 && current.h[j].x + 30 > b.board.get(i).x+ 30){
          current.placeCard(j, i + 1);
        }
      }
    }*/ 
}

void drawHand(Hand hh){
  stroke(0);
  fill(0,255,0);
  for(int i = 0; i < 7; i++){
    if(hh.h[i].getExistence()){
      rect(hh.h[i].x, hh.h[i].y, 60, 100);
      text(hh.h[i].toString(), 30 + hh.h[i].x, hh.h[i].y);
    }
  }
}

void takeTurn(){
  if(current.getActive() > -1){
    if(current.h[current.getActive()].y + 50 > height/2 && current.h[current.getActive()].y + 50  < height/2 + 100 ){
      int p = current.h[current.getActive()].x / 60;
      if(p > b.board.size()){
          p = b.board.size();
      }
      current.placeCard(current.getActive(), p);
    }
  }
}

void startScreen(){
  strokeWeight(2);
  
  text("Use the num keys to select the amount of players up to 4", width/2 - 141 , height/2);  

}
void endGame(){
  if(current.size == 0){
    gameState = player * 4;  
  }
}
void endScreen(){
  //draws end screen depending on winner
  background(0);
  String winner = "Player ";
  if(gameState == 4){
    text(winner + player + " wins!", width/2, height/2);
  }if(gameState == 8){
    text(winner + player, width/2, height/2);
  }if(gameState == 12){
    text(winner + player, width/2, height/2);
  }if(gameState == 16){
    text(winner + player, width/2, height/2);
  }
}

void mousePressed(){
  if(gameState > 0){
    for(int i = 0; i < current.size; i++){
        if(mouseX > current.h[i].x && mouseX < current.h[i].x + 50 && mouseY > current.h[i].y && mouseY < current.h[i].y + 100){
           current.h[i].isActive = true;
        }
    }
  }
}

void mouseDragged(){
  if(gameState > 0){
    for(int i = 0; i < current.size; i++){
      //TRYING TO FIX STACKING CARDS
   //   if(current.getActive() == -1){

        if(current.h[i].isActive && mouseX > current.h[i].x && mouseX < current.h[i].x + 50 && mouseY > current.h[i].y && mouseY < current.h[i].y + 100){
          if(mouseX - 30 > 0 && mouseX + 30 < width && mouseY - 50 > 0 && mouseY + 50 < height){
            current.h[i].x = mouseX - 30;
            current.h[i].y = mouseY - 50 ;
          }
        }

    //  }
    }
  }
}

void mouseReleased(){
   if(gameState > 0){
    for(int i = 0; i < current.size; i++){
        if(mouseX > current.h[i].x && mouseX < current.h[i].x + 50 && mouseY > current.h[i].y && mouseY < current.h[i].y + 100){
          current.h[i].isActive = false;
        }
    }
  }
}
