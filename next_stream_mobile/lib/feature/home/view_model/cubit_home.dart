import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_stream_mobile/feature/home/view_model/state_home.dart';
import 'package:next_stream_mobile/product/dependency_injection/get.dart';
import 'package:next_stream_mobile/product/network/core/i_network_manager.dart';
import 'package:next_stream_mobile/product/network/core/response/app_response_result.dart';
import 'package:next_stream_mobile/product/network/request/request_get_all_videos.dart';

/// The business logic component for the home screen.
class CubitHome extends Cubit<StateHome> {
  /// Creates the CubitHome instance.
  CubitHome({
    INetworkManager? networkManager,
  }) : super(const StateHomeInitial()) {
    _nm = networkManager ?? G.networkManager;
  }

  late final INetworkManager _nm;

  /// Loads the videos from the api. Until this function is called, the state
  /// will be [StateHomeInitial].
  Future<void> loadVideos() async {
    final response = await _nm.request(const RequestGetAllVideos());

    // emit error if the response is an error
    if (response is AppResponseResultError) {
      final errorResponse = response.asError;
      emit(StateHomeError(message: errorResponse.message));
      return;
    }

    // emit unknown error if the response is not success
    if (response is! AppResponseResultSuccess) {
      emit(const StateHomeError(message: 'Unknown error'));
      return;
    }

    // emit the loaded state if the response is success
    final videos = response.asSuccess.data.videos;
    emit(StateHomeLoaded(videos: videos));
  }
}
