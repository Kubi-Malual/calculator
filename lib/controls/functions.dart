import 'package:math_expressions/math_expressions.dart';

class Functions {
  String clean = " ";
  String clear() {
    return clean;
  }

  String delete(String text) {
    String split = "";
    for (var i = 0; i < text.length - 1; i++) {
      split += text[i];
    }

    return split;
  }
  String equal(String prs) {
    Parser p = Parser();
    var evl = p.parse(prs);
    ContextModel cntx = ContextModel();
    double res = evl.evaluate(EvaluationType.REAL, cntx);
    return res.toString();
  }

  String abs(String prs) {
    double i = double.parse(prs);
    if (i > 0) return i.toString();
    double equal = i * -1;
    return equal.toString();
  }
}
