import org.gwoptics.graphics.graph2D.Graph2D;
import org.gwoptics.graphics.graph2D.LabelPos;
import org.gwoptics.graphics.graph2D.traces.Line2DTrace;
import org.gwoptics.graphics.graph2D.traces.ILine2DEquation;

import igeo.*;
import igeo.p.*;
import igeo.io.*;
import igeo.gui.*;
import processing.opengl.*;

import processing.serial.*;

import java.awt.Frame;
import java.awt.BorderLayout;
import java.lang.String;
import controlP5.*;

private ControlP5 cp5;
int asd = 10;
int xyzMagVal[] = {0,0,0};
int xyzMagValPrev[] = {0,0,0};


IVec v1 = new IVec(50, 50, asd);
Graph2D g;
//private ICurve cu1 = new ICurve(0,0,0,asd,50,50).clr(255,0,0);
//private ICurve cu1 = new ICurve(0,0,0,50,50,50).clr(255,0,0);
ControlFrame cf;



Serial myPortFromMagSen;
String serial;


int def;

void setup() 
  {
    
    //myPortFromMagSen = new Serial(this, "COM10", 9600);
    
    
    
    size(500, 500,  IG.GL);
    IG.bg(0);

    cf = addControlFrame("extra", 1200,200);

   // for( int i=-200; i < 200; i++ ) new IPoint(i, 0, 0);
   // for( int i=-200; i < 200; i++ ) new IPoint(0, i, 0);
   // for( int i=-200; i < 200; i++ ) new IPoint(0, 0, i);
   
    new IBox(-200,-200,-200,400,400,400);
    new ICurve(-200,0,0, 200,0,0).clr(255,0,0);
    new ICurve(0,-200,0, 0,200,0).clr(0,255,0);
    new ICurve(0,0,-200, 0,0,200).clr(0,0,255);
    new IText("x-",20,-200,0,0);
    new IText("x+",20,200,0,0);
    new IText("y-",20,0,-200,0);
    new IText("y+",20,0,200,0);
    new IText("z-",20,0,0,-200);
    new IText("z+",20,0,0,200);
    
    
  }
void draw() 
  {
 // v1.set(asd,140,90);
   //v1.mv(50,50,asd);
   
   
//   while (myPortFromMagSen.available() > 0) 
//   { //as long as there is data coming from serial port, read it and store it 
//    serial = myPortFromMagSen.readStringUntil(10);
//  }
//    if (serial != null) 
//    {  
//    
//      String[] a = split(serial, ',');  //a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
//      println(a[0]); //print Value1 (in cell 1 of Array - remember that arrays are zero-indexed)
//      println(a[1]); //print Value2 value
//    }
   
   
   
   v1.show();
   
    
  //cu1.set(asd,50,50);
 ///  cu1.setColor(asd,0,0);
 //     cu1.show();
 //ICurve cu2 = new ICurve(0,0,0,asd,50,50).clr(255,0,0);
 //cu1.mv(0,0,asd);
  }
  
  



ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(100, 100);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}

public class ControlFrame extends PApplet 
{

  int w, h;
  int abc = 100;
  
  public  void setup() 
  {
  size(w,h);
 cp5 = new ControlP5(this);
 
  cp5.addButton("Connect")
     .setValue(0)
     .setPosition(60,20)
     .setSize(50,50)
     ;
     
  cp5.addSlider("kp")
     .setPosition(600,20)
     .setSize(500,30)
     .setRange(-255,255)
     .setValue(0)
     .setLabel("Change kP")
     .setId(1);
     ;
     
//  cp5.addSlider("x2")
//     .setPosition(650,20)
//     .setSize(500,30)
//     .setRange(-255,255)
//     .setValue(0)
//     .setLabel("Axis X2")
//     .setId(2);
//     ;
  cp5.addSlider("ki")
     .setPosition(600,70)
     .setSize(500,30)
     .setRange(-255,255)
     .setValue(0)
     .setLabel("Change kI")
     .setId(2);
     ;
//  cp5.addSlider("y2")
//     .setPosition(650,70)
//     .setSize(500,30)
//     .setRange(-255,255)
//     .setValue(0)
//     .setLabel("Axis Y2")
//     .setId(4);
//     ;
  cp5.addSlider("kD")
     .setPosition(600,120)
     .setSize(500,30)
     .setRange(-255,255)
     .setValue(0)
     .setLabel("Change kD")
     .setId(3);
     ;
//  cp5.addSlider("z2")
//     .setPosition(650,120)
//     .setSize(500,30)
//     .setRange(-255,255)
//     .setValue(0)
//     .setLabel("Axis X2")
//     .setId(6);
//     ;

  
}

public void draw() 
{
  background(0);
}

  private ControlFrame() 
  {
  }
  public ControlFrame(Object theParent, int theWidth, int theHeight) 
  {
    parent = theParent;
    w = theWidth;
    h = theHeight;
  }
  public ControlP5 control() 
  {
    return cp5;
  }
  ControlP5 cp5;
  Object parent;
  
  public void controlEvent(ControlEvent theEvent) 
{
  println("got a control event from controller with id "+theEvent.getId());
  switch(theEvent.getId()) {
    case(1): 
    asd = (int)(theEvent.getController().getValue());
    break;
    case(2): 
    asd = (int)(theEvent.getController().getValue());
    break;
  }
}
}
















