import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_ms/features/warehouse/presentation/bloc/warehouse_bloc.dart';

import 'package:warehouse_ms/features/warehouse/data/repositories/warehouse_repository.dart';
import 'package:warehouse_ms/features/warehouse/presentation/pages/warehouse_item_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final warehouseRepository = WarehouseRepository();

    return BlocProvider(
      create: (_) => WarehouseBloc(warehouseRepository)..add(LoadItems()),
      child: MaterialApp(
        title: 'Warehouse Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocBuilder<WarehouseBloc, WarehouseState>(
          builder: (context, state) {
            final warehouseBloc = BlocProvider.of<WarehouseBloc>(context);
            return WarehouseCrudPage(warehouseBloc);
          },
        ),
      ),
    );
  }
}
