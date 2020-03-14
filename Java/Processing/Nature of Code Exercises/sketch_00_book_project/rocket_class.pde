// Rocketeers are confident, steadfast, and uncompromising

class rocket
{
  PImage rocket_ship_img;
  float rotation;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float top_speed;
  
  rocket()
  {
    rocket_ship_img = loadImage("Rocket Ship RIGHT.png");
    
    top_speed = random(5, 12);
    
    float decider = random(-1, 1);  // Decides if rocket will move left or right
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    // Determining rocket direction
    if (decider >= 0)
      acceleration = new PVector(random(0.25, 4), random(1, 3));
    else
      acceleration = new PVector(random(-0.25, -4), random(1, 3));

    // Heading gives angle of direction of vector
      // So this rotates the rocket so it is facing the direction of its vector
    rotation = acceleration.heading();
  }
  
  void check_edges()
  {
    // Resets image if its outside boundaries
    if (location.x > width)
      location.x = 0;
    if (location.x < 0)
      location.x = width;
      
    if (location.y > height)
      location.y = 0;
    if (location.y < 0)
      location.y = height;
  }
  
  void update()
  {
    // Causing movement
    velocity.add(acceleration);
    velocity.limit(top_speed);
    location.add(velocity);
    
    check_edges();
  }
  
  void display()
  {
    push();
    // Rotate origin by default is (0, 0), changing this gives object rotation about itself
    translate(location.x, location.y);
    rotate(rotation);
    image(rocket_ship_img, 0, 0, 100, 60);
    pop();
  }
}
