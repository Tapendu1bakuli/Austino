class NewswireDetailsSendModel {
  int? newsId;

  NewswireDetailsSendModel({this.newsId});

  NewswireDetailsSendModel.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    return data;
  }
}
