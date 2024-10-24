part of 'warehouse_bloc.dart';

abstract class WarehouseEvent extends Equatable {
  const WarehouseEvent();

  @override
  List<Object> get props => [];
}

class LoadItems extends WarehouseEvent {}

class AddItem extends WarehouseEvent {
  final WarehouseItem item;
  AddItem(this.item);
}

class UpdateItem extends WarehouseEvent {
  final WarehouseItem item;
  UpdateItem(this.item);
}

class DeleteItem extends WarehouseEvent {
  final int id;
  DeleteItem(this.id);
}
