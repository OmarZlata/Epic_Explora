import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:flutter/material.dart';


import '../core/app_colors/app_colors.dart';

class PhoneNumberTextField extends StatefulWidget {
  @override
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  String selectedCountryCode = '+20'; // Default country code

  List<String> countryCodes = [
    '+1', // USA
    '+44', // UK
    '+91', // India
    '+971', // UAE
    '+966', // Saudi Arabia
    '+973', // Bahrain
    '+965', // Kuwait
    '+968', // Oman
    '+974', // Qatar
    '+962', // Jordan
    '+961', // Lebanon
    '+963', // Syria
    '+964', // Iraq
    '+20', // Egypt
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
          color: AppColors.white),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: DropdownButton<String>(
              dropdownColor: AppColors.white,
              value: selectedCountryCode,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCountryCode = newValue!;
                });
              },
              items: countryCodes.map((String countryCode) {
                return DropdownMenuItem<String>(
                  value: countryCode,
                  child: Text(countryCode),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Phone number',
                hintStyle: TextStyle(fontSize: 12,color: Colors.black26),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
