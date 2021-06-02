public final int PISTOL = 10;
public final int SHOTGUN = 11;

public class Weapon extends Item {
  float projectileSize, damage;
  int timeUntilNextShot, fireRate;
  int type;
  
  Weapon(int fireRate, float projectileSize, float damage, int type) {
    super(15, true, type);
    this.fireRate = fireRate;
    this.projectileSize = projectileSize;
    this.damage = damage;
    this.type = type;
    this.timeUntilNextShot = 0;
  }
  
  // will add a projectile object to the projectile list of the room that the player is in
  public void shootProjectile() {
    if (this.timeUntilNextShot != 0) {
      return;
    }

    float dx, dy;
    Projectile proj;
    int projectileSpeed;
    
    this.timeUntilNextShot = this.fireRate;

    float xDist = mouseX - p.x;
    float yDist = mouseY - p.y;
        
    float angle = atan2(yDist, xDist);

    // projectile constructor
    // float x, float y, float dx, float dy, float r, color c, int damage, int despawnTime, int numBounces, boolean isPlayerProjectile

    switch (type) {
      case PISTOL:
        projectileSpeed = 8;
        
        dx = projectileSpeed * cos(angle);
        dy = projectileSpeed * sin(angle);

        proj = new Projectile(p.x, p.y, dx, dy, 5, #FFFFFF, 1, -1, 2, true);

        p.currentRoom.projectileList.add(proj);
        break;
      
      case SHOTGUN:
        projectileSpeed = 5;
        
        dx = projectileSpeed * cos(angle);
        dy = projectileSpeed * sin(angle);

        for (int i = 0; i < 5; i++) {
          for (int j = 0; j < 5; j++) {
            proj = new Projectile(p.x + i * 10, p.y + j * 10, dx, dy, 5, #FFFFFF, 1, -1, 2, true);
            p.currentRoom.projectileList.add(proj);
          }
        }

        break;
    }
  }
  
  // will draw the weapon on the player
  public void draw() {
    
  }
}
