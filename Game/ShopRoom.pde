public class ShopRoom extends Room {
  
  ShopRoom(Room previousRoom, int direction, int x, int y, int chanceToGenerateRoom) {
    super(previousRoom, direction, "combat", x, y, chanceToGenerateRoom);
    
    addEnemiesToRoom();
  }
  
  private void addEnemiesToRoom() {
    // will add enemies to the list 'enemyList' in super
  }
}
