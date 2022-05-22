#include <stdio.h>
#include <stdlib.h>

typedef struct cs{
    char csname[6];
    char symbolname[6];
    int adr;
    int len;
}CS;
int main(int argc, char* argv[]) {
    FILE* file[10];
    CS control[10];
    int count=0;
    int start=atoi(argv[1]);
    printf("START:%d\n\n",start);
    for(int i=2;i<argc;i++){
        printf("%d\n",i);
        puts(argv[i]);
        file[i]=fopen(argv[i], "r");
        char buf[128];
        char head;
        char progname[128];int s;int size;
        fscanf(file[i],"%c",&head);
        switch(head){
            case 'H':
                fscanf(file[i],"%06s%06x%06x",control[count].csname,&s,&control[count].len);
                printf("%06x\n",control[count].len);
                count++;
            case 'D':
                fgets(buf, sizeof(buf), file[i]);
                // fscanf(file[i],"%06s%06x%06x%06s",control[count].symbolname,&s,&control[count].len);
                // printf("%06x",control[count].len);
                printf("%d\n",strlen(buf));
            default:;
        }
        
        // while (fgets(buf, sizeof(buf), file[i]) != NULL) { 
        //     printf("%s",buf);
        // }
        printf("\n----------------------------------------------\n",buf);
    }
}