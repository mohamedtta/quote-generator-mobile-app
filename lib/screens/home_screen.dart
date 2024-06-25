import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/controllers/home_controller.dart';
import 'package:quotes/my_colors.dart';
import 'package:quotes/screens/favorite_screen.dart';
import 'package:quotes/widgets/background_widget.dart';
import 'package:quotes/widgets/my_button.dart';
import 'package:quotes/widgets/quote_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homController.getQuote();
    homController.getQuoteIDs();
  }
  @override
  void dispose() {
    super.dispose();
    Get.delete<HomeController>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidget(
        myChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.090,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: MyButton(
                        onPressed: (){
                          Get.off(const FavoriteScreen());
                        },
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        text: 'Click Here To View Favorite Quotes',
                      ),
                    ),
                    GetBuilder<HomeController>(builder: (homeController){
                      return CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.black,
                        child: Text('${homeController.favoriteQuotesCount}',style: const TextStyle(color: Colors.white),),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              GetBuilder<HomeController>(builder: (homeController){
                if(homeController.quoteModel.content == null){
                  return const CircularProgressIndicator(color: MyColors.myBlue,);
                }else {
                  return QuoteContainer(quoteModel: homeController.quoteModel,onPressed: (){ homeController.getQuote();},);
                }
              }),
              // ElevatedButton(onPressed: (){MyDatabase().delete_database();}, child: Text('dfd'))
            ],
          ),
        ),
      ),
    );
  }
}
