import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_apl/Screen/RandomApi/Provider/home_provider.dart';
import 'package:random_apl/Screen/RandomApi/model/random_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvidert,homeProviderf;
  @override
  Widget build(BuildContext context) {
    homeProviderf = Provider.of<HomeProvider>(context,listen: false);
    homeProvidert = Provider.of<HomeProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Random Api"),
      ),
      body: FutureBuilder(
        future: homeProviderf!.GetData(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Text(("${snapshot.error}"));
            }
          else if(snapshot.hasData)
            {
            Randommodel? rmap = snapshot.data;
            return ListView.builder(
              itemCount: rmap!.results!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.amber,border: Border.all(width: 1),),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gender       :  ${rmap.results![index].gender}",style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text("FirstName :  ${rmap.results![index].name!.first}",style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text("LastName  : ${rmap.results![index].name!.last}",style: TextStyle(fontSize: 25),),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.amber,border: Border.all(width: 1),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Country      :  ${rmap.results![index].location!.country}",style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text("State           :  ${rmap.results![index].location!.state}",style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text("City             :   ${rmap.results![index].location!.city}",style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text("PoatCode   :  ${rmap.results![index].location!.postcode}",style: TextStyle(fontSize: 25),),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.amber,border: Border.all(width: 1),),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("E-Mail        :  ${rmap.results![index].email}",style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text("Phone        :  ${rmap.results![index].phone}",style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text("Username :  ${rmap.results![index].login!.username}",style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text("Password  :  ${rmap.results![index].login!.password}",style: TextStyle(fontSize: 25),),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
            },);
            }
          return CircularProgressIndicator();

      },),
    ));
  }
}
