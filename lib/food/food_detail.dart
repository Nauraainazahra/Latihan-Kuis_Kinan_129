import 'package:flutter/material.dart';
import 'menu_food.dart';

class FoodDetailPage extends StatelessWidget {
  final FoodMenu food;

  const FoodDetailPage({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(food.imageAsset),
            SizedBox(height: 16),
            Text(
              food.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              food.category,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text('Ingredients: ${food.ingredients}'),
            SizedBox(height: 8),
            Text('Cooking Time: ${food.cookingTime}'),
            SizedBox(height: 8),
            Text('Price: ${food.price}'),
          ],
        ),
      ),
    );
  }
}
