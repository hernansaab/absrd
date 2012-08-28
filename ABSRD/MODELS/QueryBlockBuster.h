//
//  QueryBuster.h
//  PALANGANA.CLEAN
//
//  Created by hernan saab on 8/25/12.
//  Copyright (c) 2012 hernan saab. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef id (^AbsrdQueryBlock)();
@interface QueryBlockBuster : NSObject

-(BOOL) addQueryBlock: ( AbsrdQueryBlock )predicate;
-(void) testRunBlock;
-(NSMutableArray *) multiQueryParallel;
-(NSMutableArray *) multiQuerySequential;
@end
