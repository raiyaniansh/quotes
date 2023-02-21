import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'list.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    List data=ModalRoute.of(context)?.settings.arguments as List;
    List a1=data;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1B1C1E),
        appBar: AppBar(
          title: Text("${data.last}"),
        ),
        body: ListView.builder(itemCount: data.length-1,itemBuilder: (context, index){
          return Box(a1[index], col[index], index,a1);
        },)
      ),
    );
  }
  Widget Box(String a, Gradient b,index,List a1) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
                        onTap: (){
                          setState(() {
                            a1.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete,color: Color(0xff7F6220), size: 25),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          fav.insert(0, a);
                          print(fav);
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add in Favorite list...")));
                          });
                        },
                        child: Icon(Icons.favorite_border_outlined,
                            color: Color(0xff7F6220), size: 25),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(onTap: (){
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Quote copy to clipboard..."),));
                        });
                        Clipboard.setData(ClipboardData(text: a));
                      },child: Icon(Icons.copy,color: Color(0xff7F6220), size: 25)),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () async{
                          await Share.share('$a');
                        },
                        child: Icon(Icons.share,
                            color: Color(0xff7F6220), size: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  var rnd=Random();
                  int d=rnd.nextInt(9);
                  col[index]=linearGradient[d];
                });
              },
              child: Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: b, borderRadius: BorderRadius.circular(15)),
                child: Container(
                    width: 300,
                    alignment: Alignment.center,
                    child:
                    Text("$a", style: Theme.of(context).textTheme.headline1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
