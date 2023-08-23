class ProdactModel {
  dynamic id;
  dynamic title;
  dynamic price;
  dynamic image;

  ProdactModel(
      {
      required this.title,
      required this.id,
      required this.image,
      required this.price});

  // methods convert from jason to object
  factory ProdactModel.fromJeson(jsonData){
    return ProdactModel(
        title: jsonData['title'],
        id: jsonData['id'],
        image: jsonData['image'],
        price: jsonData['price']);
  }
}
