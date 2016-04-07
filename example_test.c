#include <stdio>

int int main(int argc, char const * argv[]) {

   printf("Hello World\n");

   char ** first_names = malloc(10 * sizeof(char *))
   char ** last_names = malloc(10 * sizeof(char *))

   int num_words = 10;
   int i;
   for (i = 0; i < num_words; i++) {
      first_names[i] = malloc(512 * sizeof(char));
      last_names[i] = malloc(512 * sizeof(char));

      strcpy(first_names[i], "Donald");
      strcpy(last_names[i], "Trump");

   }

   return 0;
}
