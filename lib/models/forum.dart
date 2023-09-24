class Forum {
  String title;
  String content;
  String Id;
  List<dynamic> comment;

  Forum({
    required this.title,
    required this.content,
    required this.comment,
    required this.Id,
  });
  static Forum fromMap(Map<String, dynamic> data) {
    return Forum(
        title: data["title"],
        content: data['content'],
        Id: data['Id'],
        comment: data["comment"]);
  }
}
