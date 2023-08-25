import 'package:flutter/material.dart';
import 'package:sloth/src/kdatas/constants.dart';

@immutable
class BurgerMenu extends StatefulWidget {
  const BurgerMenu({Key? key}) : super(key: key);

  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: IconButton(
          onPressed: (){Scaffold.of(context).openDrawer();},
          icon: const Icon(Icons.menu_rounded, color: kColorGreen, size:32,)
      )
    );
  }
}
