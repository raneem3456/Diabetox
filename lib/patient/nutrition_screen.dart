import 'package:flutter/material.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // شريط البحث
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search recipes',
                  icon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // أزرار فلترة الوجبات
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildMealFilterButton('Breakfast', true),
                  _buildMealFilterButton('Lunch', false),
                  _buildMealFilterButton('Dinner', false),
                  _buildMealFilterButton('Snacks', false),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // قسم الوصفات الموصى بها من الطبيب
            const Text(
              'Doctor\'s Recommendations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildRecipeCard(
              context,
              title: 'Mediterranean Quinoa Salad',
              description: 'A refreshing and nutritious salad packed with flavor and healthy fats.',
              imagePath: 'assets/images/mediterranean_quinoa_salad.png', // Replace with your image asset
              insulinDose: '2-3 units',
              isRecommended: true,
            ),
            const SizedBox(height: 16),
            _buildRecipeCard(
              context,
              title: 'Baked Salmon with Lemon and Herbs',
              description: 'A simple and delicious way to enjoy heart-healthy salmon.',
              imagePath: 'assets/images/baked_salmon.png', // Replace with your image asset
              insulinDose: '1-2 units',
              isRecommended: true,
            ),
            const SizedBox(height: 24),

            // قائمة الوصفات العامة
            const Text(
              'Diabetes-Friendly Recipes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildRecipeCard(
              context,
              title: 'Chicken and Vegetable Stir-Fry',
              description: 'A quick and easy stir-fry with lean protein and plenty of vegetables.',
              imagePath: 'assets/images/chicken_stir_fry.png', // Replace with your image asset
              insulinDose: '3 units',
            ),
            const SizedBox(height: 16),
            _buildRecipeCard(
              context,
              title: 'Lentil Soup',
              description: 'A hearty and comforting soup that\'s high in fiber and protein.',
              imagePath: 'assets/images/lentil_soup.png', // Replace with your image asset
              insulinDose: '1 unit',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMealFilterButton(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(text),
        backgroundColor: isSelected ? Colors.blue : Colors.grey.shade200,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildRecipeCard(
      BuildContext context, {
        required String title,
        required String description,
        required String imagePath,
        required String insulinDose,
        bool isRecommended = false,
      }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description),
                  const SizedBox(height: 8),
                  if (isRecommended)
                    const Text(
                      'Doctor-Recommended ✅',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    'Insulin Dose: $insulinDose',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}