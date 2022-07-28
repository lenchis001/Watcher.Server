import 'package:client_app/navigation/inavigation_service.dart';
import 'package:client_app/navigation/watcher_route_part.dart';

class NavigationService extends INavigationService {
  @override
  void navigateBack() {
    navigationBackEvent.broadcast();
  }

  @override
  void navigateTo(WatcherRoutePart routePart) {
    navigationEvent.broadcast(routePart);
  }

  @override
  void navigateToRoot(WatcherRoutePart routePart) {
    navigationToRootEvent.broadcast(routePart);
  }

}