class Movie {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final String ageCat;
  final String showingDate;

  const Movie(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imagePath,
      required this.ageCat,
      required this.showingDate});
  factory Movie.fromJson(Map<String, dynamic> json) {
    final String id = json['id'] as String;
    final String name = json['name'] as String;
    final String description = json['description'] as String;
    final num priceNumber = json['price'] as num;
    final double price = priceNumber.toDouble();
    final String imagePath = json['imagePath'] as String;
    final String showingDate = json['showingDate'] as String;
    final String ageCat = json['ageCat'] as String;

    return Movie(
        id: id,
        name: name,
        description: description,
        price: price,
        imagePath: imagePath,
        ageCat: ageCat,
        showingDate: showingDate);
  }
  Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
      'ageCat': ageCat,
      'showingDate': showingDate
    };
    return data;
  }

  String get formattedPrice => '£${price.toStringAsFixed(2)}';
}
