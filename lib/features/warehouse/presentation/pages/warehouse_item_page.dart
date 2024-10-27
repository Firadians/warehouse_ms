import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';
import 'package:warehouse_ms/features/warehouse/presentation/bloc/warehouse_bloc.dart';
import 'package:warehouse_ms/features/warehouse/presentation/pages/warehouse_item_form.dart';

class WarehouseCrudPage extends StatelessWidget {
  final WarehouseBloc bloc;

  WarehouseCrudPage(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Warehouse Inventory')),
      body: BlocConsumer<WarehouseBloc, WarehouseState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is WarehouseError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('An error occurred while updating items.')),
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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editItem(context, item),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => bloc.add(DeleteItem(item.id!)),
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
        onPressed: () => _addItem(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WarehouseItemForm(
          onSave: (name, quantity) {
            final newItem = WarehouseItem(
              name: name,
              quantity: quantity,
              dateAdded: DateTime.now(),
            );
            bloc.add(AddItem(newItem));
          },
        ),
      ),
    );
  }

  void _editItem(BuildContext context, WarehouseItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WarehouseItemForm(
          initialItem: item,
          onSave: (name, quantity) {
            final updatedItem = WarehouseItem(
              id: item.id,
              name: name,
              quantity: quantity,
              dateAdded: item.dateAdded,
            );
            bloc.add(UpdateItem(updatedItem));
          },
        ),
      ),
    );
  }
}
