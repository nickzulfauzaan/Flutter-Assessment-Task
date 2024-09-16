import 'package:html/parser.dart' show parse;

class Novel {
  final String title;
  final String author;
  final DateTime? publication;
  final String? genre;
  final double? ratings;
  final String? summary;
  final Cover? cover;

  Novel({
    required this.title,
    required this.author,
    this.publication,
    this.genre,
    this.ratings,
    this.summary,
    this.cover,
  });

  factory Novel.fromJson(Map<String, dynamic> json) {
    String? parsedSummary;
    if (json['summary'] != null) {
      var document = parse(json['summary'] as String);
      parsedSummary = document.body?.text;
    }

    return Novel(
      title: json['title'] as String,
      author: json['author'] as String,
      publication: json['publication'] != null
          ? DateTime.parse(json['publication'] as String)
          : null,
      genre: json['genre'] as String?,
      ratings:
          json['ratings'] != null ? (json['ratings'] as num).toDouble() : null,
      summary: parsedSummary,
      cover: json['cover'] != null
          ? Cover.fromJson(json['cover'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Cover {
  final Formats? formats;

  Cover({this.formats});

  factory Cover.fromJson(Map<String, dynamic> json) {
    return Cover(
      formats: json['formats'] != null
          ? Formats.fromJson(json['formats'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Formats {
  final Medium? medium;

  Formats({this.medium});

  factory Formats.fromJson(Map<String, dynamic> json) {
    return Formats(
      medium: json['medium'] != null
          ? Medium.fromJson(json['medium'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Medium {
  final String url;

  Medium({required this.url});

  factory Medium.fromJson(Map<String, dynamic> json) {
    return Medium(
      url: json['url'] as String,
    );
  }
}
