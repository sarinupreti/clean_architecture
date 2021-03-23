import 'package:clean_framework/clean_framework.dart';

class SearchViewModal extends ViewModel {
  final String title;
  final String artist;
  final serviceStatus;
  final dataStatus;

  SearchViewModal(
      {this.title,
      this.artist,
      this.serviceStatus = ServiceStatus.unknown,
      this.dataStatus = DataStatus.unknown})
      : assert(artist != null && title != null);

  @override
  List<Object> get props => [title, artist];
}

enum ServiceStatus { success, fail, unknown }
enum DataStatus { valid, invalid, unknown }
