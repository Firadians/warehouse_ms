class WarehouseItem {
  final int? id;
  final String name;
  final int quantity;
  final DateTime dateAdded;

  WarehouseItem({
    this.id,
    required this.name,
    required this.quantity,
    required this.dateAdded,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'dateAdded': dateAdded.toIso8601String(),
    };
  }

  factory WarehouseItem.fromMap(Map<String, dynamic> map) {
    return WarehouseItem(
      id: map['id'],
      name: map['name'],
      quantity: map['quantity'],
      dateAdded: DateTime.parse(map['dateAdded']),
    );
  }
}
