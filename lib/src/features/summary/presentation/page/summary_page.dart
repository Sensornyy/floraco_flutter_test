import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:floraco_flutter_test/core/navigation/navigation_bloc.dart';
import 'package:floraco_flutter_test/src/features/summary/constants/summary_constants.dart';
import 'package:floraco_flutter_test/src/features/summary/presentation/bloc/summary_bloc.dart';
import 'package:floraco_flutter_test/src/shared/constants/shared_constants.dart';
import 'package:floraco_flutter_test/src/shared/widgets/shared_button.dart';
import 'package:floraco_flutter_test/src/features/summary/presentation/widgets/summary_titled_text_field.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  late TextEditingController choiceController;
  late TextEditingController dateOfBirthController;

  @override
  void initState() {
    super.initState();
    choiceController = TextEditingController();
    dateOfBirthController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SummaryBloc>(context).add(const SummaryEvent.get());

    return BlocBuilder<SummaryBloc, SummaryState>(
      builder: (context, state) {
        state.whenOrNull(
          successGet: (choice, dateOfBirth) {
            choiceController.text = choice;
            dateOfBirthController.text = dateOfBirth;
          },
        );
        return Scaffold(
          body: Stack(
            children: [
              SvgPicture.asset(SharedConstants.vector16Path),
              Positioned(
                left: 50,
                bottom: 35,
                child: SvgPicture.asset(SharedConstants.ellipse14Path),
              ),
              Positioned(
                top: 200,
                left: 50,
                right: 50,
                child: Text(
                  SummaryConstants.summary,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(SharedConstants.vector5Path),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SummaryTitledTextField(
                        title: SummaryConstants.choice,
                        controller: choiceController,
                      ),
                      const SizedBox(height: 50),
                      SummaryTitledTextField(
                        title: SummaryConstants.dateOfBirth,
                        controller: dateOfBirthController,
                      ),
                    ],
                  ),
                ),
              ),
              SharedButton(
                title: SummaryConstants.choice,
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context).add(
                    const NavigationEvent.goToChoicePage(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    choiceController.dispose();
    dateOfBirthController.dispose();
    super.dispose();
  }
}
