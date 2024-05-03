//
//  RecipeDetailViewController.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <UIKit/UIKit.h>
#import "RecipeDetailViewModel.h"
#import "RecipeDetailHeaderUIView.h"
#import "RecipeIngredientsTableViewCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface RecipeDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithViewModel:(RecipeDetailViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
