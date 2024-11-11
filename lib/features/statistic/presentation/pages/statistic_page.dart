import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_ms/features/statistic/presentation/widgets/item_quantity_bar_chart.dart';
import 'package:warehouse_ms/features/warehouse/presentation/bloc/warehouse_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item Statistics')),
      body: BlocBuilder<WarehouseBloc, WarehouseState>(
        builder: (context, state) {
          if (state is WarehouseLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WarehouseLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ItemQuantityBarChart(items: state.items),
            );
          } else {
            return Center(child: Text('No items available.'));
          }
        },
      ),
    );
  }
}
