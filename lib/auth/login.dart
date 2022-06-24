import 'package:flutter/material.dart';
import 'package:valeta/auth/register.dart';

// Firebase

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(36, 40, 36, 40),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
              Container(
                padding: const  EdgeInsets.only(top: 10),
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
