import 'package:get/get.dart';
import 'package:quotes/networking/api_const.dart';
import 'package:quotes/networking/api_functions.dart';
import '../models/quote_model.dart';
import '../networking/local_database.dart';

class HomeController extends GetxController{
  ApiFunctions apiFunctions = ApiFunctions();
  QuoteModel quoteModel = QuoteModel();
  MyDatabase database = MyDatabase();
  int? favoriteQuotesCount ;
  bool isQuoteSaved = false;
  List<Map> quotesIds = [];

  checkSaved(){
    isQuoteSaved = false;
    for(int i=0 ; i<quotesIds.length;i++){
      if(quotesIds[i]['quote_id'] == quoteModel.id){
        isQuoteSaved = true;
      }
    }
  }

  getQuote()async{
    var response = await apiFunctions.getData(ApiConst.randomQuoteLink);
    quoteModel = QuoteModel.fromJson(response);
    checkSaved();
    update();
  }


  savedQuote()async{
    await database.insert_data(" INSERT INTO favorite_quotes (content, author, _id) VALUES ('${quoteModel.content}', '${quoteModel.author}', '${quoteModel.id}')");
    getQuoteIDs();
    isQuoteSaved = true;
    update();
  }

  getQuoteIDs()async {
    var response = await database.show_data('SELECT `_id` FROM `favorite_quotes`');
    quotesIds = response;
    favoriteQuotesCount = quotesIds.length;
    update();
  }




}