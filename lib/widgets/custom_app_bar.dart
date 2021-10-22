import 'package:flutter/material.dart';
import 'package:news/helpers/const_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final VoidCallback onTap;
  const CustomAppBar({Key? key, required this.onTap}) :preferredSize = const Size.fromHeight(60.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        ConstHelper.appBarTitle,
        style: ConstHelper.appBarTextStyle,
      ),
      leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      actions: [
        IconButton(
          onPressed: onTap,
          icon: const Icon(Icons.repeat, color: Colors.black, size: 30),
        )
      ],
    );
  }
}