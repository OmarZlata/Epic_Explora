import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_colors/app_colors.dart';

class APIAppCard extends StatefulWidget {
  late String cardText;
  late String cardAddress;
  late List? cardimgUrl;

  APIAppCard(
      {Key? key,
      required this.cardText,
      required this.cardAddress,
      required this.cardimgUrl})
      : super(key: key);

  @override
  State<APIAppCard> createState() => _APIAppCardState();
}

class _APIAppCardState extends State<APIAppCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Container(
          child: Center(
            child: Material(
              elevation: 20,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 348,
                height: 148,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(width: 100,height: 130,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("${widget.cardimgUrl![0]}"),fit: BoxFit.fill)) ,

                            ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("${widget.cardText}"),
                                SizedBox(
                                  width: 36,
                                ),
                                InkWell(
                                  child: Image.asset('assets/images/dots.png'),
                                  onTap: () {
                                    print("Delete");
                                  },
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            Text("dolor"),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.blue,
                                ),
                                Text(
                                  "Alexandria ,Egypt",
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.grey),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.blue,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text("\$14.4"),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isFavorite = !isFavorite;
                                        });
                                      },
                                      child: Icon(
                                        isFavorite
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        color: isFavorite
                                            ? Colors.red
                                            : Colors.red,
                                        size: 28,
                                      ),
                                    ),
                                    Text(
                                      "294 Likes",
                                      style: TextStyle(
                                          fontSize: 12, color: AppColors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/rate.png'),
                                    Text("4.5"),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
