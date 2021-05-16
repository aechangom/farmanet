# farmanet
- La aplicación contiene un de login simple contra el keychain 
- Cifra la información de usando Cryptokit
- Realiza el consumo del servicio al la url https://farmanet.minsal.cl/index.php/ws/getLocales usnado Alamofire
- Se valida login inválido
- Muestra los atributos "local_nombre",  "local_direccion" y "localidad_nombre" 
- En la pantalla detalle muestra  el objeto JSON completo. 
-  Se uasa el patron MVVM

-Para ingresear  
 Usuario = admin
 Contraseña = 12345
 
- Se puede realizar el usuario y contraseña usando la clase SettingsManager modificando los atributos user, password

Covertura de pruebas unitarias  es de más del 80% en los modelos , viemodel y clases utilitarias 

<img width="1086" alt="Screen Shot 2021-05-16 at 10 42 32 AM" src="https://user-images.githubusercontent.com/23081637/118403311-7d7f1580-b633-11eb-9eb1-11fc09531f41.png">


