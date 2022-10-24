// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fromfields/model/user.dart';
import 'package:fromfields/pages/user_info_page.dart';

import 'signin_page.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final TextEditingController _textcontrollerN = new TextEditingController();
  final TextEditingController _textcontrollerP = new TextEditingController();
  final TextEditingController _textcontrollerE = new TextEditingController();
  final TextEditingController _textcontrollerS = new TextEditingController();
  final TextEditingController _textcontrollerPswr = new TextEditingController();
  final TextEditingController _textcontrollerCPswr =
      new TextEditingController();
  bool _passwordVisability = true;
  String _descriptionHideShow = "Show";
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> _countries = ["Ukraine", "USA", "UK", "Romania"];
  String? _selectCountry;
  User newUser = User();
  @override
  void dispose() {
    _textcontrollerN;
    _textcontrollerP.dispose();
    _textcontrollerE.dispose();
    _textcontrollerS.dispose();
    _textcontrollerPswr.dispose();
    _textcontrollerCPswr.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Register Page"),
        centerTitle: true,
        // backgroundColor: const Color(0xFFFF9800),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              onSaved: ((value) => newUser.name = value!),
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _nameFocus, _phoneFocus),
              controller: _textcontrollerN,
              maxLength: 32,
              decoration: InputDecoration(
                
                labelText: "Full name *",
                hintText: "Just ur name man",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.indigo,
                ),
                suffixIcon: Tooltip(
                  message: "Clear",
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => _textcontrollerN.clear(),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.indigo, width: 2.5)),
              ),
              validator: (String? _textcontrollerN) =>
                  _validateName(_textcontrollerN),
            ),
            const SizedBox(height: 10),
            TextFormField(
              onSaved: ((value) => newUser.phone = value!),
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _phoneFocus, _passwordFocus),
              controller: _textcontrollerP,
              validator: (value) => _validatePhone(value!)
                  ? null
                  : "Phone number format 0680463178",
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'[0-9]{1,}$'), allow: true)
              ],
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Phone number *",
                hintText: "Is it hard for u?",
                helperText: "Phone format 0680463178",
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.indigo,
                ),
                suffixIcon: Tooltip(
                  message: "Clear",
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => _textcontrollerP.clear(),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.indigo, width: 2.5)),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _textcontrollerE,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email *",
                hintText: "not masked mail)",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.indigo,
                ),
                suffixIcon: Tooltip(
                  message: "Clear",
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => _textcontrollerE.clear(),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.indigo, width: 2.5)),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              onSaved: ((value) => newUser.story = value!),
              controller: _textcontrollerS,
              maxLength: 132,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.indigo)),
                labelText: "Life story",
                hintText: "Type about your shit life",
                helperText: "Please not long text",
              ),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField(
              // onSaved: ((value) => newUser.country = value!),
              value: _selectCountry,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.map,
                  color: Colors.indigo,
                ),
                border: OutlineInputBorder(),
                // icon: Icon(Icons.map),
                labelText: "Country",
              ),
              items: _countries
                  .map((country) => DropdownMenuItem(
                        child: Text(country),
                        value: country,
                      ))
                  .toList(),
              onChanged: (country) => setState(() {
                newUser.country = country!;
                _selectCountry = country;
              }),
            ),
            const SizedBox(height: 10),
            TextFormField(
              focusNode: _passwordFocus,
              // onFieldSubmitted: (_) => _fieldFocusChange(context, _passwordFocus, _phoneFocus),
              controller: _textcontrollerPswr,
              obscureText: _passwordVisability,
              validator: (value) {
                if (validatePassword(value!) == false) {
                  return "min 1 letter Upper and lower case, 1 spechial symb, min 8 lenght";
                }

                return null;
              },
              decoration: InputDecoration(
                labelText: "Password *",
                hintText: "Bla-bla-bla",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.indigo,
                ),
                suffixIcon: Tooltip(
                  message: _descriptionHideShow,
                  child: GestureDetector(
                    onTap: () => _toogle(),
                    child: Icon(
                      _passwordVisability
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.indigo,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.indigo, width: 2.5)),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _textcontrollerCPswr,
              obscureText: _passwordVisability,
              decoration: InputDecoration(
                labelText: "Confirm password *",
                hintText: "just repeat",
                prefixIcon: Icon(
                  Icons.lock_reset,
                  color: Colors.indigo,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.indigo, width: 2.5)),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: _submitConfirm,
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Log in",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 0.002),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const signinPage()));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text(
                "Have an account?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 0.002),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                "Exit",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateName(value) {
    final _pattern = RegExp(r'[A-Za-z ]+$');
    if (value.isEmpty) {
      return "Name is empty";
    } else if (!_pattern.hasMatch(value)) {
      return "Alphabet value";
    } else {
      return null;
    }
  }

  bool _validatePhone(String input) {
    final pattern = RegExp(r'\d\d\d\d\d\d\d\d\d\d$');
    return pattern.hasMatch(input);
  }

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void _toogle() {
    setState(() {
      _descriptionHideShow = "Hide";
      _passwordVisability = !_passwordVisability;
    });
  }

  void _submitConfirm() {

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      _showDialog(name: _textcontrollerN.text);
      print("Form is valid");
      print("""Name: ${_textcontrollerN.text}
Phone: ${_textcontrollerP.text}
Email: ${_textcontrollerE.text}
Story: ${_textcontrollerS.text}""");
    } else {
      _showMessage(message: "Form is not valid");
    }
  }

  void _showMessage({String? message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 4),
      content: Text(
        textAlign: TextAlign.center,
        message!,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ));
  }

  void _showDialog({String? name}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Registration suc"),
              content: Text("$name is now verified register form"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => UserInfoPage(userInfo: newUser,))));
                  },
                  child: Text("Ok"),
                )
              ],
            ));
  }
}
