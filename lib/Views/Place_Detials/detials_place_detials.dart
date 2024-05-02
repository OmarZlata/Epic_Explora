import 'package:epic_expolre/Views/Place_Detials/reviews_place_detials.dart';
import 'package:flutter/material.dart';
import '../../Widgets/app_home_card.dart';
import '../../core/app_colors/app_colors.dart';
import '../Home/view.dart';

class detialsPlaceDetials extends StatefulWidget {
  const detialsPlaceDetials({super.key});

  @override
  State<detialsPlaceDetials> createState() => _detialsPlaceDetialsState();
}

class _detialsPlaceDetialsState extends State<detialsPlaceDetials> {
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/images/classic lorem.png',
                    height: 356,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 68),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        "Classic Lorem ipsum dolor",
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins"),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        // Image border
                        child: Image.asset('assets/images/classic lorem2.png',
                            width: 65, height: 50, fit: BoxFit.cover),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 300,
              child: Row(
                children: [
                  Expanded(
                      child: CustomButton(
                        fontWeight: changeColor ? FontWeight.w600 : FontWeight.w400,
                        fontSize: 14,
                        text: 'Details',
                        backgroundColor: changeColor
                            ? const Color(0xffE6E6E6) :const Color(0xff2F3C7E)
                        ,
                        onPressed: () {
                          setState(() => changeColor = !changeColor);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const detialsPlaceDetials()));
                        },
                        textColor: changeColor ? Colors.black : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      )),
                  Expanded(
                      child: CustomButton(
                        fontWeight: changeColor ? FontWeight.w400 : FontWeight.w600,
                        fontSize: 14,
                        backgroundColor: changeColor
                            ?
                        const Color(0xff2F3C7E):const Color(0xffE6E6E6),
                        onPressed: () {
                          setState(() => changeColor = !changeColor);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const reviewsPlaceDetials()));
                        },
                        textColor: changeColor ? Colors.white : Colors.black,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        text: 'Reviews',
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  const SizedBox(
                    width: 200,
                  ),
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
                  const SizedBox(
                    width: 40,
                  ),
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  const Text(
                    "Price :    ",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                  const Text(
                    "\$14.4",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.blue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
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
                        fontFamily: "Poppins"),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/rate.png'),
                      const Text("4.5"),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
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
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
                height: 150,
                width: 362,
                child: Image.asset("assets/images/hotel map.png")),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "Classic cheeseburger with beef patty, ",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Text(
                    "pickles, cheese, tomato, onion, lettuce and ",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Text(
                    "ketchup mustard. Classic cheeseburger with",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Text(
                    "beef patty, pickles, cheese, tomato, onion,",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "lettuce and ketchup mustard",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "  Read More.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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

                
              ),
            ),
            const SizedBox(
              height: 23,
            ),
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
                    )),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  void launchCustomUr(BuildContext context, previewLink) {}
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
    this.fontSize,
    this.onPressed,
    this.fontWeight,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 200,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  8,
                ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}