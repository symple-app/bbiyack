import 'package:flutter/material.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const SignUpAppBar({
    super.key,
    this.height = 60,
    this.title = '',
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_rounded,
          size: 24,
          color: Colors.black,
        ),
      ),
    );
  }
}
