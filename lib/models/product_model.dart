class ProductModel {
  final String image, brandName, title, productId;
  final double price;
  final double? priceAfterDiscount;
  final int? discountPercent;

  ProductModel({
    required this.productId,
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfterDiscount,
    this.discountPercent,
  });
}
