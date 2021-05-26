import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/providers/home_page_icons.dart';
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  final HomePageIcons homePageIcons;

  const PageItem(
    this.homePageIcons,
  );

  void _selectScreen(BuildContext context) {
    final _navigator = Navigator.of(context);

    switch (homePageIcons.id) {
      case "1":
        _navigator.pushNamed(
          AppRoute.AGENDA_DIARIA,
          arguments: homePageIcons,
        );
        break;
      case "2":
        _navigator.pushNamed(
          AppRoute.CLINICAS,
          arguments: homePageIcons,
        );
        break;
      case "3":
        _navigator.pushNamed(
          AppRoute.PACIENTES,
          arguments: homePageIcons,
        );
        break;
      case "4":
        _navigator.pushNamed(
          AppRoute.RENDIMENTOS,
          arguments: homePageIcons,
        );
        break;
      default:
        _navigator.pushNamed(
          AppRoute.HOME,
          arguments: homePageIcons,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      // color: Color.fromRGBO(255, 250, 250, 1),
      child: InkWell(
        onTap: () => _selectScreen(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  homePageIcons.image,
                  fit: BoxFit.cover,
                  height: 80,
                ),
              ),
              Container(
                child: Text(
                  homePageIcons.title,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
