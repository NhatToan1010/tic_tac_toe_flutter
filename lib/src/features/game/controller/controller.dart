import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/src/constants/strings.dart';
import 'package:tic_tac_toe/src/utils/mechanisms/game_mechanism.dart';

import '../../../utils/mechanisms/ai_mechanism.dart';

class GameController extends GetxController {
  var player1Win = 0.obs;
  var player2Win = 0.obs;
  var draw = 0.obs;

  final bool isMultiplayer;
  RxBool isAiPlaying = false.obs;
  RxList<int> boardGame = List.generate(9, (index) => 0).obs;
  RxInt currentPlayer = GameMechanism.player1.obs;
  RxInt gameResult = GameMechanism.NOT_WINNER_YET.obs;
  AiMechanism ai = AiMechanism();

  GameController(this.isMultiplayer);

  void reinitialize() {
    boardGame.value = List.generate(9, (index) => 0);
    gameResult.value = GameMechanism.NOT_WINNER_YET;
    currentPlayer.value = GameMechanism.player1;
  }

  Future<void> move(int index) async {
    boardGame[index] = currentPlayer.value;
    _checkWin();
    _togglePlayer();

    if (!isMultiplayer && gameResult.value == GameMechanism.NOT_WINNER_YET) {
      isAiPlaying.value = true;
      await Future.delayed(const Duration(milliseconds: 1800));
      final _aiMove = await Future(
        () => ai.play(boardGame, currentPlayer.value),
      );
      boardGame[_aiMove] = currentPlayer.value;
      isAiPlaying.value = false;
      _checkWin();
      _togglePlayer();
    }
  }

  void _togglePlayer() {
    currentPlayer.value = GameMechanism.togglePlayer(currentPlayer.value);
  }

  void _checkWin() {
    gameResult.value = GameMechanism.checkIfWinnerFound(boardGame);
    switch (gameResult.value) {
      case GameMechanism.player1:
        player1Win++;
        break;
      case GameMechanism.player2:
        player2Win++;
        break;
      case GameMechanism.DRAW:
        draw++;
        break;
    }
  }

  bool isEnabled(int index) => boardGame[index] == GameMechanism.NOT_WINNER_YET;

  int getDataAt(int index) => boardGame[index];

  String? get currentPlayerMove {
    if (currentPlayer.value == GameMechanism.player1) {
      return "Player 1 Move";
    } else if (currentPlayer.value == GameMechanism.player2) {
      return isMultiplayer ? "Player 2 Move" : "Ai Move";
    }
    return null;
  }

  String? get gameResultSatus {
    final _result = gameResult.value;
    if (_result != GameMechanism.NOT_WINNER_YET) {
      if (_result == GameMechanism.player1) {
        return "Player 1 Win";
      } else if (_result == GameMechanism.player2) {
        return isMultiplayer ? "Player 2 Win" : "Ai Win";
      } else {
        return "Draw";
      }
    }
    return null;
  }
}
