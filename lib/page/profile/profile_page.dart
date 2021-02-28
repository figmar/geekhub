import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geekhub/page/login/login_bloc.dart';
import 'package:geekhub/page/login/login_event.dart';
import 'package:geekhub/page/login/login_page.dart';
import 'package:geekhub/page/profile/profile_bloc.dart';
import 'package:geekhub/page/profile/profile_event.dart';
import 'package:geekhub/page/profile/profile_state.dart';
import 'package:geekhub/widget/circle_avatar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("我的")),
        body: BlocProvider(
          create: (context) => ProfileBloc()..add(ProfileFetch()),
          child: Column(children: [_aboutWidget(), _settingsWidget()]),
        ));
  }

  Widget _aboutWidget() {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      print('curren state is $state');
      if (state is ProfileLoading) {
        return CircularProgressIndicator();
      }
      if (state is UnAuthed) {
        return Card(
            elevation: 0.0,
            margin: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BlocProvider<LoginBloc>(
                    create: (context) => LoginBloc()..add(AuthPage()),
                    child: LoginPage(),
                  );
                }));
              },
              child: Text('登录'),
            ));
      }
      if (state is ProfileSuccess) {
        var user = state.user;
        return Card(
          elevation: 0.0,
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading:
                CircleAvatarWithPlaceholder(imageUrl: user.avatar, size: 32),
            title: Text(user.id),
            subtitle: Text("Gbit:0"),
            trailing: IconButton(
              icon: Icon(FontAwesomeIcons.arrowRight),
              onPressed: () {
                // 跳转到详情页面
              },
            ),
          ),
        );
      }
      return Card(
        elevation: 0.0,
        margin: const EdgeInsets.all(8.0),
        child: Center(child: Text("加载失败")),
      );
    });
  }

  Widget _settingsWidget() {
    return ListView(
      shrinkWrap: true,
      children: [
        Divider(),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.info,
          ),
          title: Text("用户协议"),
        ),
        Divider(),
        ListTile(leading: Icon(FontAwesomeIcons.comment), title: Text("意见反馈")),
        Divider(),
        ListTile(leading: Icon(FontAwesomeIcons.star), title: Text("去评分")),
        Divider()
      ],
    );
  }
}
