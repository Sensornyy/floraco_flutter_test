import 'package:flutter/material.dart';

import 'package:floraco_flutter_test/src/features/choice/presentation/widgets/choice_column_widget.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/Vector 16.png'),
            Positioned(
              left: 50,
              bottom: 40,
              child: Image.asset('assets/images/Vector 20.png'),
            ),
            Positioned(
              left: 120,
              bottom: 110,
              child: Image.asset('assets/images/Vector 17.png'),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/images/Vector 5.png'),
            ),
            const Align(
              alignment: Alignment.center,
              child: ChoiceColumnWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
