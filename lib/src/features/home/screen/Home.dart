import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/constants/colors.dart';
import 'package:tic_tac_toe/src/features/home/screen/widgets/game_mode_selection.dart';
import 'package:tic_tac_toe/src/features/home/screen/widgets/title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: primaryBackgroundColor,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleWidget(txtTheme: txtTheme),
              GameModeSelectionWidget(txtTheme: txtTheme)
            ],
          ),
        ),
      ),
    );
  }
}

