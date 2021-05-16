# farmanet
- La aplicación contiene un de login simple contra el keychain 
- Cifra la información de usando Cryptokit
- Realiza el consumo del servicio al la url https://farmanet.minsal.cl/index.php/ws/getLocales usando Alamofire
- Se valida login inválido
- Muestra los atributos "local_nombre",  "local_direccion" y "localidad_nombre" 
- En la pantalla detalle muestra  el objeto JSON completo. 
-  Se uasa el patron MVVM

-Para ingresear  
 Usuario = admin
 Contraseña = 12345
 
- Se puede realizar el usuario y contraseña usando la clase SettingsManager modificando los atributos user, password

![Simulator Screen Shot - iPhone 8 - 2021-05-16 at 10 50 31](https://user-images.githubusercontent.com/23081637/118403576-a48a1700-b634-11eb-98af-353542e7bbc5.png)

![Simulator Screen Shot - iPhone 8 - 2021-05-16 at 10 50 36](https://user-images.githubusercontent.com/23081637/118403580-a7850780-b634-11eb-8fc4-29344a6b3d58.png)

![Simulator Screen Shot - iPhone 8 - 2021-05-16 at 10 50 39](https://user-images.githubusercontent.com/23081637/118403584-aa7ff800-b634-11eb-9913-f2639101ff44.png)


- Pods Utilizados
  -  pod 'KeychainSwift'
  -  pod 'Alamofire'
  -  pod 'SwiftLint'
  
- Reclas de SwiftLint 

excluded: # paths to ignore during linting. 
  - Carthage
  - Pods
  - farmanetTests
  - farmanetUITests
disabled_rules:
  - force_cast
  - trailing_whitespace
  - variable_name
  - private_unit_test
  - weak_delegate
  - cyclomatic_complexity
  - force_unwrapping
  - function_body_length
line_length: 200

Covertura de pruebas unitarias  es de más del 80% en los modelos , viemodel y clases utilitarias 

<img width="1086" alt="Screen Shot 2021-05-16 at 10 42 32 AM" src="https://user-images.githubusercontent.com/23081637/118403311-7d7f1580-b633-11eb-9eb1-11fc09531f41.png">


