import 'package:flutter/material.dart';

class AllInfo extends StatelessWidget {
  const AllInfo({
    required this.name,
    required this.totalBalance,
    super.key,
  });

  final String name;
  final double totalBalance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            'Welcome ${name.isEmpty ? "User" : name}',
            style: const TextStyle(
              color: Colors.pinkAccent,
              fontSize: 35,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Balance : ',
                style: TextStyle(
                  color: Colors.lightGreenAccent,
                  fontSize: 20,
                ),
              ),
              Text(
                '\$ $totalBalance',
                style: const TextStyle(
                  color: Colors.lightGreenAccent,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
