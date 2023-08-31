import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { food, work, leisure, travel }

Map<Category, IconData> categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
};

Map<Category, Color> categoryColors = {
  Category.food: Color.fromARGB(255, 252, 1, 1),
  Category.work: Color.fromARGB(255, 0, 94, 255),
  Category.travel: Color.fromARGB(255, 217, 0, 255),
  Category.leisure: Color.fromARGB(255, 0, 255, 132),
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = const Uuid().v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }

  String get formattedTime {
    return DateFormat.jm().format(date);
  }
}
