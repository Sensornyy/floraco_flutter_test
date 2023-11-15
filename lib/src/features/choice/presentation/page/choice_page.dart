import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:floraco_flutter_test/src/features/choice/presentation/widgets/choice_column_widget.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/Vector 16.svg'),
          Positioned(
            left: 50,
            bottom: 100,
            child: SvgPicture.asset('assets/images/Vector 20.svg'),
          ),
          Positioned(
            left: 120,
            bottom: 170,
            child: SvgPicture.asset('assets/images/Vector 17.svg'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/images/Vector 5.svg'),
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
