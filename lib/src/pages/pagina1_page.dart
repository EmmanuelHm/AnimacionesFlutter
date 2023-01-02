import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animate Do'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            const TwitterPage()));
              },
              icon: const FaIcon(FontAwesomeIcons.twitter),
            ),
            SlideInLeft(
              from: 100,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              const Pagina1Page()));
                },
                icon: const Icon(Icons.navigate_next),
              ),
            )
          ],
        ),
        floatingActionButton: ElasticInRight(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const NavegacionPage()));
            },
            child: const FaIcon(FontAwesomeIcons.play),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElasticIn(
                  delay: const Duration(milliseconds: 1100),
                  child: const Icon(Icons.new_releases,
                      color: Colors.blue, size: 40)),
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                child: const Text('Titulo',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),
              ),
              FadeIn(
                delay: const Duration(milliseconds: 800),
                child: const Text('Soy un texto pequeño',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
              ),
              FadeInLeft(
                delay: const Duration(milliseconds: 1100),
                child: Container(
                  width: 220,
                  height: 2,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }
}
