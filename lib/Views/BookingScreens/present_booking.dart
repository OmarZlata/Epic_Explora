import 'package:flutter/cupertino.dart';

import '../../Widgets/booking_card.dart';

class PresentBooking extends StatelessWidget {
  const PresentBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (context, index) => BookingCard() ,
        itemCount: 5,
      ),
    );
  }
}
