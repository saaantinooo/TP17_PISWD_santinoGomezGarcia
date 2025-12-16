// Ejercicio 1: TA-TE-TÍ en 2D
// Código base de la actividad [cite: 28-31]
int[][] board = new int[3][3];
boolean xTurn = true;
boolean gameEnded = false;
String message = "Turno de X"; // Mejora: Mostrar turno 
float buttonX, buttonY, buttonW, buttonH; // Mejora: Botón de reinicio 

void setup() {
  size(300, 360); // Aumentamos el alto para mensajes y botón
  textFont(createFont("Arial", 16));
  textAlign(CENTER, CENTER);
  
  // Posición del botón de reinicio 
  buttonX = width / 2 - 50;
  buttonY = 320;
  buttonW = 100;
  buttonH = 30;
  
  resetGame();
}

// Función de reinicio
void resetGame() {
  // Código base de setup() [cite: 34-38]
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = 0;
    }
  }
  xTurn = true;
  gameEnded = false;
  message = "Turno de X";
}

void draw() {
  background(255);
  drawBoard(); // [cite: 42]
  
  // Dibujar mensajes
  fill(0);
  text(message, width / 2, 320);
  
  // Dibujar botón de reinicio 
  if (gameEnded) {
    fill(0, 200, 0);
    rect(buttonX, buttonY, buttonW, buttonH);
    fill(255);
    text("Reiniciar", width / 2, buttonY + buttonH / 2);
  }
}

void drawBoard() {
  // Código base [cite: 51-55]
  stroke(0);
  strokeWeight(2);
  for (int i = 1; i < 3; i++) {
    line(i * 100, 0, i * 100, 300);
    line(0, i * 100, 300, i * 100);
  }

  // Código base [cite: 56-63]
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 1) {
        drawX(i, j); // [cite: 60]
      } else if (board[i][j] == 2) {
        drawO(i, j); // [cite: 63] (corregido de 'draw')
      }
    }
  }
}

// Código base [cite: 64-67]
void drawX(int i, int j) {
  strokeWeight(4);
  line(i * 100 + 10, j * 100 + 10, (i + 1) * 100 - 10, (j + 1) * 100 - 10);
  line(i * 100 + 10, (j + 1) * 100 - 10, (i + 1) * 100 - 10, j * 100 + 10);
}

// Código base [cite: 68-70] (corregido de 'draw' a 'drawO')
void drawO(int i, int j) {
  strokeWeight(4);
  noFill();
  ellipse(i * 100 + 50, j * 100 + 50, 80, 80);
}

void mousePressed() {
  // Si el juego terminó, chequear si se presiona el botón de reinicio 
  if (gameEnded) {
    if (mouseX > buttonX && mouseX < buttonX + buttonW && 
        mouseY > buttonY && mouseY < buttonY + buttonH) {
      resetGame();
    }
    return; // [cite: 73]
  }

  // Código base [cite: 74, 75]
  int i = mouseX / 100;
  int j = mouseY / 100;

  // Validar que el clic esté dentro del tablero (0-299)
  if (i < 0 || i > 2 || j < 0 || j > 2) return;

  // Código base [cite: 76-79]
  if (board[i][j] == 0) {
    board[i][j] = xTurn ? 1 : 2;
    xTurn = !xTurn;
    if (!gameEnded) {
       message = xTurn ? "Turno de X" : "Turno de O"; // Mejora 
    }
    checkWin(); // [cite: 48]
  }
}

// Lógica para determinar ganador o empate 
void checkWin() {
  int winner = 0; // 0 = nadie, 1 = X, 2 = O

  // Revisar filas
  for (int j = 0; j < 3; j++) {
    if (board[0][j] != 0 && board[0][j] == board[1][j] && board[1][j] == board[2][j]) {
      winner = board[0][j];
    }
  }

  // Revisar columnas
  for (int i = 0; i < 3; i++) {
    if (board[i][0] != 0 && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
      winner = board[i][0];
    }
  }

  // Revisar diagonales
  if (board[0][0] != 0 && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
    winner = board[0][0];
  }
  if (board[2][0] != 0 && board[2][0] == board[1][1] && board[1][1] == board[0][2]) {
    winner = board[2][0];
  }

  if (winner != 0) {
    gameEnded = true;
    message = (winner == 1 ? "¡Ganó X!" : "¡Ganó O!");
    return;
  }

  // Revisar empate (si no hay ganador y el tablero está lleno)
  boolean full = true;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 0) {
        full = false;
        break;
      }
    }
  }

  if (full) {
    gameEnded = true;
    message = "¡Empate!";
  }
}
