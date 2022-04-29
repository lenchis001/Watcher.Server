import 'package:client_app/navigation/watcher_route_part.dart';
import 'package:event/event.dart';
import 'watcher_route_part.dart';

abstract class INavigationService {
  Event<WatcherRoutePart> navigationEvent, navigationToRootEvent;
  Event navigationBackEvent;
  void navigateTo(WatcherRoutePart routePart);
  void navigateToRoot(WatcherRoutePart routePart);
  void navigateBack();
  INavigationService():
        navigationEvent = Event<WatcherRoutePart>(),
        navigationToRootEvent = Event<WatcherRoutePart>(),
        navigationBackEvent = Event();
}