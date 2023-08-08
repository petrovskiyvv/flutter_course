import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routing_and_forms_example/pages/user_info_page.dart';

import '../model/Users.dart';

class RegisterFormPage extends StatefulWidget {
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  bool _hideConfPass = true;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();
  final _passController = TextEditingController();
  final _confPassController = TextEditingController();

  List<String> _countries = ['Russia', 'Ukraine', 'Kazakhstan', 'Georgia'];
  String? _selectedCountry;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _passController.dispose();
    _confPassController.dispose();

    super.dispose();
  }

  User newUser = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name *',
                hintText: 'What do people call you?',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                    onLongPress: () {
                      _nameController.clear();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.purple, width: 2.0)),
              ),
              validator: (value) {
                final nameExp = RegExp(r'^[A-Za-z ]+$');
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                } else if (!nameExp.hasMatch(value)) {
                  return 'Please enter alphabetical characters';
                } else {
                  return null;
                }
              },
              onSaved: (value) => newUser.name = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Where can we call you?',
                helperText: 'Phone format: (xxx)xxx-xx-xx',
                prefixIcon: Icon(Icons.phone),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.purple, width: 2.0)),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                    allow: true),
              ],
              validator: (value) {
                final phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d-\d\d-\d\d$');
                if (value == null ||
                    value.isEmpty ||
                    !phoneExp.hasMatch(value)) {
                  return 'Phone number incorrect';
                }
                return null;
              },
              onSaved: (value) => newUser.phone = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter a email address',
                  icon: Icon(Icons.mail)),
              keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Email can not be empty';
              //   } else if (!value.contains('@')) {
              //     return 'Invalid email address';
              //   } else {
              //     return null;
              //   }
              // },
              onSaved: (value) => newUser.email = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map_outlined),
                  labelText: 'Choose your country',
                ),
                items: _countries.map((country) {
                  return DropdownMenuItem(
                    child: Text(country),
                    value: country,
                  );
                }).toList(),
                onChanged: (country) {
                  setState(() {
                    _selectedCountry = country;
                    newUser.country = country!;
                  });
                  value:
                  _selectedCountry;
                  validator: (value) {
                    return value == null ? 'Please select a country' : null;
                  };
                }),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _bioController,
              decoration: const InputDecoration(
                  labelText: 'Bio',
                  hintText: 'Tell us about your self',
                  helperText: 'Keep it short',
                  border: OutlineInputBorder()),
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              onSaved: (value) => newUser.story = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passController,
              maxLength: 16,
              obscuringCharacter: 'இ',
              obscureText: _hidePass,
              decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter the password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _hidePass ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hidePass = !_hidePass;
                      });
                    },
                  ),
                  icon: const Icon(Icons.security)),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Field can not be empty';
              //   } else if (value.length < 8) {
              //     return "The password requires a minimum of 8 characters";
              //   } else {
              //     return null;
              //   }
              // },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confPassController,
              maxLength: 16,
              obscuringCharacter: 'இ',
              obscureText: _hideConfPass,
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm the password',
                  suffixIcon: IconButton(
                    icon: Icon(_hideConfPass
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _hideConfPass = !_hideConfPass;
                      });
                    },
                  ),
                  icon: const Icon(Icons.border_color)),
              validator: (value) {
                /* if (value == null || value.isEmpty) {
                  return 'Field can not be empty';
                } else */
                if (_confPassController.text != _passController.text) {
                  return "Passwords don't match";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _showDialog(_nameController.text);
      // print('Form is valid');
      // print('Name: ${_nameController.text}');
      // print('Phone: ${_phoneController.text}');
      // print('Email: ${_emailController.text}');
      // print('Bio: ${_bioController.text}');
      // print('pass: ${_passController.text}');
      // print('confPass: ${_confPassController.text}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form is not valid!')),
      );
    }
  }

  void _showDialog(String name) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Registration successful',
                style: TextStyle(
                  color: Colors.green,
                )),
            content: Text('$name is now a verified register form',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                )),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserInfoPage(
                                  userInfo: newUser,
                                )));
                  },
                  child: Text(
                    'Verified',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ))
            ],
          );
        });
  }
}
