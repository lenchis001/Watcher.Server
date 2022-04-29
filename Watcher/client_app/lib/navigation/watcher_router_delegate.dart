import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/watcher_route_stack.dart';
import 'package:flutter/material.dart';

class WatcherRouterDelegate extends RouterDelegate<WatcherRouteStack> with ChangeNotifier {
  final INavigationService _navigationService;
  WatcherRouteStack? _currentConfiguration;

  @override
  WatcherRouteStack get currentConfiguration =>
      _currentConfiguration ?? WatcherRouteStack.defaultStack(_navigationService);

  WatcherRouterDelegate(this._navigationService) {
    _currentConfiguration = WatcherRouteStack.defaultStack(_navigationService);
    _navigationService.navigationEvent.subscribe((args) {
      if(args==null) return;
      currentConfiguration.navigationHistory.add(args);
      notifyListeners();
    });

    _navigationService.navigationToRootEvent.subscribe((args) {
      if(args==null) return;
      currentConfiguration.navigationHistory.clear();
      currentConfiguration.navigationHistory.add(args);
      notifyListeners();
    });


    _navigationService.navigationBackEvent.subscribe((args) {
      if(args==null) return;
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

        return true;
      },
    );
  }

  @override
  Future<bool> popRoute() {
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
