import 'package:epic_expolre/Views/MainScreens/search_screen.dart';
import 'package:epic_expolre/Views/MainScreens/states_screen.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/app_home_card.dart';
import '../../Widgets/app_text_field.dart';
import '../../Widgets/bottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Slider(
                value: 250,
                onChanged: (value) {
                  setState(() {

                  });
                },
                max: 500,
                min: 10,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                          color: AppColors.Blue,
                        ),
                        Text(
                          "Alexandria ,Egypt",
                          style: TextStyle(fontSize: 12, color: AppColors.gray),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.Blue,
                        ),
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
                      color: AppColors.Blue,
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
                        color: AppColors.Blue),
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
                        color: AppColors.Blue),
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
                        color: AppColors.Blue),
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
      ),
    );
  }
}
