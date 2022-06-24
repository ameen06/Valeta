import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Firebase

class RegisterationView extends StatefulWidget {
  const RegisterationView({Key? key}) : super(key: key);

  @override
  State<RegisterationView> createState() => _RegisterationViewState();
}

class _RegisterationViewState extends State<RegisterationView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Register function
  Future<UserCredential?> _signUpWithEmailAndPassword() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await credential.user!.updateDisplayName(_nameController.text);

      return credential;
    } on FirebaseAuthException catch (e) {
      /// These are two examples of several possible error messages from
      /// FirebaseAuth. Find the [complete list of error messages here.](https://firebase.google.com/docs/auth/admin/errors)
      if (e.code == 'weak-password') {
        //
      } else if (e.code == 'email-already-in-use') {
        //
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(36, 40, 36, 40),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Full Name'),
                onSaved: (value) {
                  _nameController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                onSaved: (value) {
                  _emailController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
                onSaved: (value) {
                  _passwordController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  _signUpWithEmailAndPassword();
                },
                child: const Text('Register'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterationView()),
                    );
                  },
                  child: const Text("Don't have an account yet!? Sign up"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
