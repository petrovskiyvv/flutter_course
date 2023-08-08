import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Users.dart';

class UserInfoPage extends StatelessWidget {
  late User userInfo;

  UserInfoPage({required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                '${userInfo.name.isEmpty ? "" : userInfo.name}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                '${userInfo.story.isEmpty ? "" : userInfo.story}',
              ),
              leading: Icon(Icons.person, color: Colors.black),
              trailing: Text(
                '${userInfo.country.isEmpty ? "" : userInfo.country}',
              ),
            ),
            ListTile(
              title: Text(
                '${userInfo.phone.isEmpty ? "" : userInfo.phone}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            if (userInfo.email.isNotEmpty)
              ListTile(
                title: Text(
                  '${userInfo.email}',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
