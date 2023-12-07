import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Login.dart';
import 'Profile.dart';
import 'MealPlan.dart';
import 'Register.dart';
import 'ShoppingList.dart';
 
// function to trigger build when the app is run
void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LogIn(),
      '/register': (context) => const Register(),
      '/homepage': (context) => const Homepage(),      
      '/profile': (context) => const Profile(),
      '/mealPlan': (context) => const MealPlan(),
      '/shoppingList': (context) => ShoppingList(),
    },
  ));
}