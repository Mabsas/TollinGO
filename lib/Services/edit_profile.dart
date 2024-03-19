import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  String _phoneNumber = '';
  DateTime? _dateOfBirth; // Make _dateOfBirth nullable
  String _emailAddress = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100], // Change this to the desired background color
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 17.0, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[300],
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
        ),
        /*actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {
              // TODO: Implement add photo functionality
              print('Add Photo button pressed');
            },
          ),
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add_a_photo, size: 40.0),
                  onPressed: () {
                    // TODO: Implement add photo functionality
                    print('Add Photo button pressed');
                  },
                ),
                SizedBox(height: 8.0),
                Text(
                  'Add Photo',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: Key('phoneNumber'),
                    initialValue: _phoneNumber,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phoneNumber = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          key: Key('dateOfBirth'),
                          decoration: InputDecoration(
                            labelText: 'Date of Birth (optional)',
                          ),
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: _dateOfBirth ?? DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) {
                              setState(() {
                                _dateOfBirth = picked;
                              });
                            }
                          },
                          validator: (value) {
                            if (_dateOfBirth == null) {
                              return 'Please select a date of birth';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Do nothing for now, as the value is already updated in onTap.
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    key: Key('emailAddress'),
                    initialValue: _emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail address (optional)',
                    ),
                    validator: (value) {
                      if (value == null || (value.isNotEmpty && !value.contains('@'))) {
                        return 'Please enter a valid e-mail address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _emailAddress = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        key: Key('saveChanges'),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            // TODO: Save changes here
                            print('Changes saved: $_phoneNumber, $_dateOfBirth, $_emailAddress');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey[200]!),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Change text color here
                        ),
                        child: Text('Save Changes'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement Google linking functionality
                          print('Link with Google button pressed');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey[200]!),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Change text color here
                        ),
                        child: Text('Link with Google'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
