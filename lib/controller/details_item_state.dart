part of 'details_item_cubit.dart';

@immutable
abstract class DetailsItemState {}

class DetailsItemInitial extends DetailsItemState {}

class ChangeIndexImageState extends DetailsItemState {}

class ChangeIndexColorState extends DetailsItemState {}

class ChangeIndexSizeState extends DetailsItemState {}

class ChangeIndexMaterialState extends DetailsItemState {}

class ChangePriceState extends DetailsItemState {}

class ChangeQuantityState extends DetailsItemState {}

class RemoveProductState extends DetailsItemState {}