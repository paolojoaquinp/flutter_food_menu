import 'package:flutter/material.dart';

import '../constants.dart';
import '../food_menu.dart';


class CardFood extends StatelessWidget {
  const CardFood({
    required this.menuItem,
    super.key,

  });
  final FoodMenu menuItem;

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 0.7,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: primaryColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20,
                offset: Offset(0, 10)
              )
            ]
          ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.08),
          child: Column(
            children: [
              _imageCard(),
              SizedBox(height: size.height * 0.02,),
              _description()
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageCard() {
    return Expanded(
      flex: 2,
      child: AspectRatio(
          aspectRatio: 1.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(120),
              image: DecorationImage(
                image: AssetImage(menuItem.image),
                fit: BoxFit.cover
              ),
            ),
          ),
        ),
    );
  }


  Widget _description(){
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 3,
            child: Text(
              'Grilled steak\nwith veggie &\npotatoes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('4.5 *', style: const TextStyle(color: Colors.white)),
                  Text('300 kcal', style: const TextStyle(color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}