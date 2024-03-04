import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/src/constants/colors.dart';
import 'package:tic_tac_toe/src/constants/sizes.dart';
import 'package:tic_tac_toe/src/constants/strings.dart';
import 'package:tic_tac_toe/src/features/home/screen/widgets/title.dart';
import 'package:tic_tac_toe/src/utils/widgets/circle_widget.dart';
import 'package:tic_tac_toe/src/utils/widgets/cross_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: primaryBackgroundColor,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleWidget(txtTheme: txtTheme),
            ],
          ),
        ),
      ),
    );
  }
}