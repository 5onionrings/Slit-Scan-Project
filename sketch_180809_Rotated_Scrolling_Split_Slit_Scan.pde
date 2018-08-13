import processing.video.*;
Capture video;

PImage canvas;

float timer1 = 0;
float timer2 = 0;
float delay1 = 1000/100.0; // 100 fps
float delay2 = 1000/30.0; // 30 fps
 
int x = 0;
int x_2 = 0;
 
void setup() {   

canvas = createImage (1280, 2276, RGB);

size(1280, 2275);
frameRate(60);
colorMode(RGB, 255, 255, 255, 100);

video = new Capture(this, 1280, 720, 60);
  
video.start();  

imageMode(CENTER);  

background(0);
}

int pos = 0;
int pos_2 = 10;

void captureEvent(Capture video) {
  video.read();
}

void draw() {
    
  int x = frameCount*2 % height;
  
  if( millis() > timer1 ){
    pos++;
    
  canvas.copy(video, 0, video.height/2, video.width/2, 1, 0, height-x, canvas.width/2, 1);
    timer1+=delay1;
   
  for (int i = -x ; i < height ; i += height) {
    copy(canvas, 0, 0, canvas.width/2, height, 0, -i, canvas.width/2, height);
 
    
    }
  }
  
  int x_2 = frameCount/2 % height;
  
  if( millis() > timer2 ){
    pos_2++;
   
  canvas.copy(video, video.width/2, video.height/2, video.width/2, 1, canvas.width/2, height-x_2, canvas.width/2, 1);
    timer2+=delay2;
  
  for (int i_2 = -x_2 ; i_2 < height ; i_2 += height) {
    copy(canvas, canvas.width/2, 0, canvas.width/2, height, canvas.width/2, -i_2, canvas.width/2, height);
   
    }
  }
 
  
}
