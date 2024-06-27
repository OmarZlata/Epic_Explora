import 'package:epic_expolre/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class BankInfoCard extends StatelessWidget {
  final String bankName;
  final String address;
  final String status;
  final String location;
  final double rete;

  const BankInfoCard({
    Key? key,
    required this.bankName,
    required this.address,
    required this.status,
    required this.rete,
    required this.location,

  }) : super(key: key);

  void _launchMaps() async {
    final url = '$location';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            bankName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bank'),
              SizedBox(height: 4),
              Text(address),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      color: status == 'Closed' ? Colors.red : Colors.green,
                    ),
                  ),
                  Text(' • '),
                  Image.asset('assets/images/rate.png'),
                  Text('$rete'),
                ],
              ),
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: AppColors.blue,
            child: InkWell( onTap: () {
              _launchMaps();
            },child: Icon(Icons.directions, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
