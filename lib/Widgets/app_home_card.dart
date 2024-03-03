import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppHomeCard extends StatelessWidget {
  const AppHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 248,
          width: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.withOpacity(.2)
            )
          ),
          child: Stack(
            children: [
              ClipRRect(
                child: Image.asset('assets/images/cards.png'),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15,),
      ],
    );
  }
}
