PShape box,sphere;
PImage texture;
float x,y,z;
float angle, camSpeed,lookAtY,orthoScale,viewDist,
extents = 250;
boolean orthographic;
boolean showDiagnosticImages = true;

void setup(){
  size(500,600,P3D);
  x = width/2;
  y = height/2;
  z = viewDist = (height / 2.0) / tan(PI * 60.0 / 360.0);
  
  //I couldn't get the camera to work.
  angle = 0;
  camSpeed = 5.0;
  lookAtY = y;
  orthoScale = 2.0;
  orthographic = false;

  box = loadShape("cube.obj");
  box.setStroke(false);
  box.scale(70, 80, 90);
  box.setTexture(texture);
  
  sphere = loadShape("sphere.obj");
  sphere.setStroke(false);
  sphere.scale(75, 75, 100);
  sphere.setTexture(texture);

  texture = loadImage("zero.tif");
}

void draw(){
  background(255);
  lights();
  directionalLight(255,255,0,width,0,-extents);
  pointLight(0,255,255,500,height,-extents);
  directionalLight(255,255,0,width,0,extents);
  pointLight(0,255,255,500,height,extents);
  
  if (orthographic) {
    ortho(-width / orthoScale, 
      width / orthoScale, 
      -height / orthoScale, 
      height / orthoScale, 
      z / 1000.0, z * 1000.0);
  } else {
    perspective(PI / 3.0, 
      float(width) / float(height), 
      z / 2000.0, z * 2000.0);
  }
  
  keys();
  drawFloor(16, extents);

  sphere.rotateY(0.01);
  sphere.rotateX(0.01);
  sphere.rotateZ(0.03);
  sphere.setTexture(texture);
  //sphere(50);
  shape(sphere,0.25 *width,0.5 * height);

  box.rotateY(0.02);
  box.rotateX(0.01);
  box.rotateZ (.04);
  box.setTexture(texture);
  //box(50,100,150);
  shape(box,0.75 * width, 0.5 * height);
  
  angle += 0.01;
}
  
  void keys() {
  if (keyPressed) {
    if (y > 0
      && (key == 'w' || key == 'W' || keyCode == UP)) {
      y -= camSpeed;
      lookAtY = y;
    }
    if (y < height - 10
      && (key == 's' || key == 'S' || keyCode == DOWN)) {
      y += camSpeed;
      lookAtY = y;
      }
  }
  }
  
  void drawFloor(int tiles, float scale) {
  float x, z, 
    min = tiles * -scale / 2.0, 
    max = tiles * scale / 2.0;
  for (int i = 0; i < tiles; ++i) {
    for (int j = 0; j < tiles; ++j) {

      if (i % 2 == j % 2) {
        fill(map(i, 0, tiles, 0, 255), 
          map(j, 0, tiles, 0, 255), 
          127);
      } else {
        fill(0, map(i, 0, tiles, 255, 127), 
          map(j, 0, tiles, 255, 
          127));
      }

      x = map(i, 0, tiles, min, max);
      z = map(j, 0, tiles, min, max);

      beginShape();
      vertex(x, height, z);
      vertex(x + scale, height, z);
      vertex(x + scale, height, z + scale);
      vertex(x, height, z + scale);
      endShape(CLOSE);
    }
  }
}