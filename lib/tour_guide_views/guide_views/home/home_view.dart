import 'package:epic_expolre/Widgets/app_AppBar.dart';
import 'package:epic_expolre/Widgets/app_text.dart';
import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaticMessageScreen extends StatefulWidget {
  StaticMessageScreen({super.key});

  @override
  _StaticMessageScreenState createState() => _StaticMessageScreenState();
}

class _StaticMessageScreenState extends State<StaticMessageScreen> {
  final List<Map<String, String>> messages = [
    {"id": "1", "text": "Cairo 9PM"},
    {"id": "2", "text": "Cairo 5AM"},
    {"id": "3", "text": "Cairo 3PM"},
  ];

  final Set<String> hiddenMessages = {};

  void _hideMessage(String id, String action) {
    setState(() {
      hiddenMessages.add(id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: AppText(
            title: action == 'Approved' ? "Message Approved" : "Message Denied",
            color: AppColors.white,
          ),
        ),
        backgroundColor: action == 'Approved' ? AppColors.green : AppColors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        color: AppColors.violet,
        title: "Client Messages",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            if (hiddenMessages.contains(message["id"])) {
              return SizedBox.shrink();
            }
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Material(elevation: 5,borderRadius: BorderRadius.circular(16),
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: message["text"]!,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green,
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () => _hideMessage(message["id"]!, 'Approved'),
                            child: AppText(
                              title: "Approve",
                              color: AppColors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.red,
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () => _hideMessage(message["id"]!, 'Denied'),
                            child: AppText(
                              title: "Deny",
                              color: AppColors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
