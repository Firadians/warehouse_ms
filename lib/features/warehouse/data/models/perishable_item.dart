import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';

class PerishableItem extends WarehouseItem {
  final DateTime expiryDate;

  PerishableItem({
    int? id,
    required String name,
    required int quantity,
    required DateTime dateAdded,
    required this.expiryDate,
  }) : super(
            id: id,
            name: name,
            quantity: quantity,
            dateAdded: dateAdded,
            type: 'perishable');

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map['expiryDate'] = expiryDate.toIso8601String();
    return map;
  }

  factory PerishableItem.fromMap(Map<String, dynamic> map) {
    return PerishableItem(
      id: map['id'] as int?,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      dateAdded: DateTime.parse(map['dateAdded']),
      expiryDate: DateTime.parse(map['expiryDate']),
    );
  }
}
