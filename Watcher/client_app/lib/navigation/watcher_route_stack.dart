import 'package:automap/automap.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/screens/add_test_page.dart';
import 'package:client_app/screens/home_page.dart';
import 'package:client_app/screens/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart';
import 'watcher_route_part.dart';

class WatcherRouteStack {
  final INavigationService navigationService;
  final IUserService userService;
  final ITestService testService;
  final ITestExecutionService testExecutionService;
  final AutoMapper mapper;

  static const String _homeSegmentName = 'home';
  static const String _signInSegmentName = 'signIn';
  static const String _unknownSegmentName = 'unknown';
  static const String _addTestSegmentName = 'addTest';

  final navigationHistory = List<WatcherRoutePart>.empty(growable: true);

  WatcherRouteStack.defaultStack(
      {required this.navigationService,
      required this.userService,
      required this.mapper,
      required this.testService,
      required this.testExecutionService}) {
    navigationHistory.add(WatcherRoutePart.signIn());
  }

  WatcherRouteStack.fromPathSegments(
      {required this.navigationService,
      required this.userService,
      required this.mapper,
      required this.testService,
      required this.testExecutionService,
      required List<String> pathSegments}) {
    if (pathSegments.isEmpty) {
      navigationHistory.add(WatcherRoutePart.signIn());
    } else {
      for (var segment in pathSegments) {
        switch (segment) {
          case _homeSegmentName:
            navigationHistory.add(WatcherRoutePart.home());
            break;
          case _signInSegmentName:
            navigationHistory.add(WatcherRoutePart.signIn());
            break;
          case _addTestSegmentName:
            navigationHistory.add(WatcherRoutePart.addTest());
            break;
          default:
            navigationHistory.add(WatcherRoutePart.unknown());
            break;
        }
      }
    }
  }

  List<MaterialPage> toPages() {
    return navigationHistory
        .map<MaterialPage>((e) => e.map(
            home: (_) => MaterialPage(
                    child: HomePage(
                  navigationService: navigationService,
                  testService: testService,
                  mapper: mapper,
                  testExecutionService: testExecutionService,
                )),
            signIn: (_) => MaterialPage(
                    child: SignInPage(
                  navigationService: navigationService,
                  userService: userService,
                  mapper: mapper,
                )),
            unknown: (_) => MaterialPage(
                    child: HomePage(
                  navigationService: navigationService,
                  testService: testService,
                  testExecutionService: testExecutionService,
                  mapper: mapper,
                )),
            addTest: (_) => MaterialPage(
                child: AddTestPage(
                    navigationService: navigationService,
                  testService: testService,
                  mapper: mapper,
                ))))
        .toList();
  }

  RouteInformation toRouteInformation() {
    final location = navigationHistory
        .map((e) => e.map(
            home: (_) => _homeSegmentName,
            signIn: (_) => _signInSegmentName,
            unknown: (_) => _unknownSegmentName,
            addTest: (_) => _addTestSegmentName))
        .join('/');

    return RouteInformation(location: location);
  }
}
