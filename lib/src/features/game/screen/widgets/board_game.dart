import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/src/constants/colors.dart';

class BoardGameWidget extends StatelessWidget {
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
        ],
      ),
    );
  }

  Widget _listenBoardData() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      childAspectRatio: 1.0,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(9, (index) => const _FieldWidget()),
    );
  }
}

class _FieldWidget extends StatelessWidget {
  const _FieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.amberAccent.withAlpha(20),
        ),
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: primaryGrey.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: const Padding(
            padding: EdgeInsets.all(32.0),
          ),
        ),
      ),
    );
  }
}
