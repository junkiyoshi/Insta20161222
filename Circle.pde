class Circle 
{
  Body body;
  float size;
  
  color bodyColor;

  Circle(float x, float y, float size_, color c) {
    size = size_;
    makeBody(new Vec2(x, y));
    bodyColor = c;
  }

  void makeBody(Vec2 center) {

    CircleShape cs = new CircleShape();
    float box2dSize = box2d.scalarPixelsToWorld(size);
    cs.setRadius(box2dSize / 2);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.75;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
  }

  boolean isDead() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.x < 0 || pos.x > width + size || pos.y > height + size) {
      box2d.destroyBody(body);
      return true;
    }
    return false;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);

    pushMatrix();
    translate(pos.x, pos.y);
    fill(bodyColor);
    noStroke();
    ellipse(0, 0, size, size);
    popMatrix();
  }

}