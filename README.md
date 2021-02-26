# Tarea 3

## Ejercicio 1: GUESS THE WORD.
Esta app consiste en **una sola pantalla** donde se debe tratar de adivinar una palabra en base a una sugerencia y se lleva la cuenta de aciertos misma que se va mostrando.

**Utilizar BLoC para manejar los estados y separar la lógica de la vista.**

| Screenshot | Descripcion |
| -------------- | ------------- |
| Screenshot 1 | Dos textos centrados y en forma de columna. Un botón verde con texto blanco centrado en una fila casi hasta abajo de la pantalla. |
| Screenshot 2 | Un texto que indica el puntaje de palabras adivinadas en forma de columna con la fila que tiene los botones. Un botón verde con texto blanco y dos botones blancos separados dentro de una fila casi hasta abajo de la pantalla. |
| Screenshot 3 | Mismos dos textos centrados y en forma de columna y un botón verde con texto blanco con padding hacia arriba. |

![Imagen Referencia](https://github.com/EduGro/MovilesTarea3/blob/master/Reference.png?raw=true)

### Sugerencias:
- Tener widgets reutilizables para estar cambiando el contenido de los textos o de la fila de los botones ya sea para mostrar strings diferentes en los textos o cero, uno o tres botones (cada uno con su acción) en la fila.
- Inicializar dos listas (en el BLoC) que contengan las mismas palabras pero en orden diferente (`list.shuffle()`) una lista mostrará palabras sugeridas en la vista y la otra va a contener la palabra a adivinar. Se debe tener un índice en el BLoC que incremente cada que se presiona el botón de **skip** o **got it** que servirá para mostrar la siguiente palabra y al hacer la comparación con la palabra sugerida vs la real.
- Llevar la cuenta de los aciertos con un contador en el BLoC.
- Poner atención en los eventos y estados ya sea para indicar al BLoC que haga algo o para indicar a la vista que muestre algo.
- El boton de **play again** deberá reiniciar contadores, reordenar las listas y mostrar el contenido del screenshot 1 para volver a empezar el juego.

