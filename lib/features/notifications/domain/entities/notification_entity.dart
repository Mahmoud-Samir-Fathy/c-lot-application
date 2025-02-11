class NotificationEntity{
  String? title;
  String? body;
  String? date;
  String? image;


  NotificationEntity({
    this.title,
    this.body,
    this.date,
    this.image
  });


  NotificationEntity.fromJason(Map<String,dynamic>json){

    title=json['title'];
    body=json['body'];
    date=json['date'];
    image=json['image'];
  }

  Map<String,dynamic>toMap(){

    return {
      'title':title,
      'body':body,
      'date':date,
      'image':image,

    };
  }
}