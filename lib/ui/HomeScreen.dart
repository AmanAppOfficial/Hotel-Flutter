import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/blocs/HomeScreenBloc.dart';
import 'package:untitled/models/HomeModel.dart';
import 'package:untitled/resources/services/ThemeService.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ThemeBloc themeBloc = ThemeBloc();
  HomeScreenBloc homeBloc = HomeScreenBloc();

  TextStyle paraTextStyle = TextStyle(fontWeight: FontWeight.w500 , fontSize: 12);
  TextStyle headingTextStyle = TextStyle(fontWeight: FontWeight.bold , fontSize: 22);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: themeBloc.themeStream,
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: headTile(snapshot)
            ),
            drawer: Drawer(
            ),
            body: SafeArea(
              child: homeContainer(),
            ),
          );
        }
        return Scaffold(
          body: Container(
            color: Colors.cyanAccent,
          ),
        );
      }
    );
  }


  Widget headTile(snapshot){
    return AppBar(
      elevation: 0,
      backgroundColor: snapshot.data,
      title: Container(
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.fromLTRB(0 , 15 , 0 , 0),
        height: 45,
        child: TextField(
          decoration: InputDecoration(
              hintText: '     Enter a city or locality',
              border: InputBorder.none
          ),
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: IconButton(onPressed: (){}, icon: Icon(
              Icons.notifications
          ),iconSize: 30,),
        )
      ],
    );
  }
  Widget homeContainer(){
    return StreamBuilder<HomeModel>(
      stream: homeBloc.homeStream,
      builder: (context, AsyncSnapshot<HomeModel> snapshot) {
        if(!snapshot.hasData){
          return Container(
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  height: 120,
                  color: Colors.white,
                  child: cityLayout(),
                ),
                Divider(
                  height: 10,
                  color: Colors.blueGrey,
                ),
                Container(
                  color: Colors.white,
                  child: offerLayout(),
                ),
                recommendedLayout()
              ],
            ),
          );
        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  Widget cityLayout(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext ctx , int index){
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/delhi.jpg"),
                ),
              ),
              Center(
                child: Text('Mumbai' , style: paraTextStyle,),
              )
            ],
          );
      }),
    );
  }

  Widget offerLayout(){
    return Container(
      margin: EdgeInsets.only(top: 20 , left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Limited Time Offers' , style: headingTextStyle,),
          Container(
            margin: EdgeInsets.only(left: 0 , top: 20 , right: 10),
            color: Colors.white,
            height: 150,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext ctx , int index){
                  return Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    margin: EdgeInsets.only(left: 0 , top: 10 , right: 10),
                    color: Colors.blue,
                    child: Image.asset("images/offer.jpg" , fit: BoxFit.fill,),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget recommendedLayout(){
    return Container(
      margin: EdgeInsets.only(top: 20 , left: 10 , bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommended for you' , style: headingTextStyle,),
          Container(
            height: 260,
            margin: EdgeInsets.only(left: 0 , top: 20 , right: 10),
            color: Colors.white,
            child: SizedBox(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx , int index){
                    return Container(
                      width: MediaQuery.of(context).size.width/2,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10) ,
                              bottomRight: Radius.circular(10)),
                        ),
                        shadowColor: Colors.grey,
                        elevation: 3,
                        margin: EdgeInsets.only(left: 0 , top: 10 , right: 15),
                        child: hotelLayout(),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget hotelLayout(){
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                height: 120,
                child: Image.asset("images/room.jpg" , fit: BoxFit.fill,),
              ),
              Container(
                margin: EdgeInsets.only(top: 20 ,left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width  :MediaQuery.of(context).size.width/2.6 ,
                        child: Text('OYO Rooms Internal ceiling' ,
                          overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 14),)),
                    SizedBox(height: 5,),
                    Container(
                        width  :MediaQuery.of(context).size.width/2.6 ,
                        child: Text('Kurla - Andheri Road' ,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13 , fontWeight: FontWeight.normal , color: Colors.grey),)),
                    SizedBox(height: 5,),
                    Container(
                     child :  Row(
                       children: [
                        Text("\$1450" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 19),),
                         SizedBox(width: 5,),
                         RichText(
                           text: TextSpan(
                             text: '\$2199',
                             style: new TextStyle(
                               color: Colors.grey,
                               decoration: TextDecoration.lineThrough,
                               fontSize: 20
                             ),
                           ),
                         )
                     ],)
                    )
                  ],
                ),
              )
            ],
          ),
        ),
         ratingBar()
      ],
    );
  }

  Widget ratingBar(){
    return  Center(
      child: Container(
          height: 30,
          width: 80,
          alignment: Alignment.center,
          color: Colors.green,
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('4.5' , style: TextStyle(color: Colors.white),),
                SizedBox(width: 15),
                Icon(Icons.star , color: Colors.white,),
              ],
            ),
          )
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    themeBloc.dispose();
    homeBloc.dispose();
  }
}
