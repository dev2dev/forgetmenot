//
//  OneRowEditController.m
//  ForgetMeNot
//
//  Created by Anthony Mittaz on 13/04/09.
//  Copyright 2009 Anthony Mittaz. All rights reserved.
//

#import "OneRowEditController.h"
#import "Group.h"

@implementation OneRowEditController

@synthesize navigationBar=_navigationBar;
@synthesize textField=_textField;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Define the title
	self.navigationBar.topItem.title = @"New Group";
	
	// Color of the navigation bar
	self.navigationBar.tintColor = [UIColor colorWithRed:120.0/255.0 green:120.0/255.0 blue:120.0/255.0 alpha:1.0];
	
	// Add textfield placeholer
	self.textField.placeholder = @"Group Name";
	
	 [self.textField becomeFirstResponder];
}

#pragma mark Button bar actions

- (IBAction)cancelEditing:(id)sender
{
	[self dismissModalViewControllerAnimated:TRUE];
}

- (IBAction)doneEditing:(id)sender
{
	// Get Mangaged object context
	NSManagedObjectContext *context = self.appDelegate.managedObjectContext;
	
	// Create a new instance of the entity managed by the fetched results controller.
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Group" inManagedObjectContext:context];
	Group *group = (Group *)[NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
	group.name = self.textField.text;
	
	// Save the context.
    NSError *error;
    if (![context save:&error]) {
		// Handle the error...
    }
	
	[[NSNotificationCenter defaultCenter] postNotificationName:ShouldReloadGroupsController object:nil];
	
    [self dismissModalViewControllerAnimated:TRUE];
}

#pragma mark TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self doneEditing:self];
	return TRUE;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[_textField release];
	[_navigationBar release];
	
    [super dealloc];
}


@end
