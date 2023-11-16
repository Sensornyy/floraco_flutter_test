import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:floraco_flutter_test/src/shared/constants/shared_constants.dart';

class SummaryTitledTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const SummaryTitledTextField({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: 20.0,
            color: SharedConstants.secondaryColor,
          ),
        ),
      ],
    );
  }
}
