class Movie {
  final List<Search>? dataList;
  final String? totalResult;
  final String? response;

  Movie(
      {required this.totalResult,
      required this.response,
      required this.dataList});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      totalResult: json['totalResults'] as String? ?? '',
      response: json['Response'] as String? ?? '',
      dataList: json['Search'] == null
          ? []
          : (json['Search'] as List<dynamic>)
              .map((e) => Search.fromJson(e))
              .toList());
}

class Search {
  final String? title;
  final String? year;
  final String? type;
  final String? poster;

  Search(
      {required this.title,
      required this.year,
      required this.type,
      required this.poster});

  factory Search.fromJson(Map<String, dynamic> json) => Search(
      title: json['Title'] as String? ?? '',
      year: json['Year'] as String? ?? '',
      type: json['Type'] as String? ?? '',
      poster: json['Poster'] as String? ?? '');
}
