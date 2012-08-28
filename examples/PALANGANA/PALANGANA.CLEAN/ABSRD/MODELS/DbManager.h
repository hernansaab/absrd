//
//  DbConnectorManager.h
//  PALANGANA.CLEAN
//
//  Created by hernan saab on 8/24/12.
//  Copyright (c) 2012 hernan saab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DbConnector.h"

@interface DbManager : NSObject


+(DbConnector *) getConnector: (NSString *) dbName;
-(BOOL) releaseAllConnectorsForCurrentQueue ;
+(DbManager *)singleton;


@end
