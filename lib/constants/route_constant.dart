import 'package:state_management_examples/materials/stateful_app/provider/mock_provider.dart';
import 'package:state_management_examples/materials/stateful_app/service/mock_api.dart';
import 'package:state_management_examples/materials/stateful_app/view/home_view.dart';
import 'package:state_management_examples/materials/vanilla_management/view/contact_view.dart';
import 'package:state_management_examples/pages/home_page.dart';

class RouteManager {
  // This is the list of all the routes in the application.
  // We can use this list to generate the routes.
  static final List<Map<String, dynamic>> routesList = [
    {
      'title': 'Home',
      'route': '/',
      'page': const HomePage(),
      'subtitle': 'This is the home page',
    },

    // Add your routes here

    {
      'title': 'Vanilla Management',
      'route': '/vanilla_management',
      'page': const ContactView(),
      'subtitle': 'This is the vanilla management page',
    },

    {
      'title': 'Inherited Widget ',
      'route': '/inherited_widget',
      'page': MockProvider(mockApi: MockApi(), child: const StatefulHome()),
      'subtitle': 'This is the inherited widget page',
    }
  ];
}
