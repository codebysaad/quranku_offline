import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_offline/pages/home_page.dart';
import 'package:quran_offline/routes/const_routes.dart';

import '../pages/error_page.dart';

class MyRoutesApp {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: MyConstRoutes.homeRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return const MaterialPage(child: HomePage());
          },
        ),
        // GoRoute(
        //   name: MyConstRoutes.profileRouteName,
        //   path: '/profile/:username/:userid',
        //   pageBuilder: (context, state) {
        //     return MaterialPage(
        //         child: Profile(
        //           userid: state.params['userid']!,
        //           username: state.params['username']!,
        //         ));
        //   },
        // ),
        // GoRoute(
        //   name: MyConstRoutes.aboutRouteName,
        //   path: '/about',
        //   pageBuilder: (context, state) {
        //     return const MaterialPage(child: About());
        //   },
        // ),
        // GoRoute(
        //   name: MyConstRouteserror_page.dart.contactUsRouteName,
        //   path: '/contact_us',
        //   pageBuilder: (context, state) {
        //     return const MaterialPage(child: ContactUS());
        //   },
        // )
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      },
    );
    return router;
  }
}