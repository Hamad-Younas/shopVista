import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import './products.dart';
import './users.dart';
import './profile.dart';
import './orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home Page'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Doughnut Graphs in two lines with spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Doughnut Graph 1
                  Expanded(
                    child: DoughnutGraph(
                      title: 'Users',
                      data: [
                        PieChartSectionData(
                          color: Colors.blue,
                          value: 40,
                          title: '40%',
                        ),
                        PieChartSectionData(
                          color: Colors.orange,
                          value: 60,
                          title: '60%',
                        ),
                      ],
                    ),
                  ),

                  // Doughnut Graph 2
                  Expanded(
                    child: DoughnutGraph(
                      title: 'Products',
                      data: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: 70,
                          title: '70%',
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: 30,
                          title: '30%',
                        ),
                      ],
                    ),
                  ),

                  // Doughnut Graph 3
                  Expanded(
                    child: DoughnutGraph(
                      title: 'Sold',
                      data: [
                        PieChartSectionData(
                          color: Colors.purple,
                          value: 20,
                          title: '20%',
                        ),
                        PieChartSectionData(
                          color: Colors.yellow,
                          value: 80,
                          title: '80%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.0), // Add spacing between the rows

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Doughnut Graph 4
                  Expanded(
                    child: DoughnutGraph(
                      title: 'Revenue',
                      data: [
                        PieChartSectionData(
                          color: Colors.blue,
                          value: 30,
                          title: '30%',
                        ),
                        PieChartSectionData(
                          color: Colors.orange,
                          value: 70,
                          title: '70%',
                        ),
                      ],
                    ),
                  ),

                  // Doughnut Graph 5
                  Expanded(
                    child: DoughnutGraph(
                      title: 'Graph 5',
                      data: [
                        PieChartSectionData(
                          color: Colors.green,
                          value: 50,
                          title: '50%',
                        ),
                        PieChartSectionData(
                          color: Colors.red,
                          value: 50,
                          title: '50%',
                        ),
                      ],
                    ),
                  ),

                  // Doughnut Graph 6
                  Expanded(
                    child: DoughnutGraph(
                      title: 'Graph 6',
                      data: [
                        PieChartSectionData(
                          color: Colors.purple,
                          value: 10,
                          title: '10%',
                        ),
                        PieChartSectionData(
                          color: Colors.yellow,
                          value: 90,
                          title: '90%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation item taps
          if (index == 1) {
            // Navigate to the Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Productpage()),
            );
          }
          if (index == 2) {
            // Navigate to the Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UsersPage()),
            );
          }
          if (index == 3) {
            // Navigate to the Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrdersPage()),
            );
          }
          if (index == 4) {
            // Navigate to the Cart screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}

class DoughnutGraph extends StatelessWidget {
  final String title;
  final List<PieChartSectionData> data;

  DoughnutGraph({required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        AspectRatio(
          aspectRatio: 1.0,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 30,
              startDegreeOffset: 180,
              sections: data,
            ),
          ),
        ),
      ],
    );
  }
}
