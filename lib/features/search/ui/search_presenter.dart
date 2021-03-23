import 'package:clean_architecture_example/features/search/bloc/search_bloc.dart';
import 'package:clean_architecture_example/features/search/model/search_view_model.dart';
import 'package:clean_architecture_example/features/search/ui/search_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SearchPresenter
    extends Presenter<SearchBloc, SearchViewModal, SearchScreen> {
  @override
  Stream<SearchViewModal> getViewModelStream(SearchBloc bloc) {
    return bloc.searchViewModelPipe.receive;
  }

  @override
  SearchScreen buildScreen(
      BuildContext context, SearchBloc bloc, SearchViewModal viewModel) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (viewModel.serviceStatus == ServiceStatus.success) {
        _navigateToDetailScreen(context);
      } else if (viewModel.serviceStatus == ServiceStatus.fail) {
        _showErrorDialog(context);
      } else if (viewModel.dataStatus == DataStatus.invalid) {
        _showInvalidDataDialog(context);
      }
    });
    return SearchScreen(
      viewModel: viewModel,
      onChangedArtistName: (value) {
        _onChangeArtist(value, bloc);
      },
      onChangedSongTitle: (value) {
        _onChangeSongTtile(value, bloc);
      },
      onTapSubmit: () {
        _onTapSubmit(bloc);
      },
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _onChangeArtist(String text, SearchBloc bloc) {
    bloc.artistPipe.send(text);
  }

  void _onChangeSongTtile(String text, SearchBloc bloc) {
    bloc.titlePipe.send(text);
  }

  void _onTapSubmit(SearchBloc bloc) {
    bloc.submitPipe.launch();
  }

  void _navigateToDetailScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Success'),
        content: Text('Submit Succeeded'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.router.reset();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('Submit Failed'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showInvalidDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Invalid'),
        content: Text('Data entered is incorrect.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
