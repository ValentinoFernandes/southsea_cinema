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
  
  String get formattedPrice {
  final String formattedValue = price.toStringAsFixed(2);
  return '£$formattedValue';
}
}
