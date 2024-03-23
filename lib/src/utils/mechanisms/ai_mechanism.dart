import 'package:tic_tac_toe/src/utils/mechanisms/game_mechanism.dart';

class AiMechanism {
  static const WIN_SCORE = 100;
  static const DRAW_SCORE = 0;
  static const LOSE_SCORE = -100;
  static const int INFINITY = 9999999;

  int play (List<int> currentBoard, int currentPlayer) {
    return _getAIMove(currentBoard, currentPlayer).move;
  }

  Move _getAIMove(List<int> currentBoard, int currentPlayer) {
    List<int> _newBoard;
    Move _bestMove = Move(move: -1, score: -INFINITY);

    for (int currentMove = 0;
        currentMove < currentBoard.length;
        currentMove++) {
      if (!GameMechanism.isValidMove(currentBoard, currentMove)) continue;
      _newBoard = List.from(currentBoard);
      _newBoard[currentMove] = currentPlayer;
      int _newScore = -_getBestScore(_newBoard, GameMechanism.togglePlayer(currentPlayer));
      if (_newScore > _bestMove.score) {
        _bestMove.score = _newScore;
        _bestMove.move = currentMove;
      }
    }
    return _bestMove;
  }

  int _getBestScore(List<int> board, int currentPlayer) {
    final winner = GameMechanism.checkIfWinnerFound(board);
    if (winner == currentPlayer) {
      return WIN_SCORE;
    } else if (winner == GameMechanism.togglePlayer(currentPlayer)) {
      return LOSE_SCORE;
    } else if (winner == GameMechanism.DRAW) {
      return DRAW_SCORE;
    }
    return _getAIMove(board, currentPlayer).score;
  }
}

class Move {
  int move;
  int score;

  Move({required this.move, required this.score});
}