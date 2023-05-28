class CapsuleDetails {
  String? topicCode;
  String? publishedDate;
  String? title;
  String? imageUrl;
  int? duration;
  String? author;
  String? description;
  String? publisher;
  String? resourceUrl;
  String? type;
  String? audience;
  String? level;
  String? expiryDate;
  int? editorsPick;
  List<String>? tags;
  List<String>? keyPoints;

  CapsuleDetails(
      {this.topicCode,
      this.publishedDate,
      this.title,
      this.imageUrl,
      this.duration,
      this.author,
      this.description,
      this.publisher,
      this.resourceUrl,
      this.type,
      this.audience,
      this.level,
      this.expiryDate,
      this.editorsPick,
      this.tags,
      this.keyPoints});

  CapsuleDetails.fromJson(Map<String, dynamic> json) {
    topicCode = json['topicCode'];
    publishedDate = json['publishedDate'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    duration = json['duration'];
    author = json['author'];
    description = json['description'];
    publisher = json['publisher'];
    resourceUrl = json['resourceUrl'];
    type = json['type'];
    audience = json['audience'];
    level = json['level'];
    expiryDate = json['expiryDate'];
    editorsPick = json['editorsPick'];
    tags = json['tags']?.cast<String>();
    keyPoints = json['keyPoints']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topicCode'] = topicCode;
    data['publishedDate'] = publishedDate;
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    data['duration'] = duration;
    data['author'] = author;
    data['description'] = description;
    data['publisher'] = publisher;
    data['resourceUrl'] = resourceUrl;
    data['type'] = type;
    data['audience'] = audience;
    data['level'] = level;
    data['expiryDate'] = expiryDate;
    data['editorsPick'] = editorsPick;
    data['tags'] = tags;
    data['keyPoints'] = keyPoints;
    return data;
  }

  List<CapsuleDetails>? toListOfCapsules(Iterable? items) {
    if (items == null) {
      return null;
    }
    List<CapsuleDetails> capsuleList =
        items.map((e) => CapsuleDetails.fromJson(e)).toList();
    return capsuleList;
  }
}
