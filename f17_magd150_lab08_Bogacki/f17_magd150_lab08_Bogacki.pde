//For this sketch, I decided to make a motivational poster using motivational quotes
//from animes and some made up motivational words.
PFont f;
PFont g;
String a;

void setup(){
  size(500,500);
  f = loadFont("Serif-48.vlw");
  g = loadFont("ArialNarrow-Italic-48.vlw");
  a = loadString("motivationalPoster.txt","\n");
}

void draw(){
  //It only made sense to animate the anime quotes.
  background(0);

  pushMatrix();
  translate(width / 2.0, height / 2.0);
  rotate(frameCount / 50.0);
  fill(0,255,255);
  textAlign(CENTER);
  textSize(48);
  textFont(f);
  //I took this quote from an anime called "Fate Stay/Night: Unlimited Blade Works".
  //Due to its length, I decided to make this quote spin around in the center.
  text("There is no\nrule or law that\nsays a copy can't\nsurpass the\noriginal.",0,0);
  popMatrix();
  

  pushMatrix();
  translate(width / 2.0, height / 2.0);
  shearX(frameCount / 70.0);
  fill(0,0,255);
  textAlign(RIGHT);
  textSize(40);
  textFont(g);
  //I got this quote from an anime called "Gurren Lagann".
  text("KICK LOGIC\nOUT AND\nDO THE\nIMPOSSIBLE!", 0,0);
  popMatrix();

  pushMatrix();
  translate(width / 2.0, height / 2.0);
  shearY(frameCount / 90.0);
  fill(0,128,0);
  textAlign(TOP);
  textSize(45);
  textFont(g);
  //I got this quote from an anime called "Gurren Lagann".
  text("Believe in the\nyou, that believes\nin yourself.",10,20);
  popMatrix();

pushMatrix();
  //This was the only way I could get the loadString to appear on screen. This pushMatrix
  //is the reason why the screen is so glitchy. It wouldn't show PDF, which is why I
  //don't have a PDF.
  fill(255);
  textAlign(TOP);
  textLeading(24);
  textFont(g);
  textSize(34);
  text(a,0,0);
  popMatrix();
}


String loadString(String filePath,String delimiter){
  String[] lines = loadStrings(filePath);
  StringBuilder sbuilder = new StringBuilder();
  for (int i = 0, size = lines.length; i < size; ++i) {
    sbuilder.append(lines[i]);
    sbuilder.append(delimiter);
  }
  return sbuilder.toString();
}