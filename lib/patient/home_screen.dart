import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'app_drawer.dart'; // Import the AppDrawer from the new file

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(), // Correctly use the AppDrawer widget here
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              const SizedBox(height: 24),
              _buildNotificationsSection(),
              const SizedBox(height: 24),
              _buildTodaysHealth(),
              const SizedBox(height: 24),
              _buildGlucoseTrends(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // --- The rest of your code remains the same ---

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                Text(
                  'Sarah',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildNotificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notifications',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildNotificationCard(
                icon: Icons.access_time,
                title: 'Medication Reminder',
                time: '10:30 AM',
                color: Colors.blue.shade100,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildNotificationCard(
                icon: Icons.bloodtype,
                title: 'Glucose Check',
                time: '2:00 PM',
                color: Colors.blue.shade100,
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Emergency', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationCard({required IconData icon, required String title, required String time, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(time, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodaysHealth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Today's Health",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildHealthCard(
          title: 'Glucose',
          value: '110 mg/dL',
          description: 'Last checked at 8:00 AM',
          imagePath: 'assets/images/glucose_meter.png',
        ),
        const SizedBox(height: 16),
        _buildHealthCard(
          title: 'Medication',
          value: 'Metformin 500mg',
          description: 'Next dose at 6:00 PM',
          imagePath: 'assets/images/medication_bottle.png',
        ),
        const SizedBox(height: 16),
        _buildHealthCard(
          title: 'Activity',
          value: '5,200 steps',
          description: 'Goal: 10,000 steps',
          imagePath: 'assets/images/shoes.png',
        ),
      ],
    );
  }

  Widget _buildHealthCard({required String title, required String value, required String description, required String imagePath}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.blue)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(description, style: const TextStyle(color: Colors.black54)),
            ],
          ),
          Image.asset(imagePath, height: 60),
        ],
      ),
    );
  }

  Widget _buildGlucoseTrends() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Glucose Trends',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Weekly'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Monthly', style: TextStyle(color: Colors.black54)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Glucose Levels',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          '110 mg/dL',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        const Text(
          'Last 7 Days +5%',
          style: TextStyle(color: Colors.green),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: _bottomTitles,
                    reservedSize: 32,
                  ),
                ),
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: const Color(0xff37434d), width: 1),
              ),
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: 200,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 120),
                    FlSpot(1, 110),
                    FlSpot(2, 130),
                    FlSpot(3, 115),
                    FlSpot(4, 140),
                    FlSpot(5, 125),
                    FlSpot(6, 110),
                  ],
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.3),
                        Colors.blue.withOpacity(0.0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget _bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Mon', style: style);
        break;
      case 1:
        text = const Text('Tue', style: style);
        break;
      case 2:
        text = const Text('Wed', style: style);
        break;
      case 3:
        text = const Text('Thu', style: style);
        break;
      case 4:
        text = const Text('Fri', style: style);
        break;
      case 5:
        text = const Text('Sat', style: style);
        break;
      case 6:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Data Entry',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Exercises',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Communication',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}