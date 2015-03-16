#include <eHealth.h>
#include <PinChangeInt.h>
int cont =0;
int pin = 6;
char delimitador = '-';
char finPaquete = '\n';

void setup() {
  Serial.begin(9600);  
  eHealth.initPulsioximeter();
 // eHealth.initPositionSensor();     

  
  //attach interrupts to use the pulsioximeter.     
  PCintPort::attachInterrupt(pin, readPulsioximeter, RISING);
}

void loop() {
  
   Serial.print(eHealth.getBPM());  
   Serial.print(delimitador);  
   Serial.print(eHealth.getOxygenSaturation());     
   Serial.print(delimitador); 
   Serial.print(eHealth.getTemperature());
   Serial.print(delimitador); 
   Serial.print(int(eHealth.getAirFlow()));
   Serial.print(delimitador); 
//   Serial.print(eHealth.getBodyPosition());
//   Serial.print(delimitador); 
//   Serial.print(eHealth.getSkinConductance());
//   Serial.print(delimitador); 
//   Serial.print(eHealth.getSkinResistance());
   Serial.print(finPaquete);
}

void readPulsioximeter() {  
  cont ++;
  if (cont == 50) { //Get only one of  50 measures to reduce the latency
    eHealth.readPulsioximeter();  
    cont = 0;
  }
}
