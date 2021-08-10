import 'package:amazon_clone/Blocs/Events/ShopEvent.dart';
import 'package:amazon_clone/Models/ProductDetailsModel.dart';

class ProductDetailsRepo{
  getDealofDay(){
    List<ProductDetailsModel> items =[
      ProductDetailsModel(id: "1",image: 'assets/images/alexa.jpg',name: 'Amazon alexa',price: 2500),
      ProductDetailsModel(id: "2",image: 'assets/images/Diary.jpg',name: 'Journals',price: 200),
      ProductDetailsModel(id: "3",image: 'assets/images/mobile.png',name: 'Mobile phones',price: 22000),
      ProductDetailsModel(id: "4",image: 'assets/images/pic1.jpg',name: 'camara',price: 32500),
      // ProductDetailsModel(id: "5",image: 'assets/images/alexa.jpg',name: 'Amazon alexa',price: 2500),
      // ProductDetailsModel(id: "6",image: 'assets/images/Diary.jpg',name: 'Journals',price: 200),
      // ProductDetailsModel(id: "7",image: 'assets/images/mobile.png',name: 'Mobile phones',price: 22000),
      // ProductDetailsModel(id: "8",image: 'assets/images/pic1.jpg',name: 'camara',price: 32500),
    ];
    return items;
  }
  getSmartphoneDeal(){
    List<ProductDetailsModel> items =[
      ProductDetailsModel(id:"100", image: 'assets/images/phone1.jpg',name: "OnePlus: Up to ₹4,000 off with Coupons",price: 30000),
      ProductDetailsModel(id:"101",image: 'assets/images/phone2.jpg',name: "Redmi: Up to ₹5,000 on exchange",price: 25000),
      ProductDetailsModel(id:"102",image: 'assets/images/phone3.jpg',name: "Samsung: Up to ₹9,000 off",price: 27000),
      ProductDetailsModel(id:"103",image: 'assets/images/phone4.jpg',name: "iQOO: Up to ₹3,000 off with Coupons",price: 15000),
    ];
    return items;
  }
  List<CartListModel> cartList =[];
  AddtoCart(CartListModel item){
    List<CartListModel> a = cartList.where((element) => item.id == element.id).toList();
    if (a.isNotEmpty) {
      a[0].quantity += item.quantity;
    }
    else{
      cartList.add(item);
    }

  }
  RemoveFromCart(CartListModel item){

    cartList.removeWhere((element) => item.id == element.id);
  }

  DecrementCartItem(CartListModel item){
    List<CartListModel> a = cartList.where((element) => item.id == element.id).toList();
    if (a.isNotEmpty) {
      a[0].quantity -= item.quantity;
    }
    else{
      cartList.add(item);
    }
    if(a[0].quantity == 0){
      cartList.removeWhere((element) => item.id == element.id);
    }
  }

  double get calculateTotalAmount {
    double totalAmount = 0;

    cartList.forEach((element) {
      totalAmount += element.price * element.quantity;
    });
    return totalAmount;
  }

  List<SaveForLaterModel> SaveForLaterList =[];

  AddtoSaveForLater(SaveForLaterModel item){
    List<SaveForLaterModel> a = SaveForLaterList.where((element) => item.id == element.id).toList();
    if (a.isNotEmpty) {
      //a[0].quantity += item.quantity;
    }
    else{
      SaveForLaterList.add(item);
    }

  }



}

