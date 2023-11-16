import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:floraco_flutter_test/src/shared/constants/shared_constants.dart';

class SharedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SharedButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 90,
      left: 110,
      right: 110,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200,
          height: 52,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
              colors: [
                SharedConstants.secondaryColor,
                SharedConstants.secondaryColor.withOpacity(0.5)
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
                  title,
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
                  SharedConstants.whiteArrowPath,
                  width: 27,
                  height: 27,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
