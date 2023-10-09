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
    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 25:
        text = '٢٥';
        break;
      case 50:
        text = '٥٠';
        break;
      
      case 100:
        text = '١٠٠';
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
            //return CircularProgressIndicator();
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