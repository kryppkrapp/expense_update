import 'package:flutter/material.dart';
import 'package:sup/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    required this.register,
    required this.setIsRegistered,
    super.key,
  });

  final void Function(User user) register;
  final void Function() setIsRegistered;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _name = "";
  String _totalAmount = "";

  void _setName(String name) {
    setState(() {
      _name = name;
    });
  }

  void _setTotalAmount(String amount) {
    setState(() {
      _totalAmount = amount;
    });
  }

  void _onRegister() {
    final double? enteredAmount = double.tryParse(_totalAmount);
    final bool isValidAmount = enteredAmount == null || enteredAmount <= 0;
    print(_name);
    print(enteredAmount);
    if (_name.trim().isEmpty || isValidAmount) {
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
      widget.register(
        User(name: _name, totalAmount: enteredAmount),
      );
    });
    widget.setIsRegistered();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 64, 64, 64),
        appBar: AppBar(
          title: const Text(
            'Register',
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (name) {
                  _setName(name);
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
                height: 30,
              ),
              TextField(
                onChanged: (amount) {
                  _setTotalAmount(amount);
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
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  _onRegister();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.all(14),
                  shadowColor: Colors.cyanAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
