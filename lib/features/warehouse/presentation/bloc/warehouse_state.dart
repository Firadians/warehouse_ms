part of 'warehouse_bloc.dart';

abstract class WarehouseState extends Equatable {
  const WarehouseState();

  @override
  List<Object> get props => [];
}

class WarehouseInitial extends WarehouseState {}

class WarehouseLoading extends WarehouseState {}

class WarehouseLoaded extends WarehouseState {
  final List<WarehouseItem> items;
  WarehouseLoaded(this.items);
}

class WarehouseError extends WarehouseState {
  final String message;
  WarehouseError(this.message);
}
