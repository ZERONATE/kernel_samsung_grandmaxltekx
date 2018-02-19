#include <linux/fs.h>
#include <linux/init.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>

static int kernel_ver_proc_show(struct seq_file *m, void *v)
{
	seq_printf(m, "1.0");
	return 0;
}

static int kernel_ver_proc_open(struct inode *inode, struct file *file)
{
	return single_open(file, kernel_ver_proc_show, NULL);
}

static const struct file_operations kernel_ver_proc_fops = {
	.open		= kernel_ver_proc_open,
	.read		= seq_read,
	.llseek		= seq_lseek,
	.release	= single_release,
};

static int __init proc_kernel_ver_init(void)
{
	proc_create("kernel_ver", 0, NULL, &kernel_ver_proc_fops);
	return 0;
}
module_init(proc_kernel_ver_init);
