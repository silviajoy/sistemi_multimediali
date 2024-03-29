class Particle {
  private PVector position;
  private float diameter;
  private PVector speed;
  private PVector acceleration;
  private color c;
  private float mass;
  private PVector newAcceleration;
  
  public Particle(PVector position, float mass) {
    this.position = position;
    this.speed = new PVector(0,0);
    this.acceleration = new PVector(0,0);
    this.c = color(136,255,0);
    this.mass = mass;
    this.diameter = mass*10;
  }
  
  public void display() {
    fill(c, 128);
    ellipse(this.position.x, this.position.y, this.diameter, this.diameter);
  }
  
  public void update(float timeElapsed) {
    this.speed = this.speed.add(acceleration);
    this.position = this.position.add(PVector.mult(speed,timeElapsed));
    //this.position = position.add(speed);
  }
  
    public void applyForce(PVector force) {
      System.out.println("Particle Mass within: " + this.mass);
      newAcceleration = PVector.div(force, this.mass);
      System.out.println("Force: " + force.x + " - " + force.y);
      System.out.println("Particle Acceleration: " + newAcceleration.x + " - " + newAcceleration.y);
      acceleration.add(newAcceleration);
  }
  
    public void border() {
    if (this.position.x > width) {
      this.position.x = 0;
    };
    if (this.position.x < 0) {
      this.position.x = width;
    }; 
    if (this.position.y > height) {
      this.position.y = 0;
    };
    if (this.position.y < 0) {
      this.position.y = height;
    };
  }
  
public void bounce() {
    float r = this.diameter/2.0;
    if (this.position.x > width-r || this. position.x < r) {
      if (this.speed.x<1) {
        this.acceleration.x = 0;
        this.speed.x = 0;
      } else {
        this.speed.x = this.speed.x*(-1);
      }
    };
    if (this.position.y > height-r || this.position.y < r) {
      if (this.speed.y<1) {
        this.acceleration.y = 0;
        this.speed.y = 0;
      } else {
        this.speed.y = this.speed.y*(-1);
      }
    };
  }
}