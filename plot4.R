#!/usr/bin/R --silent -f

source("common/set_up_data.R");

epc = GetData();

png( "plot4.png" );

par( mfcol = c( 2, 2 ) );

plot(
    epc$DateTime,
    epc$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowats)",
);

plot(
    epc$DateTime,
    epc$Sub_metering_1,
    type = "n",
    xlab = "",
    ylab = "Energy sub metering",
);
lines( epc$DateTime, epc$Sub_metering_1, col = "black" );
lines( epc$DateTime, epc$Sub_metering_2, col = "red" );
lines( epc$DateTime, epc$Sub_metering_3, col = "blue" );
legend(
    "topright",
    col = c("black","red","blue"),
    lty = 1,
    lwd = 1,
    legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    box.lty = 0,
    bg = "transparent"
);

with( epc,
    {
	plot( DateTime, Voltage, xlab = "datetime", type = "l" );
	plot( DateTime, Global_reactive_power, xlab = "datetime", type = "l" );
    }
);


dev.off();
