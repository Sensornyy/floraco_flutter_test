import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:floraco_flutter_test/src/features/date_of_birth/constants/date_of_birth_constants.dart';

class DatePickerWidget extends StatelessWidget {
  final FixedExtentScrollController controller;
  final void Function(int index) onSelectedItemChanged;

  const DatePickerWidget(
      {required this.controller, required this.onSelectedItemChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300,
      left: 50,
      right: 50,
      child: Center(
        child: SizedBox(
          height: 250,
          child: ShaderMask(
            shaderCallback: (Rect rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.grey.withOpacity(0.5),
                  Colors.black,
                  Colors.grey.withOpacity(0.5),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
              ).createShader(rect);
            },
            blendMode: BlendMode.dstIn,
            child: ListWheelScrollView(
              controller: controller,
              itemExtent: DateOfBirthConstants.listScrollViewExtent,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: onSelectedItemChanged,
              children: List.generate(
                DateOfBirthConstants.yearsAmount,
                (index) => Center(
                  child: Text(
                    (DateTime.now().year -
                            DateOfBirthConstants.yearFromToday +
                            index)
                        .toString(),
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
