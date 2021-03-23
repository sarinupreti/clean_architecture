import 'package:clean_architecture_example/features/search/model/search_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends Screen {
  final SearchViewModal viewModel;
  final Function onChangedArtistName;
  final Function onChangedSongTitle;
  final VoidCallback onTapSubmit;

  SearchScreen(
      {@required this.viewModel,
      @required this.onChangedArtistName,
      @required this.onChangedSongTitle,
      @required this.onTapSubmit});

  TextEditingController _songController = TextEditingController();
  TextEditingController _artistController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Songs"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: media.width * .01),
            _textFormField(
              key: Key('artist_key'),
              labelText: 'Artist Name',
              // hintText: viewModel.artist ?? "Name of the artist",
              textInputType: TextInputType.text,
              controller: _artistController,
              onChangeTextField: (value) {
                onChangedArtistName(value);
              },
            ),
            SizedBox(height: media.width * .02),
            _textFormField(
              key: Key('song_title_key'),
              labelText: 'Song Title',
              // hintText: viewModel.title ?? "Name of the song",
              textInputType: TextInputType.text,
              controller: _songController,
              onChangeTextField: (value) {
                onChangedSongTitle(value);
              },
            ),
            SizedBox(height: media.width * .10),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
              child: ElevatedButton(
                clipBehavior: Clip.hardEdge,
                child: Text('Submit'),
                onPressed: () {
                  return onTapSubmit;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormField(
      {Key key,
      String hintText,
      String labelText,
      TextInputType textInputType,
      TextEditingController controller,
      Function onChangeTextField}) {
    return TextFormField(
      key: key,
      enableInteractiveSelection: false,
      keyboardType: textInputType,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
      onChanged: (value) {
        onChangeTextField(value);
      },
    );
  }
}
