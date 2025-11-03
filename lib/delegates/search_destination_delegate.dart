import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        final places = state.places;

        return ListView.separated(
          itemCount: places.length,
          itemBuilder: (_, i){
            final place = places[i];

            return ListTile(
              title: Text(place.text),
              subtitle: Text(place.placeName),
              leading: const Icon(Icons.place_outlined, color: Colors.black),
              onTap: (){
                var result = SearchResult(
                  cancel: false, 
                  manual: false, 
                  position: LatLng(place.center[1], place.center[0]),
                  name: place.text,
                  description: place.placeName
                );

                searchBloc.add(AddToHistoryEvent(place));
                close(context, result);
              }
            );
          }, 
          separatorBuilder: (_, i) => const Divider(), 
        );
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final history = BlocProvider.of<SearchBloc>(context).state.history;

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
        ),
        ...history.map(
          (place) => ListTile(
            leading: const Icon(Icons.history, color: Colors.black),
            title: Text(
              place.text, 
              style: const TextStyle(
                color: Colors.black
              )
            ),
            subtitle: Text(place.placeName),
            onTap: (){
              var result = SearchResult(
                cancel: false, 
                manual: false, 
                position: LatLng(place.center[1], place.center[0]),
                name: place.text,
                description: place.placeName
              );
              close(context, result);
            },
          )
        )
      ],
    );
  }
}