public class MenuStrategy implements ScreenStrategy {
  Button play_button = new Button("Play Game", 200, 200, 200, 100, (214));
  boolean buttonPressed = false;
  public MenuStrategy() {
  }

@Override
  public void display() {
  //this.mouseClicked();
  textSize(40);
  text("SNEK", width / 2, 100);
  textSize(25);
  play_button.Draw();
}
}
