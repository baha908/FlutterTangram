import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class DevelopersPage extends StatelessWidget {
  static const routeName = '/developers_page';
  static const whatis =
      "The tangram is a dissection puzzle consisting of seven flat polygons, called tans, which are put together to form shapes. The objective is to replicate a pattern (given only an outline) generally found in a puzzle book using all seven pieces without overlap. Alternatively the tans can be used to create original minimalist designs that are either appreciated for their inherent aesthetic merits or as the basis for challenging others to replicate its outline. It is reputed to have been invented in China sometime around the late 18th century CE and then carried over to America and Europe by trading ships shortly after. It became very popular in Europe for a time, and then again during World War I. It is one of the most widely recognized dissection puzzles in the world and has been used for various purposes including amusement, art, and education.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Column(children: [
        Container(
            margin: const EdgeInsets.only(top: 70.0),
            child: Center(
              child: Text(
                "Developers",
                style: const TextStyle(fontSize: 40),
              ),
            )),
        Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Text(
            "Bahadır Bayraktar",
            style: const TextStyle(fontWeight: FontWeight.bold)
          ),
        )),
        Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: RaisedButton(
              onPressed: (){
                launch("https://github.com/baha908");
              },
              child: Text('Github'),
            ),
            )),
        Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Text(
            "Gökay Meriç Şişik",
            style: const TextStyle(fontWeight: FontWeight.bold)
          ),
        )),
        Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: RaisedButton(
              onPressed: (){
                launch("https://github.com/gkydev");
              },
              child: Text('Github'),
            ),
            )),
      ]
      )
      );
      }}