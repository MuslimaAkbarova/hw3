import 'package:flutter/material.dart';
import 'services/DBconnector.dart';
import 'models/UserModel.dart';

class LogIn extends StatelessWidget {
  final User? user;
  const LogIn({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    int? currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
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
                'Log In',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                final emailField = emailController.value.text;
                final passwordField = passwordController.value.text;
                if(emailField.isEmpty || passwordField.isEmpty){
                  return;
                }
                DatabaseConnector dbConnector = DatabaseConnector();
                currentUser = await dbConnector.userLogin(emailController.value.text, passwordController.value.text);
                if(currentUser!=null) {
                  Navigator.pushNamed(context, '/homepage');
                }
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                'Register',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
