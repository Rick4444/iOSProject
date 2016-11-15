

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Database : NSObject{
    sqlite3 *_database;
}

@property (nonatomic, assign) sqlite3 *database;

+(Database *)databaseObject;
+(void)resetDatabase;

@end