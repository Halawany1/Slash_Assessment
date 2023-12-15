class CartItem {
  int? id;
  int productVariationId;
  int quantity;

  CartItem({
    this.id,
    required this.productVariationId,
    required this.quantity,
  });
}
