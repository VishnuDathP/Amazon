class ProductData{
  List<ProductDetailsModel> items;
  ProductData({required this.items});
}


class ProductDetailsModel{
  String id;
  String image;
  String name;
  int price;
  bool clicked = false;
  ProductDetailsModel({required this.id, required this.image, required this.name, required this.price,});
}

class CartListModel{
  String id;
  String image;
  String name;
  int price;
  int quantity;
  CartListModel({required this.id,required this.price,required this.image,required this.quantity,required this.name});
}

class SaveForLaterModel{
  String id;
  String image;
  String name;
  int price;
  int quantity;
  SaveForLaterModel({required this.name,required this.price,required this.quantity,required this.id,required this.image});
}