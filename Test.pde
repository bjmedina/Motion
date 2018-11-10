import processing.video.*;

PImage back;
Capture vid;
void saveBack() {
  back = createImage(vid.width, vid.height, RGB);
  back.copy(vid, 0, 0, vid.width, vid.height, 0, 0, back.width, back.height);
  back.updatePixels();
}

void setup() {
  size(1024, 1024);
  vid = new Capture(this, Capture.list()[0]);
  vid.start();
}

void captureEvent(Capture video) {
  video.read();
}

void mousePressed() {
  saveBack();
  //back.save("cap.jpg");
}

void draw() {
  for(int x = 0; x < vid.width; x++)
  image(vid, 0, 0);
}

float colorDist(int r1, int g1, int b1, int r2, int g2, int b2) {
  return colorDist(color(r1, g1, b1), color(r2, g2, b2));
}

float colorDist(color a, color b) {
  float ar = red(a), ag = green(a), ab = blue(a);
  float br = red(b), bg = green(b), bb = blue(b);
  
  float bar_r = (ar + br)/2,
  delta_r = (ar - br) * (ar - br),
  delta_g = (ag - bg) * (ag - bg),
  delta_b = (ab - bb) * (ab - bb);
  
  return sqrt((2 * delta_r) + (4 * delta_g) + (3 * delta_b) + ((bar_r * (delta_r - delta_b))/256));
}
