import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/strings.dart';
import '../../../../utils/widgets/circle_widget.dart';
import '../../../../utils/widgets/cross_widget.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(txtGameTitle, style: txtTheme.headlineLarge),
        const SizedBox(height: 30.0),
        const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: utilWidgetWidth,
              height: utilWidgetHeight,
              child: CrossWidget(strokeWidth: 18.0),
            ),
            SizedBox(width: 40.0),
            SizedBox(
              width: utilWidgetWidth,
              height: utilWidgetHeight,
              child: CircleWidget(strokeWidth: 18.0),
            ),
          ],
        )
      ],
    );
  }
}
