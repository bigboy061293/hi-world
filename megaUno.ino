#include <Servo.h>

#include <Wire.h>
#include <HMC58X3.h>


Servo escRoll;
Servo escPitch;
Servo escYaw;

int rndCnt = -100;

HMC58X3 magn;
  int x,y,z;
  long x1,y1,z1;


  
void setup(void) 
{
   Serial.begin(9600);
   delay(100);

   escRoll.attach(2);
   escPitch.attach(3);
   escYaw.attach(4);
   
   magn.init(true);
   magn.calibrate(1, 64);
   magn.setMode(0);
    delay(100);
}

void loop(void)
{
  magn.getValues(&x,&y,&z);
 
  x1 = x* 0.109;
  y1 = y* 0.109;
  z1 = z* 0.109;

  Serial.print(x1);
  Serial.print(',');
  Serial.print(y1);
  Serial.print(',');
  Serial.println(z1);

  delay(50);
  if (rndCnt < 100) rndCnt+=1; else rndCnt = -100;
  setSpeedRoll(rndCnt);
  
}


void setSpeedRoll(int spd)
{
  int angle = 0;
  if ((spd >-180) && (spd <180)) angle = map(spd, -100, 100, 0, 180);
  else angle = 90;
  
  escRoll.write(angle);
}

void setSpeedPitch(int spd)
{
  int angle = 0;
  if ((spd >-180) && (spd <180)) angle = map(spd, -100, 100, 0, 180);
  else angle = 90;
  
  escPitch.write(angle);
}

void setSpeedYaw(int spd)
{
  int angle = 0;
  if ((spd >-180) && (spd <180)) angle = map(spd, -100, 100, 0, 180);
  else angle = 90;
  
  escYaw.write(angle);
}

