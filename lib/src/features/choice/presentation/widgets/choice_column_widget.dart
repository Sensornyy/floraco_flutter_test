import 'package:floraco_flutter_test/src/features/choice/presentation/widgets/choice_widget.dart';
import 'package:flutter/material.dart';

class ChoiceColumnWidget extends StatelessWidget {
  const ChoiceColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceWidget(
            title: 'Track my period',
            subtitle: 'contraception and wellbeing',
            onTap: () {},
          ),
          const SizedBox(height: 50),
          ChoiceWidget(
            title: 'Get pregnant',
            subtitle: 'learn about reproductive health',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
