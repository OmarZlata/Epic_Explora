import 'package:flutter/material.dart';
import '../../core/app_colors/app_colors.dart';

class HotelDetailsScreen extends StatefulWidget {
  HotelDetailsScreen({Key? key, required this.Address, required this.Price, required this.Rate, });

  final String Address;
  final int Price;
final double Rate;

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffEFEDFF),
                    ),
                    child: const Center(
                      child: Text(
                        "Hotel ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2F3C7E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 200),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.share_outlined,
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.black.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: AppColors.red,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                   Text(
                    "Price :  ",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                   Text(
                    "${widget.Price} EGP",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(width: 70),
                  const Icon(
                    Icons.favorite,
                    color: AppColors.red,
                    size: 24,
                  ),
                  const Text(
                    "294Likes",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(width: 50),
                  Row(
                    children: [
                      Image.asset('assets/images/rate.png'),
                       Text("${widget.Rate}"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Container(
                    width: 150,
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
                          "${widget.Address} ,Egypt",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Container(
              height: 150,
              width: 362,
              child: Image.asset("assets/images/hotel map.png"),
            ),
            const SizedBox(height: 20),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Text(
                        " sss",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Text(
                    "Near By",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Container(
                height: 248,
                width: 450,
                // child: ListView.builder(
                //   itemCount: 9,
                //   scrollDirection: Axis.horizontal,
                //   itemBuilder: (context, index) => AppHomeCard(),
                // ),
              ),
            ),
            const SizedBox(height: 23),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: 344,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Booking Now",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}