/**
 Make UIView autoresize mask from string
 
 'T' = UIViewAutoresizingFlexibleTopMargin, 
 'L' = UIViewAutoresizingFlexibleLeftMargin
 'B' = UIViewAutoresizingFlexibleBottomMargin
 'R' = UIViewAutoresizingFlexibleRightMargin
 'W' = UIViewAutoresizingFlexibleWidth
 'H' = UIViewAutoresizingFlexibleHeight
 
 Any other characters considered as separators.
 For readability use '+' as separator.
 
 For example:
   self.view.autoresizeMask = UIViewAutoresizingMake(@"T+L+B+R+W+H");
   self.view.autoresizeMask = UIViewAutoresizingMake(@"WH");
 */
UIViewAutoresizing UIViewAutoresizingMake(NSString *flagsString);

// Shortcut for autoreaizing mask of resizable at all direction view 
#define  UIViewAutoresizingAll   UIViewAutoresizingMake(@"T+R+B+L+W+H")