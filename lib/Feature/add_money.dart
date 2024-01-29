import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tollin_go/Services/notify_service.dart';

class AddMoneyScreen extends StatefulWidget {
  final Function(double) onMoneyAdded;
  const AddMoneyScreen({Key? key, required this.onMoneyAdded})
      : super(key: key);

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
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey.shade200, Colors.blueGrey.shade800],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              CustomTextField(
                controller: cardNumberController,
                labelText: 'Card Number',
                keyboardType: TextInputType.number,
                maxLength: 19,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  CardNumberFormatter(),
                ],
                errorMessage: 'Enter a valid 16-digit card number',
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: securityCodeController,
                labelText: 'Security Code',
                keyboardType: TextInputType.number,
                maxLength: 3,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                errorMessage: 'Enter a valid 3-digit security code',
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: validityDateController,
                labelText: 'Validity Date',
                hintText: 'MM/YY',
                keyboardType: TextInputType.number,
                maxLength: 5,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                  ValidityDateFormatter(),
                ],
                errorMessage: 'Enter a valid validity date (MM/YY)',
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: amountController,
                labelText: 'Amount',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (validateInputs()) {
                    //  existing logic for adding money
                    double addedMoney = double.parse(amountController.text);
                    widget.onMoneyAdded(addedMoney); // Call the callback

                    // Show notification
                    sendNotification(addedMoney);
                    showSnackBar(context, 'Money added successfully');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                ),
                child: Text(
                  'Add Money',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to send notification
  void sendNotification(double addedMoney) {
    // Create an instance of the NotificationService
    NotificationService notificationService = NotificationService();

    // Build notification details
    String title = 'TollinGo';
    String body = 'Tk $addedMoney have been added to your account.';

    // Show the notification
    notificationService.showNotification(
      id: 1, // Update with a unique notification ID
      title: title,
      body: body,
    );
  }

  bool validateInputs() {
    if (cardNumberController.text.isEmpty ||
        securityCodeController.text.isEmpty ||
        validityDateController.text.isEmpty ||
        amountController.text.isEmpty) {
      showSnackBar(context, 'Fill up the information properly');
      return false;
    }

    if (cardNumberController.text.replaceAll(RegExp(r'\D'), '').length != 16) {
      showSnackBar(context, 'Enter a valid 16-digit card number');
      return false;
    }

    if (securityCodeController.text.replaceAll(RegExp(r'\D'), '').length != 3) {
      showSnackBar(context, 'Enter a valid 3-digit security code');
      return false;
    }

    String validityDateText =
        validityDateController.text.replaceAll(RegExp(r'\D'), '');
    if (validityDateText.length != 4 ||
        int.tryParse(validityDateText.substring(0, 2))! > 12) {
      showSnackBar(context, 'Enter a valid validity date (MM/YY)');
      return false;
    }

    // Additional validation logic if needed

    return true;
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorMessage;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: TextStyle(color: Colors.blueGrey.shade900),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.blueGrey.shade900),
        hintStyle: TextStyle(color: const Color.fromARGB(255, 74, 90, 98)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade700),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade900),
        ),
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String formattedValue = newValue.text.replaceAll(RegExp(r'\s'), '');

    if (formattedValue.length > 16) {
      formattedValue = formattedValue.substring(0, 16);
    }

    List<String> chunks = [];
    for (int i = 0; i < formattedValue.length; i += 4) {
      int end = i + 4;
      if (end > formattedValue.length) {
        end = formattedValue.length;
      }
      chunks.add(formattedValue.substring(i, end));
    }

    return TextEditingValue(
      text: chunks.join(' '),
      selection: TextSelection.fromPosition(
        TextPosition(offset: chunks.join(' ').length),
      ),
    );
  }
}

class ValidityDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String formattedValue = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (formattedValue.length > 4) {
      formattedValue = formattedValue.substring(0, 4);
    }

    List<String> chunks = [];
    for (int i = 0; i < formattedValue.length; i += 2) {
      int end = i + 2;
      if (end > formattedValue.length) {
        end = formattedValue.length;
      }
      chunks.add(formattedValue.substring(i, end));
    }

    return TextEditingValue(
      text: chunks.join('/'),
      selection: TextSelection.fromPosition(
        TextPosition(offset: chunks.join('/').length),
      ),
    );
  }
}
