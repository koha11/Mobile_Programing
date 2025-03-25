class RssResource {
  String id, name;
  String startDescriptionRegrex, endDescriptionRegrex;
  String startImageRegrex, endImageRegrex;
  Map<String, String> resourceHeaders;
  // Key: ten dau muc
  // Value: url cua no

  RssResource(
      {required this.id,
      required this.name,
      required this.startDescriptionRegrex,
      required this.endDescriptionRegrex,
      required this.startImageRegrex,
      required this.endImageRegrex,
      required this.resourceHeaders});
}

List<RssResource> rssResource = [
  RssResource(
      id: 'vnexpress',
      name: 'VN Express',
      startDescriptionRegrex: "</a></br>",
      endDescriptionRegrex: "",
      startImageRegrex: '<img src="',
      endImageRegrex: '"',
      resourceHeaders: {
        "Trang chủ": "https://vnexpress.net/rss/tin-moi-nhat.rss",
        "Thế giới": "https://vnexpress.net/rss/the-gioi.rss",
        "Giáo dục": "https://vnexpress.net/rss/giao-duc.rss",
        "Giải trí": "https://vnexpress.net/rss/giai-tri.rss",
        "Thể thao": "https://vnexpress.net/rss/the-thao.rss",
        "Tâm sự": "https://vnexpress.net/rss/tam-su.rss",
        "số hóa": "https://vnexpress.net/rss/cong-nghe.rss",
        "Xe": "https://vnexpress.net/rss/oto-xe-may.rss",
        "Cười": "https://vnexpress.net/rss/cuoi.rss",
      }),
  RssResource(
      id: 'tuoitre',
      name: 'Tuổi trẻ ',
      startDescriptionRegrex: "</a>",
      endDescriptionRegrex: "",
      startImageRegrex: '<img src="',
      endImageRegrex: '"',
      resourceHeaders: {
        "Trang chủ": "https://tuoitre.vn/rss/tin-moi-nhat.rss",
        "Thế giới": "https://tuoitre.vn/rss/the-gioi.rss",
        "Giáo dục": "https://tuoitre.vn/rss/giao-duc.rss",
        "Giải trí": "https://tuoitre.vn/rss/giai-tri.rss",
        "Thể thao": "https://tuoitre.vn/rss/the-thao.rss",
        "Nhịp sống trẻ": "https://tuoitre.vn/rss/nhip-song-tre.rss",
        "số hóa": "https://tuoitre.vn/rss/nhip-song-so.rss",
        "Xe": "https://tuoitre.vn/rss/xe.rss",
        "Thư giản": "https://tuoitre.vn/rss/thu-gian.rss",
      })
];
