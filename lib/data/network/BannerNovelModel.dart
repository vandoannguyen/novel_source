class BannerNovelModel {
  String id;
  String bookId;
  String bannerPic;
  String bannerUrl;

  BannerNovelModel({this.id, this.bookId, this.bannerPic, this.bannerUrl});

  BannerNovelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    bannerPic = json['banner_pic'];
    bannerUrl = json['banner_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['book_id'] = this.bookId;
    data['banner_pic'] = this.bannerPic;
    data['banner_url'] = this.bannerUrl;
    return data;
  }
}
