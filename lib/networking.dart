import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  // final String url;
   String url;

//   Future<dynamic> getData() async {
//     //http.Response response = await http.get(url);
//     http.Request response = await http.Request("GET", Uri.parse(url));
//     http.StreamedResponse result = await response.send();
// //    print(response.body);

//     if (result.statusCode == 200) {
//       String data = await utf8.decodeStream(result.stream);
//       print(data);

//       //return jsonDecode(data);
//       return data;
//     } else {
//       print(result.statusCode);
//     }
//   }


Future<dynamic> getData() async {
    //http.Response response = await http.get(url);
    http.Request response = await http.Request("GET", Uri.parse(url));
    http.StreamedResponse result = await response.send();
//    print(response.body);

    if (result.statusCode == 200) {
      String data = await utf8.decodeStream(result.stream);
      print(data);

      //return jsonDecode(data);
      return data;
    } else {
      print(result.statusCode);
    }
  }

  Future<dynamic> postData(var patientDetails) async {
    print(patientDetails);
    http.Response response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(patientDetails));

    return response.body;
  }
}
