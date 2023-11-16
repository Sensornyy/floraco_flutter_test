import 'package:floraco_flutter_test/core/navigation/navigation_bloc.dart';
import 'package:floraco_flutter_test/src/features/summary/presentation/bloc/summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

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

    return BlocBuilder<SummaryBloc, SummaryState>(builder: (context, state) {
      state.whenOrNull(
        successGet: (choice, dateOfBirth) {
          choiceController.text = choice;
          dateOfBirthController.text = dateOfBirth;
        },
      );
      return Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset('assets/images/Vector 16.svg'),
            Positioned(
              left: 50,
              bottom: 35,
              child: SvgPicture.asset('assets/images/Ellipse 14.svg'),
            ),
            Positioned(
              top: 200,
              left: 50,
              right: 50,
              child: Text(
                'Summary',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset('assets/images/Vector 5.svg'),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choice',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextField(
                      controller: choiceController,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 20.0,
                        color: const Color(0xFF454581),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Date of birth',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextField(
                      controller: dateOfBirthController,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      style: GoogleFonts.nunito(
                        fontSize: 20.0,
                        color: const Color(0xFF454581),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 90,
              left: 110,
              right: 110,
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context).add(
                    const NavigationEvent.goToChoicePage(),
                  );
                },
                child: Container(
                  width: 200,
                  height: 52,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 1),
                      colors: [
                        const Color(0xFF454581),
                        const Color(0xFF454581).withOpacity(0.5)
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          'Choice',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 17,
                        child: SvgPicture.asset(
                          'assets/icons/white_arrow.svg',
                          width: 27,
                          height: 27,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    choiceController.dispose();
    dateOfBirthController.dispose();
    super.dispose();
  }
}
