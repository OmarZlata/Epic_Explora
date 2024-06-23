import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Views/Place_Detials/detials_place_detials.dart';

class AppHomeCard extends StatefulWidget {
  final String cardText;
  final String cardAddress;
  final List cardimgUrl;
  final int cardid;

  AppHomeCard({
    Key? key,
    required this.cardText,
    required this.cardAddress,
    required this.cardimgUrl,
    required this.cardid,
  }) : super(key: key);

  @override
  State<AppHomeCard> createState() => _AppHomeCardState();
}

class _AppHomeCardState extends State<AppHomeCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    print("Card Text: ${widget.cardText}");
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detialsPlaceDetials(id: widget.cardid),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            height: 248.h,
            width: 210.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.withOpacity(.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        child: Image.network(
                          widget.cardimgUrl[0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ],
                  ),
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
                        widget.cardText,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.blue,
                            ),
                            Text(
                              widget.cardAddress,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            "\$14.4",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Image.asset('assets/images/rate.png'),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
