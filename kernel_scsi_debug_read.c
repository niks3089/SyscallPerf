diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index e4f037f..ab34612 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -61,7 +61,7 @@
 #include "scsi_logging.h"
 
 /* make sure inq_product_rev string corresponds to this version */
-#define SDEBUG_VERSION "1.86"
+#define SDEBUG_VERSION "1.87"
 static const char *sdebug_version_date = "20160430";
 
 #define MY_NAME "scsi_debug"
@@ -1524,6 +1524,7 @@ static sector_t get_sdebug_capacity(void)
 static int resp_readcap(struct scsi_cmnd * scp,
 			struct sdebug_dev_info * devip)
 {
+    return 0;
 	unsigned char arr[SDEBUG_READCAP_ARR_SZ];
 	unsigned int capac;
 
@@ -1543,6 +1544,7 @@ static int resp_readcap(struct scsi_cmnd * scp,
 static int resp_readcap16(struct scsi_cmnd * scp,
 			  struct sdebug_dev_info * devip)
 {
+    return 0;
 	unsigned char *cmd = scp->cmnd;
 	unsigned char arr[SDEBUG_READCAP16_ARR_SZ];
 	int alloc_len;
@@ -2545,6 +2547,7 @@ static int resp_read_dt0(struct scsi_cmnd *scp, struct sdebug_dev_info *devip)
 	unsigned long iflags;
 	int ret;
 	bool check_prot;
+    return 0;
 
 	switch (cmd[0]) {
 	case READ_16:
@@ -3443,6 +3446,7 @@ static int resp_xdwriteread(struct scsi_cmnd *scp, unsigned long long lba,
 static int resp_xdwriteread_10(struct scsi_cmnd *scp,
 			       struct sdebug_dev_info *devip)
 {
+    return 0;
 	u8 *cmd = scp->cmnd;
 	u64 lba;
 	u32 num;
@@ -4191,7 +4195,7 @@ module_param_named(vpd_use_hostno, sdebug_vpd_use_hostno, int,
 module_param_named(write_same_length, sdebug_write_same_length, int,
 		   S_IRUGO | S_IWUSR);
 
-MODULE_AUTHOR("Eric Youngdale + Douglas Gilbert");
+MODULE_AUTHOR("Nikhil");
 MODULE_DESCRIPTION("SCSI debug adapter driver");
 MODULE_LICENSE("GPL");
 MODULE_VERSION(SDEBUG_VERSION);
