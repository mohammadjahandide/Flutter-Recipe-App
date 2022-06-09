class Ingredient {
  final int id;
  final String image;
  final String name;
  final String amount;
  final String unit;

  Ingredient({
    required this.id,
    required this.image,
    required this.name,
    required this.amount,
    required this.unit,
  });

  @override
  String toString() {
    return 'Ingredient{id:$id, name:$name, imageUrl:$image, amount:$amount, unit:$unit}';
  }
}
