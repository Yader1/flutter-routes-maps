import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchResult> {
  SearchDestinationDelegate():super(
    searchFieldLabel: 'Buscar...'
  );

  @override
  List<Widget>? buildActions(Object context) {
    return [
      IconButton(
        onPressed: (){
          query = '';
        }, 
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        var result = SearchResult(cancel: true);
        close(context, result);
      }, 
      icon: const Icon(Icons.arrow_back_ios)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final proximity = BlocProvider.of<LocationBloc>(context).state.lastKnownLocation!;

    searchBloc.getPlacesByQuery(
      proximity,
      query
    );
    
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (_, state) {
        return Text('Resultados: ${state.places.length}');
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.location_on_outlined, color: Colors.black),
          title: const Text(
            'Colocar la ubicacion mas manualmente', 
            style: TextStyle(
              color: Colors.black
            )
          ),
          onTap: (){
            var result = SearchResult(cancel: false, manual: true);
            close(context, result);
          },
        )
      ],
    );
  }

}