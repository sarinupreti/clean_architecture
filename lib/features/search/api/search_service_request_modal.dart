import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class SearchServiceRequestModel extends Equatable implements JsonRequestModel {
  final String artist;
  final String title;

  SearchServiceRequestModel(this.artist, this.title);

  @override
  Map<String, dynamic> toJson() {
    return {'artist': artist, 'title': title};
  }

  @override
  List<Object> get props => [artist, title];
}
