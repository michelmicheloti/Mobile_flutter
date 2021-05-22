import 'package:agenda/components/buttons_cancel_save.dart';
import 'package:agenda/components/text_input.dart';
import 'package:agenda/components/text_with_textinput.dart';
import 'package:agenda/models/home_page_icons.dart';
import 'package:agenda/screens/paciente/pacientes_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RendimentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageIcons =
        ModalRoute.of(context)?.settings.arguments as HomePageIcons;

    final widthTotal = MediaQuery.of(context).size.width;
    final heigthTotal = MediaQuery.of(context).size.height;
    void _saveItem() {
      print("salvou");
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              homePageIcons.title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: heigthTotal * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropDown(),
                TextInput(
                  widthTotal: widthTotal,
                  textInputType: TextInputType.datetime,
                  icon: Icon(Icons.calendar_today),
                  labelText: "Data Inicial",
                  hint: "${DateFormat('dd/MM/y').format(DateTime.now())}",
                ),
                TextInput(
                  widthTotal: widthTotal,
                  textInputType: TextInputType.datetime,
                  icon: Icon(Icons.calendar_today),
                  labelText: "Data Final",
                  hint: "${DateFormat('dd/MM/y').format(DateTime.now())}",
                ),
                Container(
                  width: widthTotal * 0.8,
                  child: TextWithTextInput(
                    title: "Valor a Receber",
                    hint: "R\$50,00",
                    textInputType:
                        TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Container(
                  width: widthTotal * 0.9,
                  child: ButtonsCancelSave(
                    function: _saveItem,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
