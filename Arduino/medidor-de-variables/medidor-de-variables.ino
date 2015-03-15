#include <eHealth.h>
#include <PinChangeInt.h>
int cont =0;
int pin = 6;
// The setup routine runs once when you press reset:
void setup() {
  Serial.begin(9600);  
  eHealth.initPulsioximeter();
}

// the loop routine runs over and over again forever:
void loop() {
  //attach interrupts to use the pulsioximeter.     
  PCintPort::attachInterrupt(pin, readPulsioximeter, RISING);
  //delay(1000);
  
   Serial.print(eHealth.getBPM());  
   Serial.print("-");  
   Serial.print(eHealth.getOxygenSaturation());     
   Serial.print("-"); 
   Serial.print(eHealth.getTemperature());
   Serial.print("-"); 
   Serial.print(analogRead(A1));
   Serial.print("-"); 
   Serial.print("\n");
 
  
}

void readPulsioximeter() {  
  cont ++;
  if (cont == 50) { //Get only one of  50 measures to reduce the latency
    eHealth.readPulsioximeter();  
    cont = 0;
  }
}
