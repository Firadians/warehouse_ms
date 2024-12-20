import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';
import 'package:warehouse_ms/features/warehouse/presentation/bloc/warehouse_bloc.dart';
import 'package:warehouse_ms/features/warehouse/presentation/pages/warehouse_item_form.dart';
import 'package:warehouse_ms/features/warehouse/presentation/pages/warehouse_item_detail_page.dart'; // Import the new page

class WarehouseCrudPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final warehouseBloc = BlocProvider.of<WarehouseBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Warehouse Inventory')),
      body: BlocConsumer<WarehouseBloc, WarehouseState>(
        listener: (context, state) {
          if (state is WarehouseError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('An error occurred while updating items.'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is WarehouseLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WarehouseLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WarehouseItemDetailPage(item: item),
                      ),
                    );
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () =>
                            _editItem(context, warehouseBloc, item),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            warehouseBloc.add(DeleteItem(item.id!)),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No items available.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addItem(context, warehouseBloc),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem(BuildContext context, WarehouseBloc bloc) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WarehouseItemForm(
          onSave: (item) {
            bloc.add(AddItem(item));
          },
        ),
      ),
    );
  }

  void _editItem(BuildContext context, WarehouseBloc bloc, WarehouseItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WarehouseItemForm(
          initialItem: item,
          onSave: (updatedItem) {
            bloc.add(UpdateItem(updatedItem));
          },
        ),
      ),
    );
  }
}
