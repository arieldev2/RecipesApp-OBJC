//
//  ViewController.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <UIKit/UIKit.h>
#import "RecipeListViewModel.h"
#import "RecipeService.h"
#import "RecipeUITableViewCell.h"
#import "RecipeDetailViewModel.h"
#import "RecipeDetailViewController.h"

@interface RecipesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, RecipeListViewModelDelegate>


@end

