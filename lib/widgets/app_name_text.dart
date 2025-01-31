import 'package:flutter/material.dart';
import 'package:pocketplans/widgets/title_text.dart';
import 'package:shimmer/shimmer.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 22),
      baseColor: const Color.fromARGB(255, 253, 253, 253),
      highlightColor: const Color.fromARGB(255, 157, 14, 189),
      child: TitlesTextWidget(
        label: "Pocket Plans",
        fontSize: fontSize,
      ),
    );
  }
}
