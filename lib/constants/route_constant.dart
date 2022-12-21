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
    }
  ];
}
