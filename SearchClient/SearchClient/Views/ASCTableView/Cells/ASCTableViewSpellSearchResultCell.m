//
//  ASCTableViewSpellSearchResultCell.m
//  SearchClient
//
//  Created by Alex Hill on 12/6/15.
//  Copyright © 2015 Alex Hill. All rights reserved.
//

#import "ASCTableViewSpellSearchResultCell.h"

NSString * const ASCTableViewSpellSearchResultCellIdentifier = @"ASCTableViewSpellSearchResultCellIdentifier";

@implementation ASCTableViewSpellSearchResultCell

@dynamic cellModel;

- (void)setup {
    [super setup];
    
    self.textLabel.hidden = YES;
    
    self.suggestedSpellingLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.suggestedSpellingLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.suggestedSpellingLabel.frame = CGRectMake(ASCTableViewCellContentPadding, ASCTableViewCellContentPadding, self.frame.size.width - (2 * ASCTableViewCellContentPadding), 0);
    [self.suggestedSpellingLabel sizeToFit];
}

- (void)setCellModel:(ASCTableViewSpellSearchResultCellModel *)cellModel {
    [super setCellModel:cellModel];
    
    UIFontDescriptor *fontDescriptor = [self.suggestedSpellingLabel.font.fontDescriptor fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold | UIFontDescriptorTraitItalic];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[@"Did you mean: " stringByAppendingString:self.cellModel.suggestedSpellingLabelText] attributes: @{ NSFontAttributeName:[UIFont systemFontOfSize:16.] }];
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithDescriptor:fontDescriptor size:16.] range:[string.string rangeOfString:self.cellModel.suggestedSpellingLabelText]];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:[string.string rangeOfString:self.cellModel.suggestedSpellingLabelText]];
    
    self.suggestedSpellingLabel.attributedText = string;
}

+ (CGFloat)intrinsicHeightForWidth:(CGFloat)width cellModel:(ASCTableViewSearchResultCellModel *)cellModel {
    static ASCTableViewSpellSearchResultCell *sizingCell;
    
    // we have to make a sizing cell to get the intrinsic size.
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [[ASCTableViewSpellSearchResultCell alloc] init];
    });
    
    sizingCell.bounds = CGRectMake(0, 0, width, 0);
    sizingCell.cellModel = (ASCTableViewSpellSearchResultCellModel *)cellModel;
    [sizingCell layoutSubviews];
    
    CGFloat height = sizingCell.suggestedSpellingLabel.frame.size.height + (2 * ASCTableViewCellContentPadding);
    
    return height;
}

@end
