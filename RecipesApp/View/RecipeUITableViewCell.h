//
//  RecipeUITableViewCell.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import <UIKit/UIKit.h>
#import "RecipeCellViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecipeUITableViewCell : UITableViewCell

+ (NSString *)identifier;

- (void)configureCell:(RecipeCellViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
