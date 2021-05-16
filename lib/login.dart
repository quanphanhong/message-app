import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'friend_list.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController _usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                  controller: _usernameController,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                ),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Password is required!';
                    }
                    return 'Valid';
                  },
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                ),
                Center(
                  child: OutlinedButton(
                    child: Text('Login'),
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('id', _usernameController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FriendList(
                            currentUserId: _usernameController.text,
                          )
                        )
                      );
                    },
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}