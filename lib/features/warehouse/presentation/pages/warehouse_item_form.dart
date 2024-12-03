import 'package:flutter/material.dart';
import 'package:warehouse_ms/features/warehouse/data/models/furniture_item.dart';
import 'package:warehouse_ms/features/warehouse/data/models/perishable_item.dart';
import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';

class WarehouseItemForm extends StatefulWidget {
  final WarehouseItem? initialItem;
  final void Function(WarehouseItem item) onSave;

  WarehouseItemForm({this.initialItem, required this.onSave});

  @override
  _WarehouseItemFormState createState() => _WarehouseItemFormState();
}

class _WarehouseItemFormState extends State<WarehouseItemForm> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _materialController = TextEditingController();
  final _dimensionsController = TextEditingController();

  String? _selectedType;

  @override
  void initState() {
    super.initState();
    if (widget.initialItem != null) {
      _nameController.text = widget.initialItem!.name;
      _quantityController.text = widget.initialItem!.quantity.toString();
      if (widget.initialItem is PerishableItem) {
        _selectedType = 'Perishable';
        _expiryDateController.text =
            (widget.initialItem as PerishableItem).expiryDate.toIso8601String();
      } else if (widget.initialItem is FurnitureItem) {
        _selectedType = 'Furniture';
        _materialController.text =
            (widget.initialItem as FurnitureItem).material;
        _dimensionsController.text =
            (widget.initialItem as FurnitureItem).dimensions;
      } else {
        _selectedType = 'Electronic';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialItem == null ? 'Add Item' : 'Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedType,
              items: [
                DropdownMenuItem(
                  value: 'Electronic',
                  child: Text('Electronic'),
                ),
                DropdownMenuItem(
                  value: 'Furniture',
                  child: Text('Furniture'),
                ),
                DropdownMenuItem(
                  value: 'Perishable',
                  child: Text('Perishable'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
              decoration: InputDecoration(labelText: 'Item Type'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            if (_selectedType == 'Perishable') ...[
              TextField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date (yyyy-mm-dd)',
                ),
                keyboardType: TextInputType.datetime,
              ),
            ],
            if (_selectedType == 'Furniture') ...[
              TextField(
                controller: _materialController,
                decoration: InputDecoration(labelText: 'Material'),
              ),
              TextField(
                controller: _dimensionsController,
                decoration: InputDecoration(labelText: 'Dimensions'),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final quantity = int.tryParse(_quantityController.text) ?? 0;

                WarehouseItem newItem;

                if (_selectedType == 'Perishable') {
                  final expiryDate =
                      DateTime.tryParse(_expiryDateController.text) ??
                          DateTime.now();
                  newItem = PerishableItem(
                    id: widget.initialItem?.id,
                    name: name,
                    quantity: quantity,
                    dateAdded: widget.initialItem?.dateAdded ?? DateTime.now(),
                    expiryDate: expiryDate,
                  );
                } else if (_selectedType == 'Furniture') {
                  final material = _materialController.text;
                  final dimensions = _dimensionsController.text;
                  newItem = FurnitureItem(
                    id: widget.initialItem?.id,
                    name: name,
                    quantity: quantity,
                    dateAdded: widget.initialItem?.dateAdded ?? DateTime.now(),
                    material: material,
                    dimensions: dimensions,
                  );
                } else {
                  newItem = WarehouseItem(
                    id: widget.initialItem?.id,
                    name: name,
                    quantity: quantity,
                    dateAdded: widget.initialItem?.dateAdded ?? DateTime.now(),
                    type: 'Warehouse',
                  );
                }

                widget.onSave(newItem);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
