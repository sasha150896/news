import 'package:flutter/material.dart';
import 'dart:core';
import 'package:news/helpers/const_helper.dart';

class DrawerMenu extends StatefulWidget {
  final Function onTap;
  final int index;

  const DrawerMenu({required this.onTap, required this.index, Key? key})
      : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  bool activeElement(String element) {
    return ConstHelper.cities.keys.toList()[widget.index] == element;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    ConstHelper.appBarTitle,
                    style: ConstHelper.appBarTextStyle,
                  ),
                  Text(
                    ConstHelper.drawerHeaderMessage,
                    style: ConstHelper.drawerNormalStyle,
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ConstHelper.cities.keys
                      .map(
                        (element) => Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          color: activeElement(element)
                              ? Colors.black
                              : Colors.white,
                          child: InkWell(
                            onTap: () {
                              widget.onTap(element);
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text(
                                ConstHelper.cities[element],
                                style: activeElement(element)
                                    ? ConstHelper.drawerActiveStyle
                                    : ConstHelper.drawerNormalStyle,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
