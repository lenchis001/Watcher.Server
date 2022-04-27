import 'package:freezed_annotation/freezed_annotation.dart';

part 'watcher_route_part.freezed.dart';

@freezed
class WatcherRoutePart with _$WatcherRoutePart {
  factory WatcherRoutePart.home() = _HomeWatcherRoutePart;
  factory WatcherRoutePart.signIn() = _SignInWatcherRoutePart;
  factory WatcherRoutePart.unknown() = _UnknownWatcherRoutePart;
}