//
//  CredentialFieldView.h
//  rs.ios.stage-task7
//
//  Created by WiCKed on 04.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CredentialFieldView : UITextField

@property (strong, nonatomic) NSString *stateType;

- (void)setState:(NSString *) newState;

@end

NS_ASSUME_NONNULL_END
