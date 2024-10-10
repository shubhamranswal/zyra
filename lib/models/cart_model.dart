class CartItem {
  final String productId;
  final String title;
  final String brandName;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.brandName,
    required this.productId,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}
