import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:insta_clone/partials/story.dart';
import 'package:insta_clone/partials/post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Story> story = [
    Story(profile: 'twista', uri: 'assets/img/1.jpg'),
    Story(profile: 'iamhelsa', uri: 'assets/img/2.jpg'),
    Story(profile: 'vandros', uri: 'assets/img/3.jpg'),
    Story(profile: 'ruperton', uri: 'assets/img/4.jpg'),
    Story(profile: 'sly', uri: 'assets/img/5.jpg'),
    Story(profile: 'just.moi', uri: 'assets/img/6.jpg'),
    Story(profile: 'luther', uri: 'assets/img/7.jpg'),
    Story(profile: 'choisissez', uri: 'assets/img/8.jpg'),
    Story(profile: 'slow_jamz', uri: 'assets/img/9.jpg'),
    Story(profile: 'new_edition', uri: 'assets/img/10.jpg'),
  ];

  List<Post> posts = [
    Post(img:'assets/img/profile1.jpg', time:'just now', caption: 'Working from home, everyday is a new journey, such a rewarding experience. ❤', likes: 10),
    Post(img:'assets/img/profile2.jpg', time:'1h', caption: 'Experiencing nature my best friend, 🐶 #sundayHike', likes: 890),
    Post(img:'assets/img/profile3.jpg', time:'2h', caption: 'Breakfast, everyday is a journey, 😋🙏🏽 #foodPorn #foodArt', likes: 200),
    Post(img:'assets/img/profile4.jpg', time:'2h', caption: 'The Haiku bridge, a masterpiece in engineering, to think it was built fifty thousand years ago 💪🏽⚒️👷🏽‍♀️🏗️', likes: 900),
    Post(img:'assets/img/profile5.jpg', time:'4h', caption: '❤ ❤ 🐶Mountaintop moments with zoe', likes: 500),
  ];

  Future<void> onRefresh()async{
    await Future.delayed(const Duration(seconds:2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Instagram',
                style: TextStyle(
                  fontFamily: 'InstaFont',
                  color:Colors.black,
                  letterSpacing: 0.8,
                  fontSize: 40.0,
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(FeatherIcons.messageCircle),
                color: Colors.black,
                iconSize: 28,
              ),
            ],
          )
      ),
        body:RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Stories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Row(
                    children: List.generate(story.length, (index) => Container(
                      padding:const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius:35,
                              backgroundImage: const AssetImage('assets/img/storyBg.jpg'),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(story[index].uri,),
                                radius: 32,
                              )
                          ),
                          const SizedBox(height:8),
                          Text(
                            story[index].profile,
                            style: const TextStyle(
                              fontSize: 12,
                              color:Colors.black87,
                              fontWeight: FontWeight.w600
                            )
                          )
                        ],
                      )
                    ),),
                  ),
                ),
                const Divider(),
                Column(
                  children: List.generate(posts.length, (index) =>
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      //POST HEADER
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child:CircleAvatar(
                                radius:18,
                                backgroundImage: const AssetImage('assets/img/storyBg.jpg'),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(story[index].uri,),
                                  radius: 16,
                                )
                            ),
                          ),
                          Text(story[index].profile, style: const TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(width: 5.0),
                          Text(posts[index].time, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 10)),
                          const Spacer(),
                          IconButton(onPressed: (){}, icon: const Icon(FeatherIcons.moreHorizontal, size: 18,))
                        ],
                      ),

                      //POST IMAGE
                      Image.asset(posts[index].img),
                      
                      //POST FOOTER
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(FeatherIcons.heart)),
                          IconButton(onPressed: (){}, icon: const Icon(FeatherIcons.messageCircle)),
                          IconButton(onPressed: (){}, icon: const Icon(FeatherIcons.send)),
                          const Spacer(),
                          IconButton(onPressed: (){}, icon: const Icon(FeatherIcons.bookmark)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${posts[index].likes} likes',
                                style: const TextStyle(fontWeight: FontWeight.w600),
                            ),

                            const SizedBox(height:10),

                            RichText(
                                text: TextSpan(
                                    style: const TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                          text: '${story[index].profile}  ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600
                                          )
                                      ),
                                      TextSpan(
                                          text: posts[index].caption
                                      )
                                    ]
                                )
                            ),
                            const SizedBox(height:10),
                            const Text(
                                'View all 12 comments',
                                style:TextStyle(
                                  fontWeight: FontWeight.w300
                                )
                            ),
                          ]
                        ),
                      ),
                      const Divider(),
                    ]
                  ),

                  ),
                )

              ]
            )
          ),
        ),

        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            elevation:0.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FeatherIcons.home),
                    iconSize: 28,
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FeatherIcons.search),
                    iconSize: 28,
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FeatherIcons.plusCircle),
                    iconSize: 28,
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FeatherIcons.heart),
                    iconSize: 28,
                  ),
                  /*
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FeatherIcons.messageCircle),
                  ),
                  */
                  IconButton(
                    onPressed: (){},
                    icon: const CircleAvatar(
                      backgroundImage: AssetImage('assets/img/stone.jpg'),
                    ),
                    iconSize: 28,
                  )
                ]
            )
        )
    );
  }
}
