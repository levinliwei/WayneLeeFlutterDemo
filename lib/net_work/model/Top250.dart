import 'package:flutter_waynelee/page/stone_json.dart';

class Top250 {
  String title;
  int total;
  List<MovieSubjects> subjects;

  Top250.fromJson(StoneJson json) {
    title = json['title'].stringValue();
    total = json['total'].intValue();
    subjects = json['subjects']
        .listValue().map((json) => MovieSubjects.fromJson(json)).toList();
  }
}

class MovieSubjects {
  Rating rating;
  List<String> genres;
  String title;
  int collect_count;
  String original_title;
  String subtype;
  String year;
  String alt;
  String id;
  List<PeopleDetail> casts;
  List<PeopleDetail> directors;
  List<ImagesDetail> images;

  MovieSubjects.fromJson(StoneJson json) {
    rating = json['rating'].data;
    genres = json['genres'].listValue().map((json) => json).toList();
    title = json['title'].stringValue();
    collect_count = json['collect_count'].intValue();
    original_title = json['original_title'].stringValue();
    subtype = json['subtype'].stringValue();
    year = json['year'].stringValue();
    alt = json['alt'].stringValue();
    id = json['id'].stringValue();
    casts = json['casts']
        .listValue().map((json) => PeopleDetail.fromJson(json)).toList();
    directors = json['directors']
        .listValue().map((json) => PeopleDetail.fromJson(json)).toList();
    images = json['images']
        .listValue().map((json) => ImagesDetail.fromJson(json)).toList();
  }
}

class Rating {
  String max;
  String average;
  String stars;
  String min;

  Rating.fromJson(StoneJson json) {
    max = json['max'].stringValue();
    average = json['average'].stringValue();
    stars = json['stars'].stringValue();
    min = json['min'].stringValue();
  }
}

class PeopleDetail {
  String alt;
  ImagesDetail avatars;
  String name;
  String id;

  PeopleDetail.fromJson(StoneJson json) {
    alt = json['alt'].stringValue();
    avatars = json['avatars'].data;
    name = json['name'].stringValue();
    id = json['id'].stringValue();
  }
}

class ImagesDetail {
  String small;
  String large;
  String medium;

  ImagesDetail.fromJson(StoneJson json) {
    small = json['small'].stringValue();
    large = json['large'].stringValue();
    medium = json['medium'].stringValue();
  }
}
