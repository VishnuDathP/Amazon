import 'package:amazon_clone/Blocs/Events/ShopEvent.dart';
import 'package:amazon_clone/Repository/ProductDetailsRepo.dart';
import '../States/ShopState.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class ProductDetailsBloc extends Bloc<ShopEvent, ShopState> {
  ProductDetailsRepo repo = ProductDetailsRepo();

  ProductDetailsBloc() : super(InitialState()) {
    add(InitialShopEvent());
  }

  @override
  Stream<ShopState> mapEventToState(event) async* {
    // TODO: implement mapEventToState
    if (event is InitialShopEvent) {
      yield LoadPageState(
        dealofDay: repo.getDealofDay(),
        smartphoneDeal: repo.getSmartphoneDeal(),
      );
    } else if (event is ClickEvent) {
      yield LoadPageState(
        dealofDay: repo.getDealofDay(),
        smartphoneDeal: repo.getSmartphoneDeal(),
      );
    }
  }
}

class CartBloc extends Bloc<CartEvent, CartState> {
  ProductDetailsRepo repo = ProductDetailsRepo();

  CartBloc() : super(InitialCartState()) {
    add(InitialCartEvent());
  }

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    // TODO: implement mapEventToState
    if (event is AddtoCartEvent) {
      var itemtoAdd = event.item;
      repo.AddtoCart(itemtoAdd);
      yield ViewCartState(
        cartList: repo.cartList,
      );
    }
    if (event is RemoveFromCartEvent){
      repo.RemoveFromCart(event.item);
      yield ViewCartState(cartList: repo.cartList);
    }
    if (event is DecrementCartItemEvent){
      repo.DecrementCartItem(event.item);
      yield ViewCartState(cartList: repo.cartList);
    }
  }
}

class SaveForLaterBloc extends Bloc<SaveForLaterEvent,SaveForLaterState>{
  ProductDetailsRepo repo = ProductDetailsRepo();

  SaveForLaterBloc() : super(InitialSaveForLaterState()){
    add(InitialSaveForLaterEvent());
  }

  @override
  Stream<SaveForLaterState> mapEventToState(SaveForLaterEvent event) async*{
    // TODO: implement mapEventToState
    if (event is AddtoSaveForLaterEvent){
      var itemtoAdd = event.item;
      repo.AddtoSaveForLater(itemtoAdd);
      yield ViewSaveForLaterState(saveForLaterList: repo.SaveForLaterList);
    }
  }
  
}


enum CounterEvent { increment, decrement }

class Add extends Equatable{
  late int count;
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class InitialSt extends Add{
  final int count = 0;
}

class Increment extends Add{
  int count;
  Increment({required this.count});
}

class CounterBloc extends Bloc<CounterEvent, Add> {
  CounterBloc(Add initialState) : super(initialState);

  Add get initialState => InitialSt();

  @override
  Stream<Add> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield Increment(count: state.count - 1);
      break;
      case CounterEvent.increment:
        yield Increment(count: state.count + 1);
      break;
    }
  }
}