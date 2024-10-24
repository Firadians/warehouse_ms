import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';

class FurnitureItem extends WarehouseItem {
  final String material;
  final String dimensions; // e.g., "5ft x 3ft x 2ft"

  FurnitureItem({
    int? id,
    required String name,
    required int quantity,
    required DateTime dateAdded,
    required this.material,
    required this.dimensions,
  }) : super(id: id, name: name, quantity: quantity, dateAdded: dateAdded);

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map['material'] = material;
    map['dimensions'] = dimensions;
    return map;
  }

  factory FurnitureItem.fromMap(Map<String, dynamic> map) {
    return FurnitureItem(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      dateAdded: DateTime.parse(map['dateAdded']),
      material: map['material'],
      dimensions: map['dimensions'],
    );
  }
}
