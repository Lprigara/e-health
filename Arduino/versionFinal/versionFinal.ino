#include <QueueList.h>
#include <Event.h>
#include <Timer.h>
#include <eHealth.h>
#include <PinChangeInt.h>

Timer t;
Timer t2;
int cont =0;
char delimitador = '*';
char finPaquete = '\n';
QueueList<float> cola;

void setup()
{
  Serial.begin(9600);
  eHealth.initPulsioximeter();
  t.every(2500, enviarVariables);
  t2.every(250, recogerECG);
  
  PCintPort::attachInterrupt(6, readPulsioximeter, RISING);
}

void loop()
{
  t.update();
  t2.update();
}

void enviarVariables()
{
  Serial.print("Cabecera");
  Serial.print(delimitador); 
  Serial.print(eHealth.getBPM());
  Serial.print(delimitador);  
  Serial.print(eHealth.getOxygenSaturation());
  Serial.print(delimitador); 
  Serial.print(eHealth.getTemperature());
  Serial.print(delimitador); 
  Serial.print(eHealth.getSkinConductance());
  while (!cola.isEmpty ()){
    Serial.print(delimitador);
    Serial.print(cola.pop());
  }
  Serial.print(finPaquete);
}

void recogerECG()
{
  cola.push(eHealth.getECG());
}

void readPulsioximeter() {  
  cont ++;
  if (cont == 50) { //Get only one of  50 measures to reduce the latency
    eHealth.readPulsioximeter();  
    cont = 0;
  }
}
