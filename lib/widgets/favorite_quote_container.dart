import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/models/quote_model.dart';
import '../my_colors.dart';

class FavoriteQuoteContainer extends StatelessWidget {
  QuoteModel quoteModel;
  void Function()? onTap;
  FavoriteQuoteContainer({super.key, required this.quoteModel,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '${quoteModel.content}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${quoteModel.author}',
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.myMove),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border,color: MyColors.myMove,),
                  Text('Remove From Favorites',style: TextStyle(color: MyColors.myMove),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
