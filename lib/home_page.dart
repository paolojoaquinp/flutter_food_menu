

import 'package:flutter/material.dart';

import 'components/card_food.dart';
import 'components/draggable_infinite/animations/entry_out_animation.dart';
import 'components/draggable_infinite/draggable_infinite.dart';
import 'constants.dart' as ColorsCustom;
import 'food_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.initialIndex = 0
  });

  final int initialIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FoodMenu> menuItems = FoodMenu.fakeFoodMenuValues;
  late int currentIndex;
  List<Animation<double>> entryAnimations =
    List.filled(4, const AlwaysStoppedAnimation(1));

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCustom.primaryColor,
      body: Column(
      children: [
        _header(context),
        _cardSection(context),
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        backgroundColor: ColorsCustom.primaryColor,
        selectedItemColor: ColorsCustom.primaryColor,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false, 
        showUnselectedLabels: false, 
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/house_icon.png'),
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/bell_icon.png'),
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/user_thin.png'),
              size: 25,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/user_thin.png'),
              size: 25,
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _cardSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.04),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
        child: Hero(
          tag: menuItems[currentIndex].id,
          child: EntryOutTransition(
            entryAnimation: entryAnimations[1],
            entryBeginOffset: const Offset(0, .2),
            child: InfiniteDraggableSlider(
              index: currentIndex,
              itemCount: menuItems.length,
              onTapItem: (index) => print('Tapped item $index'),
              itemBuilder: (_, int index) =>
                  CardFood(menuItem: menuItems[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: size.height * 0.08),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'We have\nSpecial offer',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: -0.5,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                '🔥',
                style: TextStyle(fontSize: 40),
              ),  
            )
          ],
        ));
  }
}
