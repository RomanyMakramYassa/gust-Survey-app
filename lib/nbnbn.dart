/*
*
*

import 'package:flutter/material.dart';

class PlantDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100], // لون الخلفية العام
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // ✅ الجزء العلوي: الصورة مع الأيقونات
              Expanded(
                child: Stack(
                  children: [
                    // ✅ صورة النبات
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/OIP (4).jpeg', // استبدلها بمسار الصورة لديك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),


                    Positioned(
                      left: 10,
                      top: 40,
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.wb_sunny, color: Colors.green),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.water_drop, color: Colors.green),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.air, color: Colors.green),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.thermostat, color: Colors.green),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),

                    // ✅ الخطوط البيضاء السفلية
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ✅ الجزء السفلي: المعلومات وزرار الشراء
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ الاسم والسعر
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Angelica',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,


                              ),
                            ),
                            Text(
                              'Russia',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$440',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // ✅ الأزرار
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Description',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



*/