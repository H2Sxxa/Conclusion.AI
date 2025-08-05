class ReferenceData {
  final String title;
  final String url;
  final String body;

  ReferenceData({required this.title, required this.url, required this.body});

  @override
  String toString() {
    return '''
[$title]($url)

$body''';
  }
}
