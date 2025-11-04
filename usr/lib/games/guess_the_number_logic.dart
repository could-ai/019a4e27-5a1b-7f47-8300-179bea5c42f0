import 'dart:math';

class GuessTheNumberGame {
  int? targetNumber;
  int attempts = 0;
  bool gameWon = false;
  String hint = '';

  void startNewGame() {
    targetNumber = Random().nextInt(100) + 1;
    attempts = 0;
    gameWon = false;
    hint = '';
  }

  String makeGuess(int guess) {
    if (targetNumber == null) return 'Start a new game first';
    
    attempts++;
    
    if (guess == targetNumber) {
      gameWon = true;
      return 'Correct! You won in $attempts attempts.';
    } else if (guess < targetNumber!) {
      hint = 'Too low!';
      return 'Too low! Try a higher number.';
    } else {
      hint = 'Too high!';
      return 'Too high! Try a lower number.';
    }
  }

  int getReward() {
    if (!gameWon) return 0;
    // Reward based on attempts
    if (attempts <= 3) return 50;
    if (attempts <= 7) return 25;
    return 10;
  }
}