import 'package:flutter/material.dart';
import 'package:namaagp/ExplorePage/categoryChart/viewModelCategoryChart.dart';
import 'package:pie_chart/pie_chart.dart';

class ViewCategoryChart extends StatelessWidget {
  const ViewCategoryChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Map<String, double>> dataMapFuture;

  @override
  void initState() {
    super.initState();
    dataMapFuture = getDataMap();
  }

  Future<Map<String, double>> getDataMap() async {
    return {
      "أكل": await ViewModelMoneyTimeChart.calculateFoodPercentage(),
      "ملابس": await ViewModelMoneyTimeChart.calculateClothesPercentage(),
      "أدوية": await ViewModelMoneyTimeChart.calculateMedicinePercentage(),
      "كتب": await ViewModelMoneyTimeChart.calculateBooksPercentage(),
      "أجهزة": await ViewModelMoneyTimeChart.calculateDevicesPercentage(),
    };
  }

  // Colors for each segment
  // of the pie chart
  List<Color> colorList = [
    const Color(0xffD95AF3), 
    const Color(0xff3EE094), 
    const Color(0xff3398F6), 
    const Color(0xffFA4A42), 
    const Color(0xffFE9539) 
  ];

  // List of gradients for the
  // background of the pie chart
  final gradientList = <List<Color>>[ 
    [ 
      Color.fromRGBO(223, 250, 92, 1), 
      Color.fromRGBO(129, 250, 112, 1), 
    ], 
    [ 
      Color.fromRGBO(129, 182, 205, 1), 
      Color.fromRGBO(91, 253, 199, 1), 
    ], 
    [ 
      Color.fromRGBO(175, 63, 62, 1.0), 
      Color.fromRGBO(254, 154, 92, 1), 
    ] 
  ]; 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, double>>(
      future: dataMapFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the data
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle any error that occurred while fetching the data
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          // Data has been successfully fetched
          final dataMap = snapshot.data!;
          return Scaffold(
            backgroundColor: Colors.transparent, // Remove the background color
            appBar: AppBar(
              backgroundColor: Color.fromARGB(0, 230, 227, 227), // Remove the app bar background color
              elevation: 0, // Remove the app bar elevation
              title: null, // Remove the app bar title
              centerTitle: true,
            ),
            body: Container(
              alignment: Alignment.topCenter, 
              
              child: PieChart(
                
                // Pass in the data for the pie chart\
                dataMap: dataMap,
                // Set the colors for the pie chart segments
                colorList: colorList,
                // Set the radius of the pie chart
                chartRadius: MediaQuery.of(context).size.width /15,
                
                // Set the center text of the pie chart
                // centerText: "Budget",
                // Set the width of the ring around the pie chart
                ringStrokeWidth: 0,
                // Set the animation duration of the pie chart
                animationDuration: const Duration(seconds: 3),
                // Set the options for the chart values (e.g. show percentages, etc.)
                chartValuesOptions: const ChartValuesOptions(
                  showChartValues: true,
                  showChartValuesOutside: true,
                  showChartValuesInPercentage: true,
                  showChartValueBackground: false,
                ),
                // Set the options for the legend of the pie chart
                legendOptions: const LegendOptions(
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(fontSize: 10),
                  legendPosition: LegendPosition.right,
                  showLegendsInRow: false,
                ),
                // Set the list of gradients for the background of the pie chart
                gradientList: gradientList,
              ),
            ),
          );
        }
      },
    );
  }
}