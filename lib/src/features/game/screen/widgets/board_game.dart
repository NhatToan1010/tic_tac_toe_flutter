import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/src/constants/colors.dart';
import 'package:tic_tac_toe/src/features/game/controller/controller.dart';
import 'package:tic_tac_toe/src/utils/mechanisms/game_mechanism.dart';
import 'package:tic_tac_toe/src/utils/widgets/circle_widget.dart';
import 'package:tic_tac_toe/src/utils/widgets/cross_widget.dart';

class BoardGameWidget extends GetWidget<GameController> {
  const BoardGameWidget({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.square(size),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _listenBoardData(),
          _listenAiPlaying(),
          _listenGameResult(),
        ],
      ),
    );
  }

  Widget _listenGameResult() {
    return Obx(() => IgnorePointer(
          ignoring: controller.gameResult.value == 0,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            color: controller.gameResult.value != 0
                ? Colors.grey[200]
                : Colors.transparent,
            child: _gameResultAnnounce(),
          ),
        ));
  }

  Widget? _gameResultAnnounce() {
    final _gameResultStatus = controller.gameResultSatus;
    if (_gameResultStatus != null) {
      return Center(
        child: Text(
          _gameResultStatus,
          style: const TextStyle(
              fontSize: 30.0, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      );
    }
    return null;
  }

  // If Multiplayer mode => Ignore Ai
  Widget _listenAiPlaying() {
    return Obx(() => IgnorePointer(
          ignoring: !controller.isAiPlaying.value,
          child: Container(
            color: Colors.transparent,
          ),
        ));
  }

  Widget _listenBoardData() {
    return Obx(
      () => GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 1.0,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            controller.boardGame.length,
            (index) => _FieldWidget(
                  onTap: (value) {
                    controller.move(value);
                  },
                  isEnabled: controller.isEnabled(index),
                  index: index,
                  playerId: controller.getDataAt(index),
                )),
      ),
    );
  }
}

class _FieldWidget extends StatelessWidget {
  const _FieldWidget({
    Key? key,
    required this.isEnabled,
    required this.index,
    required this.playerId,
    required this.onTap,
  }) : super(key: key);

  final bool isEnabled;
  final int index;
  final int playerId;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? () => onTap(index) : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.amberAccent.withAlpha(20),
        ),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: primaryGrey.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: _getPlayer(playerId),
          ),
        ),
      ),
    );
  }

  Widget? _getPlayer(int playerId) {
    switch (playerId) {
      case GameMechanism.player1:
        return const CrossWidget();
      case GameMechanism.player2:
        return const CircleWidget();
    }
    return null;
  }
}
