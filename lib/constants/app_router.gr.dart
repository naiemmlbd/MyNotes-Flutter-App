// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:mynotes/services/crud/models/database_note.dart' as _i9;
import 'package:mynotes/views/app_screen.dart' as _i1;
import 'package:mynotes/views/login_view.dart' as _i3;
import 'package:mynotes/views/notes/create_update_note_view.dart' as _i2;
import 'package:mynotes/views/notes/notes_view.dart' as _i4;
import 'package:mynotes/views/register_view.dart' as _i5;
import 'package:mynotes/views/verify_email_view.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AppScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppScreen(),
      );
    },
    CreateUpdateNoteRoute.name: (routeData) {
      final args = routeData.argsAs<CreateUpdateNoteRouteArgs>(
          orElse: () => const CreateUpdateNoteRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CreateUpdateNoteView(
          key: args.key,
          databaseNote: args.databaseNote,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginView(),
      );
    },
    NotesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NotesView(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterView(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.VerifyEmailView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppScreen]
class AppScreen extends _i7.PageRouteInfo<void> {
  const AppScreen({List<_i7.PageRouteInfo>? children})
      : super(
          AppScreen.name,
          initialChildren: children,
        );

  static const String name = 'AppScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CreateUpdateNoteView]
class CreateUpdateNoteRoute
    extends _i7.PageRouteInfo<CreateUpdateNoteRouteArgs> {
  CreateUpdateNoteRoute({
    _i8.Key? key,
    _i9.DatabaseNote? databaseNote,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CreateUpdateNoteRoute.name,
          args: CreateUpdateNoteRouteArgs(
            key: key,
            databaseNote: databaseNote,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateUpdateNoteRoute';

  static const _i7.PageInfo<CreateUpdateNoteRouteArgs> page =
      _i7.PageInfo<CreateUpdateNoteRouteArgs>(name);
}

class CreateUpdateNoteRouteArgs {
  const CreateUpdateNoteRouteArgs({
    this.key,
    this.databaseNote,
  });

  final _i8.Key? key;

  final _i9.DatabaseNote? databaseNote;

  @override
  String toString() {
    return 'CreateUpdateNoteRouteArgs{key: $key, databaseNote: $databaseNote}';
  }
}

/// generated route for
/// [_i3.LoginView]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NotesView]
class NotesRoute extends _i7.PageRouteInfo<void> {
  const NotesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NotesRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterView]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.VerifyEmailView]
class VerifyEmailRoute extends _i7.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i7.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
