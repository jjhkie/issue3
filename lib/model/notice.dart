

class Notice {
  int? noticeNo;
  String? title;
  String? contents;

  Notice({this.noticeNo, this.title, this.contents});

  Notice.fromJson(Map<String, dynamic> json) {
    noticeNo = json['noticeNo'];
    title = json['title'];
    contents = json['contents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noticeNo'] = this.noticeNo;
    data['title'] = this.title;
    data['contents'] = this.contents;
    return data;
  }
}



// class Notice {
//   final int noticeNo;
//   final String title, contents;
//
//   Notice(this.noticeNo, this.title, this.contents);
// }
