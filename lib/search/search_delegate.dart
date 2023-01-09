import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Text('builactions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('build leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('build suggestions: $query');
  }
}
