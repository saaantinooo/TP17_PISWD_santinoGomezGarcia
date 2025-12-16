# TP17: Juegos Clásicos en Processing (Ta-Te-Ti y Paddle 3D)

Este repositorio contiene la resolución de la **Actividad 17** para la materia **Proyecto de Implementación de Sitios Web Dinámicos**. El proyecto consiste en el desarrollo de dos videojuegos clásicos utilizando **Processing**, aplicando lógica de programación y renderizado tanto en 2D como en 3D.

## 📋 Descripción de los Ejercicios

### 1. Ta-Te-Ti (Tic-Tac-Toe) - 2D
Juego de estrategia para dos jugadores (X y O) sobre una grilla de 3x3.
* **Funcionalidades:**
    * Turnos alternados automáticos.
    * Detección de victoria (filas, columnas y diagonales).
    * Detección de empate.
* **Mejoras Implementadas:**
    * ✅ **Botón de Reinicio:** Permite volver a jugar sin cerrar el programa.
    * ✅ **Indicador de Estado:** Muestra en pantalla de quién es el turno o quién ganó.

### 2. Paddle (Pong) - 3D
Implementación del clásico juego de tenis de mesa utilizando la librería `P3D` para un entorno tridimensional.
* **Funcionalidades:**
    * Movimiento de raquetas independientes (W/S para jugador 1, Arriba/Abajo para jugador 2).
    * Física de rebote y colisiones en 3D.
* **Mejoras Implementadas:**
    * ✅ **Iluminación:** Uso de `lights()` y `pointLight` para dar profundidad a la escena.
    * ✅ **Marcador:** Sistema de puntuación visual en pantalla.
    * ✅ **Geometría 3D:** Uso de `box()` para las raquetas y `sphere()` para la pelota.
    * ✅ **Profundidad:** La pelota tiene movimiento aleatorio en el eje Z.

## 🚀 Instalación y Ejecución
1.  Asegúrate de tener instalado [Processing 4](https://processing.org/download).
2.  Clona este repositorio o descarga el código.
3.  Abre los archivos `.pde` (`tateti.pde` o `paddle.pde`) con el entorno de Processing.
4.  Presiona el botón "Ejecutar" (Play).

## 👤 Autor
**Santino Gomez Garcia**
Materia: PWD 7° 2° B - EEST N.º 1 "Eduardo Ader"