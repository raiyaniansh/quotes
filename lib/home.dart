import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quotes/list.dart';
import 'package:flutter/services.dart';
import 'package:quotes/search.dart';
import 'package:quotes/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1B1C1E),
        body: Stack(
          children: [
            IndexedStack(
              index: a,
              children: [
                Container(
                  height: 725,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  showSearch(
                                      context: context,
                                      delegate: CustomSearchDelegate());
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3a2d1c),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 5,),
                                      Icon(Icons.search,color: Color(0xff7F6220),),
                                      SizedBox(width: 5,),
                                      Text("Type something here",style: TextStyle(color: Color(0xff7F6220),fontSize: 18)),
                                      SizedBox(width: 5,),
                                    ],
                                  ),
                                ),
                              ),),
                          SizedBox(height: 20,),
                          Text("Popular",
                              style: Theme.of(context).textTheme.headline1),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushNamed(context, 'data',
                                              arguments: love);
                                        });
                                      },
                                      child: Mbox("loves.jpg"),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Love",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushNamed(context, 'data',
                                              arguments: birth);
                                        });
                                      },
                                      child: Mbox('birthday.jpg'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Birthday",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: friends);
                                          });
                                        },
                                        child: Mbox('fri.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Friends",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Random Quote",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                Expanded(
                                    child: SizedBox(
                                  width: 1,
                                )),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (love.length == 1) {
                                          i = 0;
                                        } else {
                                          var rnd = Random();
                                          i = rnd.nextInt(love.length - 1);
                                        }
                                      });
                                    },
                                    child: Text(
                                      "Next",
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 250,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xff30281D),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                      ),
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  love.removeAt(i);
                                                });
                                              },
                                              child: (love.length == 1)
                                                  ? Container()
                                                  : Icon(Icons.delete,
                                                  color: Color(0xff7F6220),
                                                  size: 25),
                                            ),
                                            Expanded(child: SizedBox()),
                                            InkWell(onTap: (){
                                              setState(() {
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quote copy to clipboard..."),));
                                              });
                                              Clipboard.setData(ClipboardData(text: love[i]));
                                            },child: Icon(Icons.copy,color: Color(0xff7F6220), size: 25)),
                                            Expanded(child: SizedBox()),
                                            InkWell(
                                              onTap: () async {
                                                await Share.share('${love[i]}');
                                              },
                                              child: Icon(Icons.share,
                                                  color: Color(0xff7F6220),
                                                  size: 25),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        gradient: linearGradient[i],
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                        width: 300,
                                        alignment: Alignment.center,
                                        child: Text("${love[i]}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("Motivational",
                              style: Theme.of(context).textTheme.headline1),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: inspirational);
                                          });
                                        },
                                        child: Mbox('im.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Inspirational",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushNamed(context, 'data',
                                              arguments: freedom);
                                        });
                                      },
                                      child: Mbox('free.jpg'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Freedom",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: leadership);
                                          });
                                        },
                                        child: Mbox('leader.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Leadership",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("Feeling",
                              style: Theme.of(context).textTheme.headline1),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushNamed(context, 'data',
                                              arguments: alone);
                                        });
                                      },
                                      child: Mbox('alone.jpg'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Alone",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          Navigator.pushNamed(context, 'data',
                                              arguments: sad);
                                        });
                                      },
                                      child: Mbox('sad.jpg'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Sad",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: attitude);
                                          });
                                        },
                                        child: Mbox('attitude.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Attitude",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: smile);
                                          });
                                        },
                                        child: Mbox('smile.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Smile",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text("Moments",
                              style: Theme.of(context).textTheme.headline1),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: birth);
                                          });
                                        },
                                        child: Mbox('birthday.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Birthday",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: roma);
                                          });
                                        },
                                        child: Mbox('roma.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Romantic",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: success);
                                          });
                                        },
                                        child: Mbox('success.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Success",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            Navigator.pushNamed(context, 'data',
                                                arguments: fail);
                                          });
                                        },
                                        child: Mbox('fail.jpg')),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Failure",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(context, 'data',
                                      arguments: love);
                                });
                              },
                              child: Mbox2('love.jpg', 'Love'),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.pushNamed(context, 'data',
                                        arguments: family);
                                  });
                                },
                                child: Mbox2('family.jpg', 'Family')),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(context, 'data',
                                      arguments: friends);
                                });
                              },
                              child: Mbox2('friends.jpg', 'Friends'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Image.asset('assets/images/bg.jpg'),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff3a2d1c),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info,
                                    color: Color(0xff7F6220),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Quotes app v1.0.1",
                                    style: TextStyle(
                                        color: Color(0xff7F6220), fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Color(0xff3a2d1c),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  await launchUrl(Uri.parse(
                                                      "mailto:anshraiyani009@gmail.com"));
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.mail,
                                                        color:
                                                            Color(0xff7F6220)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Mail",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff7F6220)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await launchUrl(Uri.parse(
                                                      "tel: 9558345674"));
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.call,
                                                        color:
                                                            Color(0xff7F6220)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Call",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff7F6220)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  });
                                },
                                child: Container(
                                  height: 85,
                                  width: 106,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff3a2d1c),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mail,
                                          color: Color(0xff7F6220), size: 25),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Contact us",
                                        style: TextStyle(
                                            color: Color(0xff7F6220),
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 85,
                                width: 106,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff3a2d1c),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.share,
                                        color: Color(0xff7F6220), size: 25),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Share link",
                                      style: TextStyle(
                                          color: Color(0xff7F6220),
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Color(0xff3a2d1c),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("Developed by",
                                                  style: TextStyle(
                                                      color: Color(0xff7F6220),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("Ansh raiyani",
                                                  style: TextStyle(
                                                      color: Color(0xff7F6220),
                                                      fontSize: 15)),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text("Design by",
                                                  style: TextStyle(
                                                      color: Color(0xff7F6220),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("Ansh raiyani",
                                                  style: TextStyle(
                                                      color: Color(0xff7F6220),
                                                      fontSize: 15)),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text("Guidance by",
                                                  style: TextStyle(
                                                      color: Color(0xff7F6220),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("Vidit savaliya",
                                                  style: TextStyle(
                                                      color: Color(0xff7F6220),
                                                      fontSize: 15)),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  });
                                },
                                child: Container(
                                  height: 85,
                                  width: 106,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff3a2d1c),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.person,
                                          color: Color(0xff7F6220), size: 25),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "About me",
                                        style: TextStyle(
                                            color: Color(0xff7F6220),
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                width: double.infinity,
                color: Color(0xff3a2d1c),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          a = 0;
                        });
                      },
                      child: (a == 0)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 75,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xff362917),
                                  ),
                                  child: (a == 0)
                                      ? Icon(Icons.home,
                                          color: Color(0xff7F6220))
                                      : Icon(Icons.home_outlined,
                                          color: Color(0xff7F6220)),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(color: Color(0xff7F6220)),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 35,
                                  width: 75,
                                  child: Icon(Icons.home_outlined,
                                      color: Color(0xff7F6220)),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(color: Color(0xff7F6220)),
                                )
                              ],
                            ),
                    ),
                    Expanded(
                        child: SizedBox()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, 'fav',arguments: fav);
                            });
                          },
                          child: Container(
                              width: 75,
                              height: 35,
                              child: Icon(Icons.favorite,color: Color(0xff7F6220))),
                        ),
                        Text("Favorite",style: TextStyle(color: Color(0xff7F6220)),)
                      ],
                    ),
                    SizedBox(width: 40,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, 'cre',arguments: create);
                            });
                          },
                          child: Container(width: 75,height: 35,child: Icon(Icons.create,color: Color(0xff7F6220))),
                        ),
                        Text("My created",style: TextStyle(color: Color(0xff7F6220)),)
                      ],
                    ),
                    Expanded(
                        child: SizedBox()),
                    InkWell(
                      onTap: () {
                        setState(() {
                          a = 1;
                        });
                      },
                      child: (a == 1)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 75,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xff362917),
                                  ),
                                  alignment: Alignment.center,
                                  child: (a == 1)
                                      ? Container(
                                          height: 20,
                                          width: 30,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Color(0xff7F6220),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(Icons.menu,
                                              color: Color(0xff362917)),
                                        )
                                      : Container(
                                          width: 30,
                                          height: 20,
                                          child: Icon(Icons.menu_outlined,
                                              color: Color(0xff7F6220)),
                                        ),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(color: Color(0xff7F6220)),
                                )
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 75,
                                  height: 35,
                                  child: Icon(Icons.menu,
                                      color: Color(0xff7F6220)),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(color: Color(0xff7F6220)),
                                )
                              ],
                            ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  backgroundColor: Color(0xff7F6220),
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, 'add');
                    });
                  },
                  child: Icon(
                    Icons.add,
                    color: Color(0xff362917),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
