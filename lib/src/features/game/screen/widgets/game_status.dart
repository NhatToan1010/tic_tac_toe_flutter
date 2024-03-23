import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/src/features/game/controller/controller.dart';
import 'package:tic_tac_toe/src/utils/widgets/cross_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/widgets/circle_widget.dart';

class GameStatusWidget extends GetWidget<GameController> {
  const GameStatusWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const SizedBox(
                width: 32.0,
                height: 32.0,
                child: CrossWidget(
                  strokeWidth: 10.0,
                ),
              ),
              const SizedBox(height: 15.0),
              Obx(() => Text(
                    "${controller.player1Win} Wins",
                    style: txtTheme.titleLarge?.apply(color: primaryGrey),
                  ))
            ],
          ),
          Column(
            children: [
              const SizedBox(
                width: 32.0,
                height: 32.0,
                child: CircleWidget(
                  strokeWidth: 10.0,
                ),
              ),
              const SizedBox(height: 15.0),
              Obx(() => Text(
                    "${controller.player2Win} Wins",
                    style: txtTheme.titleLarge?.apply(color: primaryGrey),
                  ))
            ],
          ),
          Column(
            children: [
              const FaIcon(
                FontAwesomeIcons.scaleBalanced,
                color: primaryGrey,
                size: 32.0,
              ),
              const SizedBox(height: 15.0),
              Obx(() => Text(
                    "${controller.draw} Draws",
                    style: txtTheme.titleLarge?.apply(color: primaryGrey),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
