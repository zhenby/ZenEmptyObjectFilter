##ZenEmptyObjectFitlter
Use for filter the null and empty NSString(@"") in NSDictionary and NSArray
###Example
Before:
[% codeblock %]
// A Dictionary
{
	array1 = (
		aaa,
		"",
		"<null>",
		abb,
		{
		1a = "";
		2b = "<null>";
		}
	);
	dict1 = {
		1a = "";
		2b = "<null>";
	};
	null = "<null>";
	string1 = string1;
	string2 = "";
}
[% endcodeblock %]  
After Filter:
[% codeblock %]
{
    array1 = (
		aaa,
		abb
	);
	string1 = string1;
}
[% endcodeblock %]

###How to Use
Just Add `ZenEmptyObjectFitler` folder to you project, and import `ZenEmptyObjectFilter.h` in the file that want to use ZenEmptyObjectFilter.  
###Two Way to Filter  
####First one use for filter the whole object
Example code:  
[% codeblock %]
NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"1a", [NSNull null], @"2b",nil];
NSArray *array1 = [NSArray arrayWithObjects:@"aaa", @"", [NSNull null], @"abb", dict1, nil];

NSMutableDictionary *dictWay1Before = [[NSMutableDictionary new] autorelease];
[dictWay1Before setObject:dict1 forKey:@"dict1"];
[dictWay1Before setObject:array1 forKey:@"array1"];
[dictWay1Before setObject:@"string1" forKey:@"string1"];
[dictWay1Before setObject:@"" forKey:@"string2"];
[dictWay1Before setObject:[NSNull null] forKey:@"null"];
NSDictionary *dictWay1After = [ZenEmptyObjectFilter emptyObjectFilter:dictWay1Before];
[% endcodeblock %]


####Second one use for filter every object that set to Dictionary or Array  
Example code:  
[% codeblock %]
NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"1a", [NSNull null], @"2b",nil];
NSArray *array1 = [NSArray arrayWithObjects:@"aaa", @"", [NSNull null], @"abb", dict1, nil];

NSMutableDictionary *dictWay2After = [[NSMutableDictionary new] autorelease];
[ZenEmptyObjectFilter setObject:dict1 forKey:@"dict1" toDictionary:&dictWay2After];
[ZenEmptyObjectFilter setObject:array1 forKey:@"array1" toDictionary:&dictWay2After];
[ZenEmptyObjectFilter setObject:@"string1" forKey:@"string1" toDictionary:&dictWay2After];
[ZenEmptyObjectFilter setObject:@"" forKey:@"string2" toDictionary:&dictWay2After];
[ZenEmptyObjectFilter setObject:[NSNull null] forKey:@"null" toDictionary:&dictWay2After];
[% endcodeblock %]
