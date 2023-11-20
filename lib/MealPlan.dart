import 'package:flutter/material.dart';

class MealPlan extends StatefulWidget {
  const MealPlan({Key? key}) : super(key: key);

  @override
  _MealPlanState createState() => _MealPlanState();
}

class _MealPlanState extends State<MealPlan> {
  String selectedDay = 'Mon'; // Default selected day
  
  Map<String, dynamic> mealData = {
    'photo': 'pancakes.jpg',
    'description': 'Delicious pancakes for breakfast!',
    'ingredients': {
      'Flour': '200g',
      'Milk': '250ml',
      'Egg': '1',
      'Sugar': '2 tbsp',
      'Baking Powder': '1 tsp',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Plan"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildDaySelector(),
            SizedBox(height: 20),
            _buildMealDisplay(),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDaySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildDayButton('Mon'),
        _buildDayButton('Tue'),
        _buildDayButton('Wed'),
        _buildDayButton('Thu'),
        _buildDayButton('Fri'),
        _buildDayButton('Sat'),
        _buildDayButton('Sun'),
      ],
    );
  }

  Widget _buildDayButton(String day) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: selectedDay == day ? Colors.green : Colors.grey,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedDay = day;
        });
      },
      child: Text(day),
    );
  }

  Widget _buildMealDisplay() {
    return Column(
      children: <Widget>[
        Image.asset(
          mealData['photo'],
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(
          mealData['description'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        _buildIngredientList(mealData['ingredients']),
      ],
    );
  }

  Widget _buildIngredientList(Map<String, dynamic> ingredients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            '${entry.key}: ${entry.value}',
            style: TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}
