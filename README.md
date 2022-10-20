# Starwapp
![](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
### Aplicación desarrollada en Flutter - Desafío Star Wars
El desafío consiste en desarrollar una aplicación que permita visualizar una lista de personajes, ver el detalle de cada uno de los personajes y reportar el avistamiento de los mismos. Además, debe permitirse la posibilidad de activar / desactivar la conexión de la aplicación de manera independiente a los datos móviles y/o wifi.

## Requerimientos de diseño y desarrollo
El desafío requiere que la aplicación presente 3 vistas principales: Inicio, Detalle, Menú.

#### 1. Inicio
Debe presentar un listado de personajes provistos por la API de Star Wars (SWAPI).<br>
Dicho listado debe respetar las siguientes reglas: 
- Visualización de forma paginada con scroll infinito. Además, deberá mostrarse botones "siguiente" y "anterior" con número de página.
- Cada item de personaje debera mostrar el nombre y el genero del mismo.
- Al presionar sobre un personaje, deberá navegar a la Vista 1a (Detalle), con la posibilidad de regresar a la vista anterior.

El servicio a utilizar para realizar esta pantalla es SWAPI  https://swapi.dev/

```
Lista de personajes
GET https://swapi.dev/api/people/

Mas usos en la documentación: https://swapi.dev/documentation
```

#### 1a. Detalle
Se presentará el detalle del personaje seleccionado anteriormente, brindando los datos siguientes (sin orden especifico):<br>

- Nacimiento (birth_year)
- Color de ojos (eye_color)
- Genero (gender)
- Color de pelo (hair_color)
- Altura (height)
- Mundo natal (homeworld)
- Peso (mass)
- Nombre (name)
- Naves (starships)
- Vehiculos (vehicles)

Esta pantalla deberá presentar también un botón para reportar el avistamiento de un personaje. Dicho boton estará habilitado solo si la conexión de la Vista 2 (Menu) se encuentra activa, en caso contrario no será mostrado y puede incorporarse un mensaje determinado indicando que la conexión no está activada.<br><br>
El reporte de avistamiento se realizará al siguiente *endpoint* con el formato adecuado y se deberá notificar en la pantalla el estado del request utilizando SnackBar, MaterialBanner, u otra opcion que se desee.

```
url: https://jsonplaceholder.typicode.com/posts
httpMethod: POST

body:
- userId: int, character id
- dateTime: String, character report DateTime
- character_name: String, character name

example:
{ "userId": 1,
  "dateTime": "2022-05-12 11:00:32.334679",
  "character_name": "Luke Skywalker"
}
```

#### 2. Menu
La pantalla Menú deberá presentar un switch para activar / desactivar la conexión de la aplicación. Dicha conexión debe ser independiente de datos / wifi del telefono.


#### State Management
Deberá utilizarse para el desarrollo de la aplicación algún State Management:<br>
- BLoC (deseable)
- Provider
- Riverpod.

#### Estilo de la app
No hay requerimientos específicos con respecto al estilo de la aplicación, sino que el mismo es libre mientras cumpla con los puntos mencionados anteriormente. Adicionalmente, el uso de animaciones, freezed, dartz, local persistance, etc será considerado un extra. Por otro lado, las buenas prácticas aplicadas a Disposición / arquitectura de la App, UI, Manejo y Validaciones de errores, Clean code y Principio SOLID serán valoradas.

## Tecnologías utilizadas
![](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![](https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)
![](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)
![](https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white)

## Propuesta
<p float="left">
  <img src="https://i.ibb.co/t3T6c9m/image.png" width="200px">
  <img src="https://i.ibb.co/7z4WLyp/image.png" width="200px">
  <img src="https://i.ibb.co/QJkyk0F/image.png" width="200px">
</p>

## Roadmap

`13/10/2022` - Creación de repositorio<br>
`13/10/2022` - Se realiza el diseño base visual teniendo en cuenta los requerimientos establecidos. Se utiliza *Figma* como herramienta para bosquejar las pantallas principales de la aplicación<br>
`14/10/2022` - Creación de proyecto utilizando comando de línea Flutter create --org com.starwapp starwapp. Creación de estructura base del proyecto.<br>
`15/10/2022` - Diseño y desarrollo base de páginas principales. Creación de widgets visuales, bottomNavigatorBar y navegación por rutas. Se crean los modelos Character, Vehicles y Starship. Los valores constantes se agrupan dentro de *constants* para mantener el código más limpio.<br>
`16/10/2022` - Se actualiza el tema y se incorporan colores personalizados de la aplicación. Se incorpora la librería *Shared Preferences* y se utiliza para persistencia local de la configuración de conexión. Se elige esta librería por sobre otras debido a la sencillez de los datos que deben almacenarse.<br>
`17/10/2022` - Se crea la lógica para la obtención de datos de SWAPI y el manejo de estados utilizando Provider como State Management. Se busca implementar un código limpio con la separación modelo - lógica - vista.<br>
`18/10/2022` - Se corrigen problemas con la obtención de datos a partir de la API, se genera una listView de scroll infinito.<br>
`19/10/2022` - Se realizan gran parte de las funciones del Provider para la obtención y posteo de datos<br>
`20/10/2022` - Se realizan correcciones varias, se implementan Skeleton Loaders a partir de figuras simples y se terminan los detalles para la publicación final del código. STARWAPP queda finalizado.<br>
