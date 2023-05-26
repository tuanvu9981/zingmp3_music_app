import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphData {
  int? hourX;
  int? y;
  int? yValue;
  int? secondYValue;
  String? imgUrl;
  int? songId;

  GraphData({
    this.hourX,
    this.y,
    this.yValue,
    this.secondYValue,
    this.imgUrl,
    this.songId,
  });
}

final chartData = <GraphData>[
  GraphData(
    hourX: 6,
    y: 55,
    yValue: 40,
    secondYValue: 45,
  ),
  GraphData(
    hourX: 7,
    y: 33,
    yValue: 45,
    secondYValue: 54,
  ),
  GraphData(
    hourX: 8,
    y: 20,
    yValue: 46,
    secondYValue: 60,
  ),
  GraphData(
    hourX: 9,
    y: 24,
    yValue: 50,
    secondYValue: 57,
  ),
  GraphData(
    hourX: 10,
    y: 56,
    yValue: 18,
    secondYValue: 43,
  ),
  GraphData(
    hourX: 11,
    y: 23,
    yValue: 54,
    secondYValue: 33,
  ),
  GraphData(
    hourX: 12,
    y: 23,
    yValue: 54,
    secondYValue: 33,
  ),
  GraphData(
    hourX: 13,
    y: 23,
    yValue: 54,
    secondYValue: 33,
  ),
  GraphData(
    hourX: 14,
    y: 23,
    yValue: 54,
    secondYValue: 33,
  ),
  GraphData(
    hourX: 15,
    y: 23,
    yValue: 54,
    secondYValue: 33,
  ),
  GraphData(
    hourX: 16,
    y: 23,
    yValue: 54,
    secondYValue: 33,
  ),
];

List<StackedLineSeries<GraphData, int>> getSongSeries(int currentIndex) {
  return <StackedLineSeries<GraphData, int>>[
    StackedLineSeries<GraphData, int>(
      color: Colors.lightGreen,
      dataSource: chartData,
      xValueMapper: (GraphData sales, _) => sales.hourX,
      yValueMapper: (GraphData sales, _) => sales.y,
      markerSettings: MarkerSettings(isVisible: currentIndex == 0),
    ),
    StackedLineSeries<GraphData, int>(
      color: Colors.lightBlue[300],
      dataSource: chartData,
      xValueMapper: (GraphData sales, _) => sales.hourX,
      yValueMapper: (GraphData sales, _) => sales.yValue,
      markerSettings: MarkerSettings(isVisible: currentIndex == 1),
    ),
    StackedLineSeries<GraphData, int>(
      color: Colors.red[400],
      dataSource: chartData,
      xValueMapper: (GraphData sales, _) => sales.hourX,
      yValueMapper: (GraphData sales, _) => sales.secondYValue,
      markerSettings: MarkerSettings(isVisible: currentIndex == 2),
    ),
  ];
}
