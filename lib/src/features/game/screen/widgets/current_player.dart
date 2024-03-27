import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/src/features/game/controller/controller.dart';
import 'package:tic_tac_toe/src/utils/mechanisms/game_mechanism.dart';

import '../../../../utils/widgets/circle_widget.dart';
import '../../../../utils/widgets/cross_widget.dart';

class CurrentPlayer extends GetWidget<GameController> {
  const CurrentPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.0,
          width: 30.0,
          child: Obx(() => _getPlayerSymbol(controller.currentPlayer.value)),
        ),
        const SizedBox(height: 10.0),
        Obx(() => Text(
              controller.currentPlayerMove ?? "",
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  Widget _getPlayerSymbol(int playerId) {
    switch (playerId) {
      case GameMechanism.player1:
        return const CrossWidget(
          strokeWidth: 10.0,
        );
      case GameMechanism.player2:
        return const CircleWidget(
          strokeWidth: 10.0,
        );
      default:
        throw ArgumentError("Unknown playerId");
    }
  }
}
