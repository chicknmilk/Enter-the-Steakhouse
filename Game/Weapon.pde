public final int PISTOL = 0;
public final int SHOTGUN = 1;

public class Weapon extends Item {
  float projectileSize, damage;
  int timeUntilNextShot, fireRate;
  int type;
  
  Weapon(int fireRate, float projectileSize, float damage, int type) {
    
    super(type * 10, false, WEAPON);

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

        proj = new Projectile(p.x, p.y, dx * cos(projectileSpeed), dy * sin(projectileSpeed), 5, #FFFFFF, 1, -1, 2, true);
        Projectile proj = new Projectile(p.x, p.y, dx * cos(projectileSpeed + 0.1), dy * sin(projectileSpeed + 0.1), 3, #FFFFFF, 1, -1, 1, true);
        Projectile proj = new Projectile(p.x, p.y, dx * cos(projectileSpeed - 0.1), dy * sin(projectileSpeed - 0.1), 3, #FFFFFF, 1, -1, 1, true);


        break;
    }
  }
  
  // will draw the weapon on the player
  public void draw() {
    
  }
}
