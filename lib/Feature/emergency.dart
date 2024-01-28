import 'package:flutter/material.dart';
import 'package:tollin_go/Services/notify_service.dart';

class EmergencyLoanWidget extends StatefulWidget {
  const EmergencyLoanWidget({Key? key}) : super(key: key);

  @override
  _EmergencyLoanWidgetState createState() => _EmergencyLoanWidgetState();
}

class _EmergencyLoanWidgetState extends State<EmergencyLoanWidget> {
  double loanAmount = 0.0;
  final double minLoanAmount = 200.0;
  final double maxLoanAmount = 500.0;
  final NotificationService notificationService = NotificationService();

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
                _processLoanRequest(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _processLoanRequest(BuildContext context) {
    if (loanAmount < minLoanAmount || loanAmount > maxLoanAmount) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: Text(
                'Loan amount must be between TK $minLoanAmount and Tk $maxLoanAmount'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.of(context).pop();

      _showSuccessDialog(context);
    }
  }

  void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success!'),
        content: Text('Successfully received an emergency loan of Tk $loanAmount'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              await _sendNotification();
              Navigator.pop(context);  // Close the success dialog
              
              // Replace 'Home' with your actual homepage route name
              Navigator.pushReplacementNamed(context, 'Home');
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}


  Future<void> _sendNotification() async {
    String notificationTitle = 'TollinGo';
    String notificationBody =
        'Dear user, your request for an emergency loan of Tk $loanAmount was successful. Thank you.';

    await notificationService.showNotification(
      title: notificationTitle,
      body: notificationBody,
    );
  }
}
