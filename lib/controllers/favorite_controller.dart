import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quotes/networking/local_database.dart';
import '../models/quote_model.dart';

class FavoriteController extends GetxController{
  MyDatabase database = MyDatabase();
  List<QuoteModel> favoriteQuoteModel = [];
  List<QuoteModel> searchedCharacters = [];
  TextEditingController searchTextController = TextEditingController();





  searchForQuote(String searchCharacter){
    searchedCharacters = favoriteQuoteModel.where(
            (character) => character.content!.toLowerCase().contains(searchCharacter)

    ).toList();
    update();
  }



  getFavoriteQuotes()async{
    List<Map<String,dynamic>> response = await database.show_data('SELECT * FROM `favorite_quotes`');
    response.forEach((quote) => favoriteQuoteModel.add(QuoteModel.fromJson(quote)));
    searchedCharacters = favoriteQuoteModel;
    update();
  }

  deleteFavoriteQuote(String id, int index)async{
    await database.delete_data("DELETE FROM `favorite_quotes` WHERE _id = '$id'");
    favoriteQuoteModel.removeAt(index);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getFavoriteQuotes();
  }
}