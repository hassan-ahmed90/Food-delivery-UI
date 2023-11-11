import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Pizza", "Burgers", "Kebab", "Desert", "Salad"];
  List<dynamic> foods = [{
    "image": "images/pizza.jpg",
    "isFavorite": false,
  },
    {
      "image": "images/pizza.jpg",
      "isFavorite": false,
    },
    {
      "image": "images/pizza.jpg",
      "isFavorite": false,
    }
  ];

  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: Icon(null),
        actions: [
          IconButton(onPressed: (){}, icon: IconButton(
            onPressed: (){},
            icon: Icon(Icons.shopping_basket,color: Colors.grey[800],),
          ))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Food Delivery',style: TextStyle(
              fontSize: 30,
              color: Colors.grey[80],
              fontWeight: FontWeight.bold,
            ),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index)=> makeCatergory(title: categories[index],index: index),
                // children: [
                //   makeCatergory(isActive: true,title: 'Pizza'),
                //   makeCatergory(isActive: false,title: 'Burger'),
                //   makeCatergory(isActive: false,title: 'Sandwich'),
                //   makeCatergory(isActive: false,title: 'BBQS'),
                //   makeCatergory(isActive: false,title: 'ROLLS'),
                // ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.all(20),
            child: Text("Free Delivery",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),),
            Expanded(child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  makeItem(image: 'images/pizza.jpg',isFavourate: true),
                  makeItem(image: 'images/three.jpg',isFavourate: false),
                  makeItem(image: 'images/two.jpg',isFavourate: false),
                  makeItem(image: 'images/four.jpg',isFavourate: false),
                  makeItem(image: 'images/pizza.jpg',isFavourate: false),
                ],
              ),
            ))
          ],
        ),
      ),

    );
  }
  Widget makeCatergory({title,index}){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedCategory=index;
        });
      },
      child: Container(
        width: 120,
      margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: selectedCategory== index ? Colors.yellow[700] : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(title,style: TextStyle(
            color: selectedCategory == index ? Colors.black : Colors.grey[700],
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),),
        ),
      ));
  }

 Widget makeItem({image,isFavourate,index}){
    return AspectRatio(aspectRatio: 1/1.5,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20,bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image,
            ),fit: BoxFit.cover,
          ),
        ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2,.9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.2),
                ]
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        foods[index]["isFavourate"]=!foods[index]["isFavourate"];
                      });
                    },
                    child: isFavourate ? Icon(Icons.favorite,color: Colors.red,):
                        Icon(Icons.favorite,color: Colors.white,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$15.00",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),),
                      SizedBox(height: 10,),
                      Text('Vegiterian Pizza',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                      SizedBox(height: 30,),
                    ],
                  ),

                ],
              ),
            ),
          ),
      ),
    ));
 }
}
