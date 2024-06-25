import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/controllers/home_controller.dart';
import 'package:quotes/models/quote_model.dart';
import '../my_colors.dart';

class QuoteContainer extends StatelessWidget {
  QuoteModel quoteModel;
  void Function()? onPressed;
  QuoteContainer({super.key , required this.quoteModel,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15) ,bottomRight: Radius.circular(15)),
      child: Column(
        children: [
          ListTile(
            title: Text('${quoteModel.content}',style: Theme.of(context).textTheme.bodyMedium ,),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('${quoteModel.author}',style: const TextStyle(color: Colors.grey),)
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: onPressed,
                child: Container(
                  margin: const EdgeInsets.only(left: 15,bottom: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: MyColors.myMove,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15))
                  ),
                  child: const Text('Generate Another Quote',style: TextStyle(color: Colors.white)),
                ),
              ),
              GetBuilder<HomeController>(builder: (homeController){
                return Expanded(
                  child: GestureDetector(
                      onTap: (){
                        homeController.savedQuote();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15,bottom: 15,left: 10),
                        padding: const EdgeInsets.all(10),
                        decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15)),
                            border: Border.all(width: 2,color: MyColors.myMove)
                        ),
                        child: Icon(homeController.isQuoteSaved ? Icons.favorite : Icons.favorite_border,color: MyColors.myMove,),
                      )
                  ),
                );
              })
            ],
          )

        ],
      ),
    );
  }
}
