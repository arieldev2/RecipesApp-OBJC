//
//  RecipeDetailHeaderUIView.h
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/2/24.
//

#import <UIKit/UIKit.h>
#import "RecipeDetailHeaderViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecipeDetailHeaderUIView : UIView

- (void)configureViewModel:(RecipeDetailHeaderViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
