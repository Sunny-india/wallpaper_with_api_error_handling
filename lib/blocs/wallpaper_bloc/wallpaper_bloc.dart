import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_with_bloc/blocs/wallpaper_bloc/wallpaper_event.dart';
import 'package:wallpaper_with_bloc/blocs/wallpaper_bloc/wallpaper_state.dart';

import '../../api/api_helper.dart';
import '../../models/src_model.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  APIHelper apiHelper;
  WallpaperBloc({required this.apiHelper}) : super(WallpaperInitialState()) {
    on<FetchSearchWallpaperEvent>((event, emit) async {
      emit(WallpaperLoadingState());
      // per page work can be don here through this way
      // apiHelper.fetchAPI(url: '${searchPhotos}?per_page=20');
      //                         or
      // apiHelper.fetchAPI(url: '$searchPhotos${event.query}?per_page=20');
      var res =
          await apiHelper.fetchAPI(url: "$basicUrl${event.query}?per_page=20");
      try {
        emit(
            WallpaperLoadedState(dataPhotoModel: DataPhotoModel.fromJson(res)));
      } catch (e) {
        /// all those exception thrown created in MyException,
        /// and thrown in API class would be handled here
        emit(WallpaperErrorState(errorMessage: e.toString()));
      }
    });
  }
}
