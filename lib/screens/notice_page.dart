import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:issue3/controller/notice_controller.dart';
import 'package:issue3/repository/notice_repository.dart';
import '../model/notice.dart';

class notice extends StatefulWidget {
  @override
  State<notice> createState() => _noticeState();
}

class _noticeState extends State<notice> {
  var noticeController = NoticeController(NoticeRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice Data'),
      ),
      body: FutureBuilder<List<Notice>>(
        future: noticeController.fetchNoticeList(),
        builder: (context, snapshot) {
          //
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('error'),
            );
          }

          return ListView.separated(
              itemBuilder: (context, index) {
                var notice = snapshot.data?[index];
                return Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text('${notice?.noticeNo}')),
                      Expanded(flex: 1, child: Text('${notice?.title}')),
                      Expanded(flex: 1, child: Text('${notice?.contents}')),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(child: buildCallContainer('patch')),
                            InkWell(child: buildCallContainer('put')),
                            InkWell(
                              onTap:() {noticeController.deleteNotice(notice!);
                                },
                                child: buildCallContainer('delete')),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: snapshot.data?.length ?? 0);
        },
      ),
    );
  }

  //button 생성
  Container buildCallContainer(String title) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(child: Text('$title')),
    );
  }
}
