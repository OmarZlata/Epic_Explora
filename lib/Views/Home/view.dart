
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Widgets/app_home_card.dart';
import '../../../Widgets/ranged_slider_app.dart';
import '../../../core/app_colors/app_colors.dart';

import '../MainScreens/search_screen.dart';
import '../MainScreens/states_screen.dart';
import 'cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: SliderScreen(),
        ),
      );
    },
  );
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCurrentLocation(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            final cubit = BlocProvider.of<HomeCubit>(context);
            if (state is HomeLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.blue,
                ),
              );
            }
            final location = cubit.location;
            if (location == null) {
              return Center(child: Text('Something went wrong!'));
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 14 ),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/profile.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            "Hi,Mohammed Hassan",
                            style: TextStyle(fontSize: 12),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.blue,
                              ),
                              Text(location.district+" ,"+location.country),

                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        child: Image.asset('assets/images/Notification-icon.png'),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: 285,
                          height: 60,
                          child: TextFormField(
                            onFieldSubmitted: (value) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchScreen(),
                              ));
                            },
                            maxLines: 1,
                            decoration: InputDecoration(
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            child: Image.asset('assets/images/filters-2.png'),
                            onTap: () {
                              _showBottomSheet(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Offers",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          print('offers');
                        },
                        child: Center(
                          child: Image.asset(
                            'assets/images/offers.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Select State",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StateScreen(),
                          ));
                        },
                        child: Text(
                          "See more",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemCount: 9,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset('assets/images/Aswan.png'),
                              ),
                              Text("Aswan"),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "Recommendations",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print("Recommendations");
                        },
                        child: Text(
                          "See more",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 248,
                    width: 210,
                    child: ListView.builder(
                        itemCount: 9,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.hardEdge,
                        itemBuilder: (context, index) => AppHomeCard()),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "popular",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print("popular");
                        },
                        child: Text(
                          "See more",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 248,
                    width: 210,
                    child: ListView.builder(
                      itemCount: 9,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => AppHomeCard(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}