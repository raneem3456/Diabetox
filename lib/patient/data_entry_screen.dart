import 'package:flutter/material.dart';

class DataEntryScreen extends StatelessWidget {
  const DataEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Record My Data'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Emergency', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // قسم قراءات الجلوكوز
              _buildGlucoseReadings(),
              const SizedBox(height: 24),
              // قسم سجل الوجبات
              _buildMealLog(),
              const SizedBox(height: 24),
              // قسم سجل الحالة المزاجية
              _buildMoodLog(),
              const SizedBox(height: 24),
              // قسم عرض السجل
              _buildViewLog(),
            ],
          ),
        ),
      ),
      // شريط التنقل السفلي
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildGlucoseReadings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Glucose Readings',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter reading',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade100,
            foregroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Connect Device'),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildReadingButton('Before Meal'),
            _buildReadingButton('After Meal'),
            _buildReadingButton('Bedtime'),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Add Reading', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Set Reading Reminder', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  Widget _buildReadingButton(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: Colors.blue),
          ),
          child: Text(label),
        ),
      ),
    );
  }

  Widget _buildMealLog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meal Log',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            hintText: 'Meal Name',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade100,
            foregroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Take Photo'),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMealTypeButton('Breakfast'),
            _buildMealTypeButton('Lunch'),
            _buildMealTypeButton('Dinner'),
            _buildMealTypeButton('Snack'),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Add Meal', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Set Meal Reminder', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  Widget _buildMealTypeButton(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: Colors.blue),
          ),
          child: Text(label),
        ),
      ),
    );
  }

  Widget _buildMoodLog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mood Log',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMoodButton('Happy', '😊'),
            _buildMoodButton('Sad', '😞'),
            _buildMoodButton('Angry', '😡'),
            _buildMoodButton('Anxious', '😨'),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text('Save Mood', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildMoodButton(String label, String emoji) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: Colors.blue),
          ),
          child: Text('$emoji\n$label', textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildViewLog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'View Log',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildLogEntry('Glucose', '10:00 AM', '110 mg/dL', '11:00 AM'),
        _buildLogEntry('Meal', '8:00 AM', 'Oatmeal', '8:00 AM'),
        _buildLogEntry('Mood', '12:00 PM', 'Happy', '12:00 PM'),
        _buildLogEntry('Meal', '1:00 PM', 'Chicken Salad', '1:00 PM'),
      ],
    );
  }

  Widget _buildLogEntry(String label1, String time1, String label2, String time2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label1, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(time1, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label2, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(time2, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
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