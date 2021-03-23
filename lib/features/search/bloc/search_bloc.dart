import 'package:clean_architecture_example/features/search/api/search_service.dart';
import 'package:clean_architecture_example/features/search/bloc/search_usecase.dart';
import 'package:clean_architecture_example/features/search/model/search_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class SearchBloc extends Bloc {
  SearchUseCase _searchUseCase;

  final searchViewModelPipe = Pipe<SearchViewModal>();
  final submitPipe = EventPipe();
  final artistPipe = Pipe<String>();
  final titlePipe = Pipe<String>();

  SearchBloc({SearchService searchService}) {
    _searchUseCase =
        SearchUseCase((viewModel) => searchViewModelPipe.send(viewModel));
    searchViewModelPipe.whenListenedDo(() {
      _searchUseCase.create();
    });
    artistPipe.receive.listen(userNameInputHandler);
    titlePipe.receive.listen(passwordInputHandler);
    submitPipe.listen(submitHandler);
  }

  void submitHandler() {
    _searchUseCase.submit();
  }

  void userNameInputHandler(String artistName) {
    _searchUseCase.updateArtist(artistName);
  }

  void passwordInputHandler(String songTitle) {
    _searchUseCase.updateSongTitle(songTitle);
  }

  @override
  void dispose() {
    searchViewModelPipe.dispose();
    submitPipe.dispose();
  }
}
