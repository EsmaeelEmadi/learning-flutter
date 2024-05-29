import "package:flutter/material.dart";

class Route { 
  final String name;
  final Widget screen;
  final bool withAuth;

  Route({required this.name, required this.screen, required this.withAuth});
}
