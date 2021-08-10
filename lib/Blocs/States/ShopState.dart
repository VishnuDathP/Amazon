import 'package:amazon_clone/Models/ProductDetailsModel.dart';
import 'package:equatable/equatable.dart';

class ShopState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class InitialState extends ShopState{
  InitialState();
}

class LoadPageState extends ShopState{
  List<ProductDetailsModel> dealofDay;
  List<ProductDetailsModel> smartphoneDeal;
  LoadPageState({required this.dealofDay,required this.smartphoneDeal});
}


class CartState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
class InitialCartState extends CartState{
  InitialCartState();
}

class ViewCartState extends CartState{
  List<CartListModel> cartList;
  ViewCartState({required this.cartList});
}



class SaveForLaterState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialSaveForLaterState extends SaveForLaterState{
  InitialSaveForLaterState();
}
class ViewSaveForLaterState extends SaveForLaterState{
  List<SaveForLaterModel> saveForLaterList;
  ViewSaveForLaterState({required this.saveForLaterList});
}
