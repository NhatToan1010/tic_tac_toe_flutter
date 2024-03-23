import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/src/features/game/controller/controller.dart';
import 'package:tic_tac_toe/src/features/game/screen/game.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';

class GameModeSelectionWidget extends GetWidget<GameController> {
  const GameModeSelectionWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _GameButtonWidget(
          onPressed: () {
            Get.to(() => const GameScreen(),
                binding: GameBinding(isMultiplayer: false));
          },
          txtTheme: txtTheme,
          label: txtPve,
          icon: FontAwesomeIcons.robot,
        ),
        _GameButtonWidget(
          onPressed: () =>
              Get.to(const GameScreen(), binding: GameBinding(isMultiplayer: true)),
          txtTheme: txtTheme,
          label: txtPvp,
          icon: FontAwesomeIcons.peopleCarryBox,
        ),
      ],
    );
  }
}

class _GameButtonWidget extends StatelessWidget {
  const _GameButtonWidget({
    Key? key,
    required this.txtTheme,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final TextTheme txtTheme;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(size: 40.0, icon),
            Text(
              label,
              style: txtTheme.titleSmall?.apply(color: lightColor700),
            )
          ],
        ));
  }
}
