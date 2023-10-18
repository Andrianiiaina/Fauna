import 'package:fauna_scan/animals/add_espece_screen.dart';
import 'package:fauna_scan/bibliotheque_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'parameters/parameter.dart';
import 'main.dart';

GoRouter routes = GoRouter(routes: [
  GoRoute(
      routes: [
        GoRoute(
            path: 'parameters',
            builder: (BuildContext context, GoRouterState state) =>
                const ParameterScreen()),
        GoRoute(
            path: 'condition',
            builder: (BuildContext context, GoRouterState state) =>
                const ConditionScreen()),
        GoRoute(
            path: 'mention',
            builder: (BuildContext context, GoRouterState state) =>
                const MentionScreen()),
        GoRoute(
            path: 'help',
            builder: (BuildContext context, GoRouterState state) =>
                const HelpScreen()),
        GoRoute(
            path: 'add_espece',
            builder: (BuildContext context, GoRouterState state) =>
                AddEspeceScreen()),
        GoRoute(
            path: 'bibliotheque',
            builder: (BuildContext context, GoRouterState state) =>
                BibliothequePage())
      ],
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const MyHomePage())
]);
