class TopicDetails {
  String? code;
  String? title;
  String? status;

  TopicDetails({this.code, this.title, this.status});

  List<TopicDetails>? toListOfTopics(Iterable? items) {
    if (items == null) {
      return null;
    }
    List<TopicDetails> topicCollection =
        List<TopicDetails>.from(items.map((e) => TopicDetails.fromJson(e)));
    return topicCollection;
  }

  TopicDetails.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
