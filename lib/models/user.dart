import 'package:uuid/uuid.dart';

class User {
  User({
    required this.name,
    required this.totalAmount,
  }) : id = const Uuid().v4();

  final String id;
  final String name;
  final double totalAmount;
}
