import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class GameActionWidget extends StatelessWidget {
  const GameActionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _GameActionWidget(
            onPressed: () {}, // Need to add Function
            icon: Icons.refresh,
          ),
          _GameActionWidget(
              onPressed: () async {
                Get.back();
              },
              icon: Icons.home_filled)
        ],
      ),
    );
  }
}

class _GameActionWidget extends StatelessWidget {
  const _GameActionWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: FaIcon(
          icon,
          size: 40.0,
        ));
  }
}
