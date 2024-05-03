//
//  RecipeUITableViewCell.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import "RecipeUITableViewCell.h"

@interface RecipeUITableViewCell ()

@property(strong, nonatomic) UIImageView *recipeImageView;
@property(strong, nonatomic) UILabel *nameLabel;
@property(strong, nonatomic) UILabel *ratingLabel;
@property(strong, nonatomic) UILabel *difficultyLabel;
@property(strong, nonatomic) CAGradientLayer *colorLayer;


@end

@implementation RecipeUITableViewCell

+ (NSString *)identifier{
    return NSStringFromClass([RecipeUITableViewCell class]);
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self configureUI];
    }
    return self;
}

- (void)configureCell:(nonnull RecipeCellViewModel *)viewModel {
    _nameLabel.text = viewModel.name;
    _ratingLabel.text = viewModel.rating.stringValue;
    _difficultyLabel.text = viewModel.difficulty;
    
    __typeof(self) __weak weakSelf = self;
    [viewModel downloadImage:^(UIImage * _Nullable image, NSError * _Nullable error) {
        if(image != nil){
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.recipeImageView.image = image;
            });
            
        }
    } stringUrl:viewModel.stringUrlImage];

    
}

- (void)configureUI{
    
    _recipeImageView = [[UIImageView alloc] init];
    _recipeImageView.translatesAutoresizingMaskIntoConstraints = false;
    _recipeImageView.contentMode = UIViewContentModeScaleAspectFill;
    _recipeImageView.layer.cornerRadius = 10;
    _recipeImageView.clipsToBounds = true;
    [self.contentView addSubview:_recipeImageView];
    
    _colorLayer = [[CAGradientLayer alloc] init];
    _colorLayer.colors = @[(id)[[UIColor blackColor] colorWithAlphaComponent:0.8].CGColor, (id)[[UIColor blackColor] colorWithAlphaComponent:0.1].CGColor];
    [_recipeImageView.layer addSublayer:_colorLayer];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    _nameLabel.numberOfLines = 0;
    _nameLabel.textColor = UIColor.whiteColor;
    _nameLabel.font = [UIFont systemFontOfSize:19 weight:UIFontWeightBold];
    [_recipeImageView addSubview:_nameLabel];
    
    _ratingLabel = [[UILabel alloc] init];
    _ratingLabel.translatesAutoresizingMaskIntoConstraints = false;
    _ratingLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    _ratingLabel.textColor = UIColor.whiteColor;
    [_recipeImageView addSubview:_ratingLabel];
    
    _difficultyLabel = [[UILabel alloc] init];
    _difficultyLabel.translatesAutoresizingMaskIntoConstraints = false;
    _difficultyLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    _difficultyLabel.textColor = UIColor.whiteColor;
    [_recipeImageView addSubview:_difficultyLabel];
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.contentView.frame = UIEdgeInsetsInsetRect(self.contentView.frame, UIEdgeInsetsMake(10, 10, 10, 10));
    
    [NSLayoutConstraint activateConstraints:@[
        
        [_recipeImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [_recipeImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [_recipeImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [_recipeImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
        
        [_nameLabel.topAnchor constraintEqualToAnchor:_recipeImageView.topAnchor constant:20],
        [_nameLabel.leadingAnchor constraintEqualToAnchor:_recipeImageView.leadingAnchor constant:10],
        [_nameLabel.trailingAnchor constraintEqualToAnchor:_recipeImageView.trailingAnchor],
        
        [_difficultyLabel.topAnchor constraintEqualToAnchor:_nameLabel.bottomAnchor],
        [_difficultyLabel.leadingAnchor constraintEqualToAnchor:_recipeImageView.leadingAnchor constant:10],
        
        [_ratingLabel.topAnchor constraintEqualToAnchor:_difficultyLabel.bottomAnchor],
        [_ratingLabel.leadingAnchor constraintEqualToAnchor:_recipeImageView.leadingAnchor constant:10]

    ]];
    
    _colorLayer.frame = _recipeImageView.bounds;
    
  
}


@end
