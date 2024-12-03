import 'package:flutter/material.dart';
import 'package:warehouse_ms/features/warehouse/data/models/electronic_item.dart';
import 'package:warehouse_ms/features/warehouse/data/models/perishable_item.dart';
import 'package:warehouse_ms/features/warehouse/data/models/furniture_item.dart';
import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';

class WarehouseItemDetailPage extends StatelessWidget {
  final WarehouseItem item;

  WarehouseItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Quantity: ${item.quantity}'),
            SizedBox(height: 8),
            Text('Date Added: ${item.dateAdded.toLocal()}'.split(' ')[0]),
            SizedBox(height: 8),
            _buildItemDetails(
                item), // Call method to display type-specific details
          ],
        ),
      ),
    );
  }

  Widget _buildItemDetails(WarehouseItem item) {
    if (item is ElectronicItem) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Warranty Period: ${item.warrantyPeriod} months'),
        ],
      );
    } else if (item is PerishableItem) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Expiry Date: ${item.expiryDate.toLocal()}'.split(' ')[0]),
        ],
      );
    } else if (item is FurnitureItem) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Material: ${item.material}'),
          SizedBox(height: 8),
          Text('Dimensions: ${item.dimensions}'),
        ],
      );
    } else {
      return Text('No additional details available for this item.');
    }
  }
}
