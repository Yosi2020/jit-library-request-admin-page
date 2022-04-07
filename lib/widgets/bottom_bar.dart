import 'package:lib_admin/widgets/info_text.dart';
import 'package:lib_admin/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lib_admin/widgets//bottom_bar_column.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);
  static const Color gradientStartColor = Color(0xff11998e);
  static const Color gradientEndColor = Color(0xff0575E6);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: gradientStartColor,
              offset: Offset(1.0, 6.0),
              blurRadius: 1.0,
            ),
            BoxShadow(
              color: gradientEndColor,
              offset: Offset(1.0, 6.0),
              blurRadius: 1.0,
            ),
          ],
          gradient: LinearGradient(
              colors: [
                gradientStartColor,
                gradientEndColor
              ],
              begin: const FractionalOffset(0.2, 0.2),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      padding: EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: MediaQuery.of(context).size.width<300?Column(
        children: [
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomBarColumn(
                  heading: 'ABOUT',
                  s1: 'Contact Us',
                  s2: 'DeboEngineering',
                  id: 1,
                ),
                BottomBarColumn(
                  heading: "ONLINE SERVICE",
                  s1: "E-Learning",
                  s2: "JU Library",
                  id: 2,
                ),
                BottomBarColumn(
                  heading: "SOCIAL",
                  s1: "Twitter",
                  s2: "Facebook",
                  id: 3,)]
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.white60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoText(
                  type: 'Developer-1',
                  text: 'Boaz Berihanu',
                  text1: 'boazict@gmail.com',
                  text2: '+251911086178'
              ),
              SizedBox(height: 5),
              InfoText(
                  type: 'Developer-2',
                  text: 'Eyosiyas Tibebu',
                  text1: 'eyosimar524@gmail.com',
                  text2: '+251913135813'
              ),
              SizedBox(height: 5,),

            ],
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.white60,
          ),
          Text(
            'Copyright © 2021 | DeboEngineering',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ) :MediaQuery.of(context).size.width<365?Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                heading: 'ABOUT',
                s1: 'Contact Us',
                s2: 'DeboEngineering',
                id: 1,
              ),
              BottomBarColumn(
                heading: "ONLINE SERVICE",
                s1: "E-Learning",
                s2: "JU Library",
                id: 2,
              ),
            ],
          ),
          BottomBarColumn(
            heading: "SOCIAL",
            s1: "Twitter",
            s2: "Facebook",
            id: 3,
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.white60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoText(
                  type: 'Developer-1',
                  text: 'Boaz Berihanu',
                  text1: 'boazict@gmail.com',
                  text2: '+251911086178'
              ),
              SizedBox(height: 5),
              InfoText(
                  type: 'Developer-2',
                  text: 'Eyosiyas Tibebu',
                  text1: 'eyosimar524@gmail.com',
                  text2: '+251913135813'
              ),
              SizedBox(height: 5,),

            ],
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.white60,
          ),
          Text(
            'Copyright © 2021 | DeboEngineering',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ) :MediaQuery.of(context).size.width<800?Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                heading: 'ABOUT',
                s1: 'Contact Us',
                s2: 'DeboEngineering',
                id: 1,
              ),
              BottomBarColumn(
                  heading: "ONLINE SERVICE",
                  s1: "E-Learning",
                  s2: "JU Library",
                id: 2,
              ),
              BottomBarColumn(
                  heading: "SOCIAL",
                  s1: "Twitter",
                  s2: "Facebook",
                id: 3,
              ),

            ],
          ),
          Divider(
            color: Colors.white60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoText(
                  type: 'Developer-1',
                  text: 'Boaz Berihanu',
                  text1: 'boazict@gmail.com',
                  text2: '+251911086178'
              ),
              SizedBox(height: 5),
              InfoText(
                  type: 'Developer-2',
                  text: 'Eyosiyas Tibebu',
                  text1: 'eyosimar524@gmail.com',
                  text2: '+251913135813'
              ),
              SizedBox(height: 5,),

            ],
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.white60,
          ),
          Text(
            'Copyright © 2021 | DeboEngineering',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ) :Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                        heading: "ONLINE SERVICE",
                        s1: "E-Learning",
                        s2: "Jimma University Library",
                        s3: "Resource Servers"
                    ),
                    BottomBarColumn(
                        heading: "SOCIAL",
                        s1: "Twitter",
                        s2: "Facebook",
                        s3: ""
                    ),

                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                            type: 'Developer-1',
                            text: 'Boaz Berihanu',
                          text1: 'boazict@gmail.com',
                          text2: '+251911086178'
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Developer-2',
                          text: 'Eyosiyas Tibebu',
                            text1: 'eyosimar524@gmail.com',
                            text2: '+251913135813'
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright © 2021 | DeboEngineering',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
