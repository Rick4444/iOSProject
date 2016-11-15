//
//  DBOperations.h
//


#import <Foundation/Foundation.h>
#import "Database.h"


@interface DBOperations : NSObject

+(DBOperations *)dbOperationsObject;
+(void)resetDatabase;


//Common Data
-(BOOL)recordExistOrNot:(NSString *)query;



@end
