import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Views/Place_Detials/detials_place_detials.dart';
import '../core/app_colors/app_colors.dart';
import 'RandomNUM.dart';

class APIAppCard extends StatefulWidget {
  final String cardText;
  final String cardAddress;
  final List cardimgUrl;
  final int cardid;

  APIAppCard({
    Key? key,
    required this.cardText,
    required this.cardAddress,
    required this.cardimgUrl,
    required this.cardid,
  }) : super(key: key);

  @override
  State<APIAppCard> createState() => _APIAppCardState();
}

class _APIAppCardState extends State<APIAppCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => detialsPlaceDetials(id: widget.cardid),
                  ));
            },
            child: Container(
              child: Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
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
                                  Flexible(
                                    child: Container(
                                      width: 100,
                                      height: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
                                        child: Image.network(
                                          widget.cardimgUrl[0],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          widget.cardText,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
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
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: AppColors.blue,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "${widget.cardAddress}, Egypt",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.grey,
                                          ),
                                        ),
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
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.favorite,

                                            color: Colors.red,
                                            size: 28,
                                          ),
                                          Text(
                                            "${getRandomNumber()}",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.grey,
                                            ),
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
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
