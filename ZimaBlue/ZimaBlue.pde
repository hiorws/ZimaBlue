color zima;
int shape;
float randomSize;
float randomX;
float randomY;
int numberOfArea;
int numberOfShapes;

float strokeRangeMin = 150;
float strokeRangeMax = 220;

void setup() {
  size(1024, 768, P2D);
  background(0, 220);
  zima = color(77, 205, 241);
  // numberOfArea = int(random(5, 10));
  numberOfArea = 25;

  generate();
}

void generate() {
  drawBackground();
  fill(zima);
  shape = int(random(0, 6));
  println(shape);
  noStroke();
  switch(shape) {
  case 0: 
    drawBigPoint();
    break;
  case 1: 
    drawCircle();
    break;
  case 2: 
    drawEllipse();
    break;
  case 3: 
    drawSquare();
    break;
  case 4: 
    drawRectangle();
    break;
  case 5: 
    drawTriangle();
    break;
  default:
    println("DEFAULT");
    break;
  }
}

void draw() {
}

void drawBackground() {
  background(random(70));

  for (int i=0; i<numberOfArea; i++) {
    float areaX = random(width * 9/10);
    float areaY = random(height * 9/10);
    shape = int(random(0, 5));
    noFill();
    switch(shape) {
    case 0:
      // draw rectangles
      numberOfShapes = int(random(10, 20));
      for (int x=0; x<numberOfShapes; x++) {
        stroke(random(strokeRangeMin, strokeRangeMax));
        randomX = random(20, 50);
        randomY = random(20, 50);
        areaX += random(-20, 20);
        areaY += random(-20, 20);
        rect(areaX, areaY, randomX, randomY);
      }
      break;
    case 1:
      // draw squares
      numberOfShapes = int(random(10, 20));
      for (int x=0; x<numberOfShapes; x++) {
        stroke(random(strokeRangeMin, strokeRangeMax));
        randomSize = random(20, 100);
        areaX += random(-20, 20);
        areaY += random(-20, 20);
        rect(areaX, areaY, randomSize, randomSize);
      }
      break;
    case 2: 
      // draw circles
      numberOfShapes = int(random(10, 20));
      for (int x=0; x<numberOfShapes; x++) {
        stroke(random(strokeRangeMin, strokeRangeMax));
        randomSize = random(20, 100);
        areaX += random(-20, 20);
        areaY += random(-20, 20);
        ellipse(areaX, areaY, randomSize, randomSize);
      }
      break;
    case 3:
      // draw ellipse
      numberOfShapes = int(random(10, 20));
      for (int x=0; x<numberOfShapes; x++) {
        stroke(random(strokeRangeMin, strokeRangeMax));
        randomX = random(20, 50);
        randomY = random(20, 50);
        areaX += random(-20, 20);
        areaY += random(-20, 20);
        ellipse(areaX, areaY, randomX, randomY);
      }
      break;
    case 4:
      // draw ellipse
      numberOfShapes = int(random(10, 20));
      for (int x=0; x<numberOfShapes; x++) {
        stroke(random(strokeRangeMin, strokeRangeMax));
        randomX = random(20, 50);
        randomY = random(20, 50);
        areaX += random(-20, 20);
        areaY += random(-20, 20);
        
        pushMatrix();
        //translate(width*0.8, height*0.5);
        rotate(frameCount / -100.0);
        star(areaX, areaY, 30, 70, 5); 
        popMatrix();
        
      }
      break;
    default:
      println("DEFAULT");  
      break;
    }
  }
}

void mousePressed() {
  saveFrame("zimablue-######.png");
  generate();
}

void keyPressed() {
  saveFrame("zimablue-######.png");
  generate();
}

void drawBigPoint() {
  ellipseMode(CENTER);
  ellipse(width/2, height/2, 10, 10);
}


void drawRectangle() {
  rectMode(CENTER);
  randomX = random(width);
  randomY = random(height);
  rect(width/2, height/2, randomX, randomY);
}


void drawSquare() {
  rectMode(CENTER);
  randomSize = random(height/2);
  rect(width/2, height/2, randomSize, randomSize);
}

void drawEllipse() {
  ellipseMode(CENTER);
  randomX = random(width);
  randomY = random(height);
  ellipse(width/2, height/2, randomX, randomY);
}


void drawCircle() {
  ellipseMode(CENTER);
  randomSize = random(height/2);
  ellipse(width/2, height/2, randomSize, randomSize);
}


void drawTriangle() {
  float BX;
  float BY;
  float CX;
  float CY;

  BX = random(0, width/2);
  CX = width - BX;

  BY = random(height/2, height * 2/3);
  CY = BY;

  triangle(width/2, random(height * 1/3, height * 2/3), BX, BY, CX, CY);
}


void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
