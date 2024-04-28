import 'package:flutter/material.dart';

import '../../Widgets/app_text.dart';
import '../../core/app_colors/app_colors.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black),
        title: AppText(
            title: "Terms of service",
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: 'Licenses',
              color: AppColors.grey,
              fontSize: 14,
            ),
            AppText(
              title: 'Terms Of Service',
              fontSize: 20,
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              title: '1. Terms',
              fontSize: 14,fontWeight: FontWeight.bold,
            ),
            AppText(
              title:
                  'Tellus at sit ante rutrum suspendisse pretium, vitae vel dignissim. Nunc, scelerisque adipiscing condimentum massa dignissim tortor leo lacus. Sapien felis ultrices fringilla nisi sit nibh. Etiam volutpat nisl ornare lorem mus at a, et pulvinar. ',
              fontSize: 12,
            ),
            AppText(
              title: '2. Use License',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              title:'Fermentum erat nisl duis varius risus. Augue ac facilisi porta metus enim. Ullamcorper lacus praesent rhoncus, sapien rutrum nulla mattis vitae ultrices. ',
              fontSize: 12,
            ),


          ],
        ),
      ),
    );
  }
}
