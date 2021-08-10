import 'package:amazon_clone/Models/ProductDetailsModel.dart';
import 'package:amazon_clone/Screens/SmartPhoneDealScreen.dart';

abstract class ShopEvent {

}
class InitialShopEvent extends ShopEvent{
  InitialShopEvent();
}
class ClickEvent extends ShopEvent{

  ClickEvent();
}



abstract class CartEvent{
}
class InitialCartEvent extends CartEvent{
  InitialCartEvent();
}

class AddtoCartEvent extends CartEvent{
  CartListModel item;
  AddtoCartEvent({required this.item});
}

class RemoveFromCartEvent extends CartEvent{
  CartListModel item;
  RemoveFromCartEvent({required this.item});
}

class DecrementCartItemEvent extends CartEvent{
  CartListModel item;
  DecrementCartItemEvent({required this.item});
}


abstract class SaveForLaterEvent {
}

class InitialSaveForLaterEvent extends SaveForLaterEvent{
  InitialSaveForLaterEvent();
}

class AddtoSaveForLaterEvent extends SaveForLaterEvent{
  SaveForLaterModel item;
  AddtoSaveForLaterEvent({required this.item});
}