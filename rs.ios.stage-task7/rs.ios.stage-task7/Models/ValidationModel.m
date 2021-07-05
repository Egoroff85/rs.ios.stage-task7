//
//  ValidationModel.m
//  rs.ios.stage-task7
//
//  Created by WiCKed on 05.07.2021.
//

#import "ValidationModel.h"

@interface ValidationModel ()

@property (strong, nonatomic) NSArray<NSNumber *> *correctSequence;
@property (strong, nonatomic) NSString *correctLogin;
@property (strong, nonatomic) NSString *correctPassword;

@end

@implementation ValidationModel

- (id)init {
    self = [super init];
    if (self) {
        self.correctLogin = @"username";
        self.correctPassword = @"password";
        self.correctSequence = @[@1, @3, @2];
    }
    return self;
}

- (BOOL)validateLogin:(NSString *) login {
    return [login isEqualToString:self.correctLogin];
}

- (BOOL)validatePassword:(NSString *) password {
    return [password isEqualToString:self.correctPassword];
}

- (BOOL)validateSequence:(NSArray<NSNumber *>*) sequence {
    return [sequence isEqualToArray:self.correctSequence];
}

@end
