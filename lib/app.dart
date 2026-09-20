import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'core/location/location_service.dart';
import 'core/key_manager/key_store.dart';
import 'core/storage/path_resolver.dart';
import 'data/models/database.dart';
import 'data/repositories/map_repository.dart';
import 'features/map/bloc/map_bloc.dart';
import 'features/annotation/bloc/annotation_bloc.dart';
import 'features/track/bloc/track_bloc.dart';
import 'features/offline/bloc/offline_bloc.dart';
import 'features/folder/bloc/folder_bloc.dart';
import 'features/coordinate/bloc/coordinate_bloc.dart';
import 'features/settings/bloc/settings_bloc.dart';
import 'features/settings/bloc/settings_event.dart';
import 'features/search/bloc/search_bloc.dart';
import 'pages/map_page.dart';
import 'pages/folder_page.dart';
import 'pages/offline_page.dart';
import 'pages/coordinate_page.dart';
import 'pages/settings_page.dart';

class SurveyMapApp extends StatelessWidget {
  final AppDatabase database;
  final PathResolver pathResolver;

  const SurveyMapApp({super.key, required this.database, required this.pathResolver});

  @override
  Widget build(BuildContext context) {
    final repository = MapRepository(database);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MapBloc(repository)),
        BlocProvider(create: (_) => AnnotationBloc(repository)),
        BlocProvider(create: (_) => TrackBloc(repository, LocationService())),
        BlocProvider(create: (_) => OfflineBloc(repository, pathResolver)),
        BlocProvider(create: (_) => FolderBloc(repository)),
        BlocProvider(create: (_) => CoordinateBloc()),
        BlocProvider(create: (_) => SettingsBloc(KeyStore())..add(const SettingsLoaded())),
        BlocProvider(create: (_) => SearchBloc(repository)),
      ],
      child: MaterialApp(
        title: '测绘地图',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const MapPage(),
          '/folders': (context) => const FolderPage(),
          '/offline': (context) => const OfflinePage(),
          '/coordinate': (context) => const CoordinatePage(),
          '/settings': (context) => const SettingsPage(),
        },
      ),
    );
  }
}
