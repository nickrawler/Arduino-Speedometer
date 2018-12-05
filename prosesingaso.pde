import processing.serial.*;

Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
float velocitat;

float vall; 


void setup()
{
  // I know that the first port in the serial list on my mac
  // is Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
 
  size(800, 800);
  background(55,55,55);
  noStroke();
  signal();
}

void draw()
{
  if ( myPort.available() > 0) 
  {  // If data is available,
  val= trim(myPort.readStringUntil('\n')); 
  // read it and store it in val
   
   if (val != null )
        {
          velocitat = float(trim(val)); 
  } 
println(velocitat); //print it out in the console

if(velocitat>50)
{
  sf();
  println("sad");
  //signal();
  //delay(2000);

}

else if(velocitat<=50)
{
  hf();
  println("happy");
  //signal();
  //delay(2000);
}

else if(velocitat==0)
{
signal();
}


}

}

/////////////////////////////////////
void signal()
{

fill(255, 0, 0);
ellipse(width/2, height/2, 600,600);

fill(255, 255, 255);
ellipse(width/2, height/2, 450, 450);

fill(0, 0, 0);
textAlign(CENTER, CENTER);
textSize(260);
text("50", width/2, height/2-30);
}
//////////////////////////////////////
void hf()
{
fill(0, 255, 0);
ellipse(width/2, height/2, 600,600);

fill(55, 55, 55);
ellipse(width/2, height/2, 500, 500);

fill(0, 255, 0);
ellipse(width/2-125, height/2-80, 80, 80);
ellipse(width/2+125, height/2-80, 80, 80);
arc(width/2, height/2+60, 200, 200, 0, PI);
}

void sf()
{
fill(255, 0, 0);
ellipse(width/2, height/2, 600,600);

fill(55, 55, 55);
ellipse(width/2, height/2, 500, 500);

fill(255, 0, 0);
//ellipse(width/2-125, height/2-80, 80, 80);
//ellipse(width/2+125, height/2-80, 80, 80);
rect(width/2-150, height/2-110, 90, 20);
rect(width/2-115, height/2-145, 20, 90);

rect(width/2+80, height/2-110, 90, 20);
rect(width/2+115, height/2-145, 20, 90);

arc(width/2, height/2+60, 200, 200, 0, 2*PI);
}