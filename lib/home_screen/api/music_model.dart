class MusicSearch {
  String? title;
  String? picture;
  String? md5Image;

  MusicSearch({
    this.title,
    this.picture,
    this.md5Image,
  });

  MusicSearch.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    picture = json['picture'];

    md5Image = json['md5_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['picture'] = this.picture;

    data['md5_image'] = this.md5Image;

    return data;
  }
}
