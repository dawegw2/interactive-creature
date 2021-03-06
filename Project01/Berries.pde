class Berry {
  float berryX;
  float berryY;
  float sizeVal;
  float increment;
  float dropSpeed;
  boolean picked;

  Berry() { //initalizes berry values
    sizeVal = random(10, 25);
    berryX = random(150) + 325;
    berryY = random(150) + 400;
    increment = 0;
    dropSpeed = 5;
  }

  //determines color and position of each berry  
  void position() {  
    fill(berryColor);
    stroke(0);
    strokeWeight(5);
    ellipse(berryX, berryY, 0 + increment, 0 + increment);
  }

  //grows berries to its random sized value
  void growBerry() {
    if (increment < sizeVal) {
      increment = increment + 1; //increment increases the size of the berries
    }
  }

  void movePos() {
    berryX = random(150) + 325;
    berryY = random(150) + 400;
    increment = 0;
  }

  void changeCol() {
    float val = random(1);
    println(val);
    if (val > 0.5) {
      berryColor = color(random(127) + 127, random(127) + 127, 255); //blues and purples
    } else {
      berryColor = color(random(25) + 230, random(127) + 127, random(127) + 127); //pinks
    }
  }

  void checkMouseDistance() { 
    float d = dist(berryX, berryY, mouseX, mouseY); //measures distance from a berry's (x,y) to the mouse pointer's position
    if (d < 20) { //if the distance is less than 20, sets boolean picked to true
      picked = true;
      println(picked);
    }
  }

  void dropBerry() {
    if (picked == true) { //occurs when the berry y value is not outide the window and picked is true 
      dropSpeed = int(random(3, 10)); //randomizes drop speed of each berry 
      fall();
    } else {
      picked = false;
    }
  }

  void fall() {
    berryY = berryY + dropSpeed;
  }

  boolean isPicked() {
    if (berryY > height) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    position(); //places berry in a rondom position with a random color and a size of 0
    growBerry(); //grow berry into a random size
    checkMouseDistance(); //checks distance between the mouse pointer and the berry's position
    dropBerry(); //once the mouse pointer is closs enough, the berry drops at a random speed
  }
}
