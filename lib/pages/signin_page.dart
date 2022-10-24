import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class signinPage extends StatefulWidget {
  const signinPage({super.key});

  @override
  State<signinPage> createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> {
  final TextEditingController _textEditingControllerE =
      new TextEditingController();
  bool _passwordVisability = true;
  String _descriptionHideShow = "Show";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In Page"),
        centerTitle: true,
        // backgroundColor: const Color(0xFFFF9800),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 10),
            TextFormField(
              
              controller: _textEditingControllerE,
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
                    onPressed: () => _textEditingControllerE.clear(),
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
              obscureText: _passwordVisability,
              decoration: InputDecoration(
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
                labelText: "Password *",
                hintText: "Bla-bla-bla",
                prefixIcon: Icon(
                  Icons.lock,
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
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 0.002),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text(
                "Dont have account?",
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

  void _toogle() {
    setState(() {
      _descriptionHideShow = "Hide";
      _passwordVisability = !_passwordVisability;
    });
  }
}
