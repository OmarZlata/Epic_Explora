import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Currency extends StatefulWidget {
  Currency({Key? key});

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String displayedText = '';
  String dropDownValue = "egp";
  String selectedTargetCurrency = "";
  String result = "0.00"; // Change the type to String

  List<String> currencyCodes = [];
  List<DropdownMenuItem<String>> dropdownItems = [];
  List<DropdownMenuItem<String>> targetCurrencyItems = [];

  Map<String, dynamic>? jsonData;



  @override
  void initState() {
    super.initState();
    fetchJsonData().then((data) {
      setState(() {
        jsonData = data;
        currencyCodes = jsonData?.keys.toList() ?? [];
        updateDropdownItems();
        // Set default dropdown value
        dropDownValue = currencyCodes.isNotEmpty ? currencyCodes[0] : "";
        selectedTargetCurrency =
        currencyCodes.isNotEmpty ? currencyCodes[0] : "";
      });
    }).catchError((error) {
      // Handle error
    });
  }

  Future<Map<String, dynamic>> fetchJsonData() async {
    try {
      final response = await Dio().get(
          'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies.json');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData =
        Map<String, dynamic>.from(response.data);
        jsonData.remove("date");
        return jsonData;
      } else {
        throw Exception('Failed to fetch JSON data');
      }
    } catch (error) {
      throw Exception('Failed to fetch JSON data: $error');
    }
  }

  void updateDropdownItems() {
    dropdownItems = currencyCodes.map((code) {
      return DropdownMenuItem<String>(
        value: code,
        child: Text(code),
      );
    }).toList();
    // Update target currency dropdown items
    targetCurrencyItems = currencyCodes.map((code) {
      return DropdownMenuItem<String>(
        value: code,
        child: Text(code),
      );
    }).toList();
  }

  Widget numButton(String num) {
    // Changed function name to camelCase
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            displayedText += num;
            _calculateConversion();
          });
        },
        child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.light_blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText(
              title: num,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget zeroButton(String zero) {
    // Changed function name to camelCase
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          setState(() {
            displayedText += zero;
            _calculateConversion();
          });
        },
        child: Container(
          width: 180,
          height: 72,
          decoration: BoxDecoration(
            color: AppColors.light_blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText(
              title: zero,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget acButton(String ac) {
    // Changed function name to camelCase
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            displayedText = '';
            result = "0.00"; // Reset result when clear button is pressed
          });
        },
        child: Container(
          width: 72,
          height: 180,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText(
              title: ac,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget equalButton(String equal) {
    // Changed function name to camelCase
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _calculateConversion();
            print('Before conversion: $result');
            double parsedResult = double.parse(result);
            print('Parsed result: $parsedResult');// Call the calculation function
          });
        },
        child: Container(
          width: 72,
          height: 180,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: AppText(
              title: equal,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }



  void _calculateConversion() {
    if (displayedText.isEmpty) {
      setState(() {
        result = "0.00";
      });
      return;
    }

    double inputValue = double.tryParse(displayedText) ?? 0.0;
    if (inputValue == 0.0) {
      setState(() {
        result = "0.00";
      });
      return;
    }

    // Ensure proper type casting and handle nullable types
    double? sourceRate = jsonData?[dropDownValue] as double?;
    double? targetRate = jsonData?[selectedTargetCurrency] as double?;

    if (sourceRate == null || targetRate == null || sourceRate == 0.0) {
      setState(() {
        result = "Invalid conversion rates";
      });
      return;
    }

    double convertedValue = (inputValue * targetRate) / sourceRate;

    setState(() {
      result = convertedValue.toStringAsFixed(2);
    });
  }






  double _getConversionRate(String fromCurrency, String toCurrency) {
    if (jsonData != null && jsonData!.containsKey(fromCurrency) && jsonData!.containsKey(toCurrency)) {
      double fromRate = jsonData![fromCurrency];
      double toRate = jsonData![toCurrency];
      return toRate / fromRate;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    value: dropDownValue,
                    onChanged: (newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                        _calculateConversion();
                      });
                    },
                    items: dropdownItems,
                  ),
                ),
                Expanded(
                  child: AppText(
                    title: displayedText,
                    textAlign: TextAlign.right,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  title: selectedTargetCurrency,
                  color: AppColors.gray,
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    value: selectedTargetCurrency,
                    onChanged: (newValue) {
                      setState(() {
                        selectedTargetCurrency = newValue!;
                        _calculateConversion();
                      });
                    },
                    items: targetCurrencyItems,
                  ),
                ),
                Expanded(
                  child: AppText(
                    title: result,// Convert result to double and then format as string
                    textAlign: TextAlign.right,
                    fontSize: 30,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 140,
            ),
            AppText(
              title: "Exchange rates are provided on ${jsonData?["date"] ?? 'N/A'}",
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Divider(color: AppColors.gray, height: 3),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        numButton("7"),
                        SizedBox(width: 12),
                        numButton("8"),
                        SizedBox(width: 12),
                        numButton("9"),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        numButton("4"),
                        SizedBox(width: 12),
                        numButton("5"),
                        SizedBox(width: 12),
                        numButton("6"),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        numButton("1"),
                        SizedBox(width: 12),
                        numButton("2"),
                        SizedBox(width: 12),
                        numButton("3"),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        zeroButton("0"),
                        SizedBox(width: 0),
                        numButton("."),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    acButton('AC'),
                    SizedBox(height: 12),
                    equalButton('='),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
