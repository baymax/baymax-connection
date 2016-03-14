#include "pipeline.h"

#include <fcntl.h>
#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>

char * senderPipePath = "/tmp/baymax-sender";

void sendSender(unsigned char cmd, unsigned char data) {   
    mkfifo(senderPipePath, 0666);
    int fd = open(senderPipePath, O_WRONLY);
    char buff[35];
    snprintf(buff, 35, "%c%c", cmd, data);
    write(fd, buff, sizeof(buff));
}