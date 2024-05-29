import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Widgets/app_text.dart';
import '../../../core/app_colors/app_colors.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({super.key});

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
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
        actions: [
          DropdownButton(
            padding: EdgeInsets.only(right: 16),
            elevation: 0,
            icon: Icon(FontAwesomeIcons.ellipsisVertical,size: 23,),
            iconSize: 32,
            items: <String>['Add'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    // Adjust the spacing between icon and text
                    Text(value),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? value) {},
          )
        ],
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
  File? _selectedImage;

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
              "Details",
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
                        height: 60,
                      ),
                    ],
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
              "add images",
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
                  SizedBox(height: 130),
                  Center(
                    child: Column(
                      children: [
                        MaterialButton(
                          color: AppColors.grey,
                          child: Text(
                            "Upload Image",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          ),
                          onPressed: _pickImageFromGallery,
                        ),
                        _selectedImage != null
                            ? Image.file(_selectedImage!)
                            : Text("Please select an image"),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }
}
