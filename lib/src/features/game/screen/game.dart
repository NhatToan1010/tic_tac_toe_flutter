import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:tic_tac_toe/src/constants/colors.dart';
import 'package:tic_tac_toe/src/features/game/controller/controller.dart';
import 'package:tic_tac_toe/src/features/game/screen/widgets/board_game.dart';
import 'package:tic_tac_toe/src/features/game/screen/widgets/current_player.dart';
import 'package:tic_tac_toe/src/features/game/screen/widgets/game_action.dart';
import 'package:tic_tac_toe/src/features/game/screen/widgets/game_status.dart';

class GameBinding implements Bindings {
  final bool isMultiplayer;

  GameBinding({required this.isMultiplayer});

  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController(isMultiplayer));
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: primaryBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GameStatusWidget(txtTheme: txtTheme),
              BoardGameWidget(size: size.width * 0.8),
              const CurrentPlayer(),
              const GameActionWidget()
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool?> showConfirmDialog({
  required BuildContext context,
  String title = "Confirm!",
  required String content,
}) async {
  return showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titleTextStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text("Ok"),
        ),
      ],
    ),
  );
}
