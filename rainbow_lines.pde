boolean do_line;

void setup() {
  size(1600, 800);
  background(0);
  do_line = false;
}

void draw_line(float x, float y) {
  float cx = width / 2;
  float cy = height / 2;

  float h = (new PVector(x - cx, y - cy).heading() + PI) / TWO_PI * 255;

  stroke(h, 255, 255);
  line(cx, cy, x, y);
}

void draw() {
  colorMode(HSB, 255, 255, 255);
  if (do_line) {
    draw_line(mouseX, mouseY);
  }
}

void draw_interval(int interval) {
  for (int x = 0; x < width; x += interval) {
    println(x);
    draw_line(x, 0);
    draw_line(x, height);
  }
  for (int y = 0; y < height; y += interval) {
    draw_line(0, y);
    draw_line(width, y);
  }
}

void keyPressed() {
  if ('0' < key && key <= '9') {
    draw_interval(key - '0');
  } else if (key == 'r') {
    setup();
  }
}

void mousePressed() {
  do_line = !do_line;
}
