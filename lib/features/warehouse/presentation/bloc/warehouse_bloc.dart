import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';
import 'package:warehouse_ms/features/warehouse/data/repositories/warehouse_repository.dart';

part 'warehouse_event.dart';
part 'warehouse_state.dart';

class WarehouseBloc extends Bloc<WarehouseEvent, WarehouseState> {
  final WarehouseRepository _repository;

  WarehouseBloc(this._repository) : super(WarehouseLoading()) {
    on<LoadItems>((event, emit) async {
      emit(WarehouseLoading());
      try {
        final items = await _repository.getItems();
        emit(WarehouseLoaded(items));
      } catch (e) {
        emit(WarehouseError('Failed to load items'));
      }
    });

    on<AddItem>((event, emit) async {
      try {
        await _repository.insertItem(event.item);
        final items = await _repository.getItems();
        emit(WarehouseLoaded(items));
      } catch (e) {
        emit(WarehouseError('Failed to add item'));
      }
    });

    on<UpdateItem>((event, emit) async {
      try {
        await _repository.updateItem(event.item);
        final items = await _repository.getItems();
        emit(WarehouseLoaded(items));
      } catch (e) {
        emit(WarehouseError('Failed to update item'));
      }
    });

    on<DeleteItem>((event, emit) async {
      try {
        await _repository.deleteItem(event.id);
        final items = await _repository.getItems();
        emit(WarehouseLoaded(items));
      } catch (e) {
        emit(WarehouseError('Failed to delete item'));
      }
    });
  }
}
