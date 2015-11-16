//
//  ASCTableViewSearchResultCell.h
//  SearchClient
//
//  Created by Alex Hill on 11/14/15.
//  Copyright © 2015 Alex Hill. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTTAttributedLabel, ASCSearchResultModel;

extern NSString *ASCTableViewSearchResultCellIdentifier;

@interface ASCTableViewSearchResultCell : UITableViewCell

@property (strong) TTTAttributedLabel *titleLabel;
@property (strong) TTTAttributedLabel *contentLabel;
@property (nonatomic) ASCSearchResultModel *cellModel;

@end
