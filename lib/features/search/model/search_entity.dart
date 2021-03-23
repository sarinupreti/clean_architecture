import 'package:clean_framework/clean_framework.dart';

class SearchEntity extends Entity {
  final String artist;
  final String title;

  SearchEntity({
    List<EntityFailure> errors = const [],
    this.artist = "Adele",
    this.title = "Rolling in the deep",
  }) : super(errors: errors);

  @override
  List<Object> get props => [errors, artist, title];

  @override
  merge({
    errors,
    String artist,
    String title,
  }) {
    return SearchEntity(
      errors: errors ?? this.errors,
      artist: artist ?? this.artist,
      title: title ?? this.title,
    );
  }
}
