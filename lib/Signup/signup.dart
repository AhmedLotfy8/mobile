import 'package:flutter/material.dart';
import '../dashboard/nav_bar.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      print('Signed up with: $name, $email');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account created successfully!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (val) => val!.isEmpty ? 'Please enter your name' : null,
                onSaved: (val) => name = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => val!.isEmpty ? 'Please enter your email' : null,
                onSaved: (val) => email = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Minimum 6 characters' : null,
                onSaved: (val) => password = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (val) => val!.isEmpty ? 'Please confirm password' : null,
                onSaved: (val) => confirmPassword = val!,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: Text('Already have an account? Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}