// Ejercicio 2: Paddle en 3D con P3D
// Código base [cite: 91-94]
PVector ballPos, ballSpeed;
float ballRadius = 10;
PVector paddle1Pos, paddle2Pos;
float paddleWidth = 10, paddleHeight = 60, paddleDepth = 10, paddleSpeed = 5;

// Variables para control de raquetas
boolean wDown, sDown, upDown, downDown;

// Mejora: Marcador 
int score1 = 0;
int score2 = 0;

void setup() {
  size(800, 400, P3D); // [cite: 97]
  textSize(32);
  resetBall(); // Inicializar pelota
  
  // Código base [cite: 100, 101]
  paddle1Pos = new PVector(10, height / 2 - paddleHeight / 2, 0);
  paddle2Pos = new PVector(width - 20, height / 2 - paddleHeight / 2, 0);
}

void resetBall() {
  // Código base [cite: 98, 99]
  ballPos = new PVector(width / 2, height / 2, 0);
  // Dirección Z aleatoria para variar el juego
  ballSpeed = new PVector(random(2, 4) * (random(1) > 0.5 ? 1 : -1), 
                         random(-2, 2), 
                         random(-2, 2));
}

void draw() {
  background(0); // [cite: 103]
  
  // Mejoras: Luces [cite: 104, 120]
  lights(); // Luz ambiental base [cite: 104]
  pointLight(255, 255, 255, ballPos.x, ballPos.y, ballPos.z + 50); // Luz sigue la pelota 

  // Mover y dibujar pelota
  moveBall();
  drawBall();
  
  // Mover y dibujar raquetas
  movePaddles(); // Lógica de control [cite: 108]
  drawPaddle(paddle1Pos);
  drawPaddle(paddle2Pos);
  
  // Dibujar Marcador 
  fill(255);
  textAlign(CENTER);
  text(score1, width * 0.25, 50);
  text(score2, width * 0.75, 50);
}

void moveBall() {
  ballPos.add(ballSpeed); // [cite: 106]

  // Colisiones con paredes (Arriba/Abajo)
  if (ballPos.y < ballRadius || ballPos.y > height - ballRadius) {
    ballSpeed.y *= -1;
  }
  // Colisiones con paredes (Profundidad Z)
  if (ballPos.z < -100 || ballPos.z > 100) { // Damos un límite de profundidad
    ballSpeed.z *= -1;
  }

  // Colisiones con raquetas [cite: 107]
  // Raqueta 1 (Izquierda)
  if (ballPos.x - ballRadius < paddle1Pos.x + paddleWidth &&
      ballPos.y > paddle1Pos.y && ballPos.y < paddle1Pos.y + paddleHeight &&
      ballPos.z > paddle1Pos.z - paddleDepth/2 && ballPos.z < paddle1Pos.z + paddleDepth/2) {
    ballSpeed.x *= -1;
    ballPos.x = paddle1Pos.x + paddleWidth + ballRadius; // Evitar que se pegue
  }

  // Raqueta 2 (Derecha)
  if (ballPos.x + ballRadius > paddle2Pos.x &&
      ballPos.y > paddle2Pos.y && ballPos.y < paddle2Pos.y + paddleHeight &&
      ballPos.z > paddle2Pos.z - paddleDepth/2 && ballPos.z < paddle2Pos.z + paddleDepth/2) {
    ballSpeed.x *= -1;
    ballPos.x = paddle2Pos.x - ballRadius; // Evitar que se pegue
  }

  // Puntos
  if (ballPos.x < 0) {
    score2++; // Punto para jugador 2 
    resetBall();
  }
  if (ballPos.x > width) {
    score1++; // Punto para jugador 1 
    resetBall();
  }
}

void drawBall() {
  pushMatrix();
  translate(ballPos.x, ballPos.y, ballPos.z);
  noStroke();
  fill(255, 0, 0);
  sphere(ballRadius);
  popMatrix();
}

void drawPaddle(PVector pos) {
  pushMatrix();
  translate(pos.x, pos.y, pos.z);
  fill(0, 0, 255);
  // Usar box() para raqueta 3D [cite: 123]
  box(paddleWidth, paddleHeight, paddleDepth);
  popMatrix();
}

// Lógica de control de raquetas [cite: 108]
void movePaddles() {
  if (wDown) {
    paddle1Pos.y = max(0, paddle1Pos.y - paddleSpeed);
  }
  if (sDown) {
    paddle1Pos.y = min(height - paddleHeight, paddle1Pos.y + paddleSpeed);
  }
  if (upDown) {
    paddle2Pos.y = max(0, paddle2Pos.y - paddleSpeed);
  }
  if (downDown) {
    paddle2Pos.y = min(height - paddleHeight, paddle2Pos.y + paddleSpeed);
  }
}

// Controles de teclado
void keyPressed() {
  if (key == 'w' || key == 'W') wDown = true;
  if (key == 's' || key == 'S') sDown = true;
  if (keyCode == UP) upDown = true;
  if (keyCode == DOWN) downDown = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wDown = false;
  if (key == 's' || key == 'S') sDown = false;
  if (keyCode == UP) upDown = false;
  if (keyCode == DOWN) downDown = false;
}
