import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';

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
    _scrollController = FixedExtentScrollController(initialItem: 95);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/Vector 10.svg'),
          Positioned(
            left: 12,
            top: 12,
            child: SvgPicture.asset('assets/images/Vector 11.svg'),
          ),
          Positioned(
            right: 70,
            top: 35,
            child: SvgPicture.asset('assets/images/Ellipse 14.svg'),
          ),
          Positioned(
            right: 65,
            top: 70,
            child: SvgPicture.asset('assets/images/Ellipse 15.svg'),
          ),
          Positioned(
            right: 0,
            bottom: 280,
            child: SvgPicture.asset('assets/images/Vector 14.svg'),
          ),
          Positioned(
            left: 26,
            bottom: 85,
            child: SvgPicture.asset('assets/images/Vector 9.svg'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('assets/images/Vector 6.svg'),
          ),
          Positioned(
            top: 200,
            left: 50,
            right: 50,
            child: Center(
              child: Text(
                'Log in your date of birth',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
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
                color: const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
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
                    controller: _scrollController,
                    itemExtent: 60.0,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {},
                    children: List.generate(
                      124,
                      (index) => Center(
                        child: Text(
                          (DateTime.now().year - 123 + index).toString(),
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
          ),
          Positioned(
            bottom: 90,
            left: 110,
            right: 110,
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
                      'Next',
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
