import 'package:clean_architecture_example/features/search/bloc/search_service_adapter.dart';
import 'package:clean_architecture_example/features/search/model/search_entity.dart';
import 'package:clean_architecture_example/features/search/model/search_view_model.dart';
import 'package:clean_architecture_example/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SearchUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;
  SearchUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<SearchEntity>();
    if (_scope == null) {
      final newAccountDetailEntity = SearchEntity();
      _scope = ExampleLocator()
          .repository
          .create<SearchEntity>(newAccountDetailEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, SearchServiceAdapter());
  }

  void submit() async {
    final entity = ExampleLocator().repository.get<SearchEntity>(_scope);
    if (entity.artist == "Adele" || entity.title == "Rolling in the deep") {
      _viewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
    } else {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, SearchServiceAdapter());
    }
  }

  void updateArtist(String artistName) async {
    final entity = ExampleLocator().repository.get<SearchEntity>(_scope);
    final updatedEntity = entity.merge(artist: artistName);
    ExampleLocator().repository.update<SearchEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModel(updatedEntity));
  }

  void updateSongTitle(String songTitle) async {
    final entity = ExampleLocator().repository.get<SearchEntity>(_scope);

    final updatedEntity = entity.merge(title: songTitle);
    ExampleLocator().repository.update<SearchEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModel(updatedEntity));
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  SearchViewModal buildViewModel(SearchEntity entity) {
    return SearchViewModal(
      title: entity.title,
      artist: entity.artist,
    );
  }

  SearchViewModal buildViewModelForLocalUpdateWithError(SearchEntity entity) {
    return SearchViewModal(
        title: entity.title,
        artist: entity.artist,
        dataStatus: DataStatus.invalid);
  }
}
