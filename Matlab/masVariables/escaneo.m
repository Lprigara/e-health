function escaneo(serial, variables)
  datos = fscanf(serial.puerto,'%s'); %lectura del puerto serial
  descomponer(datos, variables);
end