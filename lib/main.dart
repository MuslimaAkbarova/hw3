// import 'dart:io';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Login.dart';
import 'Profile.dart';
import 'MealPlan.dart';
import 'Register.dart';
import 'ShoppingList.dart';
 
void main() {
  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;
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