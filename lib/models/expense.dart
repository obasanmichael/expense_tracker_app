import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat('MMM dd, yyyy. EEEE');

const uuid = Uuid();

enum Category {
  food,
  transport,
  grocery,
  leisure,
  work,
  health,
  utilities,
  clothing,
  subscriptions,
  rent,
  entertainment,
  movies
}

class CategoryInfo {
  final String emoji;
  final Color backgroundColor;

  CategoryInfo({required this.emoji, required this.backgroundColor});
}

final categoryData = {
  Category.food: CategoryInfo(emoji: '🍔', backgroundColor: Colors.red),
  Category.transport: CategoryInfo(emoji: '🚗', backgroundColor: Colors.blue),
  Category.grocery: CategoryInfo(emoji: '🛒', backgroundColor: Colors.green),
  Category.leisure: CategoryInfo(emoji: '⛱️', backgroundColor: Colors.orange),
  Category.work: CategoryInfo(emoji: '💼', backgroundColor: Colors.purple),
  Category.health: CategoryInfo(emoji: '💊', backgroundColor: Colors.pink),
  Category.utilities: CategoryInfo(emoji: '💡', backgroundColor: Colors.yellow),
  Category.clothing: CategoryInfo(emoji: '👕', backgroundColor: Colors.teal),
  Category.subscriptions:
      CategoryInfo(emoji: '📦', backgroundColor: Colors.brown),
  Category.rent: CategoryInfo(emoji: '🏠', backgroundColor: Colors.indigo),
  Category.entertainment:
      CategoryInfo(emoji: '🎮', backgroundColor: Colors.deepOrange),
  Category.movies: CategoryInfo(
      emoji: '🎬', backgroundColor: Colors.cyan), // New entry for movies
  // Add more categories as needed
};

class Expense {
  Expense({
    required this.title,
    required this.date,
    this.emoji,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final String? emoji;
  final double amount;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
