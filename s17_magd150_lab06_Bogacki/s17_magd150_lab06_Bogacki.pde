Specialist mySpecialist;
int circleX,circleY,w,h;

void setup(){
  size(500,500);
  mySpecialist = new Specialist();
}

void draw(){
  background(0);
  mySpecialist.update();
  mySpecialist.draw();
  //I wanted to create some sllipses in my sketch, so I created these 2 custom functions.
  updateZero();
  drawZero();
}

void updateZero(){
  circleX = round(random(-4,4))+circleX;
  circleY = round(random(-4,4))-circleY;
  w = 200;
  h = 200;
}

void drawZero(){
  ellipseMode(CENTER);
  fill(0,128,0);
  ellipse(circleX,circleY,w,h);
  fill(255,255,0);
  // I started experimenting with the placement of circleX and circleY and created this
  /* awesome animation*/
  ellipse(300,300,circleX,circleY);
  fill(128,0,128);
  ellipse(200,300,circleX,circleY);
  fill(192,192,192);
  ellipse(200,200,circleX,circleY);
  fill(0,255,255);
  ellipse(300,200,circleX,circleY);
}