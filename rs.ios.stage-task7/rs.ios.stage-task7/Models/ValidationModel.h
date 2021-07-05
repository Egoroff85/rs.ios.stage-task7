//
//  ValidationModel.h
//  rs.ios.stage-task7
//
//  Created by WiCKed on 05.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ValidationModel : NSObject

- (BOOL)validateLogin:(NSString *) login;
- (BOOL)validatePassword:(NSString *) password;
- (BOOL)validateSequence:(NSArray<NSNumber *>*) sequence;

@end

NS_ASSUME_NONNULL_END
