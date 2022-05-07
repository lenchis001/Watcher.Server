import 'package:automap/automap.dart';
import 'package:client_app/models/default_processing_result.dart';
import 'package:client_app/models/error_code.dart';
import 'package:client_app/models/user/add_user.dart';
import 'package:client_app/models/user/sign_in.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/watcher_route_part.dart';
import 'package:flutter/material.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart' as wcb;

import 'base_page.dart';

class SignInPage extends BasePage {
  final wcb.IUserService userService;
  final AutoMapper mapper;

  String _signInEmail = '',
      _signInPassword = '',
      _signUpEmail = '',
      _signUpPassword = '';

  SignInPage(
      {Key? key,
      required INavigationService navigationService,
      required this.userService,
      required this.mapper})
      : super(key: key, showAppBar: false, navigationService: navigationService);

  Widget _getSignInTabContent(BuildContext context) {
    return Column(
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
          onChanged: (value) => _signInEmail = value,
          autocorrect: false,
        ),
        const SizedBox(height: 16),
        const Text('Password'),
        TextField(
          onChanged: (value) => _signInPassword = value,
          obscureText: true,
          autocorrect: false,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () => _onSignInRequested(context),
                child: const Text('Sign In'))
          ],
        )
      ],
    );
  }

  void _onSignInRequested(BuildContext context) async {
    final bllModel =
        mapper.map<SignIn, wcb.SignIn>(SignIn(_signInEmail, _signInPassword));
    final bllResult = await userService.signIn(bllModel);
    final result = mapper
        .map<wcb.DefaultProcessingResult, DefaultProcessingResult>(bllResult);

    switch (result.errorCode) {
      case ErrorCode.OK:
        navigationService.navigateToRoot(WatcherRoutePart.home());
        break;
      default:
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('An error happened.'),
            content: const Text(
                'An error happened on attempt to sign in. Please check input data and try again.'),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'))
            ],
          ),
        );
        break;
    }
  }

  Widget _getSignUpTabContent(BuildContext context) {
    return Column(
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
            Text('Please fill all boxes with your data.'),
          ],
        ),
        const SizedBox(height: 24),
        const Text('Login'),
        TextField(
          onChanged: (value) => _signUpEmail = value,
          autocorrect: false,
        ),
        const SizedBox(height: 16),
        const Text('Password'),
        TextField(
          onChanged: (value) => _signUpPassword = value,
          obscureText: true,
          autocorrect: false,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () => _onSignUpRequested(context),
                child: const Text('Sign Up'))
          ],
        )
      ],
    );
  }

  void _onSignUpRequested(BuildContext context) async {
    final bllModel = mapper
        .map<AddUser, wcb.AddUser>(AddUser(_signUpEmail, _signUpPassword));
    final bllResult = await userService.add(bllModel);
    final result = mapper
        .map<wcb.DefaultProcessingResult, DefaultProcessingResult>(bllResult);

    switch (result.errorCode) {
      case ErrorCode.OK:
        navigationService.navigateToRoot(WatcherRoutePart.home());
        break;
      default:
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('An error happened.'),
            content: const Text(
                'An error happened on attempt to sign in. Please check input data and try again.'),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'))
            ],
          ),
        );
        break;
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    return Center(
        child: Container(
            width: 400,
            height: 450,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white70),
            padding: const EdgeInsets.all(40),
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(tabs: [
                      Tab(
                          child: Text('Sign In',
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text('Sign Up',
                              style: TextStyle(color: Colors.black))),
                    ]),
                    Expanded(
                        child: TabBarView(
                      children: [
                        _getSignInTabContent(context),
                        _getSignUpTabContent(context)
                      ],
                    ))
                  ],
                )
            )
        )
    );
  }
}
