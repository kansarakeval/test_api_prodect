class DbModel{
  String? title,image,detail;
  int? id;
  dynamic price;

  DbModel({this.title, this.image, this.detail, this.id, this.price});

  factory DbModel.mapToModel(Map m1){
    return DbModel(
      title: m1['title'],
      id: m1['id'],
      price: m1['price'],
      image: m1['image'],
      detail: m1['detail'],
    );
  }
}