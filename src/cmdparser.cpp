#include "cmdparser.h"
#include "pipeline.h"
#include "cmdconst.h"
#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>

void parseCmd(unsigned char cmd, unsigned char data) {
    sendSender(cmd, data);
    switch (cmd) {
        case FAN_SPEED:
            printf("Setting fan speed to %d\n", data);
            break;
        case SUSPENSION_MODE:
            printf("Setting suspension mode to %d\n", data);
            break;
            
        case INTERIOR_LIGTH:
            printf("Setting interior ligth to %d\n", data);
            break;
        
        case SPOILER_MODE:
            printf("Setting spoiler mode to %d\n", data);
            break;
        
        case SPORT_MODE:
            printf("Setting sport mode to %d\n", data);
            break;
        
        case REGENERATION:
            printf("Setting regeneration to %d\n", data);
            break;
        
        default:
            printf("Invalid command");
            break;
    }
}