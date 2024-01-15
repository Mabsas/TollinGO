// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';



class EmergencyLoanWidget extends StatefulWidget {
  const EmergencyLoanWidget({super.key});

  @override
  _EmergencyLoanWidgetState createState() => _EmergencyLoanWidgetState();
}

class _EmergencyLoanWidgetState extends State<EmergencyLoanWidget> {
  double loanAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Emergency Loan Amount: $loanAmount'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _showLoanDialog(context);
          },
          child: const Text('Request Emergency Loan'),
        ),
      ],
    );
  }

  Future<void> _showLoanDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Request Emergency Loan'),
          content: Column(
            children: [
              const Text('Enter loan amount:'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    loanAmount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement logic to process the emergency loan request
                // For simplicity, let's print the loan amount for now
                print('Emergency Loan Requested: $loanAmount');
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}