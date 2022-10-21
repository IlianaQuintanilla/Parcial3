import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetalleDog extends StatefulWidget {
  final dogDetalle;
  final Color color;
  final int iddog;

  const DetalleDog(
      {super.key,
      required this.dogDetalle,
      required this.color,
      required this.iddog});
  @override
  State<DetalleDog> createState() => _DetalleDogState();
}

class _DetalleDogState extends State<DetalleDog> {
  @override
  Widget build(BuildContext context) {
    var anchodeta = MediaQuery.of(context).size.width;
    var altodeta = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 40,
            left: 1,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.dogDetalle['name'],
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Positioned(
            top: 120,
            left: 20,
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                  child: Text(
                    widget.dogDetalle['type'].join(', '),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.black26)),
          ),
          Positioned(
            top: altodeta * 0.18,
            right: -30,
            child: Image.asset(
              'assets/img/dog.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: anchodeta,
              height: altodeta * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    "Nombre :",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  )),
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    widget.dogDetalle['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    "Nombre de usuario :",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  )),
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    widget.dogDetalle['username'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    "Correo :",
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 16),
                                  )),
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    widget.dogDetalle['email'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                "Telefono :",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                              Container(
                                  width: anchodeta * 0.3,
                                  child: Text(
                                    widget.dogDetalle['phone'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                "Ciudad :",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                              Container(
                                  child: Text(
                                widget.dogDetalle['city'].join(", "),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                "Direcciones :",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                              SizedBox(
                                height: 20,
                                width: anchodeta * 0.55,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.dogDetalle['addres'].length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                          widget.dogDetalle['addres'][index]
                                              ['name'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    );
                                  }),
                                ),
                              ),
                            ]),
                      ),
                    ]),
              ),
            ),
          ),
          Positioned(
            top: (altodeta * 0.18) - 10,
            left: (altodeta / 2) - 180,
            child: CachedNetworkImage(
                imageUrl: widget.dogDetalle['img'],
                height: 150,
                fit: BoxFit.fitHeight),
          )
        ],
      ),
    );
  }
}
