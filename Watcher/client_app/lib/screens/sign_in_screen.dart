import 'package:automap/automap.dart';
import 'package:client_app/models/default_processing_result.dart';
import 'package:client_app/models/error_code.dart';
import 'package:client_app/models/user/sign_in.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/watcher_route_part.dart';
import 'package:flutter/material.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart' as wcb;

class SignInScreen extends StatelessWidget {
  final INavigationService navigationService;
  final wcb.IUserService userService;
  final AutoMapper mapper;

  String _email = '', _password = '';

  SignInScreen({
    Key? key,
    required this.navigationService,
    required this.userService,
    required this.mapper
  }) : super(key: key);

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
                  TextField(
                    onChanged: (value) => _email = value,
                  ),
                  const SizedBox(height: 16),
                  const Text('Password'),
                  TextField(
                    onChanged: (value) => _password = value,
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () => _onSignInRequested(context),
                          child: const Text('Sign In')
                      )
                    ],
                  )
                ],
              ),
            ))));
  }

  void _onSignInRequested(BuildContext context) async {
    final bllModel = mapper.map<SignIn, wcb.SignIn>(SignIn(_email, _password));
    final bllResult = await userService.signIn(bllModel);
    final result = mapper.map<wcb.DefaultProcessingResult, DefaultProcessingResult>(bllResult);

    switch(result.Error) {
      case ErrorCode.OK:
        navigationService.navigateToRoot(WatcherRoutePart.home());
        break;
      default:
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('An error happened.'),
              content: const Text('An error happened on attempt to sign in. Please check input data and try again.'),
              actions: [
                ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))
              ],
            ),
        );
        break;
    }
  }
}
