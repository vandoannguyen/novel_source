class NovelModel {
  String id;
  String name;
  String desc;
  String bpic;
  String writerName;
  int updateSection;
  int updateStatus;
  String createdAt;
  String updatedAt;

  NovelModel(
      {this.id,
      this.name,
      this.desc,
      this.bpic,
      this.writerName,
      this.updateSection,
      this.updateStatus,
      this.createdAt,
      this.updatedAt});

  NovelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    bpic = json['bpic'];
    writerName = json['writer_name'];
    updateSection = json['update_section'];
    updateStatus = json['update_status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['bpic'] = this.bpic;
    data['writer_name'] = this.writerName;
    data['update_section'] = this.updateSection;
    data['update_status'] = this.updateStatus;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
