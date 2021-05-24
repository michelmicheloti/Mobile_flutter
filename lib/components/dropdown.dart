import 'package:agenda/models/clinica.dart';
import 'package:flutter/material.dart';
import 'package:agenda/Utils/globals.dart' as globals;

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<String> listaClinicas = [];
  late Future<List<String>> clinicas;

  @override
  void initState() {
    clinicas = Clinica().carregaClinica();
    super.initState();
  }

  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: clinicas,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          listaClinicas = snapshot.data.toString().split("}, {");
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: DropdownButton(
                  hint: Container(
                    child: Text("Selecione uma Clínica"),
                    alignment: Alignment.center,
                  ),
                  dropdownColor: Colors.white,
                  underline: SizedBox(),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 32,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue as String;
                      globals.valueDropClinica =
                          valueChoose.toString().split(",")[1];
                    });
                  },
                  items: listaClinicas.map(
                    (valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            valueItem.split(",")[1],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
