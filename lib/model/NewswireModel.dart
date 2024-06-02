import 'CompleteShiftsListResponseModel.dart';

class NewswireModel {
  NewswireModel({
    //required this.settings,
    required this.news,
  });
  late final Map<String, dynamic> news;
  late final List<Data> data;
  NewswireModel.fromJson(Map<String, dynamic> json){
    //settings = Settings.fromJson(json['settings']);
    news = json['news'];
    data = getdata(news);
   print(data);
  }
  List<Data> getdata(Map<String, dynamic> mapValue) {

    List<Data> data = [];
    mapValue.forEach((key, value) {
      List<NewsDetails> newsDetailsList = [];

      value.forEach((item) {
        NewsDetails newsDetails = NewsDetails(
            id: item["id"] ?? 0,
            title: item["title"] ?? "",
            description: item["description"]?? "",
            addedBy: item["added_by"]?? 0,
            newsImage: item["news_image"]?? "",
            youtubeUrl: item["youtubeUrl"]?? "",
            status: item["status"]?? 0,

            createdAt: item["created_at"]?? 0,
            updatedAt: item["updated_at"]?? 0);
        newsDetailsList.add(newsDetails);
      });

      NewsDetails newsDetails = NewsDetails(
          id: value[0]["id"] ?? 0,
          title: value[0]["title"] ?? "",
          description: value[0]["description"]?? "",
          addedBy: value[0]["added_by"]?? 0,
          newsImage: value[0]["news_image"]?? "",
          youtubeUrl: value[0]["youtubeUrl"]?? "",
          status: value[0]["status"]?? 0,
          createdAt: value[0]["created_at"]?? 0,
          updatedAt: value[0]["updated_at"]?? 0);


      data.add(Data(name: key, newsDetails: newsDetails,newsDetailsList: newsDetailsList));


    });

    return data;
    // data.forEach((element) {
    //   print(element.name + " : " + '${element.userList.length}');
    // });
  }



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
   // _data['settings'] = settings.toJson();
   // _data['news'] = news.toJson();
    return _data;
  }
}

class Data {
  final String name;
  final NewsDetails newsDetails;
  final List<NewsDetails> newsDetailsList;

  Data({required this.name,required this.newsDetails,required this.newsDetailsList});
}

class NewsDetails {
  NewsDetails({
required this.id,
required this.title,
required this.description,
required this.addedBy,
required this.newsImage,
required this.youtubeUrl,
required this.status,
required this.createdAt,
required this.updatedAt,
});
late final int id;
late final String title;
late final String description;
late final int addedBy;
late final String newsImage;
late final String youtubeUrl;
late final int status;
late final int createdAt;
late final int updatedAt;

  NewsDetails.fromJson(Map<String, dynamic> json){
id = json['id'];
title = json['title'];
description = json['description'];
addedBy = json['added_by'];
newsImage = json['news_image'];
youtubeUrl = json['youtube_url'];
status = json['status'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final _data = <String, dynamic>{};
_data['id'] = id;
_data['title'] = title;
_data['description'] = description;
_data['added_by'] = addedBy;
_data['news_image'] = newsImage;
_data['youtube_url'] = youtubeUrl;
_data['status'] = status;
_data['created_at'] = createdAt;
_data['updated_at'] = updatedAt;
return _data;
}
}