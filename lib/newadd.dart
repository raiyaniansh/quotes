import 'package:flutter/material.dart';
import 'package:quotes/list.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  Gradient b = LinearGradient(colors: [
    Color(0xff080202),
    Color(0xffA3867E),
  ]);
  String data = 'Love';
  String c = '';
  TextEditingController txtquotes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text("Create"),
          actions: [
            Center(child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(onTap: () {
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your quote add successfully...")));
                  if(data==inspirational.last)
                  {
                      col.insert(linearGradient.length, b);
                      inspirational.insert(inspirational.length-1, "${txtquotes.text}");
                    }
                  if(data==freedom.last)
                  {
                    col.insert(linearGradient.length, b);
                    freedom.insert(freedom.length-1, "${txtquotes.text}");
                  }
                  if(data==leadership.last)
                  {
                    col.insert(linearGradient.length, b);
                    leadership.insert(leadership.length-1, "${txtquotes.text}");
                  }
                  if(data==alone.last)
                  {
                    col.insert(linearGradient.length, b);
                    alone.insert(alone.length-1, "${txtquotes.text}");
                  }
                  if(data==sad.last)
                  {
                    col.insert(linearGradient.length, b);
                    sad.insert(sad.length-1, "${txtquotes.text}");
                  }
                  if(data==attitude.last)
                  {
                    col.insert(linearGradient.length, b);
                    attitude.insert(attitude.length-1, "${txtquotes.text}");
                  }
                  if(data==smile.last)
                  {
                    col.insert(linearGradient.length, b);
                    smile.insert(smile.length-1, "${txtquotes.text}");
                  }
                  if(data==birth.last)
                  {
                    col.insert(linearGradient.length, b);
                    birth.insert(birth.length-1, "${txtquotes.text}");
                  }
                  if(data==roma.last)
                  {
                    col.insert(linearGradient.length, b);
                    roma.insert(roma.length-1, "${txtquotes.text}");
                  }
                  if(data==success.last)
                  {
                    col.insert(linearGradient.length, b);
                    success.insert(success.length-1, "${txtquotes.text}");
                  }
                  if(data==fail.last)
                  {
                    col.insert(linearGradient.length, b);
                    fail.insert(fail.length-1, "${txtquotes.text}");
                  }
                  if(data==love.last)
                  {
                    col.insert(linearGradient.length, b);
                    love.insert(love.length-1, "${txtquotes.text}");
                  }
                  if(data==family.last)
                  {
                    col.insert(linearGradient.length, b);
                    family.insert(family.length-1, "${txtquotes.text}");
                  }
                  if(data==friends.last)
                  {
                    col.insert(linearGradient.length, b);
                    friends.insert(friends.length-1, "${txtquotes.text}");
                  }
                  create.insert(0, '${txtquotes.text}');
                });
              },child: Text("Save",style: TextStyle(fontSize: 20),)),
            ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: b,
                ),
                alignment: Alignment.center,
                child: Text("$c", style: Theme.of(context).textTheme.headline1),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select Background",style: TextStyle(color: Colors.white,fontSize: 20)),
                    SizedBox(height: 10,),
                    Container(
                      height: 100,
                      width: 500,
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1),
                        itemCount: 10,
                        itemBuilder: (context, index) => Box2(linearGradient[index]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Enter the quotes",style: TextStyle(color: Colors.white,fontSize: 20)),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: b,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          style: TextStyle(fontSize: 15,color: Colors.white),
                          decoration: InputDecoration(border: InputBorder.none),
                          controller: txtquotes,
                          onChanged: (value) {
                            setState(() {
                              c = txtquotes.text;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Select Category",style: TextStyle(color: Colors.white,fontSize: 20)),
                    SizedBox(height: 10,),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        gradient: b,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: DropdownButton(
                          menuMaxHeight: 300,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                          isExpanded: true,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.white,
                          dropdownColor: Theme.of(context).backgroundColor,
                          items: [
                            DropdownMenuItem(child: Text("Inspirational"),value: 'Inspirational',),
                            DropdownMenuItem(child: Text("Freedom"),value: 'Freedom',),
                            DropdownMenuItem(child: Text("Leadership"),value: 'Leadership',),
                            DropdownMenuItem(child: Text("Sad"),value: 'Sad',),
                            DropdownMenuItem(child: Text("Attitude"),value: 'Attitude',),
                            DropdownMenuItem(child: Text("Smile"),value: 'Smile',),
                            DropdownMenuItem(child: Text("Birthday"),value: 'Birthday',),
                            DropdownMenuItem(child: Text("Alone"),value: 'Alone',),
                            DropdownMenuItem(child: Text("Romantic"),value: 'Romantic',),
                            DropdownMenuItem(child: Text("Success"),value: 'Success',),
                            DropdownMenuItem(child: Text("Failure"),value: 'Failure',),
                            DropdownMenuItem(child: Text("Love"),value: 'Love',),
                            DropdownMenuItem(child: Text("Family"),value: 'Family',),
                            DropdownMenuItem(child: Text("Friends"),value: 'Friends',),
                          ],
                          onChanged: (value) {
                            setState(() {
                              data = value!;
                            });
                          },
                          value: data,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Box2(Gradient a) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            b = a;
          });
        },
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: a,
          ),
        ),
      ),
    );
  }
}
