import processing.video.*;
Capture video;

float timer1 = 0;
float timer2 = 0;
float delay1 = 1000/100.0; // 100 fps
float delay2 = 1000/50.0; // 50 fps
 
int x = 0;
int x_2 = 0;
 
void setup() {   
  
size(2000, 720);
frameRate(120);
colorMode(RGB, 255, 255, 255, 100);

video = new Capture(this, 1280, 720);
  
video.start();  

background(0);
}

int pos = 0;
int pos_2 = 10;

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  
  
  if( millis() > timer1 ){
    pos++;
  int w = video.width;
  int h = video.height;
  
  copy(video, w/2, 0, 1, h/2, x, 0, 1, h/2);
    timer1+=delay1;
    
    x++;
    
    if (x > width) {
      x = 0;
    }
  }
  
  if( millis() > timer2 ){
    pos_2++;
    
  int w = video.width;
  int h = video.height;
  
  copy(video, w/2, h/2, 1, h/2, x_2, h/2, 1, h/2);
    timer2+=delay2;
    
    x_2++;
    
    if (x_2 > width) {
      x_2 = 0;
    }
  }
  
}
