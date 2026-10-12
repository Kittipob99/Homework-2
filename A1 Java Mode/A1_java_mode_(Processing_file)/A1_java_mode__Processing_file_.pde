float startTime = 0;
float v0 = 0;
float h0 = 0;
float g = 9.81;
float obj_size = 25;
boolean isrunning = true;

void setup() {
  size(1000, 700);
  startTime = millis();
}

float time() {
  float seconds = (millis() - startTime) / 1000.0;
  return seconds;
}

float velocity() {
  float v = v0 + g * time();
  return v;
}

float distance() {
  float d = 0.5 * g * pow(time(), 2);
  return d;
}

void simulation() {
  float simX = width - 700;
  float simY = height - 650;

  fill(225, 240, 250);
  noStroke();
  rect(simX, simY, 600, 500);

  stroke(3);
  line(simX + 50, simY, simX + 150, simY);
  line(simX + 100, simY, simX + 100, 550);
  line(simX + 50, 550, simX + 150, 550);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("50 m", 350, 300);
}

void stats() {
  fill(0);
  textAlign(LEFT, CENTER);
  textSize(30);

  text("a : " + nf(-g, 1, 2) + " m/s^2", 75, 50);
  text("t : " + nf(time(), 1, 2) + " s", 75, 100);
  text("v : " + nf(velocity(), 1, 2) + " m/s", 75, 150);
  text("d : " + nf(distance(), 1, 2) + " m", 75, 200);
}

void object() {
  fill(0);
  ellipse(600, 50 - obj_size / 2 + distance() * 10,
          obj_size, obj_size);
}

void draw() {
  if (isrunning) {
    background(255);

    simulation();
    stats();
    object();

    if (distance() >= 50) {
      isrunning = false;
      line(575, 550, 625, 550);
    }
  }
}
