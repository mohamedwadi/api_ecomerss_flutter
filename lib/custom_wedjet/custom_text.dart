import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
   CustomText({
    super.key,
     this.size = 14,
     this.color  = CupertinoColors.black
     ,this.text = ''
  });
  double size;
  Color color;
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.nunito(
        fontSize: size,
        color: color,
      ),
    );
  }
}
