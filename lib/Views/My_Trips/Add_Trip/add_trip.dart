import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/app_text.dart';
import '../../../core/app_colors/app_colors.dart';
class AddTrip extends StatelessWidget {
  const AddTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 24,
            ),
          ),
        ),
        title: const Text(
          "Add Trip",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.9,
      ),
      body: const Center(
        child: StepperExample(),
      ),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "Departure",
              style: TextStyle(
                  fontSize: 11,
                  color: _index == 0 ? const Color(0xff2F3C7E) : Colors.grey),
            ),
            state: _index >= 0 ? StepState.complete : StepState.indexed,
            isActive: _index >= 0,
            content: Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: " Name",
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
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Colors.black26),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: "City",
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
                            hintText: "City",
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      )
                    ],
                  ),
                  //todo

                  Row(
                    children: [
                      SizedBox(
                        width: 11,
                      ),
                      Image.asset("assets/images/around location.png"),
                      SizedBox(
                        width: 12,
                      ),
                      Text("Around current location"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: "AirLine",
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
                            hintText: "AirLine",
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: "Date",
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
                            hintText: "Date",
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: "Time",
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
                            hintText: "Time",
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Center(
                    child: InkWell(
                      onTap: () {
                        //Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const ArrivalTrip()));
                      },
                      child: InkWell(
                        onTap: () {
                          if (_index <= 0) {
                            setState(() {
                              _index += 1;
                            });
                          }
                        },
                        child: Container(
                          width: 348,
                          height: 47,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.blue,
                          ),
                          child: const Center(
                            child: Text(
                              "Next",
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const SizedBox.shrink(),
            label: Text(
              "arrival",
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
                        title: "City ",
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
                            hintText: "City",
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset("assets/images/around location.png"),
                      SizedBox(
                        width: 12,
                      ),
                      Text("Around current location"),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: "Date",
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
                            hintText: "Date",
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //todo

                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: "Time",
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
                            hintText: "Time",
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.black26),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: 345,
                    height: 108,
                    child: DottedBorder(
                      radius: const Radius.circular(50),
                      dashPattern: [5, 5],
                      color: Colors.grey,
                      strokeWidth: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset("assets/images/Upload.png"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text("Uploud Documents(jpg.png.pdf),")
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
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
                            "Next",
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
              "summary",
              style: TextStyle(
                  fontSize: 11,
                  color: _index == 2 ? const Color(0xff2F3C7E) : Colors.grey),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Text(
                        "Yemen(Sana’a)",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.arrow_forward),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Alexandria",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Yemenia Air Lines",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: Color(0xff808080)),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Confirmation DL1234",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        color: Color(0xff98A2B3)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: 399,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xffE6E6E6),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 3),
                    child: Text(
                      "Mon,Nov 2024",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff808080)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    width: 84,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.mediumBlue,
                    ),
                    child: const Center(
                        child: Text(
                      "upcoming ",
                      style: TextStyle(fontSize: 13, color: AppColors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/flight.png"),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Depart Sana’a  14 Nov",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xff333333)),
                          ),
                          const Text(
                            "6:00 AM",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Color(0xff333333)),
                          ),
                          const Text(
                            "show Sana’a Map",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Color(0xff2F3C7E)),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            children: [
                              Text(
                                "Duration 1 hr, 15 min > Seat",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: const Color(0xff333333)
                                        .withOpacity(0.5)),
                              ),
                              const Text(
                                "  19B",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            "Arrive Alexandria  14 Nov",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xff333333)),
                          ),
                          const Text(
                            "7:15 AM",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Color(0xff333333)),
                          ),
                          const Text(
                            "show Alexandria Map",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Color(0xff2F3C7E)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xffE6E6E6),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 3),
                    child: Text(
                      "Documents",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff808080)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/ticket.png",
                      width: 65,
                      height: 53,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      //Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const ArrivalTrip()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.blue,
                        ),
                        child: const Center(
                            child: Text(
                          "Add",
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
    );
  }
}
