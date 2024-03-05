import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';

class GameModeSelectionWidget extends StatelessWidget {
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
        _GameButtonWidget(txtTheme: txtTheme, label: txtPve, icon: FontAwesomeIcons.robot,),
        _GameButtonWidget(txtTheme: txtTheme, label: txtPvp, icon: FontAwesomeIcons.peopleCarryBox,),
      ],
    );
  }
}

class _GameButtonWidget extends StatelessWidget {
  const _GameButtonWidget({
    required this.txtTheme,
    required this.label,
    required this.icon
  });

  final TextTheme txtTheme;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(size: 40.0, icon),
            Text(
              label,
              style: txtTheme.titleSmall
                  ?.apply(color: lightColor700),
            )
          ],
        )
    );
  }
}
