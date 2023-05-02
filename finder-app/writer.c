#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <errno.h>
#include <string.h>


int main(int argc, char *argv[]) {
    openlog("myprogram", LOG_PID, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Expected two arguments.");
        printf("Error: expected two arguments\n");
        return 1;
    }

    char *filename = argv[1];
    char *content = argv[2];

    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Failed to open file %s error: %s", filename, strerror(errno));
        printf("Error: failed to open file %s error: %s\n", filename, strerror(errno));
        return 1;
    }

    fprintf(file, "%s", content);
    syslog(LOG_DEBUG, "Wrote content '%s' to file '%s'.", content, filename);

    fclose(file);

    closelog();
    return 0;
}