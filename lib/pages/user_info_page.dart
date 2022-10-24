import 'package:flutter/material.dart';
import 'package:fromfields/model/user.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;
  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text("Name: ${userInfo.name}"),
              subtitle: Text("Story: ${userInfo.story}"),
              leading: Icon(Icons.person),
              trailing: Text("Country: ${userInfo.country}"),
            ),
            ListTile(
              title: Text("Phone: ${userInfo.phone}"),
              leading: Icon(Icons.phone),
            )
          ],
        ),
      ),
    );
  }
}
