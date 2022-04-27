import 'package:client_app/navigation/watcher_route_stack.dart';
import 'package:flutter/material.dart';

class WatcherRouterDelegate extends RouterDelegate<WatcherRouteStack> {
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: currentConfiguration?.toPages() ?? WatcherRouteStack.defaultStack().toPages(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
            return false;
        }

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
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(WatcherRouteStack configuration) {
    return Future.value();
  }

}