import 'package:flutter/cupertino.dart';
import '../my_colors.dart';

class BackGroundWidget extends StatelessWidget {
  Widget myChild;
  BackGroundWidget({super.key,required this.myChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MyColors.myBlue, MyColors.myMove])),
      child: myChild,
    );
  }
}
