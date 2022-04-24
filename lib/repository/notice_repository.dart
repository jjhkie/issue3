

import 'package:issue3/model/notice.dart';
import 'package:issue3/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NoticeRepository implements Repository{

  //http
  String dataURL = 'http://118.67.131.249';

  @override
  Future<String> deleteNotice(Notice notice) async{
    var url = Uri.parse('$dataURL/v1/api/notices/${notice.noticeNo}');
    var result = 'false';
    await http.delete(url).then((value){
      print(value.body);
      return result = 'true';
    });
    return result;
  }

  @override
  Future<List<Notice>> getNoticeList() async{
    List<Notice> noticeList =[];

    //http://118.67.131.249/v1/api/notices
    var url = Uri.parse('$dataURL/v1/api/notices');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    var body = json.decode(response.body);//convert

    //parse
    for(var i = 0; i < body.length; i++){
      noticeList.add(Notice.fromJson(body[i]));
    }

    return noticeList;
  }

  //patch
  @override
  Future<String> patchCompleted(Notice notice) async{
    var url = Uri.parse('$dataURL/v1/api/notices/${notice.noticeNo}');

    String resData = '';


    return resData;

  }

  @override
  Future<String> postNotice(Notice notice) {
    // TODO: implement postNotice
    throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(Notice notice) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }

}