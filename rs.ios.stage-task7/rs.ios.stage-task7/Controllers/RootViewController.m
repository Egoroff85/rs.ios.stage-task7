//
//  RootViewController.m
//  rs.ios.stage-task7
//
//  Created by WiCKed on 04.07.2021.
//

#import "RootViewController.h"
#import "CredentialFieldView.h"
#import "AuthorizeButon.h"
#import "ValidationModel.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet CredentialFieldView *loginField;
@property (weak, nonatomic) IBOutlet CredentialFieldView *passwordField;
@property (weak, nonatomic) IBOutlet AuthorizeButon *authorizeButton;
@property (weak, nonatomic) IBOutlet UIView *secureSequenceView;
@property (weak, nonatomic) IBOutlet UILabel *resultField;
@property (strong, nonatomic) NSMutableArray<NSNumber *>*secureSequenceEntered;
@property (strong, nonatomic) ValidationModel *validator;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.validator = [[ValidationModel alloc] init];
    
    // init array for adding number sequence
    self.secureSequenceEntered = [[NSMutableArray alloc] init];
    
    // setup login field
    [self.loginField setKeyboardType:UIKeyboardTypeASCIICapable];
    self.loginField.delegate = self;
    
    // setup password field
    self.passwordField.delegate = self;
    [self.passwordField setSecureTextEntry:YES];
    
    // setup secure sequence view
    [self.secureSequenceView.layer setBorderWidth:2];
    [self.secureSequenceView.layer setCornerRadius:10];
    [self.secureSequenceView.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.secureSequenceView setBackgroundColor:[UIColor whiteColor]];
    
    // setup hide keyobard on outside touch
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(endEditing:)];
    [tapGestureRecognizer setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (IBAction)autohorizeButtonTapped:(id)sender {
    if ([self.validator validateLogin:self.loginField.text]) {
        [self.loginField setState:@"success"];
    } else {
        [self.loginField setState:@"error"];
    }
    
    if ([self.validator validatePassword:self.passwordField.text]) {
        [self.passwordField setState:@"success"];
    } else {
        [self.passwordField setState:@"error"];
    }
    
    if ([self.validator validateLogin:self.loginField.text] &&
        [self.validator validatePassword:self.passwordField.text]) {
        [self.loginField setAlpha:0.5];
        [self.loginField setEnabled:NO];
        
        [self.passwordField setAlpha:0.5];
        [self.passwordField setEnabled:NO];
        
        [self.authorizeButton setEnabled:NO];
        [self.authorizeButton setAlpha:0.5];
        
        [self.secureSequenceView setHidden:NO];
        [self.secureSequenceView setAlpha:0.5];
    }
}

- (IBAction)sequenceButtonTapped:(UIButton *)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber* senderValue = [formatter numberFromString:sender.titleLabel.text];
    [self.secureSequenceEntered addObject: senderValue];
    
    if ([self.resultField.text isEqualToString:@"_"]) {
        [self.resultField setText:@" "];
    }
    
    [self.resultField setText:[self.resultField.text stringByAppendingFormat: @"%d ", senderValue.intValue]];
    
    if (self.secureSequenceEntered.count == 3) {
        if ([self.validator validateSequence:self.secureSequenceEntered]) {
            [self.secureSequenceView.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
            [self openAlertWindow];
        } else {
            [self.resultField setText:@"_"];
            [self.secureSequenceEntered removeAllObjects];
            [self.secureSequenceView.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
        }
    } else {
        [self.secureSequenceView.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}
    
- (IBAction)resetErrorToReady:(CredentialFieldView *)sender {
    if ([sender.stateType isEqualToString:@"error"]) {
        [sender setState:@"ready"];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

- (void)openAlertWindow {
    UIAlertController *alertVC=[UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfully authorized!\n" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *refreshAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self setViewsToDefault];
    }];
    [alertVC addAction:refreshAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)setViewsToDefault {
    [self.passwordField setState:@"ready"];
    [self.passwordField setText:@""];
    [self.passwordField setAlpha:1.0];
    [self.passwordField setEnabled:YES];
    
    [self.loginField setState:@"ready"];
    [self.loginField setText:@""];
    [self.loginField setAlpha:1.0];
    [self.loginField setEnabled:YES];
    
    [self.authorizeButton setEnabled:YES];
    [self.authorizeButton setAlpha:1];
    
    [self.secureSequenceView setHidden:YES];
    self.secureSequenceEntered = [[NSMutableArray alloc] init];

    [self.resultField setText:@"_"];
    [self.secureSequenceView.layer setBorderColor:[UIColor clearColor].CGColor];
}

@end
