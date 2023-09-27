abstract class WallpaperEvent {}

class FetchSearchWallpaperEvent extends WallpaperEvent {
  FetchSearchWallpaperEvent({required this.query});
  String query;
}

class FetchTrendingWallpaperEvent extends WallpaperEvent {
  FetchTrendingWallpaperEvent({required this.query});
  String query;
}
