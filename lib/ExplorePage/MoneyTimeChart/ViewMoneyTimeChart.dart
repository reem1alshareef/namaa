import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaagp/ExplorePage/MoneyTimeChart/ViewModelMoneyTimeChart.dart';
import 'package:stacked/stacked.dart';

class ViewMoneyTimeChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  const ViewMoneyTimeChart({Key? key}) : super(key: key);

  @override
  State<ViewMoneyTimeChart> createState() => _ViewMoneyTimeChartState();
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  // var style = GoogleFonts.getFont("Noto Sans",
  //     fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white);
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('السبت',
          style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white));
      break;
    case 2:
      text = Text('الجمعة',
          style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white));
      break;
    case 3:
      text = Text('الخميس',
          style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white));
      break;
    case 4:
      text = Text('الأربعاء',
          style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white));
      break;
    case 5:
      text = Text('الثلاثاء',
          style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white));
      break;
    case 6:
      text = Text('الإثنين',
          style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white));
      break;
    case 7:
      text = Text('الأحد',
          style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white));
      break;
    default:
      text = Text('',
          style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white));
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
  Widget rightTitleWidgets(double value, TitleMeta meta) {
    // var style = GoogleFonts.getFont("Noto Sans Arabic",
    //           fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 25:
        text = 'خمسة وعشرون';
        break;
      case 50:
        text = 'خمسون';
        break;
      
      case 100:
        text = 'مئة';
        break;
      
      case 200:
        text = '٢٠٠';
        break;
      
      case 500:
        text = '٥٠٠';
        break;

      case 750:
        text = '٧٥٠';
        break;

      case 1000:
        text = 'ألف';
        break;

      case 2000:
        text = 'ألفين';
        break;

      // case 5000:
      //   text = '٥٠٠٠';
      //   break;
      default:
        return Container();
    }

    return Text(text, style: GoogleFonts.getFont("Noto Sans Arabic",
              fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white), textAlign: TextAlign.right);
  }

class _ViewMoneyTimeChartState extends State<ViewMoneyTimeChart> {
@override
Widget build(BuildContext context) {
  return ViewModelBuilder<ViewModelMoneyTimeChart>.reactive(
    viewModelBuilder: () => ViewModelMoneyTimeChart(),
    builder: (context, viewmodel, _) {
      return FutureBuilder<List<double>>(
        future: Future.wait([
          ViewModelMoneyTimeChart.getSaturdayAverage(),
          ViewModelMoneyTimeChart.getFridayAverage(),
          ViewModelMoneyTimeChart.getThursdayAverage(),
          ViewModelMoneyTimeChart.getWednesdayAverage(),
          ViewModelMoneyTimeChart.getTuesdayAverage(),
          ViewModelMoneyTimeChart.getMondayAverage(),
          ViewModelMoneyTimeChart.getSundayAverage(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          List<double> averages = snapshot.data!;

          return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              borderData: FlBorderData(border: Border.all(width: 0)),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: bottomTitleWidgets,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: rightTitleWidgets,
                  ),
                ),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              barGroups: [
                BarChartGroupData(x: 1, barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: averages[0],
                    width: 6,
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xB2567BB6), Color(0x3516325F)],
                    ),
                  ),
                ]),
                BarChartGroupData(x: 2, barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: averages[1],
                    width: 6,
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xB2567BB6), Color(0x3516325F)],
                    ),
                  ),
                ]),
                BarChartGroupData(x: 3, barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: averages[2],
                    width: 6,
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xB2567BB6), Color(0x3516325F)],
                    ),
                  ),
                ]),
                BarChartGroupData(x: 4, barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: averages[3],
                    width: 6,
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xB2567BB6), Color(0x3516325F)],
                    ),
                  ),
                ]),
                BarChartGroupData(x: 5, barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: averages[4],
                    width: 6,
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xB2567BB6), Color(0x3516325F)],
                    ),
                  ),
                ]),
                BarChartGroupData(x: 6, barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: averages[5],
                    width: 6,
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xB2567BB6), Color(0x3516325F)],
                    ),
                  ),
                ]),
                BarChartGroupData(x: 7, barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: averages[6],
                    width: 6,
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0,1),
                      colors: [Color(0xB2567BB6), Color(0x3516325F)],
                    ),
                  ),
                ]),
              ],
            ),
          );
        },
      );
    },
  );
}

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 8,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 8, getTitlesWidget: rightTitleWidgets),
        ),
      );
}


// getSaturdayAverageAsDouble() async {
//   return await ViewModelMoneyTimeChart.getSaturdayAverage();
// }
// getFridayAverageAsDouble() async {
//   return await ViewModelMoneyTimeChart.getFridayAverage();
// }
// getThursdayAverageAsDouble() async {
//   return await ViewModelMoneyTimeChart.getThursdayAverage();
// }
// getWednesdayAverageAsDouble() async {
//     return await ViewModelMoneyTimeChart.getWednesdayAverage();
// }
// getTuesdayAverageAsDouble() async {
//   return await ViewModelMoneyTimeChart.getTuesdayAverage();
// }
// getMondayAverageAsDouble() async {
//   return await ViewModelMoneyTimeChart.getMondayAverage();
// }
// getSundayAverageAsDouble() async {
//   return await ViewModelMoneyTimeChart.getSundayAverage();
// }



// //import 'package:syncfusion_flutter_charts/charts.dart';

// // void main() {
// //   return runApp(_ChartApp());
// // }

// // class ChartApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return 
// //     // return MaterialApp(
// //     //   theme: ThemeData(primarySwatch: Colors.blue),
// //     //   home: _MyHomePage(),
// //     // );
// //   }
// // }

// class MyHomePage extends StatefulWidget {
//   // ignore: prefer_const_constructors_in_immutables
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late List<_ChartData> data;
//   //late TooltipBehavior _tooltip;

//   @override
//   void initState() {
//     data = [
//       _ChartData('CHN', 12),
//       _ChartData('GER', 15),
//       _ChartData('RUS', 30),
//       _ChartData('BRZ', 6.4),
//       _ChartData('IND', 14)
//     ];
//     //_tooltip = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Syncfusion Flutter chart'),
//         ),
//         body: SfCartesianChart(
//             primaryXAxis: CategoryAxis(),
//             primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
//            // tooltipBehavior: _tooltip,
//             series: <ChartSeries<_ChartData, String>>[
//               ColumnSeries<_ChartData, String>(
//                   dataSource: data,
//                   xValueMapper: (_ChartData data, _) => data.x,
//                   yValueMapper: (_ChartData data, _) => data.y,
//                   name: 'Gold',
//                   color: Color.fromRGBO(8, 142, 255, 1))
//             ]));
//   }
// }

// class _ChartData {
//   _ChartData(this.x, this.y);

//   final String x;
//   final double y;
// }
//-------------------------------------------------------------------------------------------------------------------------
// class LineChartSample2 extends StatefulWidget {
//   const LineChartSample2({super.key});

//   @override
//   State<LineChartSample2> createState() => _LineChartSample2State();
// }

// class _LineChartSample2State extends State<LineChartSample2> {
//   @override
//   Widget build(BuildContext context) {
//     return Chart(
//   layers: [
//     ChartAxisLayer(
//       settings: ChartAxisSettings(
//         x: ChartAxisSettingsAxis(
//           frequency: 1.0,
//           max: 13.0,
//           min: 7.0,
//           textStyle: TextStyle(
//             color: Colors.white.withOpacity(0.6),
//             fontSize: 10.0,
//             ),
//           ),
//           y: ChartAxisSettingsAxis(
//             frequency: 100.0,
//             max: 300.0,
//             min: 0.0,
//             textStyle: TextStyle(
//               color: Colors.white.withOpacity(0.6),
//               fontSize: 10.0,
//             ),
//           ),
//         ),
//         labelX: (value) => value.toInt().toString(),
//         labelY: (value) => value.toInt().toString(),
//       ),
//       ChartBarLayer(
//         items: List.generate(
//           13 - 7 + 1,
//           (index) => ChartBarDataItem(
//             color: const Color(0xFF8043F9),
//             value: Random().nextInt(280) + 20,
//             x: index.toDouble() + 7,
//           ),
//         ),
//         settings: const ChartBarSettings(
//           thickness: 8.0,
//           radius: BorderRadius.all(Radius.circular(4.0)),
//         ),
//       ),
//     ]);
// //   ],
// // );
//   }
  
// }
//--------------------------------------------------------------------------------------------------------------------------
// //import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LineChartSample2 extends StatefulWidget {
//   const LineChartSample2({super.key});

//   @override
//   State<LineChartSample2> createState() => _LineChartSample2State();
// }

// class _LineChartSample2State extends State<LineChartSample2> {
//   List<Color> gradientColors = [
//     Colors.blue,
//     Colors.purple,
//   ];

//   bool showAvg = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 1.70,
//           child: Padding(
//             padding: const EdgeInsets.only(
//               right: 18,
//               left: 12,
//               top: 24,
//               bottom: 12,
//             ),
//             child: LineChart(
//               showAvg ? avgData() : mainData(),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 60,
//           height: 34,
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 showAvg = !showAvg;
//               });
//             },
//             child: Text(
//               'avg',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

  // Widget bottomTitleWidgets(double value, TitleMeta meta) {
  //    var style = GoogleFonts.getFont("Noto Sans",
  //     fontWeight: FontWeight.bold,
  //     fontSize: 10,
  //     color: Colors.white
  //   );
  //   Widget text;
  //   switch (value.toInt()) {
  //     case 2:
  //       text = Text('الأربعاء', style: GoogleFonts.getFont("Noto Sans Arabic",
  //     fontWeight: FontWeight.bold,
  //     fontSize: 10,
  //     color: Colors.white
  //   ));
  //       break;
  //     case 5:
  //       text = Text('JUN', style: style);
  //       break;
  //     case 8:
  //       text = Text('SEP', style: style);
  //       break;
  //     default:
  //       text = Text('', style: style);
  //       break;
  //   }

  //   return SideTitleWidget(
  //     axisSide: meta.axisSide,
  //     child: text,
  //   );
  // }

//   Widget leftTitleWidgets(double value, TitleMeta meta) {
//     const style = TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 15,
//     );
//     String text;
//     switch (value.toInt()) {
//       case 1:
//         text = '10K';
//         break;
//       case 3:
//         text = '30k';
//         break;
//       case 5:
//         text = '50k';
//         break;
//       default:
//         return Container();
//     }

//     return Text(text, style: style, textAlign: TextAlign.right);
//   }

//   LineChartData mainData() {
//     return LineChartData(
//       // gridData: FlGridData(
//       //   show: true,
//       //   drawVerticalLine: true,
//       //   horizontalInterval: 1,
//       //   verticalInterval: 1,
//       //   getDrawingHorizontalLine: (value) {
//       //     return const FlLine(
//       //       color: Colors.green,
//       //       strokeWidth: 1,
//       //     );
//       //   },
//       //   getDrawingVerticalLine: (value) {
//       //     return const FlLine(
//       //       color: Colors.red,
//       //       strokeWidth: 1,
//       //     );
//       //   },
//       // ),
//       titlesData: FlTitlesData(
//         show: true,
//         leftTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             interval: 1,
//             getTitlesWidget: bottomTitleWidgets,
//           ),
//         ),
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             interval: 1,
//             getTitlesWidget: leftTitleWidgets,
//             reservedSize: 42,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color(0xff37434d)),
//       ),
//       minX: 0,
//       maxX: 11,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: const [
//             FlSpot(0, 3),
//             FlSpot(2.6, 2),
//             FlSpot(4.9, 5),
//             FlSpot(6.8, 3.1),
//             FlSpot(8, 4),
//             FlSpot(9.5, 3),
//             FlSpot(11, 4),
//           ],
//           isCurved: true,
//           gradient: LinearGradient(
//             colors: gradientColors,
//           ),
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: const FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             gradient: LinearGradient(
//               colors: gradientColors
//                   .map((color) => color.withOpacity(0.3))
//                   .toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   LineChartData avgData() {
//     return LineChartData(
//       lineTouchData: const LineTouchData(enabled: false),
//       gridData: FlGridData(
//         show: true,
//         drawHorizontalLine: true,
//         verticalInterval: 1,
//         horizontalInterval: 1,
//         getDrawingVerticalLine: (value) {
//           return const FlLine(
//             color: Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//         getDrawingHorizontalLine: (value) {
//           return const FlLine(
//             color: Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 30,
//             getTitlesWidget: bottomTitleWidgets,
//             interval: 1,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: leftTitleWidgets,
//             reservedSize: 42,
//             interval: 1,
//           ),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: true,
//         border: Border.all(color: const Color(0xff37434d)),
//       ),
//       minX: 0,
//       maxX: 11,
//       minY: 0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: const [
//             FlSpot(0, 3.44),
//             FlSpot(2.6, 3.44),
//             FlSpot(4.9, 3.44),
//             FlSpot(6.8, 3.44),
//             FlSpot(8, 3.44),
//             FlSpot(9.5, 3.44),
//             FlSpot(11, 3.44),
//           ],
//           isCurved: true,
//           gradient: LinearGradient(
//             colors: [
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!,
//               ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                   .lerp(0.2)!,
//             ],
//           ),
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: const FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             gradient: LinearGradient(
//               colors: [
//                 ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                     .lerp(0.2)!
//                     .withOpacity(0.1),
//                 ColorTween(begin: gradientColors[0], end: gradientColors[1])
//                     .lerp(0.2)!
//                     .withOpacity(0.1),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }