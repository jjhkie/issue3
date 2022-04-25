import 'package:issue3/repository/repository.dart';

import '../model/notice.dart';

class NoticeController {
  final Repository _repository;

  NoticeController(this._repository);

  //get
  Future<List<Notice>> fetchNoticeList() async {
    return _repository.getNoticeList();
  }

  //delete
  Future<String> deleteNotice(Notice notice) async {
    return _repository.deleteNotice(notice);
  }
}
