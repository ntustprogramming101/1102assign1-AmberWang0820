PImage skyImg;
PImage groundhogImg;
PImage lifeImg;
PImage robotImg;
PImage soilImg;
PImage soldierImg;

int sx, sy;//soldier's position
int speedsX;
int rx, ry;//robor's position
int lx, ly;//laser's position
int speedlX;//laser


void setup() {
	size(640, 480, P2D);
	skyImg = loadImage("img/bg.jpg");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  soilImg = loadImage("img/soil.png");
  soldierImg = loadImage("img/soldier.png");
  robotImg = loadImage("img/robot.png");
  
  sx = -160;
  sy = 80*floor(random(2,6));
  speedsX = 3;//soldier
  
  rx = 80*floor(random(2,8));
  ry = 80*floor(random(2,6));

  lx = rx+25;//laser
  ly = ry+37;
  speedlX = 2;//laser's speed

}

void draw() {
  //background
	image(skyImg,0,0);//sky
  fill(253, 184, 19);//sun
  strokeWeight(5);
  stroke(255, 255, 0);
  circle(590,50,120);
  image(soilImg,0,160);//soil
  strokeWeight(15);//grass
  stroke(24, 204, 25);
  line(0,152.5,640,152.5);
  image(lifeImg,10,10);//lifeHeart (size: 50*43)
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  
  //characters
  image(groundhogImg,280,80);//groundhog
  
  image(soldierImg,sx,sy);//soldier
  sx += speedsX;//walkingSpeed
  if(sx > 640){
     sx = -80;
     sx += speedsX;
  };
  
  image(robotImg,rx,ry);//robot
  
  strokeWeight(10);//laser
  stroke(255,0,0);

  line(lx,ly,lx-30,ly);
  lx -= speedlX;

  }
