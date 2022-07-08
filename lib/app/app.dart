import 'package:movie_array/ui/screen/movie_list/movie_list_view.dart';
import 'package:movie_array/ui/screen/movie_list/movie_list_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../service/api_service.dart';



@StackedApp(
  routes: [
    MaterialRoute(page: MovieListView, initial: true)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: API),
    Factory(classType: MovieListViewModel),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */

  /** flutter pub run build_runner build --delete-conflicting-outputs */

}
