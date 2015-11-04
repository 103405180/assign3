PImage bg1Img,bg2Img,enemyImg,treasureImg,fighterImg,hpImg,start1Img,start2Img;
float bgX=0;
float hpX=38.8;  //10hp=19.4, 20hp=38.8
float fighterX=589, fighterY=240;
float treasureX=random(45,585),treasureY=random(45,405); 
float enemyX=0, enemyY=random(0,420);
float spacingX=70, spacingY=40;
boolean upPressed=false,downPressed=false,rightPressed=false,leftPressed=false;
int state=1;

void setup(){
  size(640,480);
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  enemyImg=loadImage("img/enemy.png");
  treasureImg=loadImage("img/treasure.png");
  fighterImg=loadImage("img/fighter.png");
  hpImg=loadImage("img/hp.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  
}

void draw(){
 //background
 image(bg1Img,bgX,0);
 image(bg2Img,bgX-640,0);
 image(bg1Img,bgX-1280,0);
 bgX++;
 bgX%=1280;
 
 //hp
 noStroke();
 fill(255,0,0);
 rect(22,14,hpX,16);
 image(hpImg,10,10);  //211*31  12*206
 
 //treasure 41*41
 image(treasureImg,treasureX,treasureY);
 
 //fighter 51*51
 image(fighterImg,fighterX,fighterY);
 
 if(upPressed){
   fighterY-=5;
 }if(fighterY<0){
    fighterY=0;
  }
 if(downPressed){
   fighterY+=5;
 }if(fighterY>height-51){
   fighterY=height-51;
  }
 if(rightPressed){
   fighterX+=5;
 }if(fighterX>width-51){
   fighterX=width-51;
  }
 if(leftPressed){
   fighterX-=5;
 }if(fighterX<0){
    fighterX=0;
 }
 image(fighterImg,fighterX,fighterY);
 
 switch(state){
   case 1:
   image(start2Img,0,0);
   if(mouseX>=210 && mouseX<=440 && mouseY>=380 && mouseY<=410){
     image(start1Img,0,0);
     if(mousePressed){      
       state=2;      
     }
   }
   break;
   
   case 2:
   enemyX+=3;
   for(int i=0; i<5; i++){
   image(enemyImg,enemyX-i*spacingX,enemyY);
   }
   if(enemyX>width+spacingX*4){
     enemyX=0;
     enemyY=random(0,255);
     state=3;
   }
   break;
   
   case 3:
   enemyX+=3;
   for(int i=0; i<5; i++){
     image(enemyImg,enemyX-i*spacingX,enemyY+i*spacingY);
   }
   if(enemyX>width+spacingX*4){
     enemyX=0;
     enemyY=random(80,335);
     state=4;
   }
   break;
   
   case 4:
   enemyX+=3;
   for(int i=0; i<3; i++){
     image(enemyImg,enemyX-i*spacingX,enemyY-i*spacingY);
     for(int j=0; j<2; j++){
       image(enemyImg,enemyX-i*spacingX-2*j*spacingX,enemyY-i*spacingY+2*j*spacingY);
     }
   }
   for(int i=0; i<3; i+=2){
       image(enemyImg,enemyX-(i+1)*spacingX,enemyY+(1-i)*spacingY);
     }
   if(enemyX>width+spacingX*4){
     enemyX=0;
     enemyY=random(0,420);
     state=2;
   }  
   break;
 }

}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=true;
        break;
      case DOWN:
        downPressed=true;
        break;
      case RIGHT:
        rightPressed=true;
        break;
      case LEFT:
        leftPressed=true;
        break;
    }
  }
}

void keyReleased(){
  if(key==CODED){
   switch(keyCode){  
     case UP:
       upPressed=false;
       break;
     case DOWN:
       downPressed=false;
       break;
     case RIGHT:
       rightPressed=false;
       break;
     case LEFT:
       leftPressed=false;
       break;   
    }
  }
}
