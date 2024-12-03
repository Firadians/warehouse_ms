import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';

class FurnitureItem extends WarehouseItem {
  final String material;
  final String dimensions;

  FurnitureItem({
    int? id,
    required String name,
    required int quantity,
    required DateTime dateAdded,
    required this.material,
    required this.dimensions,
  }) : super(
            id: id,
            name: name,
            quantity: quantity,
            dateAdded: dateAdded,
            type: 'furniture');

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map['material'] = material;
    map['dimensions'] = dimensions;
    return map;
  }

  factory FurnitureItem.fromMap(Map<String, dynamic> map) {
    return FurnitureItem(
      id: map['id'] as int?,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      dateAdded: DateTime.parse(map['dateAdded']),
      material: map['material'] as String,
      dimensions: map['dimensions'] as String,
    );
  }
}
