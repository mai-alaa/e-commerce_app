import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 60.0,
          ),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://t3.ftcdn.net/jpg/03/53/11/00/360_F_353110097_nbpmfn9iHlxef4EDIhXB1tdTD0lcWhG9.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
