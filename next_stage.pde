import java.util.*;

Vector stages;
PFont font;
PFont font2;

void setup() {
  size(400,600);
  frameRate(5);

  font = createFont("Impact", 64, true);
  font2 = createFont("Impact", 96, true);
  
  stages = new Vector();

  stages.add(new Stage(10, 40));
  stages.add(new Stage(11, 10));
  stages.add(new Stage(11, 40));
  stages.add(new Stage(12, 10));

  stages.add(new Stage(13, 20));
  stages.add(new Stage(13, 50));
  stages.add(new Stage(14, 20));

  stages.add(new Stage(15, 00));
  stages.add(new Stage(15, 30));
  stages.add(new Stage(16,  0));
}

void draw() {
  background(0, 0, 64);
  smooth();
 
  stroke(255);
  noFill();
  
  strokeWeight(20);
  ellipse(200, 200, 360, 360); 

  strokeWeight(15);
  line(200, 20, 200, 40);
  line(200, 380, 200, 360);
  line(20,  200, 40, 200);
  line(380,  200, 360, 200);

  int h = hour();
  int m = minute();
  int s = second();
  
  float fh = h / 12.0 + 1.0/12.0/60.0*m;
  strokeWeight(20);
  line(200, 200, 200 + 80 * sin(fh * 2 * PI), 200 + 80 * -cos(fh * 2 * PI));

  float fm = m / 60.0;
  strokeWeight(16);
  line(200, 200, 200 + 120 * sin(fm * 2 * PI), 200 + 120 * -cos(fm * 2 * PI));

  float fs = s / 60.0;
  strokeWeight(5);
  line(200, 200, 200 + 150 * sin(fs * 2 * PI), 200 + 150 * -cos(fs * 2 * PI));
  
  Stage now = new Stage(h, m);
  Stage next_stage = null;
  for (int i = 0; i < stages.size(); ++i) {
    Stage st = (Stage)stages.get(i);
    if (now.before(st)) {
      next_stage = st;
      break;
    }
  }
  
  String msg;
  if (next_stage == null) {
    textFont(font);
    text("Finished!", 60, 470); 
  }
  else {
    textFont(font);
    text("Next Stage", 60, 470);

    textFont(font2);
    String sh = digit2(next_stage.h);
    String sm = digit2(next_stage.m);
    text(sh + ":" + sm, 100, 570);
  }
}

String digit2(int n) {
  String s;
  s = "00" + n;
  s = s.substring(s.length() - 2, s.length());
  return s;
}

