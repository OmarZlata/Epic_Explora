import 'package:epic_expolre/Views/MainScreens/search_screen.dart';
import 'package:epic_expolre/Views/MainScreens/states_screen.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../Widgets/app_button.dart';
import '../../Widgets/app_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        top: 60,
        right: 16,
        left: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen(),));
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
                        print("Fillter");
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
                  "All  Offers",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    print('offers');
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/images/offers.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Select State",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => StateScreen(),));
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child:
                                        Image.asset('assets/images/Aswan.png'),
                                  ),
                                  Text('Aswan'),
                                ],
                              ),
                              SizedBox(
                                width: 28.5,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child:
                                        Image.asset('assets/images/Aswan.png'),
                                  ),
                                  Text('Aswan'),
                                ],
                              ),
                              SizedBox(
                                width: 28.5,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child:
                                        Image.asset('assets/images/Aswan.png'),
                                  ),
                                  Text('Aswan'),
                                ],
                              ),
                              SizedBox(
                                width: 28.5,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child:
                                        Image.asset('assets/images/Aswan.png'),
                                  ),
                                  Text('Aswan'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Recommendations",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        print('Recommendations');
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
                Container(
                  width: 210,
                  height: 248,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset('assets/images/cards.png'),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
