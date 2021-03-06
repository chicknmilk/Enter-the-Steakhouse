public class Player {
  float x, y, speed;
  boolean[] direction;
  
  Room currentRoom;
  
  int health;
  int money;
  int blanks;
  int keys;

  int iFrame = 0;

  int radius = 10;
  Weapon currentWeapon;
  
  boolean isFalling = false;
  boolean isShooting = false;
  int blankCooldown = 0;
  int[] fallDirection = null; // gets updated with the direction the player was moving in when they were isFalling
  
  String[] heartColour = loadStrings("heart.txt");
  String[] blankColour = loadStrings("milk.txt");
  String[] keyColour = loadStrings("key.txt");
  String[] coinColour = loadStrings("coin.txt");
  String[] cow = loadStrings("cowpixel.txt"); 
  
  Player(Room currentRoom, float speed) {
    this.x = width / 2;
    this.y = height / 2;
    this.direction = new boolean[4];
    
    this.speed = speed;
    this.currentRoom = currentRoom;
    
    this.health = 10;
    this.money = 0;
    this.blanks = 6;
    this.keys = 1;
    
    Weapon pistol = new Weapon(15, 5, 1, 0);
    this.currentWeapon = pistol;
  }
  
  public void draw() {
    fill(0);
    
    // draw the player
    ellipseMode(CENTER);
    drawPlayer(this.x, this. y, 2);
    
    // draw the player info
    drawPlayerInfo();
    

    if (iFrame > 0) iFrame--;

    // draw the weapon
    currentWeapon.draw();

    if (p.blankCooldown > 0) p.blankCooldown--;

    if (currentWeapon.timeUntilNextShot > 0) currentWeapon.timeUntilNextShot--;
    if (isShooting) shootProjectile();
  }
  
  public void drawPlayer(float x, float y, int sideLength){

    x -= cow[0].length()/2 * sideLength; //centers the player cow
    y -= cow.length/2 * sideLength; 
    
    float newX = x;
    noStroke();

    int transparent = this.iFrame == 0 ? 255 : 50;
    if (isFalling) {
      sideLength = 1;
      transparent = 50;
    }
    
    if (mouseX < this.x) { 
      for (int i = 0; i < cow.length; i++) {
        for (int j = 0; j < cow[0].length(); j++) {
          char colour = cow[i].charAt(j);
          
          if (colour == '0') {
            //space; skip the iteration
          }
          else {
            if (colour == '1') {fill(#000000, transparent);} //black
            else if (colour == '2') {fill(#FFFFFF, transparent);} //white
            else if (colour == '3') {fill(#FF8BA8, transparent);} //pink
            rect(newX,y, sideLength,sideLength);
          }
          newX += sideLength;
        }
        newX = x; //resets newX
        y += sideLength;
      }
    }
    else {
      for (int i = 0; i < cow.length; i++) {
        for (int j = cow[0].length() - 1; j >= 0; j--) {
          char colour = cow[i].charAt(j);
          
          if (colour == '0') {
            //space; skip the iteration
          }
          else {
            if (colour == '1') {fill(#000000, transparent);} //black
            else if (colour == '2') {fill(#FFFFFF, transparent);} //white
            else if (colour == '3') {fill(#FF8BA8, transparent);} //pink
            rect(newX,y, sideLength,sideLength);
          }
          newX += sideLength;
        }
        newX = x; //resets newX
        y += sideLength;
      }
    }
      
    
  }

  public void drawPlayerInfo() {
    int xOffset = 50;
    int yOffset = 30;

    fill(200, 0, 0);
    for (int i = 0; i < this.health; i++) {
      drawHeart(xOffset + (i * 35), yOffset, 2);
    }
    for (int i = 0; i < this.blanks; i++) {
      drawBlank(xOffset + (i * 40), yOffset + 32, 1);
    }
    for (int i = 0; i < this.keys; i++) {
      drawKey(xOffset+10 + (i * 48), yOffset + 67, 2);
    }

    textSize(32);
    fill(0);
    text(this.money, xOffset - 10, yOffset + 110);

    drawCoin(xOffset + 30, yOffset + 100, 2);
  }
  
  void drawHeart(float x, float y, int sideLength){
    x -= heartColour[0].length()/2 * sideLength; //centers the heart
    y -= heartColour.length/2 * sideLength; 
    
    float newX = x;
      
    noStroke();
    for (int i = 0; i < heartColour.length; i++) {
      
      for (int j = 0; j < heartColour[0].length(); j++) {
        char c = heartColour[i].charAt(j);
        
        if (c == '0') {
          //space; skip the iteration
        }
        else {
          if (c == '1') {fill(#000000);} //black
          else if (c == '2') {fill(#FF0505);} //bright red
          else if (c == '3') {fill(#CB1515);} //dark red
          else if (c == '4') {fill(#FFFFFF);} //white
          rect(newX,y, sideLength,sideLength);
        }
        newX += sideLength;
      }
      newX = x; //resets newX
      y += sideLength;
    }
  }

  void drawBlank(float x, float y, int sideLength) {
    x -= blankColour[0].length()/2 * sideLength; //centers the blank (milk carton)
    y -= blankColour.length/2 * sideLength; 
    
    float newX = x;
      
    noStroke();
    for (int i = 0; i < blankColour.length; i++) {
      
      for (int j = 0; j < blankColour[0].length(); j++) {
        char c = blankColour[i].charAt(j);
        
        if (c == '0') {
          //space; skip the iteration
        }
        else {
          if (this.blankCooldown == 0) {
            if (c == '1') {fill(#000000);} //black
            else if (c == '2') {fill(#FFFFFF);} //white
            else if (c == '3') {fill(#9DEBFF);} //cyan blue
            else if (c == '4') {fill(#9DFFF1);} 
            else if (c == '5') {fill(#95C4FF);} //light blue 
            else if (c == '6') {fill(#7491FF);} //
            else if (c == '7') {fill(#524DFF);} //dark blue
            else if (c == '8') {fill(#FCF2CC);} //beige
          }
          else { //change the alpha to show user that blank was used
            if (c == '1') {fill(#000000,100);} //black
            else if (c == '2') {fill(#FFFFFF,100);} //white
            else if (c == '3') {fill(#9DEBFF,100);} //cyan blue
            else if (c == '4') {fill(#9DFFF1,100);} 
            else if (c == '5') {fill(#95C4FF,100);} //light blue 
            else if (c == '6') {fill(#7491FF,100);} //
            else if (c == '7') {fill(#524DFF,100);} //dark blue
            else if (c == '8') {fill(#FCF2CC,100);} //beige
          }
          rect(newX,y, sideLength,sideLength);
        }
        newX += sideLength;
      }
      newX = x; //resets newX
      y += sideLength;
    }
  }
  
  void drawKey(float x, float y, int sideLength){
    x -= keyColour[0].length()/2 * sideLength; //centers the key
    y -= keyColour.length/2 * sideLength; 
    
    float newX = x;
      
    noStroke();
    for (int i = 0; i < keyColour.length; i++) {
      
      for (int j = 0; j < keyColour[0].length(); j++) {
        char c = keyColour[i].charAt(j);
        
        if (c == '0') {
          //space; skip the iteration
        }
        else {
          if (c == '1') {fill(0);} //black
          else if (c == '2') {fill(#FFFFFF);} //white
          else if (c == '3') {fill(#FFED21);} //bright yellow
          else if (c == '4') {fill(#FCD821);} //
          else if (c == '5') {fill(#FFB012);} //orange
          else if (c == '5') {fill(#DE9C16);} //brown
          rect(newX,y, sideLength,sideLength);
        }
        newX += sideLength;
      }
      newX = x; //resets newX
      y += sideLength;
    }
  }

  void drawCoin(float x, float y, int sideLength) {
    x -= coinColour[0].length()/2 * sideLength; //centers the coin
    y -= coinColour.length/2 * sideLength; 
    
    float newX = x;
      
    noStroke();
    for (int i = 0; i < coinColour.length; i++) {
      
      for (int j = 0; j < coinColour[0].length(); j++) {
        char c = coinColour[i].charAt(j);
        
        if (c == '0') {
          //space; skip the iteration
        }
        else {
          if (c == '1') {fill(#000000);} //black
          else if (c == '2') {fill(#FFFFFF);} //white
          else if (c == '3') {fill(#FEFF12);} //bright yellow
          else if (c == '4') {fill(#FFE02E);} //cheese yellow
          else if (c == '5') {fill(#B6B909);} //dirty yellow
          rect(newX,y, sideLength,sideLength);
        }
        newX += sideLength;
      }
      newX = x; //resets newX
      y += sideLength;
    }
  }
  
  public void move() {
    if (isFalling) {
      if (radius > -30) {
        radius--;
      }
      else {
        radius = 10;
        isFalling = false;
        this.x -= fallDirection[0] * speed * 3;
        this.y -= fallDirection[1] * speed * 3;
        this.loseHP(1);
      }
      return;
    }

    for (int i = 0; i < this.speed; i++) {
      // sum the directions the player is moving in
      int x = (direction[EAST] ? 1 : 0) + (direction[WEST] ? -1 : 0);
      int y = (direction[NORTH] ? -1 : 0) + (direction[SOUTH] ? 1 : 0);

      if (!checkIfXWall(x, y)) {
        if (!this.currentRoom.enemyList.isEmpty() && x == 1 && this.x >= width - radius) continue;
        if (!this.currentRoom.enemyList.isEmpty() && x == -1 && this.x < radius) continue;
        this.x += x;
      }
      if (!checkIfYWall(x, y)) {
        if (!this.currentRoom.enemyList.isEmpty() && y == 1 && this.y >= height - radius) continue;
        if (!this.currentRoom.enemyList.isEmpty() && y == -1 && this.y < radius) continue;
        this.y += y;
      }

      // checks if player fell into a pit
      this.isFalling = checkIfPit();

      // checks if the player tries to walk to another room
      if (this.currentRoom.enemyList.isEmpty()) checkIfRoomChange();
    }
  }

  public boolean checkIfXWall(int x, int y) {
    float newX = x + this.x;
    float newY = y + this.y;

    try {
      // check if left is in a wall
      if (x == -1) {
        if (fetchTile(newX - radius, newY) == WALL) return true;
      }
    }
    catch (Exception e) {}
    try {
      // check if right is in a wall
      if (x == 1) {
        if (fetchTile(newX + radius, newY) == WALL) return true;
      }
    }
    catch (Exception e) {}

    return false;
  }

  public boolean checkIfYWall(int x, int y) {
    float newX = x + this.x;
    float newY = y + this.y;

    try {
      // check if up is a wall
      if (y == -1) {
        if (fetchTile(newX, newY - radius) == WALL) return true;
      }
    }
    catch (Exception e) {}
    try {
      // check if down is a wall
      if (y == 1) {
        if (fetchTile(newX, newY + radius) == WALL) return true;
      }
    }
    catch (Exception e) {}

    return false;
  }
 
  // checks if the player is in a pit
  public boolean checkIfPit() {
    try {
      if (fetchTile(this.x, this.y) == PIT) {
        this.fallDirection = new int[] {(direction[EAST] ? 1 : 0) + (direction[WEST] ? -1 : 0), (direction[NORTH] ? -1 : 0) + (direction[SOUTH] ? 1 : 0)};
        return true;
      }
    }
    catch (Exception e) {}
    return false;
  }

  // responsible for switching room
  public void checkIfRoomChange() {
    if (this.x <= 0) {
      // check if there is a corridor here
      if (this.currentRoom.corridorW != null && (int)(this.x / 30) == this.currentRoom.corridorW[1] && (int)(this.y / 30) == this.currentRoom.corridorW[0]) {
        // GOING WEST
        if (this.currentRoom.roomW != null) {
          this.currentRoom.projectileList = new ArrayList();
          this.currentRoom.isCurrentRoom = false;
          this.currentRoom.roomW.isCurrentRoom = true;

          this.currentRoom.roomW.constructCorridors();
          
          this.x = this.currentRoom.roomW.corridorE[1] * 30 - 1;
          this.y = this.currentRoom.roomW.corridorE[0] * 30 + 15;

          this.currentRoom = this.currentRoom.roomW;
          this.currentRoom.visited = true;

          spawnBoss();
        }
        else this.x = 0;
      }
      else this.x = 0;
    }
    else if (this.x >= width) {
      // check if there is a corridor here
      if (this.currentRoom.corridorE != null && (int)(this.x / 30) == this.currentRoom.corridorE[1] && (int)(this.y / 30) == this.currentRoom.corridorE[0]) {
        // GOING EAST
        if (this.currentRoom.roomE != null) {
          this.currentRoom.projectileList = new ArrayList();
          this.currentRoom.isCurrentRoom = false;
          this.currentRoom.roomE.isCurrentRoom = true;

          this.currentRoom.roomE.constructCorridors();

          this.x = this.currentRoom.roomE.corridorW[1] * 30 + 1;
          this.y = this.currentRoom.roomE.corridorW[0] * 30 + 15;
          
          this.currentRoom = this.currentRoom.roomE;
          this.currentRoom.visited = true;

          spawnBoss();
        }
        else this.x = width;
      }
      else this.x = width;
    }
    if (this.y <= 0) {
      // check if there is a corridor here
      if (this.currentRoom.corridorN != null && (int)(this.x / 30) == this.currentRoom.corridorN[1] && (int)(this.y / 30) == this.currentRoom.corridorN[0]) {
        // GOING NORTH
        if (this.currentRoom.roomN != null) {
          this.currentRoom.projectileList = new ArrayList();
          this.currentRoom.isCurrentRoom = false;
          this.currentRoom.roomN.isCurrentRoom = true;

          this.currentRoom.roomN.constructCorridors();

          this.x = this.currentRoom.roomN.corridorS[1] * 30 + 15;
          this.y = this.currentRoom.roomN.corridorS[0] * 30 - 1;
          
          this.currentRoom = this.currentRoom.roomN;
          this.currentRoom.visited = true;

          spawnBoss();
        }
        else this.y = 0;
      }
      else this.y = 0;
    }
    else if (this.y >= height) {
      // check if there is a corridor here
      if (this.currentRoom.corridorS != null && (int)(this.x / 30) == this.currentRoom.corridorS[1] && (int)(this.y / 30) == this.currentRoom.corridorS[0]) {
        // GOING SOUTH
        if (this.currentRoom.roomS != null) {
          this.currentRoom.projectileList = new ArrayList();
          this.currentRoom.isCurrentRoom = false;
          this.currentRoom.roomS.isCurrentRoom = true;

          this.currentRoom.roomS.constructCorridors();

          this.x = this.currentRoom.roomS.corridorN[1] * 30 + 15; //NULLPOINTER EXCEPTION
          this.y = this.currentRoom.roomS.corridorN[0] * 30 + 1;
          
          this.currentRoom = this.currentRoom.roomS;
          this.currentRoom.visited = true;

          spawnBoss();
        }
        else this.y = height;
      }
      else this.y = height;
    }
  }
  
  public void changeDirection(boolean moving) {
    switch (keyCode) {
      case WKEY:
        direction[NORTH] = moving;
        break;
      case DKEY:
        direction[EAST] = moving;
        break;
      case SKEY:
        direction[SOUTH] = moving;
        break;
      case AKEY:
        direction[WEST] = moving;
        break;
    }
  }
  
  // asks the current weapon to shoot
  public void shootProjectile() {
    this.currentWeapon.shootProjectile();
  }
  
  void loseHP(float lost){
    this.health--;
  }

  public void purchaseItem(int itemIndex) {
    if (this.currentRoom.roomType.equals("shop")) {
      ((ShopRoom) this.currentRoom).purchaseItem(itemIndex);
    }
  }

  public boolean useBlank() {
    if (this.blanks <= 0) return false;
    this.blanks--;
    this.currentRoom.removeEnemyProjectiles();
    return true;
  }


  public void spawnBoss() {
    if (this.currentRoom.roomType.equals("boss")) {
      if (!((BossRoom)this.currentRoom).bossSpawned) {

        for (Room r : map.roomList) {
          if (r.roomType.equals("combat")) {
            if (!r.visited) return;
          }
        }
        ((BossRoom)this.currentRoom).addBossToRoom();
        ((BossRoom)this.currentRoom).bossSpawned = true;
      }
    }
  }
  
  public void openChest() {
    if (this.currentRoom.roomType.equals("chest")) {
      if (!((ChestRoom)this.currentRoom).chestOpened) {
        if (p.keys > 0) {
          p.keys--;
          ((ChestRoom)this.currentRoom).openChest();
        }
      }
    }
  }
}
