import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:floraco_flutter_test/src/shared/constants/shared_constants.dart';
import 'package:floraco_flutter_test/src/features/choice/presentation/widgets/choice_column_widget.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(SharedConstants.vector16Path),
          Positioned(
            left: 50,
            bottom: 100,
            child: SvgPicture.asset(SharedConstants.vector20Path),
          ),
          Positioned(
            left: 120,
            bottom: 170,
            child: SvgPicture.asset(SharedConstants.vector17Path),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(SharedConstants.vector5Path),
          ),
          const Align(
            alignment: Alignment.center,
            child: ChoiceColumnWidget(),
          ),
        ],
      ),
    );
  }
}
