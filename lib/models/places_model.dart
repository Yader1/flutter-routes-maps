import 'dart:convert';

class PlacesResponse {
  final String type;
  //final List<String> query;
  final List<Feature> features;
  final String attribution;

  PlacesResponse({
    required this.type,
    //required this.query,
    required this.features,
    required this.attribution,
  });

  factory PlacesResponse.fromRawJson(String str) => PlacesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlacesResponse.fromJson(Map<String, dynamic> json) => PlacesResponse(
    type: json["type"],
    //query: List<String>.from(json["query"].map((x) => x)),
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    attribution: json["attribution"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    //"query": List<dynamic>.from(query.map((x) => x)),
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
    "attribution": attribution,
  };
}

class Feature {
  final String id;
  final String type;
  final List<String> placeType;
  final Properties properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String? language;
  final String placeName;
  final List<double> center;
  final Geometry geometry;
  final List<Context> context;

  Feature({
    required this.id,
    required this.type,
    required this.placeType,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    this.language,
    required this.placeName,
    required this.center,
    required this.geometry,
    required this.context,
  });

  factory Feature.fromRawJson(String str) => Feature.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    id: json["id"],
    type: json["type"],
    placeType: List<String>.from(json["place_type"].map((x) => x)),
    properties: Properties.fromJson(json["properties"]),
    textEs: json["text_es"],
    placeNameEs: json["place_name_es"],
    text: json["text"],
    language: json["language"],
    placeName: json["place_name"],
    center: List<double>.from(json["center"].map((x) => x?.toDouble())),
    geometry: Geometry.fromJson(json["geometry"]),
    context: List<Context>.from(json["context"].map((x) => Context.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "place_type": List<dynamic>.from(placeType.map((x) => x)),
    "properties": properties.toJson(),
    "text_es": textEs,
    "place_name_es": placeNameEs,
    "text": text,
    "language": language,
    "place_name": placeName,
    "center": List<dynamic>.from(center.map((x) => x)),
    "geometry": geometry.toJson(),
    "context": List<dynamic>.from(context.map((x) => x.toJson())),
  };
}

class Context {
  final String id;
  final String? mapboxId;
  final String textEs;
  final String? languageEs;
  final String text;
  final String? language;
  final String? wikidata;
  final String? shortCode;

  Context({
    required this.id,
    this.mapboxId,
    required this.textEs,
    this.languageEs,
    required this.text,
    this.language,
    this.wikidata,
    this.shortCode,
  });

  factory Context.fromRawJson(String str) => Context.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Context.fromJson(Map<String, dynamic> json) => Context(
    id: json["id"],
    mapboxId: json["mapbox_id"],
    textEs: json["text_es"],
    languageEs: json["language_es"],
    text: json["text"],
    language: json["language"],
    wikidata: json["wikidata"],
    shortCode: json["short_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mapbox_id": mapboxId,
    "text_es": textEs,
    "language_es": languageEs,
    "text": text,
    "language": language,
    "wikidata": wikidata,
    "short_code": shortCode,
  };
}

class Geometry {
  final String type;
  final List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromRawJson(String str) => Geometry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class Properties {
  final String mapboxId;
  final String? wikidata;

  Properties({
    required this.mapboxId,
    this.wikidata,
  });

  factory Properties.fromRawJson(String str) => Properties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    mapboxId: json["mapbox_id"],
    wikidata: json["wikidata"],
  );

  Map<String, dynamic> toJson() => {
    "mapbox_id": mapboxId,
    "wikidata": wikidata,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}