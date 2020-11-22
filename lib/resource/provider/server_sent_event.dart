import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServerSentEventBloc {
  ServerSentEventBloc() {
    var request = http.Request("GET", Uri.parse("http://localhost:8080/api/stream-sse"));
    request.headers["Accept"] = "text/event-stream";
    request.headers["Cache-Control"] = "no-cache";
    Future<http.StreamedResponse> response = _client.send(request);
    // print("Subscribed!");
    response.asStream().listen((streamedResponse) {
      streamedResponse.stream.listen((data) {
        var jsonData = json.decode(utf8.decode(data).split("data:")[1]) as Map<String, dynamic>;
        // print("Received data => $jsonData");
        this._state.add(jsonData.toString());
      });
    });

  }

  http.Client _client = http.Client();
  StreamController<String> _controller = StreamController<String>();
  Sink<String> get _state => this._controller.sink;

  Stream<String> get event => this._controller.stream;

}