import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:flutter/material.dart';

import '../../Widgets/bottomNavigationBar.dart';
import '../../core/app_colors/app_colors.dart';

class StateScreen extends StatelessWidget {
  const StateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Select State",),
      body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,

          ),
          itemCount: 12,
          itemBuilder: (context, index) => Column(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/images/Aswan.png'),
                  ),
                  Text('Aswan'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
