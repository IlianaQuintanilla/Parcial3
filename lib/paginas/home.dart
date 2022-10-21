import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import 'detalledog.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dogApi = "https://jsonplaceholder.typicode.com/users";
  List dog = [];
  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              bottom: -50,
              right: -50,
              child: Image.asset(
                "assets/img/dog.png",
                width: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                "--Guillen Perez, Karla Gabriela 25-0590-2018 --"
                "Fabian Quintanilla, Iliana Lisseth 25-3862-2018",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ),
            Positioned(
              top: 100,
              bottom: 0,
              width: ancho,
              child: Column(children: [
                dog.length != null
                    ? Expanded(
                        child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: dog.length,
                        itemBuilder: (context, index) {
                          var tipo = dog[index]['name'][0];

                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: dog[index]['name'][0] == "Grass"
                                          ? Colors.greenAccent
                                          : dog[index]['name'][0] == "Fire"
                                              ? Colors.redAccent
                                              : dog[index]['name'][0] == "Water"
                                                  ? Colors.blue
                                                  : dog[index]['name'][0] ==
                                                          "Poison"
                                                      ? Colors.deepPurpleAccent
                                                      : dog[index]['name'][0] ==
                                                              "Electric"
                                                          ? Colors.amber
                                                          : dog[index]['name']
                                                                      [0] ==
                                                                  "Rock"
                                                              ? Colors.grey
                                                              : dog[index]['name']
                                                                          [0] ==
                                                                      "Ground"
                                                                  ? Colors.brown
                                                                  : dog[index]['name']
                                                                              [
                                                                              0] ==
                                                                          "Psychic"
                                                                      ? Colors
                                                                          .indigo
                                                                      : dog[index]['name'][0] ==
                                                                              "Fighting"
                                                                          ? Colors
                                                                              .orange
                                                                          : dog[index]['name'][0] == "Bug"
                                                                              ? Colors.lightGreenAccent
                                                                              : dog[index]['name'][0] == "Ghost"
                                                                                  ? Colors.deepPurple
                                                                                  : dog[index]['name'][0] == "Normal"
                                                                                      ? Colors.black26
                                                                                      : Colors.pink,
                                      /**
                                       *  "Fire",*
                                          "Ice",
                                          "Flying",
                                          "Psychic"
                                       * "Water",*
                                          "Ground",*
                                          "Rock"*
                                       */

                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Stack(children: [
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Image.asset(
                                        "assets/img/dog.png",
                                        height: 50,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        left: 20,
                                        child: Text(
                                          dog[index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                        )),
                                    Positioned(
                                        top: 45,
                                        left: 20,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(tipo.toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10)),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.black26),
                                        )),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: CachedNetworkImage(
                                        imageUrl: dog[index]['img'],
                                        height: 80,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ])),
                            ),
                            onTap: () {
                              //TODO: llamar pantalla
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetalleDog(
                                          dogDetalle: dog[index],
                                          color: Colors.green,
                                          iddog: index)));
                            },
                          );
                        },
                      ))
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ]),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      datosDog();
    }
  }

  void datosDog() {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodejsonData = jsonDecode(value.body);
        dog = decodejsonData['users'];
        setState(() {});
      }

      //  print(decodejsonData);
    });
    //200 correcto
    //404 incorrecto
    //500
    //505,504,505
  }
}
