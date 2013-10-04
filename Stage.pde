class Stage {
  int h;
  int m;
  
  Stage(int h, int m) {
    this.h = h;
    this.m = m;
  }
  
  int t() {
    return h * 60 + m;
  }

  boolean before(Stage s) {
    return this.t() < s.t();
  }
}
