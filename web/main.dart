import 'dart:html';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  // var ships = await getShips();
  var url = Uri.https('swapi.dev', 'api/starships');
  var response = await http.get(url);

  var body = convert.jsonDecode(response.body);
  var ships = body['results'];
  print(ships.runtimeType);

  var foo = {"name": 'Hurz'};
  // querySelector('#output')?.text = 'Your Dart app is running.';
  for (var ship in ships) {
    querySelector('#output')?.appendHtml('<h3>${ship['name']}</h3>');
  }
}

getShips() async {
  var url = Uri.https('swapi.dev', 'api/starships');
  var response = await http.get(url);
  return await convert.jsonDecode(response.body).results as List<dynamic>;
}
