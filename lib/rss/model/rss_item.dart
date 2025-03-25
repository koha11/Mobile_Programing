import 'package:anhkhoa_flutter_app/rss/model/rss_resource.dart';

class RssItem {
  String? title, description, pubDate, link, imageUrl;

  RssItem.empty();

  RssItem fromJson(Map<String, dynamic> json, RssResource resResource) {
    title = json["title"];
    link = json["link"];
    pubDate = json["pubDate"];
    imageUrl = getImageUrl(json['description'], resResource);
    description = getDescriptionUrl(json['description'], resResource);

    return this;
  }
}

String? getImageUrl(String rawDescription, RssResource resource) {
  String startRegex = resource.startImageRegrex;
  String endRegex = resource.endImageRegrex;
  int start = rawDescription.indexOf(startRegex) + startRegex.length;

  if (start >= startRegex.length) {
    if (endRegex.length > 0) {
      int end = rawDescription.indexOf(endRegex, start);

      return rawDescription.substring(start, end);
    }
    return rawDescription.substring(start);
  }

  return null;
}

String getDescriptionUrl(String rawDescription, RssResource resource) {
  String startRegex = resource.startDescriptionRegrex;
  String endRegex = resource.endDescriptionRegrex;
  int start = rawDescription.indexOf(startRegex) + startRegex.length;

  if (start >= startRegex.length) {
    if (endRegex.length > 0) {
      int end = rawDescription.indexOf(endRegex, start);

      return rawDescription.substring(start, end);
    }
    return rawDescription.substring(start);
  }

  return "";
}
