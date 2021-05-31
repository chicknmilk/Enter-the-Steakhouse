public class Stove extends Enemy{
  int projectileDamage = 1;
  float projectileSpeed = 7;
  int cooldown = 50; //does not change
  int c = cooldown;
  
  Stove(float x, float y, int health, int contactDamage) {
    super(x, y, health, contactDamage);  
  }
  
  public void shootProjectile() {
    // calculates direction of the projectile
    float xDist = p.x - x;
    float yDist = p.y - y;
    
    float angle = atan2(yDist, xDist);
    
    //***why can it not exceed 6 projectiles??
    // creates 6 projectiles 60 degrees apart
    for (int i = 0; i <= radians(300); i+= radians(60)) {
      float dx = projectileSpeed * cos(angle+i);
      float dy = projectileSpeed * sin(angle+i);
      Projectile p1 = new Projectile(x, y, dx, dy, 25, #6D60E8, projectileDamage, -1, 1, false);
      
      // adds projectile to the projectile list of the room that the player is in
      p.currentRoom.projectileList.add(p1);
    }
  }
  
  void loadMon(float x, float y, int sideLength){
    String[] monster = loadStrings("stove.txt");
    
    x -= monster[0].length()/2 * sideLength; //centers the monster
    y -= monster.length/2 * sideLength; 
    
    float newX = x;
      
    noStroke();
    for (int i = 0; i < monster.length; i++) {
      
      for (int j = 0; j < monster[0].length(); j++) {
        char colour = monster[i].charAt(j);
        
        if (colour == '0') {
          //space; skip the iteration
        }
        else {
          if (colour == '1') {fill(#3D3B7E);} //blue, darkest
          else if (colour == '2') {fill(#424EB9);}
          else if (colour == '3') {fill(#5D77F2);}
          else if (colour == '4') {fill(#5EE6FC);} //blue, lightest
          rect(newX,y, sideLength,sideLength);
        }
        newX += sideLength;
      }
      newX = x; //resets newX
      y += sideLength;
    }
  }
  
  public void draw() {
    loadMon(x,y,4);
    
    //periodically shoots projectile 
    if (c == 0) {
      shootProjectile();
      this.c = this.cooldown;
    }
    else {
      c--;
    }
  }

}
