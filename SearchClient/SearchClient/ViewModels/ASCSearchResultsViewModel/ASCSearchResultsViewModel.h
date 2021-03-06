//
//  ASCViewModel.h
//  SearchClient
//
//  Created by Alex Hill on 10/27/15.
//  Copyright © 2015 Alex Hill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASCSearchHistoryViewModel.h"

@class ASCSearchResultsViewModel;

typedef NS_ENUM(NSInteger, ASCQueryType) {
    ASCQueryTypeWeb,
    ASCQueryTypeImage,
    ASCQueryTypeNews,
    ASCQueryTypeVideo,
    ASCQueryTypeRelated
};

@interface ASCSearchResultsViewModel : ASCViewModel

@property (nonatomic, copy) NSString *query;
@property (nonatomic) ASCQueryType queryType;

/**
 * @brief Load results for a given queryType
 */
- (void)loadResultsWithQueryType:(ASCQueryType)queryType;

@end
