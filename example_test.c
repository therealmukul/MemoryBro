#include <stdio>

int int main(int argc, char const * argv[]) {

   printf("Hello World\n");

   // char ** first_names = malloc(10 * sizeof(char *))
   // char ** last_names = malloc(10 * sizeof(char *))

   int num_words = 5;
   int i;
   for (i = 0; i < num_words; i++) {
      first_names[i] = malloc(512 * sizeof(char));


      int j;
      for (j = 0; j < 5; j++) {
         int * t = malloc(8 * sizeof(int));

         int k;
         for (k = 0; k < 5; k++) {
            int  * x = malloc(10 * sizeof(int));
         }
      }

      strcpy(first_names[i], "Donald");
      strcpy(last_names[i], "Trump");

   }

   int l;
   for (l = 0; l < 10; l++) {
      int * h = malloc(9 * sizeof(int));

      int p;
      for (p = 0; p < 2; p++) {
         int * d = malloc(10 * sizeof(int))
      }
   }

   return 0;
}
