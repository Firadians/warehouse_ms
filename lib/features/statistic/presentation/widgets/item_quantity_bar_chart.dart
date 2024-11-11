import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:warehouse_ms/features/warehouse/data/models/warehouse_item.dart';

class ItemQuantityBarChart extends StatelessWidget {
  final List<WarehouseItem> items;

  ItemQuantityBarChart({required this.items});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: _calculateMaxY(),
        barGroups: _buildBarGroups(),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                final index = value.toInt();
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    items[index].name,
                    style: TextStyle(fontSize: 10),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: _calculateMaxY() / 5,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(value.toInt().toString());
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  double _calculateMaxY() {
    return items
            .map((item) => item.quantity.toDouble())
            .reduce((a, b) => a > b ? a : b) +
        5;
  }

  List<BarChartGroupData> _buildBarGroups() {
    return List.generate(items.length, (index) {
      final item = items[index];
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: item.quantity.toDouble(),
            color: Colors.blueAccent,
            width: 20,
          ),
        ],
      );
    });
  }
}
