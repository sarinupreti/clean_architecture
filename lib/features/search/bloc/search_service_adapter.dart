import 'package:clean_architecture_example/features/search/api/search_service.dart';
import 'package:clean_architecture_example/features/search/api/search_service_request_modal.dart';
import 'package:clean_architecture_example/features/search/api/search_service_response_modal.dart';
import 'package:clean_architecture_example/features/search/model/search_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class SearchServiceAdapter extends ServiceAdapter<SearchEntity,
    SearchServiceRequestModel, SearchServiceResponseModel, SearchService> {
  SearchServiceAdapter() : super(SearchService());

  @override
  SearchServiceRequestModel createRequest(SearchEntity entity) {
    return SearchServiceRequestModel(entity.artist, entity.title);
  }

  @override
  SearchEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(errors: <EntityFailure>[]);
  }
}
