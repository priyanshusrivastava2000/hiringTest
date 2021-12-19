import 'package:flutter/material.dart';
import 'package:hring_task/view/cart_page.dart';

import 'package:hring_task/view/widgets/grid_items.dart';
import 'package:hring_task/view/widgets/slider.dart';
import 'package:hring_task/view_model/functions/fetch_categories.dart';
import 'package:hring_task/view_model/functions/fetch_category_product.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool catStatus = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories().whenComplete((){
      setState(() {
        catStatus=true;
      });
    });
    getProductByCategories('electronics');
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: (catStatus)?DefaultTabController(
          length: categories.length,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: EdgeInsets.only(left: 5),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => profile()),
                    // );
                  },
                  child: const CircleAvatar(
                    child:  Text(
                      "P",
                      style: TextStyle(fontSize: 26),
                    ),
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cartScreen()),
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  slider(),
                  Container(
                    width: MediaQuery.of(context).size.width,

                    child: TabBar(
                      tabs: categoryTabs,
                      labelColor: Color(0xFF607887),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: TabBarView(
                      children: List<Widget>.generate(categoryTabs.length,(int index){
                        return FutureBuilder(
                          future: getProductByCategories(categories[index]),
                          builder: (BuildContext context,AsyncSnapshot snapshot){
                            if(snapshot.data == null){
                              return   Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            else{
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: GridView.builder(
                                    itemCount: snapshot.data.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 20,
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.6),
                                    itemBuilder: (context, index1) {
                                      return item(snapshot.data[index1].imageUrl, snapshot.data[index1].name, snapshot.data[index1].price, snapshot.data[index1].id);
                                    }),
                              );
                            }
                          },

                        );
                      })
                    ),
                  )
                ],
              ),
            ),
    ),
        ):Scaffold(body: const CircularProgressIndicator()),
    );
  }
}
