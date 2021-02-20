class NovalChapterModel {
  String id;
  String bookId;
  String title;
  int num;
  int coin;
  int secnum;
  String createdAt;
  String updatedAt;

  NovalChapterModel(
      {this.id,
      this.bookId,
      this.title,
      this.num,
      this.coin,
      this.secnum,
      this.createdAt,
      this.updatedAt});

  NovalChapterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['book_id'];
    title = json['title'];
    num = json['num'];
    coin = json['coin'];
    secnum = json['secnum'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['book_id'] = this.bookId;
    data['title'] = this.title;
    data['num'] = this.num;
    data['coin'] = this.coin;
    data['secnum'] = this.secnum;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
