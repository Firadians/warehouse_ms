import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';

class ElectronicItem extends WarehouseItem {
  final int warrantyPeriod; // Warranty period in months

  ElectronicItem({
    int? id,
    required String name,
    required int quantity,
    required DateTime dateAdded,
    required this.warrantyPeriod,
  }) : super(id: id, name: name, quantity: quantity, dateAdded: dateAdded);

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map['warrantyPeriod'] = warrantyPeriod;
    return map;
  }

  factory ElectronicItem.fromMap(Map<String, dynamic> map) {
    return ElectronicItem(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      dateAdded: DateTime.parse(map['dateAdded']),
      warrantyPeriod: map['warrantyPeriod'],
    );
  }
}
