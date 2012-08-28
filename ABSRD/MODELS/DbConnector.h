//
//  DbConnector.h
//  PALANGANA.CLEAN
//
//  Created by hernan saab on 8/18/12.
//  Copyright (c) 2012 hernan saab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DbConnector : NSObject


-(id) initWithConnector: (id) TechnologyConnector;
-(DbConnector *) connect: (NSDictionary *) creds ;
-(NSMutableArray *) query:  (NSString *) query;
-(NSDictionary *) getCreds;
@end
