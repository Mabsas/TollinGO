import 'package:flutter/material.dart';

class EmergencyLoanWidget extends StatefulWidget {
  const EmergencyLoanWidget({Key? key}) : super(key: key);

  @override
  _EmergencyLoanWidgetState createState() => _EmergencyLoanWidgetState();
}

class _EmergencyLoanWidgetState extends State<EmergencyLoanWidget> {
  double loanAmount = 0.0;
  final double minLoanAmount = 200.0;
  final double maxLoanAmount = 500.0;

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
             // Navigate back to the home page
              Navigator.of(context).popUntil((route) => route.isFirst);
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
      // Show an error dialog for invalid loan amount
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Loan amount must be between $minLoanAmount and $maxLoanAmount.'),
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
      // Close the current dialog
      Navigator.of(context).pop();

      // Show a success dialog using Navigator
      _showSuccessDialog(context);
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success!'),
          content: Text('Successfully received emergency loan of Tk $loanAmount.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navigate back to the home page
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
