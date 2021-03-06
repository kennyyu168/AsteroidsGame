//your variable declarations here
ArrayList <Asteroid> bunch;
Star [] galaxy;
SpaceShip one;
boolean launch;
ArrayList <Bullet> shot;
int eradicated=0;
int lifeForce=150;
public void setup() 
{
  int ray=10;
  bunch=new ArrayList <Asteroid>();
  for(int i=0;i<ray;i++){bunch.add(i, new Asteroid());}
  galaxy=new Star[200];
  for(int j=0;j<galaxy.length;j++){galaxy[j]=new Star();}
  one=new SpaceShip();
  shot=new ArrayList <Bullet>();
  size(640,480);
}
public void draw() 
{ 
  background(0);
  if(lifeForce>0)
  {
    if(mousePressed)
    {
      shot.add(new Bullet(one));
    }
    for(int j=0;j<galaxy.length;j++){galaxy[j].show();}
    for(int i=0;i<bunch.size();i++)
    {
      bunch.get(i).show();
      bunch.get(i).rotate(2);
      bunch.get(i).move();
      if(dist(one.getX(),one.getY(),bunch.get(i).getX(),bunch.get(i).getY())<30)
      {
        bunch.remove(i);
        bunch.add(i, new Asteroid());
        lifeForce--;
      }
    } 
    for(int k=0;k<shot.size();k++)
    {
      shot.get(k).show();
      shot.get(k).move();
      shot.get(k).accelerate(2);
      for(int z=(bunch.size()-1);z>=0;z--)
      {
        if(dist(bunch.get(z).getX(),bunch.get(z).getY(),shot.get(k).getX(),shot.get(k).getY())<20)
        { 
          bunch.remove(z);
          shot.remove(k);
          bunch.add(new Asteroid());
          eradicated++;
          break;
        }
      }
    }
    for(int k=0;k<shot.size();k++)
    { 
      if(shot.get(k).getX()>640||shot.get(k).getY()>480||shot.get(k).getX()<0||shot.get(k).getY()<0)
      {
        shot.remove(k);
      }
    }
  
    one.show();
    if(launch==true)
    {
      one.move();
    }
    fill(255,160,122);
    rect(50,20,lifeForce,20);
    fill(225);
    rect(50,40,eradicated,20);
  }
  else
  {
    fill(255);
    textAlign(CENTER);
    text("GAME OVER",320,240);
    text("SCORE: "+eradicated,320,280);
  }
}
public void keyPressed()
{
  if(key=='w')
  {
    launch=true;
    one.accelerate(0.5);
  }
  if(key=='s'){one.accelerate(-0.7);}
  if(key=='a'){one.rotate(-10);}
  if(key=='d'){one.rotate(10);}
  if(key=='q')
  {
      one.setX((int)(Math.random()*1280));
      one.setY((int)(Math.random()*720));
      one.setPointDirection((int)(Math.random()*361));
      one.setDirectionX(0);
      one.setDirectionY(0);
  }
  if(key=='p'){lifeForce=1;}
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
      myCenterX=320;
      myCenterY=240;
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
}
class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    rotSpeed=(int)((Math.random()*10)-5);
    corners=6;
    xCorners=new int[corners];
    yCorners=new int[corners];
    xCorners[0]=-16;
    yCorners[0]=4;
    xCorners[1]=-12;
    yCorners[1]=12;
    xCorners[2]=0;
    yCorners[2]=8;
    xCorners[3]=12;
    yCorners[3]=8;
    xCorners[4]=8;
    yCorners[4]=-4;
    xCorners[5]=-8;
    yCorners[5]=-8;
    myColor=(200);
    myCenterX=Math.random()*640;
    myCenterY=Math.random()*480;
    myDirectionX=(Math.random()*10)-5;
    myDirectionY=(Math.random()*10)-5;
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
  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }
}
class Star extends Floater
{
  public Star()
  {
    corners=0;
    myColor=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    myCenterX=Math.random()*1280;
    myCenterY=Math.random()*720;
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
  public Bullet(SpaceShip one)
  {
    corners=0;
    myColor=color(255,208,0);
    myPointDirection=one.getPointDirection();
    myCenterX=one.getX();
    myCenterY=one.getY();
    double dRadians=myPointDirection*(Math.PI/180);
    myDirectionX=10*Math.cos(dRadians)+one.getDirectionX();
    myDirectionY=10*Math.sin(dRadians)+one.getDirectionY();
    
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
  public void move ()   //move the floater in the current direction of travel
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
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

