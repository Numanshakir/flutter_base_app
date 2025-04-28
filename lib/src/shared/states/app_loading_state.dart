import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_loading_state.freezed.dart';
@freezed
abstract class AppLoadingState with _$AppLoadingState{
  const factory AppLoadingState() = _initialized;
  const factory AppLoadingState.loading() = LoadingState;
  const factory AppLoadingState.error() = ErrorState;
}
