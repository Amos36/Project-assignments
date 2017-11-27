class Specialist{
int centerX,centerY,offset1,offset2;

  Specialist(){
   centerX = round(random(0,width));
  centerY = round(random(0,height));
  offset1 = 15;
  offset2 = 17; 
    
  }
  void update(){
  centerX = round(random(-5,5))+centerX;
  centerY = round(random(-5,5))+centerY;
}

void draw(){
  rectMode(CENTER);
  fill(0,0,255);
  rect(centerX,centerY,100,300);
  //I experimented to see what would happen if I added frameCount instead of adding
  /*offset1 and offset2*/
  fill(255);
  rect(centerX-offset1,centerY+offset2,frameCount%200,frameCount%200);
  //I took what I learned from the Zero functions and applied it to my Class.
  fill(255,0,0);
  rect(100,400,centerX-offset1,centerY-offset2);
}
}