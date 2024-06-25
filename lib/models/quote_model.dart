class QuoteModel{
  String? content;
  String? author;
  String? id;

  QuoteModel({this.content, this.author, this.id});

  QuoteModel.fromJson(Map<String,dynamic> json){
    content = json['content'];
    author  = json['author'];
    id      = json['_id'];
  }
}