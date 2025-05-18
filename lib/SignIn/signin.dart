import 'package:flutter/material.dart';
import '../dashboard/nav_bar.dart';

void main() => runApp(AuthApp());

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth App',
      theme: ThemeData(primarySwatch: Colors.blue),

    );
  }

  Widget _getInitialPage() {
    // Simulating authentication check (replace with actual logic)
    bool isUserSignedIn = false; // Set to true if authenticated

    return isUserSignedIn ? NavBar() : SignInPage();
  }
}

// ------------------ SIGN IN PAGE ------------------

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Signed in with $email');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed in successfully!')));

      // Navigate to NavBar
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator:
                    (val) => val!.isEmpty ? 'Please enter your email' : null,
                onSaved: (val) => email = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator:
                    (val) => val!.length < 6 ? 'Minimum 6 characters' : null,
                onSaved: (val) => password = val!,
              ),
              SizedBox(height: 24),
              ElevatedButton(onPressed: _signIn, child: Text('Sign In')),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text('Don\'t have an account? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

