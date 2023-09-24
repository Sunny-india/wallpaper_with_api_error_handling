import 'package:wallpaper_with_bloc/models/src_model.dart';

abstract class WallpaperState {}

class WallpaperInitialState extends WallpaperState {}

class WallpaperLoadingState extends WallpaperState {}

class WallpaperLoadedState extends WallpaperState {
  WallpaperLoadedState({required this.dataPhotoModel});
  DataPhotoModel dataPhotoModel;
}

class WallpaperErrorState extends WallpaperState {
  WallpaperErrorState({required this.errorMessage});
  String? errorMessage;
}
