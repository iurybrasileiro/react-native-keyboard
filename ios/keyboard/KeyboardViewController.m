//
//  KeyboardViewController.m
//  keyboard
//
//  Created by Iury Brasileiro on 01/04/22.
//

#import "KeyboardViewController.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface KeyboardViewController ()
  @property (nonatomic) RCTRootView *rootView;
  @property (nonatomic) RCTBridge *bridge;
@end

KeyboardViewController * keyboardViewController = nil;

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
  
    if (self.rootView) {
      self.rootView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    CGFloat _expandedHeight = 380;
    NSLayoutConstraint *_heightConstraint =
        [NSLayoutConstraint constraintWithItem: self.view
                                   attribute: NSLayoutAttributeHeight
                                   relatedBy: NSLayoutRelationEqual
                                      toItem: nil
                                   attribute: NSLayoutAttributeNotAnAttribute
                                  multiplier: 0.0
                                    constant: _expandedHeight];
    [self.view addConstraint: _heightConstraint];
    
    self.bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:@{@"keyboardExtension": self}];
    self.rootView = [[RCTRootView alloc] initWithBridge:self.bridge
                                                     moduleName:@"keyboard"
                                               initialProperties:nil];
  
    self.view = self.rootView;
    [self updateViewConstraints];
    keyboardViewController = self;
    
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    #if DEBUG
      return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
    #else
      return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    #endif
}

- (void)viewWillLayoutSubviews
{
    //
}

- (void)textWillChange:(id<UITextInput>)textInput {
    //
}

- (void)textDidChange:(id<UITextInput>)textInput {
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
