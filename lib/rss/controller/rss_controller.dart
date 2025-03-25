import 'dart:convert';

import 'package:anhkhoa_flutter_app/rss/model/rss_item.dart';
import 'package:anhkhoa_flutter_app/rss/model/rss_resource.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class RssController extends GetxController {
  String? currentUrl;
  int currentResIndex = 0;
  List<RssResource> currentResources = rssResource;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentUrl =
        currentResources[currentResIndex].resourceHeaders.values.toList()[0];
  }

  void changeRss({required int newIndex}) {
    currentResIndex = newIndex;
    currentUrl =
        currentResources[currentResIndex].resourceHeaders.values.toList()[0];

    refresh();
  }

  void refresh() {
    update(["rss"]);
  }

  Future<List<RssItem>> readRss() async {
    var response = await http.get(Uri.parse(currentUrl!));

    if (response.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(utf8.decode(response.bodyBytes));

      String body = xml2json.toParker();

      var data = json.decode(body)["rss"]["channel"]["item"] as List;

      return data
          .map(
            (e) =>
                RssItem.empty().fromJson(e, currentResources[currentResIndex]),
          )
          .toList();
    }

    return Future.error("Loi doc rss");
  }
}
