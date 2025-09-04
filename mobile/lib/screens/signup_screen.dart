import 'package:flutter/material.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Full Name"),
                onSaved: (val) => name = val,
                validator: (val) =>
                    val!.isEmpty ? "Enter your name" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                onSaved: (val) => email = val,
                validator: (val) =>
                    val!.isEmpty ? "Enter email" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                onSaved: (val) => password = val,
                validator: (val) =>
                    val!.isEmpty ? "Enter password" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Sign Up"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
