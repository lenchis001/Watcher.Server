import 'package:client_app/navigation/watcher_route_information_parser.dart';
import 'package:client_app/navigation/watcher_router_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp.router(
      routeInformationParser: WatcherRouteInformationParser(),
      routerDelegate: WatcherRouterDelegate())
  );
}