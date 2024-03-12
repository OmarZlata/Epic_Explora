import 'package:dotted_border/dotted_border.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_card.dart';
import 'package:epic_expolre/Widgets/app_tileWithButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Widgets/PhoneNumTextField.dart';
import '../../../Widgets/app_text.dart';
import '../../../core/app_colors/app_colors.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

int _index = 0;
bool isAppWalletSelected = true;
bool isEWalletSelected= false;
bool isCCSelected= false;


class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: 'Booking Details'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stepper(
          margin: EdgeInsets.zero,
          connectorThickness: 2,
          controlsBuilder: (context, controller) {
            return const SizedBox.shrink();
          },
          elevation: 0.1,
          type: StepperType.horizontal,
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index <= 0) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {

            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              

              title: const SizedBox.shrink(),
              label: Text(
                "Booking",
                style: TextStyle(
                    fontSize: 11,
                    color: _index == 0 ? const Color(0xff2F3C7E) : Colors.grey),
              ),
              state: _index >= 0 ? StepState.complete : StepState.indexed,
              isActive: _index >= 0,

              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 384,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.light_blue),
                      borderRadius: BorderRadius.circular(18),
                      color: AppColors.white.withOpacity(0.05),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/images/trip photo.png",
                                    width: 120,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Classic Lorem ipsum dolor ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.light_blue,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Divider(
                            color: AppColors.light_blue,
                            thickness: 1.5,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Check in",
                                    color: AppColors.blue,
                                  ),
                                  AppText(
                                    title: "Sat 9 Oct 2022",
                                    color: AppColors.gray,
                                  )
                                ],
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Expanded(
                                  child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.light_blue),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.moon,
                                      color: AppColors.blue,
                                      size: 15,
                                    ),
                                    AppText(
                                      title: "13 nights",
                                      fontSize: 12,
                                      color: AppColors.gray,
                                    )
                                  ],
                                ),
                              )),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Check out",
                                    color: AppColors.blue,
                                  ),
                                  AppText(
                                    title: "Sat 18 Oct 2022",
                                    color: AppColors.gray,
                                  )
                                ],
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 384,
                    height: 66,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.light_blue),
                      borderRadius: BorderRadius.circular(18),
                      color: AppColors.white.withOpacity(0.05),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "Price",
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            children: [
                              Text(
                                "10000 LE",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              AppText(
                                title: "8000",
                                color: AppColors.yellow,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const ArrivalTrip()));
                      },
                      child: InkWell(
                        onTap: () {
                          if (_index <= 1) {
                            setState(() {
                              _index += 1;
                            });
                          }
                        },
                        child: Container(
                          width: 344,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.blue,
                          ),
                          child: const Center(
                              child: Text(
                            "Confirm",
                            style: TextStyle(color: AppColors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              title: const SizedBox.shrink(),
              label: Text(
                "User Details",
                style: TextStyle(
                    fontSize: 11,
                    color: _index == 1 ? const Color(0xff2F3C7E) : Colors.grey),
              ),
              state: _index >= 1 ? StepState.complete : StepState.indexed,
              isActive: _index >= 1,
              content: Container(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "Full name ",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 47,
                          width: 344,
                          child: const TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: Icon(CupertinoIcons.person),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Colors.black26),
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
                        AppText(
                          title: "Phone Number ",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PhoneNumberTextField(),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "ID Number ",
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 47,
                          width: 344,
                          child: const TextField(
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: "ID Number",
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Colors.black26),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 230,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          //Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const ArrivalTrip()));
                        },
                        child: InkWell(
                          onTap: () {
                            if (_index <= 1) {
                              setState(() {
                                _index += 1;
                              });
                            }
                          },
                          child: Container(
                            width: 344,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.blue,
                            ),
                            child: const Center(
                                child: Text(
                              "Confirm",
                              style: TextStyle(color: AppColors.white),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Step(
              state: _index >= 2 ? StepState.complete : StepState.indexed,
              isActive: _index == 2,
              title: const SizedBox.shrink(),
              label: Text(
                "Payment",
                style: TextStyle(
                    fontSize: 11,
                    color: _index == 2 ? const Color(0xff2F3C7E) : Colors.grey),
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 384,
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.light_blue),
                      borderRadius: BorderRadius.circular(18),
                      color: AppColors.white.withOpacity(0.05),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/images/trip photo.png",
                                    width: 120,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Classic Lorem ipsum dolor ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.light_blue,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Divider(
                            color: AppColors.light_blue,
                            thickness: 1.5,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Check in",
                                    color: AppColors.blue,
                                  ),
                                  AppText(
                                    title: "Sat 9 Oct 2022",
                                    color: AppColors.gray,
                                  )
                                ],
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Expanded(
                                  child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.light_blue),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.moon,
                                      color: AppColors.blue,
                                      size: 15,
                                    ),
                                    AppText(
                                      title: "13 nights",
                                      fontSize: 12,
                                      color: AppColors.gray,
                                    )
                                  ],
                                ),
                              )),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    title: "Check out",
                                    color: AppColors.blue,
                                  ),
                                  AppText(
                                    title: "Sat 18 Oct 2022",
                                    color: AppColors.gray,
                                  )
                                ],
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 384,
                    height: 66,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.light_blue),
                      borderRadius: BorderRadius.circular(18),
                      color: AppColors.white.withOpacity(0.05),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title: "Price",
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            children: [
                              Text(
                                "10000 LE",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              AppText(
                                title: "8000",
                                color: AppColors.yellow,
                                fontWeight: FontWeight.bold,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  AppTileWithButton(
                    iconData: Icons.account_balance_wallet_outlined,
                    title: "App Wallet",
                    isSelected: isAppWalletSelected,
                    onSelect: (isSelected) {
                      setState(() {
                        isAppWalletSelected = isSelected;
                        isCCSelected = !isSelected;
                        isEWalletSelected = !isSelected;
                      });
                    },
                  ),
                  SizedBox(height: 16,),
                  AppTileWithButton(
                    iconData: Icons.wallet,
                    title: "E - Wallet",
                    isSelected: isEWalletSelected,
                    onSelect: (isSelected) {
                      setState(() {
                        isEWalletSelected = isSelected;
                        isAppWalletSelected= !isSelected;
                        isCCSelected = !isSelected;
                      });
                    },
                  ),
                  SizedBox(height: 16,),
                  AppTileWithButton(
                    iconData: FontAwesomeIcons.creditCard,
                    title: "Credit Card",
                    isSelected: isCCSelected,
                    onSelect: (isSelected) {
                      setState(() {
                        isCCSelected = isSelected;
                        isEWalletSelected = !isSelected;
                        isAppWalletSelected= !isSelected;
                      });
                    },
                  ),
                  SizedBox(height: 40,),
                  Center(
                    child: InkWell(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const ArrivalTrip()));
                      },
                      child: InkWell(
                        onTap: () {
                          if (_index <= 1) {
                            setState(() {
                              _index += 1;
                            });
                          }
                        },
                        child: Container(
                          width: 344,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.blue,
                          ),
                          child: const Center(
                              child: Text(
                            "Pay - 100 LE",
                            style: TextStyle(color: AppColors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
