import 'package:flutter/material.dart';
import 'package:movies_application/screens/home/widgets/movie_widgets.dart';
import 'package:movies_application/screens/user_profile/user_profile_page.dart';

class UserProfileView extends StatelessWidget {
  final UserProfileController state;

  const UserProfileView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(text: 'Profile email:  ${state.user.email}', size: 20),
            const SizedBox(height: 10,),
            text(text: 'Profile creation date:  ${state.user.metadata.creationTime?.toLocal()}', size: 20),
          ],
        ),
      ),
    );
  }
}
