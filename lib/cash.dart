import 'package:flutter/material.dart';
import 'package:sup/models/expense.dart';
import 'package:sup/models/user.dart';
import 'package:sup/screens/add_expense/add_expense.dart';
// import 'package:sup/screens/register/register_screen.dart';
import 'package:sup/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:sup/widgets/custom_text_icon.dart';
import 'package:sup/widgets/info/all_info.dart';

class Cash extends StatefulWidget {
  const Cash({super.key});

  @override
  State<Cash> createState() => _CashState();
}

class _CashState extends State<Cash> {
  String _name = "";
  double _totalAmount = 0;
  bool _isRegistered = false;

  List<Expense> _allExpense = <Expense>[];

  void _register(User user) {
    setState(() {
      _name = user.name;
      _totalAmount = user.totalAmount;
      _isRegistered = true;
    });
  }

  void _showRegisterModal() {
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 66, 66, 66),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: context,
      builder: (ctx) => Container(
        margin: const EdgeInsets.all(10),
        // padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please Register!',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 35,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showExpenseScreen() {
    if (!_isRegistered) {
      _showRegisterModal();
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AddExpense(
          addExpense: _addExpense,
          totalBalance: _totalAmount,
        ),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _allExpense.add(expense);
      _totalAmount -= expense.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        floatingActionButton: Container(
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: Colors.lightGreenAccent,
              blurRadius: 3,
              spreadRadius: 10,
              offset: Offset(-2, 0),
            ),
            BoxShadow(
              color: Colors.blueAccent,
              blurRadius: 3,
              spreadRadius: 7,
              offset: Offset(0, 2),
            ),
          ]),
          child: FloatingActionButton(
            onPressed: () {
              _showExpenseScreen();
            },
            tooltip: 'Add Expense',
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.add,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.redAccent,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextIcon(
                text: 'History',
                icon: Icons.history,
                iconColor: Colors.white,
                textColor: Colors.white,
                textSize: 18,
                iconSize: 22,
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 8,
          ),
          child: Column(
            children: [
              CustomAppBar(
                register: _register,
              ),
              const SizedBox(
                height: 20,
              ),
              AllInfo(
                name: _name,
                totalBalance: _totalAmount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
