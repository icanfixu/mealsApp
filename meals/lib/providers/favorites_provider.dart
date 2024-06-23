import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteNotifier extends StateNotifier<List<Meal>> {
  FavoriteNotifier() : super([]);
  //methods
  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    //deleteing
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      //adding
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteNotifier, List<Meal>>((ref) {
  return FavoriteNotifier();
});

// StateNotifierProvider, 2 class like stfl,  name convention, generic StateNotifier 
//constructor
// not allowd to edit an existing value in memory
//state class provided by StateNotifier and that you can only assign stuff to it(ie replace existing things in that )
//howver u cant .add or .delete (ie modifyhing it )
/*
you can do this btww
state = state.where().toList()
where gives us a new iterable and toList then converts it to list
remember .where((meal) => true to keep and false to drop it).toList()


for adding
state = [...state, meal]
*/
