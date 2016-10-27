//your variable declarations here
//Rocks [] bunch;
Star [] galaxy;
SpaceShip one;
Bullet shoot;
public void setup() 
{
  //bunch=new Rocks[5];
  //for(int i=0;i<bunch.length;i++)
    //bunch[i]=new Rocks();
  galaxy=new Star[200];
  for(int j=0;j<galaxy.length;j++)
    galaxy[j]=new Star();
  one=new SpaceShip();
  size(640,480);
}
public void draw() 
{
  background(0);
  for(int j=0;j<galaxy.length;j++)
    galaxy[j].show();
  //for(int i=0;i<bunch.length;i++)
  //{
   // bunch[i].show();
    //bunch[i].accelerate(0);
   // bunch[i].rotate(5);
    //bunch[i].move();
  //}
  one.show();
  one.move();
  shoot=new Bullet();
}
public void keyPressed()
{
  if(key=='w'){one.accelerate(0.5);}
  if(key=='s'){one.accelerate(-0.5);}
  if(key=='a'){one.rotate(-10);}
  if(key=='d'){one.rotate(10);}
  if(key=='q')
    {
      one.setX((int)(Math.random()*640));
      one.setY((int)(Math.random()*480));
      one.setPointDirection((int)(Math.random()*361));
      one.setDirectionX(0);
      one.setDirectionY(0);
    }
}
public void mousePressed()
{
  shoot.setPointDirection((int)(one.getPointDirection()));
  shoot.setX(one.getX());
  shoot.setY(one.getY());
  shoot.setDirectionX(one.getDirectionX());
  shoot.setDirectionY(one.getDirectionY());
  shoot.show();
  shoot.move();
  shoot.accelerate(5);
}
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      corners=15;
      xCorners=new int[corners];
      yCorners=new int[corners];
      xCorners[0]=-20;
      yCorners[0]=16;
      xCorners[1]=-8;
      yCorners[1]=16;
      xCorners[2]=-4;
      yCorners[2]=12;
      xCorners[3]=32;
      yCorners[3]=4;
      xCorners[4]=36;
      yCorners[4]=0;
      xCorners[5]=32;
      yCorners[5]=-4;
      xCorners[6]=-4;
      yCorners[6]=-12;
      xCorners[7]=-8;
      yCorners[7]=-16;
      xCorners[8]=-20;
      yCorners[8]=-16;
      xCorners[9]=-16;
      yCorners[9]=-12;
      xCorners[10]=-16;
      yCorners[10]=-8;
      xCorners[11]=-20;
      yCorners[11]=-4;
      xCorners[12]=-20;
      yCorners[12]=4;
      xCorners[13]=-16;
      yCorners[13]=8;
      xCorners[14]=-16;
      yCorners[14]=12;
      myColor=(200);
      myCenterX=90;
      myCenterY=240;
      myDirectionX=3;
      myDirectionY=0;
      myPointDirection=0;
    }
    public void setX(int x){myCenterX=x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY=y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX=x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY=y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection=degrees;}
    public double getPointDirection(){return myPointDirection;}
}
class Rocks extends Floater
{
  public Rocks()
  {
    corners=6;
    xCorners=new int[corners];
    yCorners=new int[corners];
    xCorners[0]=-24;
    yCorners[0]=12;
    xCorners[1]=-10;
    yCorners[1]=16;
    xCorners[2]=0;
    yCorners[2]=13;
    xCorners[3]=10;
    yCorners[3]=11;
    xCorners[4]=20;
    yCorners[4]=9;
    xCorners[5]=20;
    yCorners[5]=-5;
    myColor=(200);
    myCenterX=Math.random()*640;
    myCenterY=Math.random()*480;
    myDirectionX=Math.random()*5;
    myDirectionY=Math.random()*-5;
    myPointDirection=Math.random()*10;
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;}
}
class Star extends Floater
{
  public Star()
  {
    corners=0;
    myColor=(255);
    myCenterX=Math.random()*640;
    myCenterY=Math.random()*480;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;  
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;}
  public void show()
  {
    fill(myColor);
    stroke(myColor);
    ellipse((int)myCenterX,(int)myCenterY,5,5);
  }
}
class Bullet extends Floater
{
  public Bullet()
  {
    corners=0;
    myColor=color(255,208,0);
    myCenterX=0;
    myCenterY=0;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY=y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX=x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;}
  public void show()
  {
    fill(myColor);
    stroke(myColor);
    ellipse((int)myCenterX,(int)myCenterY,3,3);
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

