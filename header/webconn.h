#ifndef WEBCONN_H
#define WEBCONN_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <libwebsockets.h>
//#include <pthread.h>



int webConn();
static int ws_service_callback(
                         struct lws *wsi,
                         enum lws_callback_reasons reason, void *user,
                         void *in, size_t len);
                         
static void *pthread_routine(void *tool_in);                         
static int websocket_write_back(struct lws *wsi_in, char *str, int str_size_in);
static void INT_HANDLER(int signo);

/*
struct session_data {
    int fd;
};

struct pthread_routine_tool {
    struct lws_context *context;
    struct lws *wsi;
};*/


#endif // WEBCONN_H