#!/usr/bin/R --silent -f

source("common/set_up_data.R");

epc = GetData();

png("plot2.png");

plot(
    epc$DateTime,
    epc$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowats)",
);

dev.off();
