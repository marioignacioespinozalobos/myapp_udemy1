import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Booksy(),
    title: "Booksy",
  ));
}

class Booksy extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 80)),
            Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 8)],
              ),
              child: Image(
                image: AssetImage("images/alonso_sopaipa.jpg"),
                width: 200,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            BookDescription("Sopaipa", "Alonso Sopaipa",
                "era se una vez en una pequeña isla cpon mocos de todos lados dfgdfg"),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            AddBookButton()
          ],
        ),
      ),
      color: Colors.white,
    );
  }
}

class AddBookButton extends StatefulWidget {
  @override
  _AddBookButtonState createState() {
    return _AddBookButtonState();
  }
}

class _AddBookButtonState extends State<AddBookButton> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    var button = _isSaved
        ? ElevatedButton(
            onPressed: _manageBookInLibrary,
            child: Text("Quitar a libreria"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          )
        : ElevatedButton(
            onPressed: _manageBookInLibrary,
            child: Text("Agregar de la libreria"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          );

    // TODO: implement build
    return Directionality(textDirection: TextDirection.ltr, child: button);
  }

  void _manageBookInLibrary() {
    // llamar backend y actualizar bd

    // metodo async y largo
    setState(() {
      _isSaved = !_isSaved;
    });
  }
}

class BookDescription extends StatelessWidget {
  final String title;
  final String author;
  final String description;

  const BookDescription(this.title, this.author, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          author,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.black54, fontSize: 25),
        ),
        Padding(padding: EdgeInsets.only(top: 20)),
        Text(
          description,
          textAlign: TextAlign.justify,
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.black54, fontSize: 18),
          softWrap: true,
        ),
      ],
    );
  }
}