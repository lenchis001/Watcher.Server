import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/watcher_route_stack.dart';
import 'package:flutter/material.dart';

class WatcherRouteInformationParser extends RouteInformationParser<WatcherRouteStack> {
  final INavigationService _navigationService;

  WatcherRouteInformationParser(this._navigationService);

  @override
  Future<WatcherRouteStack> parseRouteInformation(RouteInformation routeInformation) {
    var uri = Uri.parse(routeInformation.location ?? '');
    return Future.value(WatcherRouteStack.fromPathSegments(_navigationService, uri.pathSegments));
  }

  @override
  RouteInformation? restoreRouteInformation(WatcherRouteStack configuration) {
    return configuration.toRouteInformation();
  }
}