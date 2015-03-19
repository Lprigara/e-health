#include <Event.h>
#include <Timer.h>
#include <eHealth.h>
#include <PinChangeInt.h>

Timer t;
Timer t2;
Timer t3;
int cont =0;
char delimitador = '-';
char finPaquete = '\n';

void setup()
{
  Serial.begin(9600);
  eHealth.initPulsioximeter();
  t.every(2500, enviarPulsioximetro);
  t2.every(7000, enviarTemperatura);
  t3.every(250, enviarAirFlow);
  
  PCintPort::attachInterrupt(6, readPulsioximeter, RISING);
}

void loop()
{
  t.update();
  t2.update();
  t3.update();
}

void enviarPulsioximetro()
{
  Serial.print("Cab1");
  Serial.print(delimitador); 
  Serial.print(eHealth.getBPM());
  Serial.print(delimitador);  
  Serial.print(eHealth.getOxygenSaturation());
  Serial.print(finPaquete);
}

void enviarTemperatura()
{
  Serial.print("Cab2");
  Serial.print(delimitador); 
  Serial.print(eHealth.getTemperature());
  Serial.print(finPaquete);
}

void enviarAirFlow()
{
  Serial.print("Cab3");
  Serial.print(delimitador); 
  Serial.print(eHealth.getAirFlow());
  Serial.print(finPaquete);
}

void readPulsioximeter() {  
  cont ++;
  if (cont == 50) { //Get only one of  50 measures to reduce the latency
    eHealth.readPulsioximeter();  
    cont = 0;
  }
}
