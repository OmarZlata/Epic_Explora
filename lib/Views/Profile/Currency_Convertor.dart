import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_button.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Currency extends StatefulWidget {
  Currency({Key? key}) : super(key: key);

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  late String selectedSourceCurrency;
  late String selectedTargetCurrency;
  String displayedText = '';
  String result = "0.00";
  List<String> currencyCodes = [];
  List<DropdownMenuItem<String>> sourceCurrencyItems = [];
  List<DropdownMenuItem<String>> targetCurrencyItems = [];
  Map<String, dynamic>? jsonData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      Response response = await Dio().get(
          'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/usd.json');
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data['usd'];
        setState(() {
          jsonData = responseData;
          List<String> currencies = [
            "egp",
            "sar",
            "eur",
            "usd",
            "jpy",
            "gbp",
            "aud",
            "cad",
            "chf",
            "cny",
            "sek",
            "nzd",
            "krw",
            "mxn",
            "sgd",
            "nok",
            "inr",
            "rub",
            "brl",
            "zar",
            "hkd",
            "try"
          ];
          currencyCodes = currencies
              .where((currency) => responseData.containsKey(currency))
              .toList();
          selectedSourceCurrency = 'eur';
          selectedTargetCurrency = currencyCodes.first;
          currencyCodes.forEach((code) {
            sourceCurrencyItems.add(
              DropdownMenuItem<String>(
                value: code,
                child: Text(code),
              ),
            );
            targetCurrencyItems.add(
              DropdownMenuItem<String>(
                value: code,
                child: Text(code),
              ),
            );
          });
          isLoading = false;
        });
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  void convertCurrency() {
    if (jsonData != null) {
      double amount = double.tryParse(displayedText) ?? 0;

      // If the first dropdown is set to 'usd'
      if (selectedSourceCurrency == 'usd') {
        // Multiply the second dropdown value by the text field value
        double? targetRate = jsonData![selectedTargetCurrency];
        if (targetRate != null) {
          double convertedAmount = amount * targetRate;
          setState(() {
            result = convertedAmount.toStringAsFixed(2);
          });
        } else {
          setState(() {
            result = 'Rates for selected currencies are not available';
          });
        }
      }
      // If the second dropdown is set to 'usd'
      else if (selectedTargetCurrency == 'usd') {
        double? sourceRate = jsonData![selectedSourceCurrency];
        if (sourceRate != null) {
          double convertedAmount = amount / sourceRate;
          setState(() {
            result = convertedAmount.toStringAsFixed(2);
          });
        } else {
          setState(() {
            result = 'Rates for selected currencies are not available';
          });
        }
      } else {
        // Default currency conversion logic
        double? sourceRate = jsonData![selectedSourceCurrency];
        double? targetRate = jsonData![selectedTargetCurrency];
        if (sourceRate != null && targetRate != null) {
          double convertedAmount = (amount / sourceRate) * targetRate;
          setState(() {
            result = convertedAmount.toStringAsFixed(2);
          });
        } else {
          setState(() {
            result = 'Rates for selected currencies are not available';
          });
        }
      }
    }
  }

  void swapCurrencies() {
    setState(() {
      String temp = selectedSourceCurrency;
      selectedSourceCurrency = selectedTargetCurrency;
      selectedTargetCurrency = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppAppBar(title: "Currency Converter"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: DropdownButton<String>(
                    value: selectedSourceCurrency,
                    onChanged: (newValue) {
                      setState(() {
                        selectedSourceCurrency = newValue!;
                      });
                    },
                    items: sourceCurrencyItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.value,
                        child: Text(
                          item.value!, // Use the value of the item
                          style: TextStyle(
                              fontSize: 20), // Adjust the font size
                        ),
                      );
                    }).toList(),
                    iconSize: 30, // Adjust the icon size
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(CircleBorder()),
                        backgroundColor:
                        MaterialStatePropertyAll(AppColors.blue)),
                    onPressed: () {
                      swapCurrencies();
                    },
                    child: Icon(Icons.swap_horiz)),
                SizedBox(
                  width: 100, // Adjust the width as needed
                  child: DropdownButton<String>(
                    value: selectedTargetCurrency,
                    onChanged: (newValue) {
                      setState(() {
                        selectedTargetCurrency = newValue!;
                      });
                    },
                    items: targetCurrencyItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.value,
                        child: Text(
                          item.value!, // Use the value of the item
                          style: TextStyle(
                              fontSize: 20), // Adjust the font size
                        ),
                      );
                    }).toList(),
                    iconSize: 30, // Adjust the icon size
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  displayedText = value;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter amount',
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      color: AppColors.blue,
                      title: "Convert",
                      font_color: AppColors.white,
                      onTap: () {
                        convertCurrency();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 75.h,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.blue.withOpacity(0.15),

              ),
              child: Center(
                child: Text(
                  '$result ${selectedTargetCurrency.toUpperCase()}',
                  style: TextStyle(fontSize: 28,color: AppColors.blue,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}