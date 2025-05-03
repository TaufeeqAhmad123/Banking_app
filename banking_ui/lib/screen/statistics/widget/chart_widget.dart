import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

Widget buildChart(int isSelected) {
    if (isSelected == 0) {
      // Today -> Stacked Column Chart
      return SfCartesianChart(
        //title: ChartTitle(text: 'Spending Overview (Today)'),
        primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 4000,
              interval: 1000,
            ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          StackedColumnSeries<ChartData, String>(
            dataSource: todayChartData,
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.creditSpending,
            name: 'Credit',
            color: Colors.black,
          ),
          StackedColumnSeries<ChartData, String>(
            dataSource: todayChartData,
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.debitSpending,
            name: 'Debit',
            color: Colors.lightGreenAccent,
          ),
        ],
      );
    } else if (isSelected == 1) {
      // Week -> Line Chart
      return SfCartesianChart(
        title: ChartTitle(text: 'Spending Overview (Week)'),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 3000, interval: 500),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          LineSeries<ChartData, String>(
            dataSource: weekChartData,
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.creditSpending,
            name: 'Credit',
            color: Colors.black,
          ),
          LineSeries<ChartData, String>(
            dataSource: weekChartData,
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.debitSpending,
            name: 'Debit',
            color: Colors.lightGreenAccent,
          ),
        ],
      );
    } else if (isSelected == 2) {
      // Month -> Stacked Column Chart
      return SfCartesianChart(
        title: ChartTitle(text: 'Spending Overview (Month)'),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 5000, interval: 1000),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          StackedColumnSeries<ChartData, String>(
            dataSource: monthChartData,
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.creditSpending,
            name: 'Credit',
            color: Colors.black,
          ),
          StackedColumnSeries<ChartData, String>(
            dataSource: monthChartData,
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.debitSpending,
            name: 'Debit',
            color: Colors.lightGreenAccent,
          ),
        ],
      );
    } else {
      // Year -> Line Chart
      return SfCircularChart(
      title: ChartTitle(text: 'Spending Overview (Year)'),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CircularSeries>[
        PieSeries<ChartData, String>(
          dataSource: yearChartData,
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.creditSpending + data.debitSpending,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          pointColorMapper: (ChartData data, _) {
            // Different color for each year
            if (data.month == '2020') {
              return Colors.black;
            } else if (data.month == '2021') {
              return Colors.lightGreenAccent;
            } else if (data.month == '2022') {
              return Colors.blueAccent;
            } else {
              return Colors.deepPurpleAccent;
            }
          },
        ),
      ],
    );
  }
  }

// ChartData Model
class ChartData {
  final String month;
  final double debitSpending;
  final double creditSpending;

  ChartData(this.month, this.debitSpending, this.creditSpending);
}

// Dummy Data for all charts
final List<ChartData> todayChartData = [
  ChartData('JAN', 1200, 500),
  ChartData('FEB', 1800, 400),
  ChartData('MAR', 3000, 900),
  ChartData('APR', 2700, 800),
  ChartData('MAY', 3200, 1000),
  ChartData('JUN', 1600, 600),
];
final List<ChartData> weekChartData = [
  ChartData('W1', 1200, 900),
  ChartData('W2', 1800, 1100),
  ChartData('W3', 1500, 1300),
  ChartData('W4', 1000, 800),
];

final List<ChartData> monthChartData = [
  ChartData('Jan', 2200, 1800),
  ChartData('Feb', 2400, 2000),
  ChartData('Mar', 2000, 1700),
  ChartData('Apr', 2500, 1900),
];

final List<ChartData> yearChartData = [
  ChartData('2020', 12000, 9000),
  ChartData('2021', 15000, 11000),
  ChartData('2022', 18000, 13000),
  ChartData('2023', 20000, 16000),
];
