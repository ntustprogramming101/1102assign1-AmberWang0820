PImage skyImg;
PImage groundhogImg;
PImage lifeImg;
PImage robotImg;
PImage soilImg;
PImage soldierImg;

int soldierX, soldierY;//soldier's position
int soldierSpeed;
int robotX, robotY;//robot's position
int laserX1, laserX2, laserY;//laser's position, laserX1=laserX2
float laserLenght;
int laserSpeed;


void setup() {
	size(640, 480, P2D);

  //load the pictures
	skyImg = loadImage("img/bg.jpg");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  soilImg = loadImage("img/soil.png");
  soldierImg = loadImage("img/soldier.png");
  robotImg = loadImage("img/robot.png");
  
  //soldier
  soldierX = -160;
  soldierY = 80*floor(random(2,6));
  soldierSpeed = 3;//soldier
  
  //robot
  robotX = 80*floor(random(2,8));
  robotY = 80*floor(random(2,6));
  
  //laser
  laserX1 = robotX+25;
  laserX2 = robotX+25;
  laserY = robotY+37;
  laserLenght=2;
  laserSpeed=2;

}

void draw() {
  //background
	image(skyImg,0,0);//sky
  fill(253, 184, 19);//sun
  strokeWeight(5);
  stroke(255, 255, 0);
  ellipse(590,50,120,120);
  image(soilImg,0,160);//soil
  strokeWeight(15);//grass
  stroke(24, 204, 25);
  line(0,152.5,640,152.5);
  image(lifeImg,10,10);//lifeHeart (size: 50*43)
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  
  //characters
  
  //Drae groundhog
  image(groundhogImg,280,80);
  
  //Draw soldier
  image(soldierImg,soldierX,soldierY);
  soldierX += soldierSpeed;//soldier Walking Speed
  if(soldierX > 640){
     soldierX = -80;
     soldierX += soldierSpeed;
  };
  
  //Draw robot
  image(robotImg,robotX,robotY);
  
  //Draw laser
  strokeWeight(10);
  stroke(255,0,0);
  line(laserX2,laserY,(laserX1-=laserSpeed) -laserLenght++,laserY);
  if(laserLenght++ > 20){
    laserX2-=laserSpeed;
    laserLenght=20;
  }
  if(robotX-140 >= laserX1){
    laserLenght=0;//let laser from short to long
    laserX1=robotX+25;
    laserX2=robotX+25;
  }
}
