import 'package:flutter/material.dart';
import 'services/DBconnector.dart';
import 'models/UserModel.dart';

class Register extends StatelessWidget {
  final User? user;
  const Register({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [TextFormField(
                  controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                final nameField = nameController.value.text;
                final usernameField = usernameController.value.text;
                final emailField = emailController.value.text;
                final passwordField = passwordController.value.text;
                if(nameField.isEmpty || usernameField.isEmpty || emailField.isEmpty || passwordField.isEmpty) {
                  return;
                }
                final User model = User(user_id: user?.user_id, name: nameField, username: usernameField, email: emailField, password: passwordField);
                DatabaseConnector dbConnector = DatabaseConnector();
                await dbConnector.addUser(model);
                Navigator.pushNamed(context, '/login');               
              },
            ),
          ],
        ),
      ),
    );
  }
}
