import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/screens/home_screen.dart';
import 'package:client_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'watcher_route_part.dart';

class WatcherRouteStack {
  final INavigationService _navigationService;

  static const String _homeSegmentName = 'home';
  static const String _signInSegmentName = 'signIn';
  static const String _unknownSegmentName = 'unknown';

  final navigationHistory = List<WatcherRoutePart>.empty(growable: true);

  WatcherRouteStack.defaultStack(this._navigationService) {
    navigationHistory.add(WatcherRoutePart.home());
  }

  WatcherRouteStack.fromPathSegments(this._navigationService, List<String> pathSegments) {
    if (pathSegments.isEmpty) {
      navigationHistory.add(WatcherRoutePart.home());
    } else {
      for (var segment in pathSegments) {
        switch (segment) {
          case _homeSegmentName:
            navigationHistory.add(WatcherRoutePart.home());
            break;
          case _signInSegmentName:
            navigationHistory.add(WatcherRoutePart.signIn());
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
            home: (_) => const MaterialPage(child: HomeScreen()),
            signIn: (_) => MaterialPage(child: SignInScreen(navigationService: _navigationService)),
            unknown: (_) => const MaterialPage(child: HomeScreen())))
        .toList();
  }

  RouteInformation toRouteInformation() {
    final location = navigationHistory.map((e) => e.map(
        home: (_) => _homeSegmentName,
        signIn: (_) => _signInSegmentName,
        unknown: (_) => _unknownSegmentName)
    ).join('/');

    return RouteInformation(location: location);
  }
}