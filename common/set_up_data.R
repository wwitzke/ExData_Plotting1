#!/usr/bin/R --silent -f

#   This function will read an input data file, the name of which is hardcoded
#   herein, and return a data.table containing the data from the file.
library( data.table );
suppressWarnings( library( lubridate ) );

GetData = function()
{
    input.file = "RawData/household_power_consumption.txt";

    retval = fread( input.file, sep=";", header = TRUE, na.strings = "?" );

    retval =
	retval[
	    dmy(Date) %within% interval(ymd(20070201),ymd(20070202)),
	];

    #	What we really want is one Date/Time column. So, let's make one.

    retval =
	cbind(
	    DateTime =
		parse_date_time(
		    paste(retval$Date, retval$Time),
		    "dmy hms"
		),
	    retval
	);

    retval = retval[,Date:=NULL];
    retval = retval[,Time:=NULL];

    return(retval);
}
