import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Utils {
  static Path createAnimatedPath(Path originPath, double aminationPercentage) {

    final totalLength = originPath
        .computeMetrics()
        .fold(0.0, (double prev, ui.PathMetric metric) => prev + metric.length);
    final currentLength = totalLength * aminationPercentage;

    return extractPathUtilLength(originPath, currentLength);
  }

  static Path extractPathUtilLength(Path originPath, double length) {
    double currentLength = 0.0;

    final path = Path();

    var metriceIterator = originPath.computeMetrics().iterator;

    while (metriceIterator.moveNext()) {
      var metric = metriceIterator.current;
      var nextLength = currentLength + metric.length;

      final bool isLastSegment = nextLength > length;

      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
