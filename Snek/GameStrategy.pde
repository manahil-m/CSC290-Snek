/**
 * Strategy for main game screen
 */
public class GameStrategy implements ScreenStrategy {
  Random r = new Random();
  String foodArray[] = {"Normal", "Triple"};
  String movementLock = "Up"; //Direction that will be locked from player usage.
  ConsumableFactory CFactory = new ConsumableFactory();
  Consumable food = CFactory.getConsumable(foodArray[r.nextInt(2)]);
  SnekHead python = new SnekHead(10, 10);
  Button pauseButton = new Button("Pause", 450, 50, 100, 50, (214));
  Button quitButton = new Button("Quit", 450, 125, 100, 50, (214));

  public GameStrategy() {
  }

  @Override
    public void display() {
    this.keyPressed();
    textSize(25);
    textAlign(LEFT, LEFT);
    fill(0);
    text("Score: " + score, 5, 28);
    pauseButton.Draw();
    quitButton.Draw();

    python.update();
    if (python.eat(food)) {
      food.update();
      food = CFactory.getConsumable(foodArray[r.nextInt(2)]);
      food.pickLocation(); 
      python.setTrue();
      //Play sound
      foodFile.play();
    }
    food.draw();
  }

  void keyPressed() {
    if (keyCode == UP && !(movementLock.equals("Up"))) {
      python.setSpeed(0, -scl);
      movementLock = "Down";
    }
    if (keyCode == DOWN && !movementLock.equals("Down")) {
      python.setSpeed(0, scl);
      movementLock = "Up";
    }
    if (keyCode == LEFT && !movementLock.equals("Left")) {
      python.setSpeed(-scl, 0);
      movementLock = "Right";
    }
    if (keyCode == RIGHT && !movementLock.equals("Right")) {
      python.setSpeed(scl, 0);
      movementLock = "Left";
    }
  }
}
