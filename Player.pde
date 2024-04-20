class Player {
 
  // variables
  int playerScore;
  int enemyScore;
  int x;
  int y;
  int w;
  int h;
  
  boolean isMovingUp;
  boolean isMovingDown;
  int left; int right;
  int top; int bottom;
  int speed;
  
  //constructor 
  Player(int startingX, int startingY, int startingW, int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    left = x- w/2;
    right = x +w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    speed = 17;

isMovingUp = false;
isMovingDown = false;
  }
  
  // functions
  void render(){
    stroke(0);
  }
  
  void move(){
        
    left = x- w/2;
    right = x +w/2;
    top = y - h/2;
    bottom = y + h/2;
    
   if (isMovingUp == true){
     y -= speed;
     
   }
   if (isMovingDown == true){
    y += speed; 
   }
  }
  void drawText() {
    textSize(70);
  rect(1100,80,60,70);
  fill(#3BB20D);
  text(playerScore, 1100, 100);
  fill(0);
  
}
void handlePlayerScore() {
  if (x > width) {
    playerScore += 1;
    y = height/2;
    x = width/2;
  }
  
}
void checkPlayerWin(){
  if(playerScore == 30){
    state= 2;
  }
  
  if(enemyScore == 10){
    state = 3;
  }
}
void playerWin(){
  image(winImg,width/2,height/2);
  text("Press R to Return", width/2,40);
  fill(255);
}
}
