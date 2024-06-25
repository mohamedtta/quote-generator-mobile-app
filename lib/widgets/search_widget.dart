import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  void Function(String)? onChanged;
  Widget? suffixIcon;
  SearchWidget({super.key,required this.controller,this.onChanged,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
            hintText: 'Type Something Here To Search',
            fillColor: Colors.white,
            filled: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
            )
        ),
      ),
    );

  }
}
