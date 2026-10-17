#include <stdio.h>
#include <dlfcn.h>

typedef double (*CalcFn)(double, double);

int main(void)
{
    void *handle = dlopen("./lib/libcalc.so", RTLD_NOW);

    if (handle == NULL) {
        fprintf(stderr, "%s\n", dlerror());
        return 1;
    }

    dlerror();

    CalcFn add_fn = (CalcFn)dlsym(handle, "add");
    CalcFn sub_fn = (CalcFn)dlsym(handle, "subtract");
    CalcFn mul_fn = (CalcFn)dlsym(handle, "multiply");
    CalcFn div_fn = (CalcFn)dlsym(handle, "divide");

    const char *error = dlerror();
    if (error != NULL) {
        fprintf(stderr, "%s\n", error);
        dlclose(handle);
        return 1;
    }

    double a = 12.0;
    double b = 4.0;

    printf("add:      %.2f\n", add_fn(a, b));
    printf("subtract: %.2f\n", sub_fn(a, b));
    printf("multiply: %.2f\n", mul_fn(a, b));
    printf("divide:   %.2f\n", div_fn(a, b));

    dlclose(handle);
    return 0;
}
