import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Login.dart';
import 'Profile.dart';
import 'MealPlan.dart';
import 'Register.dart';
import 'ShoppingList.dart';
import 'services/DBconnector.dart';
 
void main() async {
  DatabaseConnector dbConnector = DatabaseConnector();
  await dbConnector.init();
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