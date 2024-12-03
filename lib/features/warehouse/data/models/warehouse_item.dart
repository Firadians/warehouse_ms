class WarehouseItem {
  final int? id;
  final String name;
  final int quantity;
  final DateTime dateAdded;
  final String type; // "perishable", "furniture", "electronic"

  WarehouseItem({
    this.id,
    required this.name,
    required this.quantity,
    required this.dateAdded,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'dateAdded': dateAdded.toIso8601String(),
      'type': type,
    };
  }

  factory WarehouseItem.fromMap(Map<String, dynamic> map) {
    return WarehouseItem(
      id: map['id'] as int?,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      dateAdded: DateTime.parse(map['dateAdded']),
      type: map['type'] as String,
    );
  }
}
