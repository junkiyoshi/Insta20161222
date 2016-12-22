import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing box2d;

ArrayList<Circle> circles;
Surface surface;

void setup()
{
  size(720, 720);
  background(0);
  frameRate(60);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -30);
  
  circles = new ArrayList<Circle>();
  surface = new Surface();
}

void draw()
{
  background(0);
  box2d.step();
  
  if(frameCount < 3600)
  {
    Circle circle = new Circle(20, 20 + random(-5, 5), 10, color(random(255), random(255), random(255)));
    circle.body.setLinearVelocity(new Vec2(25, 0));
    circles.add(circle);
  }
  
  if(frameCount % 600 == 0)
  {
    Circle circle = new Circle(50, -50, 100, color(255, 255, 255));
    Fixture f = circle.body.getFixtureList();
    f.setDensity(1000);
    circle.body.setLinearVelocity(new Vec2(1000, -1000));
    circle.body.setAngularVelocity(30);
    circles.add(circle);
  }
 
  for(Circle c : circles)
  {
    c.display();
  }
  
  surface.display();
  
  /*
  for(int i = circles.size() - 1; i >= 0; i--)
  {
    Circle c = circles.get(i);
    if(c.isDead())
    {
      circles.remove(i);
    }
  }
  */
  
  /*
  saveFrame("screen-#####.png");
  println(frameCount);
  if(frameCount > 3600)
  {
     exit();
  } 
  */
}