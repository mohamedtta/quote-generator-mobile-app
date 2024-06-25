import 'package:flutter/material.dart';

import '../my_colors.dart';

class MyButton extends StatelessWidget {
  BorderRadius borderRadius;
  String text;
  void Function()? onPressed;
  MyButton({super.key,required this.borderRadius,required this.text,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width * 0.92,
        decoration: BoxDecoration(
            color: MyColors.myLightMove,
            borderRadius: borderRadius
        ),
        child: Text(text,style: Theme.of(context).textTheme.bodyMedium,),
      ),
    );
  }
}
