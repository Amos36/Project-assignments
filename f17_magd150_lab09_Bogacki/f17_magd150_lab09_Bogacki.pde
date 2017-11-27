//For this sketch I wanted to have a chill, fun-loving vibe.
import processing.video.*;
import processing.sound.*;
PImage frame;
Capture reflection;
SoundFile song;
boolean playing = false;
Movie movie;

void setup(){
  size(600,400);
  //This frame image was made by Alison Burell.
  frame = loadImage("pexels-photo-197919.png");
  //I don't know why, but mirror I made using reflection and capture doesn't work.
  //I even tried to use to Capture video, void captureEvent with both reflection and
  //video and moved the ".read" function in void captureEvent, but it still didn't work.
  reflection = new Capture(this,400,0);
  reflection.start();
  //I couldn't find out who made this song or video.
  song = new SoundFile(this, "bensound-cute.mp3");
  movie = new Movie(this, "672653476.mp4"); 
  movie.loop();
}

void movieEvent(Movie movie) {
  movie.read();
}

void mousePressed(){
  reflection.read();
  //When user clicks with mouse, the song will play.
  song.play();
  song.rate(1.5);
  song.amp(1);
}

void draw(){
  //I wanted the the movie/video to be the center of attention, which is it takes up
  //most of the screen.
  image(movie,0,0,400,400);
  image(frame,400,0,200,400);
  //The mirror is in the corner, because I couldn't get it to work.
  tint (100,20);
  image(reflection,400,0,200,200);
}