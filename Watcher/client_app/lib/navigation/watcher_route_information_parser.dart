import 'package:automap/automap.dart';
import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/watcher_route_stack.dart';
import 'package:flutter/material.dart';
import 'package:watcher_client_bll/watcher_client_bll.dart';

class WatcherRouteInformationParser extends RouteInformationParser<WatcherRouteStack> {
  final INavigationService navigationService;
  final IUserService userService;
  final AutoMapper mapper;

  WatcherRouteInformationParser({
    required this.navigationService,
    required this.userService,
    required this.mapper
  });

  @override
  Future<WatcherRouteStack> parseRouteInformation(RouteInformation routeInformation) {
    var uri = Uri.parse(routeInformation.location ?? '');
    return Future.value(
        WatcherRouteStack.fromPathSegments(
            navigationService: navigationService,
            userService: userService,
            mapper: mapper,
            pathSegments: uri.pathSegments
        )
    );
  }

  @override
  RouteInformation? restoreRouteInformation(WatcherRouteStack configuration) {
    return configuration.toRouteInformation();
  }
}