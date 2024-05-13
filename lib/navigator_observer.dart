import 'package:flutter/widgets.dart';
import 'package:openpanel_analytics/openpanel_analytics.dart';

/// A [NavigatorObserver] that reports page views to [Openpanel].
class OpenpanelNavigatorObserver extends NavigatorObserver {
  /// The [Openpanel] instance to report page views to.
  final Openpanel openpanel;

  /// Creates a [OpenpanelNavigatorObserver].
  OpenpanelNavigatorObserver(this.openpanel);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    openpanel.event(page: route.settings.name ?? '');
  }
}
