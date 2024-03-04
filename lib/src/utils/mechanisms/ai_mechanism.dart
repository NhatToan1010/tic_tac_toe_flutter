import 'package:tic_tac_toe/src/utils/mechanisms/game_mechanism.dart';

class AiMechanism {
  static const WIN_SCORE = 100;
  static const DRAW_SCORE = 0;
  static const LOSE_SCORE = -100;
  static const int INFINITY = 9999999;

  Move _getAIMove(List<int> currentBoard, int currentPlayer) {
    List<int> newBoard;
    Move bestMove = Move(move: -INFINITY, score: -1);

    for (int currentMove = 0;
        currentMove < currentBoard.length;
        currentMove++) {
      if (!GameMechanism.isValidMove(currentBoard, currentMove)) continue;
      newBoard = List.from(currentBoard);
      newBoard[currentMove] = currentPlayer;
      int newScore = -_getBestScore(newBoard, _togglePlayer(currentPlayer));
      if (newScore > bestMove.score) {
        bestMove.score = newScore;
        bestMove.move = currentMove;
      }
    }
    return bestMove;
  }

  int _getBestScore(List<int> board, int currentPlayer) {
    int winner = GameMechanism.checkIfWinnerFound(board);
    if (winner == currentPlayer) {
      return WIN_SCORE;
    } else if (winner == _togglePlayer(currentPlayer)) {
      return LOSE_SCORE;
    } else if (winner == GameMechanism.DRAW) {
      return DRAW_SCORE;
    }
    return _getAIMove(board, currentPlayer).score;
  }

  int _togglePlayer(int currentPlayer) =>
      GameMechanism.togglePlayer(currentPlayer);
}

class Move {
  late final int move;
  late final int score;

  Move({required this.move, required this.score});
}