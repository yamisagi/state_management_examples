import 'package:state_management_examples/materials/inherited_model/view/home_page.dart';
import 'package:state_management_examples/materials/inheritednotifier_changenotifier/view/home_view.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/view/provider_home.dart';
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
    },

    {
      'title': 'Inherited Model',
      'route': '/inherited_model',
      'page': const InheritedModelHomePage(),
      'subtitle': 'This is the inherited model page',
    },
    {
      'title': 'Inherited Notifier & Change Notifier',
      'route': '/inherited_notifier_change_notifier',
      'page': const NotiferHomePage(),
      'subtitle': 'This is the inherited notifier & change notifier page',
    },
    {
      'title': 'Basic Provider',
      'route': '/basic_provider',
      'page': const ProviderHome(),
      'subtitle': 'This is the basic provider page',
    }
  ];
}
