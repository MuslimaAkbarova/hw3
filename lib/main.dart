import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Login.dart';
import 'Profile.dart';
import 'MealPlan.dart';
import 'ShoppingList.dart';
 
// function to trigger build when the app is run
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const LogIn(),
      '/homepage': (context) => const Homepage(),      
      '/profile': (context) => const Profile(),
      '/mealPlan': (context) => const MealPlan(),
      '/shoppingList': (context) => ShoppingList(),
    },
  ));
}