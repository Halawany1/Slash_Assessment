import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slash_task/core/dummy_data.dart';

part 'details_item_state.dart';

class DetailsItemCubit extends Cubit<DetailsItemState> {
  DetailsItemCubit() : super(DetailsItemInitial());

  int currentIndex=0;
  void changeIndexImage(int index){
    currentIndex=index;
    emit(ChangeIndexImageState());
  }

  int colorSelected=0;
  void changeIndexColor(int index){
    colorSelected=index;
    emit(ChangeIndexColorState());
  }

  int sizeSelected=0;
  void changeIndexSize(int index){
    sizeSelected=index;
    emit(ChangeIndexSizeState());
  }


  int materialSelected=0;
  void changeIndexMaterial(int index){
    materialSelected=index;
    emit(ChangeIndexMaterialState());
  }

  int quantity=1;
  double totalPrice=-1;
  void changeQuantity(bool add,double price){
    if(add){
      quantity++;
      totalPrice=price;
      totalPrice*=quantity;
    }else{
      if(quantity!=1){
        quantity--;
        totalPrice=price;
        totalPrice*=quantity;
      }
      totalPrice=price;
      totalPrice*=quantity;
    }
    emit(ChangeQuantityState());
  }

  void removeProduct(){
    totalPrice=0;
    emit(RemoveProductState());
  }
}
