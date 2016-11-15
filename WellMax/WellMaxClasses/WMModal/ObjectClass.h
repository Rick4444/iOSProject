//
//  ObjectClass.h
//  SampleCode
//
//  Created by EVS on 9/29/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectClass : NSObject

{
    NSString *_code,*_image,*_manft,*_brand,*_product,*_size,*_comment,*_address,*_lat,*_longt,*_status,*_date;
}

@property (nonatomic, copy)  NSString *code,*image,*manft,*brand,*product,*size,*comment,*address,*lat,*longt,*status,*date;

-(id)initWithcode:(NSString *)code
            image:(NSString *)image
            manft:(NSString *)manft
            brand:(NSString *)brand
          product:(NSString *)product
             size:(NSString *)size
          comment:(NSString *)comment
          address:(NSString *)address
              lat:(NSString *)lat
            longt:(NSString *)longt
           status:(NSString *)status
             date:(NSString *)date;


@end
