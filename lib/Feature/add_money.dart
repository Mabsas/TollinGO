import 'package:flutter/material.dart';


class AddMoneyScreen extends StatefulWidget {

   const AddMoneyScreen({Key? key}) : super(key: key);
  @override
  _AddMoneyScreenState createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  TextEditingController validityDateController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: securityCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Security Code'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: validityDateController,
              decoration: InputDecoration(labelText: 'Validity Date'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate adding money process
                String cardNumber = cardNumberController.text;
                String securityCode = securityCodeController.text;
                String validityDate = validityDateController.text;
                double amount = double.parse(amountController.text);

                // Perform validation and update app's account balance
                // This is where you can simulate backend logic for adding money
                // For demo, you can print the details and update a balance variable
                print('Card Number: $cardNumber');
                print('Security Code: $securityCode');
                print('Validity Date: $validityDate');
                print('Amount: $amount');

                // Update account balance variable (replace this with your logic)
                double currentBalance = 100.0; // Initial balance for demo
                double newBalance = currentBalance + amount;
                print('New Balance: $newBalance');
              },
              child: Text('Add Money'),
            ),
          ],
        ),
      ),
    );
  }
}
