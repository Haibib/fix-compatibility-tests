__attribute__((import_module("local:library-example/library")))
__attribute__((import_name("add")))
int add(int x);

__attribute__((export_name("main")))
int run(void) {
    return add(5);
}