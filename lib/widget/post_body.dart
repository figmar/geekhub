import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geekhub/model/comment.dart';
import 'package:geekhub/model/post_body.dart';

import 'circle_avatar.dart';

/// @file   :   post_body.dart
/// @author :   leetao
/// @date   :   2/23/21 8:08 PM
/// @email  :   leetao94@gmail.com
/// @desc   :   post body 部分

class PostDetailBody extends StatelessWidget {
  final PostBody comment;
  final String msg;

  PostDetailBody(this.comment, {this.msg});

  @override
  Widget build(BuildContext context) {
    if (this.msg != null) {
      print("show Toast");
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => _buildComment(comment.comments[index], index),
          childCount: comment.comments.length),
    );
  }

  Widget _buildComment(Comment item, int index) {
    if (index == 0) {
      return Container(
          padding: EdgeInsets.only(left: 16.0, right: 18.0, top: 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatarWithPlaceholder(
                      imageUrl: item.avatar,
                      size: 32,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  "${item.author.trim()}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    item.replyTime.trim(),
                                    style: TextStyle(color: Colors.grey[400]),
                                  ))
                            ]),
                        Text(item.order,
                            style: TextStyle(color: Colors.grey[400])),
                      ],
                    ))
                  ],
                ),
                Html(
                  data: item.content.trim(),
                  onLinkTap: (String url) {
                    // TODO
                  },
                  style: {
                    "p": Style(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        fontSize: FontSize(15.0)),
                    "span": Style(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        fontSize: FontSize(15.0))
                  },
                ),
                Row(
                  children: [
                    TextButton.icon(
                      style: ButtonStyle(),
                      icon: Icon(
                        FontAwesomeIcons.reply,
                        size: 16,
                      ),
                      label: Text('评论'),
                      onPressed: () {},
                    ),
                    TextButton.icon(
                      style: ButtonStyle(),
                      icon: Icon(
                        FontAwesomeIcons.rocket,
                        size: 16,
                      ),
                      label: Text('上天(${item.upCount})'),
                      onPressed: () {},
                    )
                  ],
                ),
                Divider()
              ]));
    }
    return Container(
        padding: EdgeInsets.only(left: 16.0, right: 18.0, top: 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatarWithPlaceholder(
                    imageUrl: item.avatar,
                    size: 32,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "${item.author.trim()}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  item.replyTime.trim(),
                                  style: TextStyle(color: Colors.grey[400]),
                                ))
                          ]),
                      Text(item.order,
                          style: TextStyle(color: Colors.grey[400])),
                    ],
                  ))
                ],
              ),
              Html(
                data: item.content.trim(),
                onLinkTap: (String url) {
                  // TODO
                },
                style: {
                  "p": Style(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      fontSize: FontSize(15.0)),
                  "span": Style(
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(0),
                      fontSize: FontSize(15.0))
                },
              ),
              Row(
                children: [
                  TextButton.icon(
                    style: ButtonStyle(),
                    icon: Icon(
                      FontAwesomeIcons.reply,
                      size: 16,
                    ),
                    label: Text('评论'),
                    onPressed: () {},
                  ),
                  TextButton.icon(
                    style: ButtonStyle(),
                    icon: Icon(
                      FontAwesomeIcons.rocket,
                      size: 16,
                    ),
                    label: Text('上天(${item.upCount})'),
                    onPressed: () {},
                  )
                ],
              ),
              Divider()
            ]));
  }
}
