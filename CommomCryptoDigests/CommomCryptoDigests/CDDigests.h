//
//  CDDigests.h
//  CommomCryptoDigests
//
//  Created by Guerrero Azpitarte Adrian on 06/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

#ifndef CDDigests_h
#define CDDigests_h
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>


@interface CDDigests : NSObject
+(NSString *) sha1String (Styring *) input;
@end

#endif /* CDDigests_h */
