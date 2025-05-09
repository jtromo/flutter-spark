// status
// string
// If the request was successful or not. Options: ok, error. In the case of error a code and message property will be populated.

// totalResults
// int
// The total number of results available for your request. Only a limited number are shown at a time though, so use the page parameter in your requests to page through them.

// articles
// array[article]
// The results of the request.

// source
// object
// The identifier id and a display name name for the source this article came from.

// author
// string
// The author of the article

// title
// string
// The headline or title of the article.

// description
// string
// A description or snippet from the article.

// url
// string
// The direct URL to the article.

// urlToImage
// string
// The URL to a relevant image for the article.

// publishedAt
// string
// The date and time that the article was published, in UTC (+000)

// content
// string
// The unformatted content of the article, where available. This is truncated to 200 chars.

import 'package:equatable/equatable.dart';

class Article extends Equatable {
  // late String source;
  late String? author;
  late String? title;
  late String? description;
  late String? url;
  late String? urlToImage;
  late String? publishedAt;
  late String? content;

  Article(
      {
      // required this.source,
      required this.author,
      required this.title,
      required this.description,
      this.url,
      this.urlToImage,
      required this.publishedAt,
      required this.content});

  Article.fromJson(Map<String, dynamic> json) {
    // source = json['source'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['source'] = source;
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }

  int get id => hashCode;

  @override
  int get hashCode {
    return Object.hashAll([author, title, description, url, urlToImage, publishedAt, content]);
  }

  @override
  List<Object?> get props => [author, title, description, url, urlToImage, publishedAt, content];

  @override
  bool operator ==(Object other) {
    return super == other;
  }
}
