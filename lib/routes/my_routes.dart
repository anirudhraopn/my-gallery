import 'package:flutter/material.dart';
import 'package:gallery_app/model/pixabay_image.dart';
import 'package:go_router/go_router.dart';

import 'package:gallery_app/screens/full_screen_view.dart';
import 'package:gallery_app/screens/gallery_screen.dart';

class MyRoutes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: GalleryScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const GalleryScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: FullScreenView.routeName.name,
            builder: (BuildContext context, GoRouterState state) {
              final image = state.extra as PixabayImage;
              return FullScreenView(
                image: image,
              );
            },
          ),
        ],
      ),
    ],
  );
}

extension PathExtension on String{
  String get path => "/$this";
  String get name => substring(1);
}