class Enemy{
  //variables
  int x;
  float y; 
  int d;
  int speed;
  boolean shouldRemove;
  int left; int right;
  float top; float bottom;
  int enemyScore;

  // constructor
  Enemy(int startingX, float startingY, int startingSpeed){
    x = startingX;
    y = startingY;
    d = 20;
    speed = startingSpeed;
    shouldRemove = false;
    left = d- d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
    
  }

void render (){
  image(pikachuImg, x, y);
}

void move(){
  x -= speed;
  
    left = x- d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  
}
void checkRemove(){
  if (x<0){
    shouldRemove = true;
    
  }
}
void handleEnemyScore(Player ap) {
  if (x < 0) {
    ap.enemyScore += 1;
  }
}

//Collision between enemy and palyer
void shootEnemy(Player aPlayer){
  if (top <= aPlayer.bottom &&
  bottom >= aPlayer.top&&
  left <= aPlayer.right&&
  right >= aPlayer.left){
     shouldRemove = true;
    aPlayer.playerScore+=1;
     caughtSound.play();
   
}
}
} 
