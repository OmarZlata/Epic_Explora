
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Views/Place_Detials/place_details/repo.dart';
import 'package:graduation_project/Views/Place_Detials/place_details/state.dart';
import '../../../Widgets/app_home_card.dart';
import '../../../core/app_colors/app_colors.dart';
import '../reviews_place_dwtials.dart';
import 'cubit.dart';
import 'details_model.dart';

class detialsPlaceDetials extends StatefulWidget {
  const detialsPlaceDetials({super.key});

  @override
  State<detialsPlaceDetials> createState() => _detialsPlaceDetialsState();
}

class _detialsPlaceDetialsState extends State<detialsPlaceDetials> {
  bool changeColor = false;
  final DataRepository dataRepository = DataRepository();

  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DataCubit(dataRepository),
        child: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (state is DataLoaded) {
              Place place = state.place;
              List<String>? imageUrls = place.data?.placeById?.imgUrl;
              if (imageUrls != null && imageUrls.isNotEmpty) {
              }

              String firstImageUrl = imageUrls![0];
              return ListView(children: [
                Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          child: Image.network(
                            firstImageUrl,
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
                              // Text(
                              //   state.place.name,
                              //   style: TextStyle(
                              //       fontSize: 18,
                              //       color: AppColors.white,
                              //       fontWeight: FontWeight.w600,
                              //       fontFamily: "Poppins"),
                              // )
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                // Image border
                                child: Image.network(
                                  firstImageUrl,
                                    width: 65,
                                    height: 50,
                                    fit: BoxFit.cover),
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
                            fontWeight:
                                changeColor ? FontWeight.w600 : FontWeight.w400,
                            fontSize: 14,
                            text: 'Details',
                            backgroundColor: changeColor
                                ? const Color(0xffE6E6E6)
                                : const Color(0xff2F3C7E),
                            onPressed: () {
                              setState(() => changeColor = !changeColor);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const detialsPlaceDetials()));
                            },
                            textColor:
                                changeColor ? Colors.black : Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          )),
                          Expanded(
                              child: CustomButton(
                            fontWeight:
                                changeColor ? FontWeight.w400 : FontWeight.w600,
                            fontSize: 14,
                            backgroundColor: changeColor
                                ? const Color(0xff2F3C7E)
                                : const Color(0xffE6E6E6),
                            onPressed: () {
                              setState(() => changeColor = !changeColor);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const reviewsPlaceDetials()));
                            },
                            textColor:
                                changeColor ? Colors.white : Colors.black,
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
                                color: AppColors.Black.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.share_outlined,
                              color: AppColors.Black,
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
                                color: AppColors.Black.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              color: AppColors.Red,
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
                                color: AppColors.Black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins"),
                          ),
                          const Text(
                            "\$14.4",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColors.Blue,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins"),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: AppColors.Red,
                            size: 24,
                          ),
                          const Text(
                            "294Likes",
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.gray,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins"),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/rate.png'),
                              //    Text(state.place.averageRating as String),
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
                                color: AppColors.gray.withOpacity(.1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.Blue,
                                ),
                                Text(
                                  '${state.place.data!.placeById!.address}',
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
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Text(
                            '${state.place.data!.placeById!.description}',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.gray,
                              fontWeight: FontWeight.w400,
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
                              color: AppColors.Black,
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
                        child: ListView.builder(
                          itemCount: 9,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => AppHomeCard(),
                        ),
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
              ]);
            } else if (state is DataError) {
              return Center(
                child: Text('Error: ${state.errorMessage}'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

Widget _buildDetailsScreen(Place place) {
  return ListView(
    children: [
      ListTile(
        title: Text('Name: ${place.data!.placeById!.name}'),
      ),
      ListTile(
        title: Text('Description: ${place.data!.placeById!.description}'),
      ),
      ListTile(
        title: Text('Address: ${place.data!.placeById!.address}'),
      ),
      // Add more ListTile widgets to display other details as needed
    ],
  );
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
