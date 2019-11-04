import 'package:flutter/material.dart';

void main() => runApp(ContadorClientes());

class ContadorClientes extends StatefulWidget {
  @override
  _ContadorClientesState createState() => _ContadorClientesState();
}

class _ContadorClientesState extends State<ContadorClientes> {
  int _clientes = 0;
  String _status = "Pode Entrar";

  void changeClientes(int valueToChange) {

    setState(() {

      _clientes += valueToChange;

      if(_clientes > 10){
        _status = "Estamos Lotados!!!";
        _clientes = 10;
        return;
      }
      if(_clientes <= 0){
        _status = "Estamos Vazios!";
        _clientes = 0;
        return;
      }

      _status = "Temos Vagas!";

    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("images/restaurant.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pessoas: $_clientes",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontFamily: "comic sans",
                    decoration: TextDecoration.none),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text(
                        '+1',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        debugPrint("Entrou Gente"); changeClientes(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      child: Text(
                        '-1',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        debugPrint("Saiu Gente");changeClientes(-1);
                      },
                    ),
                  )
                ],
              ),
              Text(
                "$_status",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: "comic sans",
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ));
  }
}
