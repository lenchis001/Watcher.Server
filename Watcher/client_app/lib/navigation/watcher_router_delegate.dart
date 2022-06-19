import 'package:automap/automap.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/watcher_route_stack.dart';
import 'package:flutter/material.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart';

class WatcherRouterDelegate extends RouterDelegate<WatcherRouteStack>
    with ChangeNotifier {
  final INavigationService navigationService;
  final IUserService userService;
  final ITestService testService;
  final AutoMapper mapper;

  WatcherRouteStack? _currentConfiguration;

  @override
  WatcherRouteStack get currentConfiguration =>
      _currentConfiguration ??
      WatcherRouteStack.defaultStack(
          navigationService: navigationService,
          userService: userService,
          testService: testService,
          mapper: mapper);

  WatcherRouterDelegate(
      {required this.navigationService,
      required this.userService,
      required this.testService,
      required this.mapper}) {
    _currentConfiguration = WatcherRouteStack.defaultStack(
        navigationService: navigationService,
        userService: userService,
        testService: testService,
        mapper: mapper);
    navigationService.navigationEvent.subscribe((args) {
      if (args == null) return;
      currentConfiguration.navigationHistory.add(args);
      notifyListeners();
    });

    navigationService.navigationToRootEvent.subscribe((args) {
      if (args == null) return;
      currentConfiguration.navigationHistory.clear();
      currentConfiguration.navigationHistory.add(args);
      notifyListeners();
    });

    navigationService.navigationBackEvent.subscribe((args) {
      if (args == null) return;
      currentConfiguration.navigationHistory.removeLast();
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: currentConfiguration.toPages(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        currentConfiguration.navigationHistory.removeLast();
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<bool> popRoute() {
    print('On back requested');
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  Future<void> setNewRoutePath(WatcherRouteStack configuration) {
    _currentConfiguration = configuration;
    notifyListeners();

    return Future.value();
  }
}
