import processing.video.*;

Capture cam; 
int switcher = 0; 

void setup() {
  String[] cameras = Capture.list(); 
  println("Available cameras: "); 
  
  for (int i = 0; i < cameras.length; i++){
    println(cameras[i]);
  }
  
  size(1280, 1024);
  cam = new Capture(this, cameras[0]);
  
  cam.start();
  
}

void draw() {
  
  if(cam.available() == true){
    cam.read(); 
  }
  
  image(cam, 0, 0, width, height); 
  
  if(second()%10 == 0) {
    cam.stop(); 
    saveFrame(); 
    delay(1); 
    cam.start(); 
    
  }
  
   tintCapture();
} 
  
  void tintCapture(){
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
