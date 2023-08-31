import 'package:flutter/material.dart';
import 'package:sup/models/user.dart';
import 'package:sup/screens/register/register_screen.dart';
import 'package:sup/widgets/custom_text_icon.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    required this.register,
    super.key,
  });

  final void Function(User user) register;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isRegistered = false;

  void _setIsRegistered() {
    setState(() {
      _isRegistered = true;
    });
  }

  void _openRegisterSreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RegisterScreen(
          register: widget.register,
          setIsRegistered: _setIsRegistered,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Cashed',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          _isRegistered
              ? CustomTextIcon(
                  text: 'Profile',
                  icon: Icons.person_2_rounded,
                  iconColor: Colors.tealAccent,
                  textColor: Colors.tealAccent,
                  textSize: 15,
                  iconSize: 25,
                  onPressed: () {},
                )
              : CustomTextIcon(
                  text: 'Register',
                  icon: Icons.person,
                  iconColor: Colors.redAccent,
                  textColor: Colors.red,
                  textSize: 15,
                  iconSize: 25,
                  onPressed: () {
                    _openRegisterSreen();
                  },
                ),
        ],
      ),
    );
  }
}
