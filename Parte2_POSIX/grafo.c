#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <semaphore.h>
#include <unistd.h>

void* printE (void* x){
    usleep((rand()%100)*1000);
    printf("E");
    pthread_exit(0);

}

void* printD (void* x){
    usleep((rand()%100)*1000);
    printf("D");
    pthread_exit(0);

}

void* printC (void* x){
    usleep((rand()%100)*1000);
    printf("C");
    pthread_t t1, t2;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_create(&t1, &attr, printD, NULL);
    pthread_create(&t2, &attr, printE, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("F");
    pthread_exit(0);

}

void* printB(void* x){
    usleep((rand()%100)*1000);
    printf("B");
    pthread_exit(0);
}

int main(){
    
    pthread_t t1, t2;
    pthread_attr_t attr;
    
    pthread_attr_init(&attr);
    printf("A");
    pthread_create(&t1, &attr, printB, NULL);
    pthread_create(&t1, &attr, printC, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    
    return 0;



}