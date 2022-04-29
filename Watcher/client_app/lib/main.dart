import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/navigation_service.dart';
import 'package:client_app/navigation/watcher_route_information_parser.dart';
import 'package:client_app/navigation/watcher_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  var container = GetIt.asNewInstance();
  initDependencies(container);

  runApp(MaterialApp.router(
      routeInformationParser: container.get<WatcherRouteInformationParser>(),
      routerDelegate: container.get<WatcherRouterDelegate>())
  );
}

void initDependencies(GetIt container) {
  container.registerSingleton<INavigationService>(NavigationService());
  container.registerSingleton(WatcherRouteInformationParser(container.get()));
  container.registerSingleton(WatcherRouterDelegate(container.get()));
}