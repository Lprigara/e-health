function escaneo(eHealth)
  datos = fscanf(eHealth.puerto,'%s'); %lectura del puerto serial
  descomponer(datos,eHealth);
end