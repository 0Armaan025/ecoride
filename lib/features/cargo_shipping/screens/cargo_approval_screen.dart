import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:fl_chart/fl_chart.dart';

class CargoApprovalScreen extends StatefulWidget {
  const CargoApprovalScreen({Key? key}) : super(key: key);

  @override
  State<CargoApprovalScreen> createState() => _CargoApprovalScreenState();
}

class _CargoApprovalScreenState extends State<CargoApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cargo Approval'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            Lottie.asset('assets/lottie/approval_tick.json'),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cargo Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Shipper Email: example@example.com",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Origin: City X",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Destination: City Y",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Cargo Description: XYZ Cargo",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Cargo Weight: 500 lbs",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Professionalism Checked: Yes",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 300,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      axisNameSize: 16,
                      sideTitles: const SideTitles(),
                      drawBelowEverything: true,
                    ),
                    rightTitles: AxisTitles(
                      axisNameSize: 16,
                      sideTitles: const SideTitles(),
                      drawBelowEverything: true,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                  ),
                  minX: 0,
                  maxX: 7,
                  minY: 0,
                  maxY: 6,
                  gridData: FlGridData(
                    show: true,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 1),
                        FlSpot(2, 4),
                        FlSpot(3, 2),
                        FlSpot(4, 5),
                        FlSpot(5, 4),
                        FlSpot(6, 6),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
