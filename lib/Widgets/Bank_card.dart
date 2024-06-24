import 'package:flutter/material.dart';



class BankInfoCard extends StatelessWidget {
  final String bankName;
  final String address;
  final String status;
  final String openingTime;

  const BankInfoCard({
    Key? key,
    required this.bankName,
    required this.address,
    required this.status,
    required this.openingTime,
  }) : super(key: key);

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
                  Text('Opens $openingTime'),
                ],
              ),
            ],
          ),
          trailing: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.directions, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
