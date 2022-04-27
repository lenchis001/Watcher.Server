import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.redAccent,
                  Colors.cyanAccent,
                  Colors.amberAccent
                ])),
            child: Center(
                child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white70),
              width: 400,
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Welcome!', style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Please sign in to use the service.'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Login'),
                  const TextField(),
                  const SizedBox(height: 16),
                  const Text('Password'),
                  const TextField(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {

                            }, child: const Text('Sign In'))
                    ],
                  )
                ],
              ),
            ))));
  }
}
