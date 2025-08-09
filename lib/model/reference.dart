class ReferenceData {
  final String title;
  final String url;
  final String body;

  const ReferenceData({
    required this.title,
    required this.url,
    required this.body,
  });

  @override
  String toString() {
    return '''
[$title]($url)

$body''';
  }

  static ReferenceData from(Map data) {
    return ReferenceData(
      title: data["title"],
      url: data["url"],
      body: data["body"],
    );
  }

  static List<ReferenceData> fromIter(Iterable<Map> data) {
    return data.map(from).toList();
  }
}
