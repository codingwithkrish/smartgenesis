class ProductModels {
  String title;
  String price;
  String description;
  String category;
  String imagelink;
  String rate;
  String count;
  ProductModels(
      {required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.imagelink,
      required this.rate,
      required this.count});
  factory ProductModels.fromMap(Map info) {
    return ProductModels(
        title: info["title"],
        price: info["price"].toString(),
        description: info["description"],
        category: info["category"],
        imagelink: info["image"],
        rate: info["rating"]["rate"].toString(),
        count: info["rating"]["count"].toString());
  }
}
