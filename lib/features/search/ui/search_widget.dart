import 'package:clean_architecture_example/features/search/bloc/search_bloc.dart';
import 'package:clean_architecture_example/features/search/ui/search_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc(),
      child: SearchPresenter(),
    );
  }
}
