

import 'package:flutter/material.dart';
import 'package:nike_project/contants/contants.dart';
import 'package:nike_project/view/common/Button/story_button.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

   List<String> imageUrl = [
    "https://scontent.fdad1-3.fna.fbcdn.net/v/t1.6435-9/53615607_2260108900868926_5930305239600070656_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=lrzZdzHtQ0wAX_Z2omA&_nc_ht=scontent.fdad1-3.fna&oh=00_AT--5Nl5CFsnuQy-epSn4Iu1s4qgqs1kcrA0IqEKNL4xwg&oe=61E2DF31",
    "https://scontent.fdad1-1.fna.fbcdn.net/v/t1.18169-9/12651239_197793903908105_6634826857517071349_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=730e14&_nc_ohc=mYnkeRN-6bIAX_4Qt4O&_nc_ht=scontent.fdad1-1.fna&oh=00_AT8-xeKw_VmrJbIvDT-wVHK3g8pH0tSx_3XwfBvfXGbLqw&oe=61E47431",
    "https://scontent.fdad1-1.fna.fbcdn.net/v/t1.6435-9/91854369_521248425482499_6130673632986267648_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=174925&_nc_ohc=SHK4Xh2az3kAX9K1dFj&tn=xNFYOjgJ187sxl2t&_nc_ht=scontent.fdad1-1.fna&oh=00_AT9-9GaBw3NbNe3gTZtUoHHcq4_Ds96Fswc4OW6vIKlYQA&oe=61E12DAE",
    "https://scontent.fdad1-1.fna.fbcdn.net/v/t39.30808-6/251009150_1046745559225260_1530515447386627409_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=SHp5tDGYIVIAX9t4je9&_nc_ht=scontent.fdad1-1.fna&oh=00_AT8f6gls5yCJ441E5RHY5JDFPVws9YJtm2H7CVMsfI-4tA&oe=61C1FFAD",
    "https://scontent.fdad2-1.fna.fbcdn.net/v/t1.6435-9/135007345_2714614908803178_5965932174788042024_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=174925&_nc_ohc=6LpNLEYIgeMAX8-bAVE&_nc_ht=scontent.fdad2-1.fna&oh=00_AT-N3UoWlWqJlbrXuxhelv1NdrtrJR7jB1Sm-Q96kaKBlQ&oe=61E31276",
    "https://scontent.fdad2-1.fna.fbcdn.net/v/t1.18169-9/19424344_1705940299709335_4449019188533820333_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=pyXNsm46SYYAX_WLzlP&_nc_ht=scontent.fdad2-1.fna&oh=00_AT9CbrV-25N0Gz4Ay4SctY5a_q16N4aJRCHMT5xnMS8KXw&oe=61E4534D",
    "https://scontent.fdad2-1.fna.fbcdn.net/v/t1.6435-9/80698813_872764103179029_6361909101630324736_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=8i3-swA4pEsAX-4SZsb&_nc_oc=AQkDY8-x3eSTyPd4dYFYIbklmkj5U8w-ujf-K_ZGkczY2Bt8y7zayu3O1yyDaDWBugDLIkUlRkNXKprgQY8KluiI&_nc_ht=scontent.fdad2-1.fna&oh=00_AT9vlCWtxrPaWP8GC3d35FzhVy5hWhRi8QBnzIkN7SY_TQ&oe=61E4BB1C",
    "https://randomuser.me/api/portraits/women/1.jpg",
    "https://randomuser.me/api/portraits/men/0.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
        ],
      ),

      body: Column(
        children: [
          //First let's create the Story time line container
          Container(
            color: kPrimaryColor,
            height: 100.0,
            child: Padding(
              padding: 
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  //Let's create a custom widget for our story button
                  StoryButton(imageUrl[0], "Bao"),
                  StoryButton(imageUrl[1], "Hieu"),
                  StoryButton(imageUrl[2], "Khoa"),
                  StoryButton(imageUrl[3], "Vi"),
                  StoryButton(imageUrl[4], "A Hieu"),
                  StoryButton(imageUrl[5], "Dy"),
                  StoryButton(imageUrl[6], "Long"),]
              ),
            ),
          ),

          //Now let's create our chat timeline
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
                child: ListView(
                  children: [
                    //Now let's create our chat tile custom widget
                    chatTile(imageUrl[0], "Bao", "msg", "9Am", false),
                    chatTile(imageUrl[1], "Hieu", "msg", "8Am", true),
                    chatTile(imageUrl[2], "Khoa", "msg", "6Am", true),
                    chatTile(
                        imageUrl[3], "Vi", "msg", "Yesterday", false),
                    chatTile(
                        imageUrl[5], "Dy", "msg", "Yesterday", false),
                    chatTile(imageUrl[4], "A Hieu", "msg", "San 20", true),
                    chatTile(imageUrl[6], "Long", "msg", "San20", true),
                    chatTile(imageUrl[7], "No Name", "msg", "San20", true),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget chatTile(
    String imgUrl, String userName, String msg, String date, bool seen) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgUrl),
            radius: 28.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        userName,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(date),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(child: Text(userName)),
                    if (seen)
                      Icon(
                        Icons.check_circle,
                        size: 18.0,
                        color: Colors.green,
                      ),
                    if (!seen)
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
 
