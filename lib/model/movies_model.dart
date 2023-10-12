//variables
//constructors
//map => to
//map <= from
/*class StudentModel{
  String ?name;
  double ? age;
  StudentModel({this.name,required this.age});

  Map<String,dynamic> toJson(){
    final  map=<String,dynamic>{};
      map["name"]=this.name;
      map["age"]=this.age;
    return map;//bb3tlo map
  }

  fromJson(Map map){ //gayly map 3ayza a5znha
    name=map["name"];
    age=map["age"];
  }


}*/

class MoviesModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MoviesModel({this.page, this.results, this.totalPages, this.totalResults});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

/*class Movie {
  ///variables
  final int id;
  final String name;
  final String image;
  final dynamic rate;
  final String date;
  final String overview;
  final bool adult;
  final dynamic popularity;

  ///constructor
  Movie({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.date,
    required this.overview,
    required this.adult,
    required this.popularity,
  });

  ///factory constructor
  factory Movie.fromJson(Map<String, dynamic> jsonData) {
    return Movie(
      name: jsonData['title'] ?? '',
      image: ("https://image.tmdb.org/t/p/w500" + jsonData['poster_path']),
      rate: jsonData['vote_average']??0.0,
      date: jsonData['release_date'] ?? '',
      overview: jsonData['overview'] ?? '',
      adult: jsonData['adult'] ?? false,
      id: jsonData['id']??0,
      popularity: jsonData['popularity']??0.0,
    );
  }

  ///to map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    return <String, dynamic>{
      map['original_title']: name,
      map['poster_path']: image,
      map['vote_average']: rate,
      map['release_date']: date,
      map['overview']: overview,
      map['adult']: adult,
      map['id']: id,
      map['popularity']: popularity,
    };
  }
}*/

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  dynamic voteAverage;
  dynamic voteCount;

  Results(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = "https://image.tmdb.org/t/p/w500"+json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult??false;
    data['backdrop_path'] = this.backdropPath??'';
    data['genre_ids'] = this.genreIds??[];
    data['id'] = this.id??0;
    data['original_language'] = this.originalLanguage??'';
    data['original_title'] = this.originalTitle??'';
    data['overview'] = this.overview??'';
    data['popularity'] = this.popularity??0.0;
    data['poster_path'] = this.posterPath??'';
    data['release_date'] = this.releaseDate??'';
    data['title'] = this.title??'';
    data['video'] = this.video??false;
    data['vote_average'] = this.voteAverage??'';
    data['vote_count'] = this.voteCount??'';
    return data;
  }
}
