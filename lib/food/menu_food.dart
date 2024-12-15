import 'package:flutter/material.dart';
import 'food_detail.dart';

class FoodMenuPage extends StatelessWidget {
  final String username;
  final String? nickname;

  FoodMenuPage({Key? key, required this.username, this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Selamat Datang! $username",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    if (nickname != null)
                      Text(
                        "Panggilan saya $nickname",
                        style: TextStyle(fontSize: 18),
                      ),
                    SizedBox(height: 10),
                    Text("Ini adalah Halaman Utama."),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: foodMenuList.map((food) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset(
                        food.imageAsset,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(food.name),
                      subtitle: Text(food.category),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailPage(food: food),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Log Out"),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class FoodMenu {
  String name;
  String category;
  String description;
  String ingredients;
  String cookingTime;
  String price;
  String imageAsset;
  List<String> imageUrls;

  FoodMenu({
    required this.name,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.cookingTime,
    required this.price,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var foodMenuList = [
  FoodMenu(
    name: 'Es Campur',
    category: 'Dessert',
    description:
        'Es campur segar dengan campuran buah-buahan, cincau, agar-agar, dan santan.',
    ingredients:
        'Buah-buahan, cincau, agar-agar, susu kental manis, sirup, es batu',
    cookingTime: '10 minutes',
    price: 'Rp 12000',
    imageAsset: 'images/escampur.jpg',
    imageUrls: [
      'https://www.resepmakansedap.com/images/es-campur.jpg',
      'https://www.example.com/escampur.jpg',
    ],
  ),
  FoodMenu(
    name: 'Martabak Manis',
    category: 'Dessert',
    description:
        'Martabak manis dengan berbagai topping seperti coklat, keju, dan kacang.',
    ingredients:
        'Tepung terigu, gula, telur, mentega, susu, coklat, keju, kacang',
    cookingTime: '25 minutes',
    price: 'Rp 30000',
    imageAsset: 'images/martabakmanis.jpg',
    imageUrls: [
      'https://www.resepmakansedap.com/images/martabak-manis.jpg',
      'https://www.example.com/martabakmanis.jpg',
    ],
  ),
  FoodMenu(
    name: 'Klepon',
    category: 'Dessert',
    description:
        'Kue tradisional berbentuk bulat berisi gula merah cair dan dibalut kelapa parut.',
    ingredients: 'Tepung ketan, gula merah, kelapa parut, pandan',
    cookingTime: '15 minutes',
    price: 'Rp 5000',
    imageAsset: 'images/klepon.jpg',
    imageUrls: [
      'https://www.resepmakansedap.com/images/klepon.jpg',
      'https://www.example.com/klepon.jpg',
    ],
  ),
];
