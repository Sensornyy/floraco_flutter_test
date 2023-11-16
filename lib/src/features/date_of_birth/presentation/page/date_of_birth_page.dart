import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:floraco_flutter_test/src/features/date_of_birth/constants/date_of_birth_constants.dart';
import 'package:floraco_flutter_test/core/navigation/navigation_bloc.dart';
import 'package:floraco_flutter_test/src/features/summary/presentation/bloc/summary_bloc.dart';
import 'package:floraco_flutter_test/src/shared/widgets/shared_button.dart';
import 'package:floraco_flutter_test/src/shared/constants/shared_constants.dart';
import 'package:floraco_flutter_test/src/features/date_of_birth/presentation/widgets/date_picker_widget.dart';

class DateOfBirth extends StatefulWidget {
  const DateOfBirth({Key? key}) : super(key: key);

  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(
      initialItem: DateOfBirthConstants.initialItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    var selectedYear = DateOfBirthConstants.selectedYear;

    return Scaffold(
      backgroundColor: SharedConstants.scaffoldColor,
      body: Stack(
        children: [
          SvgPicture.asset(SharedConstants.vector10Path),
          Positioned(
            left: 12,
            top: 12,
            child: SvgPicture.asset(SharedConstants.vector11Path),
          ),
          Positioned(
            right: 70,
            top: 35,
            child: SvgPicture.asset(SharedConstants.ellipse14Path),
          ),
          Positioned(
            right: 65,
            top: 70,
            child: SvgPicture.asset(SharedConstants.ellipse15Path),
          ),
          Positioned(
            right: 0,
            bottom: 280,
            child: SvgPicture.asset(SharedConstants.vector14Path),
          ),
          Positioned(
            left: 26,
            bottom: 85,
            child: SvgPicture.asset(SharedConstants.vector9Path),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(SharedConstants.vector6Path),
          ),
          Positioned(
            top: 200,
            left: 50,
            right: 50,
            child: Text(
              DateOfBirthConstants.logInDateOfBirth,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            top: 390,
            left: 35,
            right: 35,
            child: Container(
              width: 355,
              height: 67,
              decoration: ShapeDecoration(
                color: SharedConstants.pickerColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          DatePickerWidget(
            controller: _scrollController,
            onSelectedItemChanged: (index) {
              selectedYear =
                  (index + DateOfBirthConstants.indexToYear).toString();
            },
          ),
          SharedButton(
            title: DateOfBirthConstants.buttonText,
            onTap: () {
              BlocProvider.of<SummaryBloc>(context).add(
                SummaryEvent.setDateOfBirth(selectedYear),
              );
              BlocProvider.of<NavigationBloc>(context).add(
                const NavigationEvent.goToSummaryPage(),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
