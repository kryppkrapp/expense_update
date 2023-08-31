import 'package:flutter/material.dart';
import 'package:sup/models/expense.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({
    required this.addExpense,
    required this.totalBalance,
    super.key,
  });

  final void Function(Expense expense) addExpense;
  final double totalBalance;

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String _task = "";
  String _amount = "";
  Category _selectedCategory = Category.food;

  void _setTask(String task) {
    setState(() {
      _task = task;
    });
  }

  void _setAmount(String amount) {
    setState(() {
      _amount = amount;
    });
  }

  void _onAddTask() {
    final double? enteredAmount = double.tryParse(_amount);
    final bool isValidAmount = enteredAmount == null || enteredAmount <= 0;

    if (widget.totalBalance <= 0 || (enteredAmount! > widget.totalBalance)) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 64, 64, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Insufficient Balance',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 23,
            ),
          ),
          content: const Text(
            'Please add funds!',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 20,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                'Okay',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }

    if (_task.trim().isEmpty || isValidAmount) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: const Color.fromARGB(255, 64, 64, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Invalid Inputs',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 23,
            ),
          ),
          content: const Text(
            'Please provide valid Name and Total Amount',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 20,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text(
                'Okay',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      widget.addExpense(
        Expense(
            title: _task,
            amount: enteredAmount,
            date: DateTime.now(),
            category: _selectedCategory),
      );
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        appBar: AppBar(
          title: Text('Add Expense'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Add Expense',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  TextField(
                    onChanged: (String item) {
                      _setTask(item);
                    },
                    style: const TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 20,
                    ),
                    maxLength: 50,
                    decoration: InputDecoration(
                      label: const Text('Name'),
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 25,
                      ),
                      helperStyle: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 18,
                      ),
                      prefixIconColor: Colors.tealAccent,
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (amount) {
                      _setAmount(amount);
                    },
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                      label: const Text('Total Amount'),
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        size: 25,
                      ),
                      helperStyle: const TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 18,
                      ),
                      prefixIconColor: Colors.tealAccent,
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          categoryIcons[_selectedCategory],
                          color: categoryColors[_selectedCategory],
                          size: 26,
                        ),
                        DropdownButton(
                          iconEnabledColor: categoryColors[_selectedCategory],
                          iconSize: 35,
                          dropdownColor: categoryColors[_selectedCategory],
                          borderRadius: BorderRadius.circular(15),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          value: _selectedCategory,
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _onAddTask();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Add Task',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
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
