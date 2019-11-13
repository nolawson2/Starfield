particle[] dot;
odd hole;
void setup() {
  size(1000, 1000);
  dot = new particle[700];
  for (int i = 0; i < dot.length-1; i++){
    dot[i] = new particle();
  }
  dot[dot.length -1] = new odd();
}

void draw() {
  fill(0,0,0,40);
  rect(0, 0, 1000, 1000);
  for (int i = 0; i < dot.length-2; i++) {
    dot[i].move();
    dot[i].show();
  }
  dot[dot.length-1].change();
  dot[dot.length-1].show();
  dot[dot.length-1].move();
}
class particle {
  int hue; 
  double myX, myY, angle, speed, size; 
  particle() {
    
    myX = 500;
    myY = 500;
    size = .25; 
    speed = Math.random()*5; 
    angle = Math.random()* TWO_PI;
  }

  void move() {
    myX = myX + Math.cos(angle)* speed;
    myY = myY + Math.sin(angle) * speed;
    if(myX > 1000 || myX < 0){
    myX = myY = 500;
    speed = Math.random()*5;
    }
    if(myY > 1000 || myY < 0){
    myY = myX = 500;
    speed = Math.random()*5; 
    }
    //angle = angle +(( Math.random() * 2 - 1)* .0);
    speed = Math.sqrt(speed * (speed + .05)) ;
    
  }                
  void change() {
  }
  void show() {
    fill(255);
    noStroke();
    for(int i = 0; i < 3; i++){
    ellipse((float) myX, (float) myY, (float)  size * ((float)  ((speed * speed) + 1)), (float) size * ((float) ((speed * speed) + 1)));
    }
  }

}
class odd extends particle{
  odd(){
  
   size = 3;
  }
  void change(){
    angle = angle + .02;
  }
  
}
