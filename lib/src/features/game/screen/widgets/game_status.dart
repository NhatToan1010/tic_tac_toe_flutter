import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tic_tac_toe/src/utils/widgets/cross_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/widgets/circle_widget.dart';

class GameStatusWidget extends StatelessWidget {
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
          _StatusWidget(
            txtTheme: txtTheme, title: "0 Wins", // Need to add Function
            icon: const SizedBox(width: 32.0, height: 32.0,
              child: CrossWidget(
                strokeWidth: 10.0,
              ),
            ),
          ),
          _StatusWidget(
            txtTheme: txtTheme, title: "0 Wins", // Need to add Function
            icon: const SizedBox(width: 32.0, height: 32.0,
              child: CircleWidget(
                strokeWidth: 10.0,
              ),
            ),
          ),
          _StatusWidget(
              txtTheme: txtTheme, title: "0 Draws", // Need to add Function
              icon: const FaIcon(
                FontAwesomeIcons.scaleBalanced, color: primaryGrey, size: 32.0,)
          ),
        ],
      ),
    );
  }
}

class _StatusWidget extends StatelessWidget {
  const _StatusWidget({
    Key? key,
    required this.txtTheme,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final TextTheme txtTheme;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 15.0),
        Text(title, style: txtTheme.titleLarge?.apply(color: primaryGrey),)
      ],
    );
  }
}