import processing.video.*;

Capture cam;
int switcher = 0; 

void setup(){
  size(640, 480);
  cam = new Capture(this, 640, 480);
  cam.start();
}

void draw(){
  
  tint(256, 256, 256);
  background(0); 
  
  if (cam.available()){
    cam.read();
  }
  if(switcher == 0 ){
  image(cam, 0, 0); 
  } 

else if(switcher == 1 ){ 
  scale(-1, 1);
  image(cam, -width, 0);
  }
  
else if(switcher == 2 ){ 
  scale(-1, -1);
  image(cam, -width, -height);
  }
  
else if(switcher == 3 ){
  
  tint(256, 0, 0); 
  image(cam, 0, 0, width/2, height/2); 
  
  tint(0, 256, 0); 
  image(cam, width/2, 0, width/2, height/2);  
  
  tint(0, 0, 256); 
  image(cam, 0, height/2, width/2, height/2); 
  
  tint(256, 0, 256); 
  image(cam, width/2, height/2, width/2, height/2); 
  } 
  
  else if(switcher == 4 ){ 
    image(cam, mouseX, mouseY, width/2, height/2); 
  }
  
  else { 
    println("ERROR!!!");
    switcher = 0;
}

} 

void mousePressed(){
  switcher++; 
  
} 
