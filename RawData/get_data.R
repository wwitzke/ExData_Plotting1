#!/usr/bin/R --silent -f

library(stringr);

#   This gets the data from the remote host (if necessary) and writes a
#   timestamp to a text file describing when the file was downloaded (if the
#   download was necessary). 
my_timestamp = "TimeStamp.txt";
input.file = "RawDataset.zip";

if ( !file.exists( input.file ) )
{
    stamp = date();
    download.file(
	url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
	destfile = input.file
    );
    writeLines( stamp, my_timestamp );
}

zip.filelist = unzip( input.file, overwrite = FALSE, list = TRUE );

created.dir = str_match(
		zip.filelist[1]$Name,
		paste("^(.*?)", .Platform$file.sep, sep="" )
	      )[1,2];

if ( file.exists( created.dir ) )
{
    stop( "Unzip directory location already exists. Stopping for efficiency" );
}

unzip( input.file, overwrite = FALSE );
