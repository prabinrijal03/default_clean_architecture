import 'package:flutter/material.dart';

import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/splash/splash_page.dart';

enum AppRoute {
  splashPage('/', SplashPage()),
  homePage('/home', HomePage());

  final String path;
  final Widget page;
  const AppRoute(this.path, this.page);
  static AppRoute get initialRoute => AppRoute.splashPage;
  static final _routeNameMap = AppRoute.values.asNameMap();
  static final _routePathMap = Map.fromEntries(
    _routeNameMap.entries.map(
      (entry) => MapEntry(entry.value.path, entry.value),
    ),
  );
  static AppRoute? fromName(String? name) => _routePathMap[name];

  static Widget _getWidget(
    RouteSettings routeSettings,
  ) {
    final routeSettingsName = routeSettings.name;
    return AppRoute.fromName(routeSettingsName)?.page ?? undefinedRoute();
  }

  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    return MaterialPageRoute(
      builder: (context) => _getWidget(routeSettings),
    );
  }

  static Widget undefinedRoute() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('No route found'),
      ),
      body: const Center(
        child: Text('No route found'),
      ),
    );
  }
}
