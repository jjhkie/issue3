

import '../model/notice.dart';

abstract class Repository{

  //get
  Future<List<Notice>> getNoticeList();
  //patch
  Future<String> patchCompleted(Notice notice);
  //put
  Future<String> putCompleted(Notice notice);
  //delete
  Future<String> deleteNotice(Notice notice);
  //post
  Future<String> postNotice(Notice notice);
}