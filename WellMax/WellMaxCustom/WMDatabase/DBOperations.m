//
//  DBOperations.m


#import "DBOperations.h"
#import <sqlite3.h>
#import "Utils.h"
#import "Utilities.h"

static DBOperations  *_dbOperationsObject;
static Database *dbObject;
#define DatabaseName @"SC.sqlite"

@implementation DBOperations

+(DBOperations *)dbOperationsObject
{
    
    _dbOperationsObject = [[DBOperations alloc]init];
    dbObject = [Database databaseObject];
    
    return _dbOperationsObject;
}

+(void)resetDatabase
{
    _dbOperationsObject = nil;
    [Database resetDatabase];
}

#pragma mark Check Image Id
-(NSString *) dataFilePath
{
    
    NSString *documentsDirectory = [Utilities documentsPath:DatabaseName];
    
    return documentsDirectory;
}

-(BOOL)recordExistOrNot:(NSString *)query
{
    BOOL recordExist=NO;
    sqlite3 *database = dbObject.database;
    NSInteger retval = 0;
    if(sqlite3_open([[self dataFilePath] UTF8String], &database) == SQLITE_OK)
    {
        sqlite3_stmt *statement;
        retval = sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, Nil);
        if(retval == SQLITE_OK)
        {
            if (sqlite3_step(statement)==SQLITE_ROW)
            {
                recordExist=YES;
            }
            else
            {
                //////NSLog(@"%s,",sqlite3_errmsg(database));
            }
            sqlite3_finalize(statement);
            sqlite3_close(database);
        }
    }
    return recordExist;
}

#pragma mark Custom Methods


@end
