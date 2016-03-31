#!/usr/bin/R --silent -f

source("common/set_up_data.R");

epc = GetData();

png("plot1.png");

hist(
    epc$Global_active_power,
    col = "red",
    xlab = "Global Active Power (kilowats)",
    main = "Global Active Power",
);

dev.off();
