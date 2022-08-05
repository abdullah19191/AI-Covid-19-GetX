import 'package:flutter/material.dart';

class NavigstionOption extends StatelessWidget {

  late final String title;
  late final bool selected;
  late final Function() onSelected;
  NavigstionOption({required this.title,required this.selected,required this.onSelected });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onSelected();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: selected?  Colors.white : Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          selected?
              Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                  )
                ],
              ) :
              Container()
        ],

      ),
    );
  }
}
