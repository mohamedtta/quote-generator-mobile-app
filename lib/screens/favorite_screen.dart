import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/controllers/favorite_controller.dart';
import 'package:quotes/screens/home_screen.dart';
import 'package:quotes/widgets/background_widget.dart';
import 'package:quotes/widgets/favorite_quote_container.dart';
import 'package:quotes/widgets/my_button.dart';
import 'package:quotes/widgets/search_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool _isSearching = false;
  FavoriteController favoriteController = Get.put(FavoriteController());
  @override
  void dispose() {
    super.dispose();
    Get.delete<FavoriteController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackGroundWidget(
      myChild: SafeArea(
        child: Column(
          children: [
            MyButton(
              borderRadius: BorderRadius.circular(15),
              text: '< Back To Home Screen',
              onPressed: () {
                Get.off(() => const HomeScreen());
              },
            ),
            const SizedBox(
              height: 15,
            ),
            GetBuilder<FavoriteController>(builder: (favoriteController) {
              return SearchWidget(
                suffixIcon: _isSearching ? IconButton(onPressed: (){_clearSearch();Navigator.pop(context);}, icon: const Icon(Icons.dangerous_outlined)) : const Text(''),
                controller: favoriteController.searchTextController,
                onChanged: (searchedCharacter) {
                  favoriteController.searchForQuote(searchedCharacter);
                  _startSearching();
                },
              );
            }),
            GetBuilder<FavoriteController>(
                builder: (favoriteController){
                  if(favoriteController.searchTextController.text.isEmpty){
                    if(favoriteController.favoriteQuoteModel.isEmpty){
                      return const Center(child: Text('There is no data',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),);
                    }else{
                      return Expanded(
                          child: ListView.builder(
                              itemCount: favoriteController.favoriteQuoteModel.length,
                              itemBuilder: (context,i){
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: FavoriteQuoteContainer(quoteModel: favoriteController.favoriteQuoteModel[i], onTap: (){
                                    favoriteController.deleteFavoriteQuote(favoriteController.favoriteQuoteModel[i].id!, i);
                                  }),
                                );
                              })
                      );
                    }
                  }else{
                    if(favoriteController.searchedCharacters.isEmpty){
                      return const Center(child: Text('No such a result',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),);
                    }else{
                      return Expanded(
                          child: ListView.builder(
                              itemCount: favoriteController.searchedCharacters.length,
                              itemBuilder: (context,i){
                                return Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: FavoriteQuoteContainer(quoteModel: favoriteController.searchedCharacters[i], onTap: (){
                                    favoriteController.deleteFavoriteQuote(favoriteController.searchedCharacters[i].id!, i);
                                  }),
                                );
                              })
                      );
                    }

                  }
                }
            ),

          ],
        ),
      ),
    ));
  }
  void _startSearching(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }
  void _stopSearching(){
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }
  void _clearSearch(){
    favoriteController.searchTextController.clear();
  }
}
