class GameMechanism {
  static const player1 = 1;
  static const player2 = -1;

  static const DRAW = 2;
  static const NOT_WINNER_YET = 0;

  static const WIN_CONDITIONS_LIST = [
    [0, 1, 2], // Row Win Condition
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6], // Column Win Condition
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8], // Cross Win Condition
    [2, 4, 6]
  ];

  static int togglePlayer(int currentPlayer) => -1 * currentPlayer;

  static bool isValidMove(List<int> currentBoard, int index) =>
      currentBoard[index] == NOT_WINNER_YET;

  static bool isBoardFull(List<int> currentBoard) {
    for (var index in currentBoard) {
      if (currentBoard[index] == NOT_WINNER_YET) return false;
    }
    return true;
  }

  static int checkIfWinnerFound(List<int> currentBoard) {
    for (var index in WIN_CONDITIONS_LIST) {
      if (currentBoard[index[0]] != NOT_WINNER_YET &&
          currentBoard[index[0]] == currentBoard[index[1]] &&
          currentBoard[index[0]] == currentBoard[index[2]]) {
        return currentBoard[index[0]];
      }
    }
    if (isBoardFull(currentBoard)) return DRAW;
    return NOT_WINNER_YET;
  }
}