Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5806D6865
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:07:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518022.804164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjC5-00050b-IR; Tue, 04 Apr 2023 16:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518022.804164; Tue, 04 Apr 2023 16:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjC5-0004wX-ER; Tue, 04 Apr 2023 16:07:37 +0000
Received: by outflank-mailman (input) for mailman id 518022;
 Tue, 04 Apr 2023 16:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCXw=73=citrix.com=prvs=451435b33=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pjjC3-0004Q2-C0
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:07:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cedfab95-d302-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 18:07:33 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cedfab95-d302-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680624453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=uBXu6YZv6BAp5cZzrn3yHrWUC2z5HKvOE9bB6d7ZZR4=;
  b=C+WTegrat2MbXQD0eTtTXHY77Y/y9cnBEfngiiX/94eFKxSc6DcWn2IU
   qHfbBIoVSa6O9yxr+/2lq4X2vmIR224w0YZKr/K+zglpfZb8rHFUWcMWo
   b2cF2j3qvJjhGWnGid2kP37FoS7uKmS1WguBabK1w1Yqcdz8RMQTFANWH
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106724147
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:AUokrKgTGvkjyX7osJTilRLbX161VhAKZh0ujC45NGQN5FlHY01je
 htvWGCOPPuCajOhc912PI61/BgDupXTx9AxHFQ6+SkwQX4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT4AeCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ0IgwPTAGvqtm73a2iGvI8vJwJfO3CadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XaDBCp1+E46Ym6nPXzSR60aT3McqTcduPLSlQth/A+
 D2coz2lXXn2MvSA8TeO90vwltbItgKlWdNRN+P72eV11Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Eec39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDht9HmHzt0q5WOVGmQsLyTqFuaOzURLGIETT8JS00C+daLiJookhvFQ9JnEai0pt74Azf9x
 3aNtidWulkIpZdVjePhpwmB2m/y4MGTFWbZ+zk7QEqJ5D97Rp+JSrel9EfCve0QFt6zHn2o6
 S1sd9el0AweMX2cvHXTEL1TRO3ytqrt3C702gA2QcR4n9i50zv6JN0LvmkjTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONk1Hs0DaJo9zqx+HXAaIlmU
 XthTe6iDGwBFYNsxyesSuEW3NcDn35unT6PG8GhlE75gdJygUJ5rp9caDOzgh0RtvvY8G05D
 f4EXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLliCjTcbaelAOMDh4W5fsLUYJJ9QNc1J9yr2Zo
 RlQmyZwlDLCuJEwAV7QNSo5MO+3DM4XQLBSFXVEAGtEEkMLOe6HhJrzvbNtJdHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:5XLDkKPTjTUy48BcTuqjsMiBIKoaSvp037BL7TEVdfUxSKb0qy
 nAppgmPHPP5wr5IUtQ4OxoW5PwI080l6QU3WB5B97LYOCBggWVxepZnOjfKlPbehEWwdQtsZ
 uII5IUNDQpNykAsS8h2njfLz/8+qjhzEl1v5an856yd3ARV51d
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="106724147"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v4 3/3] tools/xen-ucode: print information about currently loaded ucode
Date: Tue, 4 Apr 2023 17:06:55 +0100
Message-ID: <20230404160655.2354-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230404160655.2354-1-sergey.dyasli@citrix.com>
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Add an option to xen-ucode tool to print the currently loaded ucode
revision and also print it during usage info.  Print CPU signature and
platform flags as well.  The raw data comes from XENPF_get_cpu_version
and XENPF_get_ucode_revision platform ops.

Example output:
    Intel:
    CPU signature 06-55-04 (raw 0x00050654) pf 0x1 revision 0x02006e05

    AMD:
    CPU signature fam19h (raw 0x00a00f11) revision 0x0a0011ce

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
v3 --> v4:
- changed the output to be 1-line long
- made xc_interface *xch global
- added error checking to xc calls
- added error for unsupported CPU vendor
- changed printf format to 0x%08x for raw signature and revision values
---
 tools/misc/xen-ucode.c | 83 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 12 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index ad32face2b..bd0bfaaa00 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -12,22 +12,89 @@
 #include <fcntl.h>
 #include <xenctrl.h>
 
+static xc_interface *xch;
+
+static const char intel_id[] = "GenuineIntel";
+static const char   amd_id[] = "AuthenticAMD";
+
+static void show_curr_cpu(FILE *f)
+{
+    int ret;
+    struct xenpf_pcpu_version cpu_ver = { .xen_cpuid = 0 };
+    struct xenpf_ucode_revision ucode_rev = { .cpu = 0 };
+
+    ret = xc_get_cpu_version(xch, &cpu_ver);
+    if ( ret )
+    {
+        fprintf(f, "Failed to get CPU information. (err: %s)\n",
+                strerror(errno));
+        exit(1);
+    }
+
+    ret = xc_get_ucode_revision(xch, &ucode_rev);
+    if ( ret )
+    {
+        fprintf(f, "Failed to get microcode information. (err: %s)\n",
+                strerror(errno));
+        exit(1);
+    }
+
+    /*
+     * Print signature in a form that allows to quickly identify which ucode
+     * blob to load, e.g.:
+     *
+     *      Intel:   /lib/firmware/intel-ucode/06-55-04
+     *      AMD:     /lib/firmware/amd-ucode/microcode_amd_fam19h.bin
+     */
+    if ( memcmp(cpu_ver.vendor_id, intel_id,
+                sizeof(cpu_ver.vendor_id)) == 0 )
+    {
+        fprintf(f, "CPU signature %02x-%02x-%02x (raw 0x%08x) pf %#x revision 0x%08x\n",
+                   cpu_ver.family, cpu_ver.model, cpu_ver.stepping,
+                   ucode_rev.signature, ucode_rev.pf, ucode_rev.revision);
+    }
+    else if ( memcmp(cpu_ver.vendor_id, amd_id,
+                     sizeof(cpu_ver.vendor_id)) == 0 )
+    {
+        fprintf(f, "CPU signature fam%xh (raw 0x%08x) revision 0x%08x\n",
+                   cpu_ver.family, ucode_rev.signature, ucode_rev.revision);
+    }
+    else
+    {
+        fprintf(f, "Unsupported CPU vendor: %s\n", cpu_ver.vendor_id);
+        exit(3);
+    }
+}
+
 int main(int argc, char *argv[])
 {
     int fd, ret;
     char *filename, *buf;
     size_t len;
     struct stat st;
-    xc_interface *xch;
+
+    xch = xc_interface_open(NULL, NULL, 0);
+    if ( xch == NULL )
+    {
+        fprintf(stderr, "Error opening xc interface. (err: %s)\n",
+                strerror(errno));
+        exit(1);
+    }
 
     if ( argc < 2 )
     {
-        fprintf(stderr,
-                "xen-ucode: Xen microcode updating tool\n"
-                "Usage: %s <microcode blob>\n", argv[0]);
+        fprintf(stderr, "xen-ucode: Xen microcode updating tool\n");
+        show_curr_cpu(stderr);
+        fprintf(stderr, "Usage: %s <microcode blob>\n", argv[0]);
         exit(2);
     }
 
+    if ( !strcmp(argv[1], "show-cpu-info") )
+    {
+        show_curr_cpu(stdout);
+        return 0;
+    }
+
     filename = argv[1];
     fd = open(filename, O_RDONLY);
     if ( fd < 0 )
@@ -52,14 +119,6 @@ int main(int argc, char *argv[])
         exit(1);
     }
 
-    xch = xc_interface_open(NULL, NULL, 0);
-    if ( xch == NULL )
-    {
-        fprintf(stderr, "Error opening xc interface. (err: %s)\n",
-                strerror(errno));
-        exit(1);
-    }
-
     ret = xc_microcode_update(xch, buf, len);
     if ( ret )
     {
-- 
2.17.1


