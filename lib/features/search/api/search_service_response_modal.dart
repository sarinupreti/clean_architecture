import 'package:clean_framework/clean_framework_defaults.dart';

class SearchServiceResponseModel extends JsonResponseModel {
  final String lyrics;

  SearchServiceResponseModel(
    this.lyrics,
  );

  SearchServiceResponseModel.fromJson(Map<String, dynamic> json)
      : lyrics = json['lyrics'] ?? '';

  @override
  List<Object> get props => [lyrics];
}
