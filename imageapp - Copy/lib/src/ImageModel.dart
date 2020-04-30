

class ImageModel{

  String title;
  String link;
  Media media;
  String date_taken;
  String description;
  String tags;
  String author;

  ImageModel(Map<String, dynamic> parsedJson){
    title = parsedJson['title'];
    link = parsedJson['link'];
    media = Media(parsedJson['media']);
    date_taken = parsedJson['date_taken'];
    description = parsedJson['description'];
    tags = parsedJson['tags'];
    author = parsedJson['author'];
  }

}

class Media{

  String m;

  Media(parsedJson){

    m = parsedJson['m'];

  }

}