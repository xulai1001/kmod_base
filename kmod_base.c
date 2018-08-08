#include "linux/init.h"
#include "linux/module.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("islab");

static int __init mod_init(void)
{
    printk("+ module loaded.\n");
    return 0;
}

static void __exit mod_exit(void)
{
    printk("- module exited.\n");
}

module_init(mod_init);
module_exit(mod_exit);

