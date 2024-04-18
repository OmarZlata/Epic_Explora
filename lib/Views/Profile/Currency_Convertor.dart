import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  Currency({super.key});

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String displayedText = '';
  String DropDownValue = 'one';

  Widget NumButton(String num) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            displayedText += num;
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          setState(() {
            displayedText += zero;
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

  Widget AcButton(String AC) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            displayedText = '';
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
              title: AC,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
  Widget BackButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            displayedText = '';
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
            child: Icon(Icons.backspace_outlined,color: AppColors.white,)
          ),
        ),
      ),
    );
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
                    style: TextStyle(fontSize: 30,color: Colors.black),
                    value: DropDownValue,
                    onChanged: (newvalue) {setState(() {
                      DropDownValue=newvalue!;
                    });},
                    items: [
                      DropdownMenuItem(value: 'one', child: Text("EGP")),
                      DropdownMenuItem(value: 'Two', child: Text("USD")),
                      DropdownMenuItem(value: 'Three', child: Text("UAE")),

                    ],
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
                    title: "Egyptian Pound",
                    color: AppColors.grey,
                  )
                ]),
            Row(
              children: [
                AppText(title: "EGP", fontSize: 30),
                Expanded(
                  child: AppText(
                    title: "displayedText",
                    textAlign: TextAlign.right,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: 150,),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12),
              child: Divider(color: AppColors.grey,height: 3),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        NumButton("7"),
                        SizedBox(width: 12),
                        NumButton("8"),
                        SizedBox(width: 12),
                        NumButton("9"),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        NumButton("4"),
                        SizedBox(width: 12),
                        NumButton("5"),
                        SizedBox(width: 12),
                        NumButton("6"),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        NumButton("1"),
                        SizedBox(width: 12),
                        NumButton("2"),
                        SizedBox(width: 12),
                        NumButton("3"),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        zeroButton("0"),
                        SizedBox(width: 0),
                        NumButton("."),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    AcButton('AC'),
                    SizedBox(height: 12),
                    BackButton(),
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
