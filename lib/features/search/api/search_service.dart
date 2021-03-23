import 'package:clean_architecture_example/features/search/api/search_service_request_modal.dart';
import 'package:clean_architecture_example/features/search/api/search_service_response_modal.dart';
import 'package:clean_architecture_example/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class SearchService extends EitherService<SearchServiceRequestModel,
    SearchServiceResponseModel> {
  SearchService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().api,
            path: 'search-song');

  @override
  SearchServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return SearchServiceResponseModel.fromJson(jsonResponse);
  }
}
