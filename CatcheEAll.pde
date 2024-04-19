import processing.sound.*;
PImage backgroundImg;
PImage grassImg;
PImage lostImg;
PImage winImg;
PImage pokeballImg;
PImage pikachuImg;

int sendEnemy = 800;
int currentTime;
int startTime;
int difficultyStartTime;
int state = 0;
int enemyWin;
int speedInterval = 10000;
int enemySpeed = 7 ;

//declaring my vars
SoundFile pokemonSound;
SoundFile lawandorderSound;
SoundFile thatshotSound;
SoundFile caughtSound;

Enemy e1;
Player p1;
ArrayList<Enemy> enemyList;

int level = 0;

void setup() {
  size(1200, 800);
  backgroundImg = loadImage("background.jpeg");
  grassImg = loadImage("grass.jpeg");
  lostImg = loadImage("lost.jpeg");
  winImg = loadImage("win.jpeg");
  pokeballImg= loadImage("pokeball_0.png");
  pikachuImg= loadImage("pikachu.png");

  imageMode(CENTER);
  
  pokeballImg. resize(120,120);
  pikachuImg.resize(50,50);
  backgroundImg.resize(1200,800);
  winImg.resize(1200,800);
  lostImg.resize(1200,800);
  grassImg.resize(1200,800);
  
  p1 = new Player(20, height/2, 20, 70);
  enemyList = new ArrayList<Enemy>();

  startTime = millis();
  difficultyStartTime = millis();

  //intialize my vars
  pokemonSound= new SoundFile(this, "pokemon.wav");
  caughtSound= new SoundFile(this, "caught.wav");
  lawandorderSound= new SoundFile(this, "lawandorder.wav");
  thatshotSound= new SoundFile(this, "thatshot.wav");

  pokemonSound.rate(1);
  lawandorderSound.rate(1);
  caughtSound.rate(1);
  thatshotSound.rate(1);

  rectMode(CENTER);
}

void draw() {
  background(69);

  switch(state) {
  case 0:
    startScreen();
    break;
  case 1:
   image(grassImg,width/2,height/2);
    p1. render();
    image(pokeballImg, p1.x, p1.y);
    p1. move();
    p1. drawText();
    p1. handlePlayerScore();
    for (Enemy aEnemy : enemyList) {
      aEnemy.render();
      aEnemy.move();
      aEnemy.shootEnemy(p1);
      aEnemy.handleEnemyScore(p1);
      aEnemy.checkRemove();
      
    }

    for (int i = enemyList.size()-1; i >= 0; i-=1) {
      Enemy aEnemy = enemyList.get(i);

      if (aEnemy.shouldRemove == true) {
        enemyList.remove(aEnemy);
      }
    }
    //play a sound on a loop
    if (pokemonSound.isPlaying() == false) {
      pokemonSound.play();
    }
    currentTime = millis();
    if (currentTime - startTime > sendEnemy) {

      Enemy newEnemy = new Enemy(1200, random(20, 790), enemySpeed);
       if (currentTime - difficultyStartTime > speedInterval) {
        enemySpeed += 4;
        difficultyStartTime = millis();
      }
     

      enemyList.add(newEnemy);
      startTime = millis();
    }
     p1. checkPlayerWin();
    break;
  case 2:
  if (thatshotSound.isPlaying() == false) {
      thatshotSound.play();
    }
  pokemonSound.stop();
    p1. playerWin();
    break;
  case 3:
  if (lawandorderSound.isPlaying() == false) {
      lawandorderSound.play();
    }
  pokemonSound.stop();
    endScreen();
    break;
  }
}
//closing Draw
void startScreen(){
  image(backgroundImg,width/2,height/2);
  textAlign(CENTER);
  textSize(100);
  text("Press Space to Catch 'Em!", width/2, 780);
  textSize(60);
  text("Controls W & S",width/2,45);
  fill(255);
   p1 = new Player(20, height/2, 20, 70);
  enemyList = new ArrayList<Enemy>();
}

void endScreen(){
   image(lostImg,width/2,height/2);
   textSize(60);
text("Press R to Return", 750,690);
fill(0);
}
void keyPressed() {
  if (key == 'w') {
    p1.isMovingUp = true;
  }

  if (key == 's') {
    p1.isMovingDown = true;
  }
  if ( key == ' ') {
    state = 1;//state = state + 1
  }
      if ( key == 'r') {
    state = 0;//state = state + 1
    enemySpeed = 8;
    
  }
}

void keyReleased() {
  if (key == 'w') {
    p1.isMovingUp = false;
  }

  if (key == 's') {
    p1.isMovingDown = false;
  }
}
