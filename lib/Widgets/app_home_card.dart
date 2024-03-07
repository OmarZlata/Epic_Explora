import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppHomeCard extends StatefulWidget {
  AppHomeCard({super.key});

  @override
  State<AppHomeCard> createState() => _AppHomeCardState();
}

class _AppHomeCardState extends State<AppHomeCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 248,
          width: 210,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.withOpacity(.2))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    child: Image.asset('assets/images/cards.png'),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.topRight,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/fav.png',
                          fit: BoxFit.cover,
                          height: 28,
                          width: 28,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.red,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Classic Lorem ipsum ",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "dolor. ",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.gray.withOpacity(.1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.blue,
                          ),
                          Text(
                            "Alexandria ,Egypt",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "\$14.4",
                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Image.asset('assets/images/rate.png'),
                            Text("4.5",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
