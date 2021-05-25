public final int MENU_SCREEN = 0;
public final int MAPSELECT_SCREEN = 1;
public final int GAME_SCREEN = 2;
public final int VICTORY_SCREEN = 3;
public final int DEFEAT_SCREEN = 4;

public class MenuPages {
  int currentPage;
  
  MenuPages(int currentPage) {
    this.currentPage = currentPage;
  }
  
  public void draw() {
    switch (currentPage) {
      case MENU_SCREEN: //menu screen
        //println("menu");
        break;
      
      case MAPSELECT_SCREEN: //map size screen
        //println("map size");
        break;
      
      case GAME_SCREEN: //game screen
        //println("game");
        break;
      
      case VICTORY_SCREEN: //victory screen
        //println("victory");
        break;
      
      case DEFEAT_SCREEN:
        //println("defeat");
        break;
    }
  }
}