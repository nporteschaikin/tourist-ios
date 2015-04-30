//
//  Constants.m
//  Tourist
//
//  Created by Noah Portes Chaikin on 3/29/15.
//  Copyright (c) 2015 Noah Portes Chaikin. All rights reserved.
//

#import "Constants.h"

NSString * const IOBaseURL = @"http://127.0.0.1:3333/";
// NSString * const IOBaseURL = @"http://tourist-io.herokuapp.com/";
NSString * const IOAuthEndpoint = @"auth";
NSString * const IOToursNearEndpoint = @"tours/near";
NSString * const IOToursCreateEndpoint = @"tours";
NSString * const IOTourEndpoint = @"tours/%@";
NSString * const IOUserIDAttribute = @"_id";
NSString * const IOTourIDAttribute = @"_id";

NSString * const FoursquareAPIBase = @"http://api.foursquare.com/v2/";
NSString * const FoursquareClientID = @"CZNQF23JXXLGVNVOJCVDZJDM3PLFPNPXETWQ2QEZW3DCS3UM";
NSString * const FoursquareClientSecret = @"FYIJSJWGT5EHO5LIOFUEC5OEF3JDWO5NV1RD1WDSHXYWTVRM";
NSString * const FoursquareVersionDate = @"20150330";

NSString * const SessionTokenUserDefaultsKey = @"TouristSessionTokenUserDefaultsKey";

NSString * const TouristDefaultFontName = @"Avenir";
NSString * const TouristDefaultBoldFontName = @"Avenir-Heavy";