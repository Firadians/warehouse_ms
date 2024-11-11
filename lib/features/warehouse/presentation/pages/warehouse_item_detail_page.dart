import 'package:flutter/material.dart';
import 'package:warehouse_ms/features/warehouse/data/models/electronic_item.dart';
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
            if (item is ElectronicItem) ...[
              SizedBox(height: 8),
              Text(
                  'Warranty Period: ${(item as ElectronicItem).warrantyPeriod} months'),
            ],
          ],
        ),
      ),
    );
  }
}
