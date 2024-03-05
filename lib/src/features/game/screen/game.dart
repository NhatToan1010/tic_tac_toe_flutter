import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/constants/colors.dart';
import 'package:tic_tac_toe/src/features/game/screen/widgets/game_action.dart';
import 'package:tic_tac_toe/src/features/game/screen/widgets/game_status.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        color: primaryBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GameStatusWidget(txtTheme: txtTheme),
            const GameActionWidget()
          ],
        ),
      ),
    );
  }
}