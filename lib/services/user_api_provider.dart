import "dart:convert";
import "package:http/http.dart" as http;
import "package:my_app/entity/users/user.dart";

class UserApiProvider {
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (response.statusCode == 200) {
        final List<dynamic> userJson = json.decode(response.body);

        return userJson.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
