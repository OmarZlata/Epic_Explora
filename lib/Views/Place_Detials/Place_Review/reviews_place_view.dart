import 'package:flutter/material.dart';
import '../../../core/app_colors/app_colors.dart';
import '../place_details/detials_place_detials.dart';

class reviewsPlaceDetials extends StatefulWidget {
  const reviewsPlaceDetials({super.key});

  @override
  State<reviewsPlaceDetials> createState() => _reviewsPlaceDetialsState();
}

class _reviewsPlaceDetialsState extends State<reviewsPlaceDetials> {
  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      SizedBox(
                        width: 12,
                      ),
                      Text(
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
            SizedBox(
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
                        borderRadius: BorderRadius.circular(12), // Image border
                        child: Image.asset('assets/images/classic lorem2.png',
                            width: 65, height: 50, fit: BoxFit.cover),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20,),
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
                            ? const Color(0xff2F3C7E) :const Color(0xffE6E6E6)
                        ,
                        onPressed: () {
                          setState(() => changeColor = !changeColor);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const detialsPlaceDetials()));
                        },
                        textColor: changeColor ? Colors.white : Colors.black,
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
                        const  Color(0xffE6E6E6) :Color(0xff2F3C7E),
                        onPressed: () {
                          setState(() => changeColor = !changeColor);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const reviewsPlaceDetials()));
                        },
                        textColor: changeColor ? Colors.black : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        text: 'Reviews',
                      )),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "Review this hotel",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.Black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Test(),
              ],
            ),
            SizedBox(height: 20,),



            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "Write feedback",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.Blue,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 19.0, right: 15),
              child: Container(
                child: TextField(
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(

                      hintText: "Write feedback",
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.yellow,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    "4.5",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.Black,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins"),
                  ),
                ),
                SizedBox(width: 110,),
                Text(
                  "5 stars",
                ),
                SizedBox(width: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/86%.png",
                    width: 131,
                    height: 9,
                    fit: BoxFit.fill,
                  ),
                ),
                Text("86%")

              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/rating.png",
                      width: 84,
                      height: 16,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 70,),
                Text(
                  "4 stars",
                ),
                SizedBox(width: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/60%.png",
                    width: 131,
                    height: 9,
                    fit: BoxFit.fill,
                  ),
                ),
                Text("60%")
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    "36 Reviews",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.gray,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(width: 84,),
                Text(
                  "3 stars",
                ),
                SizedBox(width: 10,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/40%.png",
                    width: 131,
                    height: 9,
                    fit: BoxFit.fill,
                  ),
                ),
                Text("40%")
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180.0),
              child: Row(
                children: [
                  Text(
                    "2 stars",
                  ),
                  SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/40%.png",
                      width: 131,
                      height: 9,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text("40%")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180.0),
              child: Row(
                children: [
                  Text(
                    "1 stars",
                  ),
                  SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/40%.png",
                      width: 131,
                      height: 9,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text("40%")
                ],
              ),
            ),
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: [
                  Text(
                    "All reviews",
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.Black,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: Container(
                        width: 357,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffF9FAFB),
                        ),
                        child:  Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_outline_outlined,size: 35,
                                    color: AppColors.Blue,
                                  ),
                                  Column(
                                    children: [
                                      Text("Ahmed Nasser",style: TextStyle(
                                          fontSize: 13
                                      ),),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          "assets/images/rating.png",
                                          width: 84,
                                          height: 16,
                                          fit: BoxFit.fill,
                                        ),
                                      ),



                                    ],
                                  ),
                                  SizedBox(width: 120,),
                                  Text("December 2022",style: TextStyle(fontSize: 11),)


                                ],
                              ),
                              SizedBox(height: 7,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text("When is the best time to visit your property for the",style: TextStyle(
                                        fontSize: 13
                                    ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  children: [
                                    Text("perfect beach holiday?",style: TextStyle(
                                        fontSize: 13
                                    ),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ),
                    );
                  }),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: 344,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.Blue,
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
      ),
    );
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        size: 70,
        Icons.star_border,
        color: Colors.grey.shade600,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        size: 70,
        Icons.star_half,
        color: color ?? Colors.grey.shade600,
      );
    } else {
      icon = Icon(
        size: 70,
        Icons.star,
        color: color ?? Colors.grey.shade600,
      );
    }
    return InkResponse(
      onTap:
      onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
        List.generate(starCount, (index) => buildStar(context, index)));
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    return StarRating(
      color: Colors.yellow,
      rating: rating,
      onRatingChanged: (rating) => setState(() => this.rating = rating),
    );
  }
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