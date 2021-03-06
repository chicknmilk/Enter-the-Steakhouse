public class BossRoom extends Room {

  boolean bossSpawned = false;
  
  BossRoom(Room previousRoom, int direction, int x, int y, int chanceToGenerateRoom) {
    super(previousRoom, direction, "boss", x, y, chanceToGenerateRoom);
  }
  
  public void addBossToRoom() {
    // will add boss to the list 'enemyList' in super

    int randomGenType = (int) random(1);

    switch (randomGenType) {
      case 0:
        for (int i = 0; i < 1; i++) {
          int x = (int) random(780) + 90;
          int y = (int) random(360) + 90;

          while (this.roomBlueprint[(int)(y / 30)].charAt((int)(x / 30)) != GROUND ||
                 this.roomBlueprint[(int)(y / 30) - 1].charAt((int)(x / 30)) != GROUND ||
                 this.roomBlueprint[(int)(y / 30) + 1].charAt((int)(x / 30)) != GROUND ||
                 this.roomBlueprint[(int)(y / 30)].charAt((int)(x / 30) - 1) != GROUND ||
                 this.roomBlueprint[(int)(y / 30)].charAt((int)(x / 30) + 1) != GROUND) {
            x = (int) random(960);
            y = (int) random(540);
          }

          Boss m = new Boss(x, y, 40, 1);

          this.enemyList.add(m);
        }
        break;
    }


  }

  public void draw() {
    super.draw();

    if (bossSpawned == true) {
      if (!enemyList.isEmpty()) {
        fill(255, 0, 0);
        text("HEALTH: " + enemyList.get(0).health, width / 2 - 100, 100);
      }
    }
  }
}
