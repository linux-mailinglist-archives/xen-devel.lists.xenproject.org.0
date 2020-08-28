Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24088255D72
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:08:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfzc-0005I1-I2; Fri, 28 Aug 2020 15:08:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzb-0004eL-Ip
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:39 +0000
X-Inumbo-ID: 198293ef-4bb1-4c95-b3b7-f6a4eebfe10c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 198293ef-4bb1-4c95-b3b7-f6a4eebfe10c;
 Fri, 28 Aug 2020 15:07:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35746AF21;
 Fri, 28 Aug 2020 15:08:25 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 14/31] tools/misc: rename xc_dom.h do xenctrl_dom.h
Date: Fri, 28 Aug 2020 17:07:30 +0200
Message-Id: <20200828150747.25305-15-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

For being able to disentangle lixenctrl and libxenguest headers
xc_dom.h will need to be public. Prepare that by renaming xc_dom.h
to xenctrl_dom.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Wei Liu <wl@xen.org>
---
 stubdom/grub/kexec.c                            | 2 +-
 tools/helpers/init-xenstore-domain.c            | 2 +-
 tools/libxc/include/{xc_dom.h => xenctrl_dom.h} | 0
 tools/libxc/xc_core.c                           | 2 +-
 tools/libxc/xc_private.c                        | 2 +-
 tools/libxc/xg_dom_arm.c                        | 2 +-
 tools/libxc/xg_dom_armzimageloader.c            | 2 +-
 tools/libxc/xg_dom_binloader.c                  | 2 +-
 tools/libxc/xg_dom_boot.c                       | 2 +-
 tools/libxc/xg_dom_compat_linux.c               | 2 +-
 tools/libxc/xg_dom_core.c                       | 2 +-
 tools/libxc/xg_dom_decompress.h                 | 2 +-
 tools/libxc/xg_dom_decompress_unsafe.h          | 2 +-
 tools/libxc/xg_dom_elfloader.c                  | 2 +-
 tools/libxc/xg_dom_hvmloader.c                  | 2 +-
 tools/libxc/xg_dom_x86.c                        | 2 +-
 tools/libxc/xg_offline_page.c                   | 2 +-
 tools/libxc/xg_sr_common.h                      | 2 +-
 tools/libxl/libxl_arm.c                         | 2 +-
 tools/libxl/libxl_arm.h                         | 2 +-
 tools/libxl/libxl_create.c                      | 2 +-
 tools/libxl/libxl_dm.c                          | 2 +-
 tools/libxl/libxl_dom.c                         | 2 +-
 tools/libxl/libxl_internal.h                    | 2 +-
 tools/libxl/libxl_vnuma.c                       | 2 +-
 tools/libxl/libxl_x86.c                         | 2 +-
 tools/libxl/libxl_x86_acpi.c                    | 2 +-
 tools/python/xen/lowlevel/xc/xc.c               | 2 +-
 tools/xcutils/readnotes.c                       | 2 +-
 29 files changed, 28 insertions(+), 28 deletions(-)
 rename tools/libxc/include/{xc_dom.h => xenctrl_dom.h} (100%)

diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
index 0e68b969a2..24001220a9 100644
--- a/stubdom/grub/kexec.c
+++ b/stubdom/grub/kexec.c
@@ -20,7 +20,7 @@
 #include <sys/mman.h>
 
 #include <xenctrl.h>
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 #include <kernel.h>
 #include <console.h>
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 4ce8299c3c..5bdb48dc80 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -8,7 +8,7 @@
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 #include <xenctrl.h>
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <xenstore.h>
 #include <xen/sys/xenbus_dev.h>
 #include <xen-xsm/flask/flask.h>
diff --git a/tools/libxc/include/xc_dom.h b/tools/libxc/include/xenctrl_dom.h
similarity index 100%
rename from tools/libxc/include/xc_dom.h
rename to tools/libxc/include/xenctrl_dom.h
diff --git a/tools/libxc/xc_core.c b/tools/libxc/xc_core.c
index 2ee1d205b4..7df1fccd62 100644
--- a/tools/libxc/xc_core.c
+++ b/tools/libxc/xc_core.c
@@ -62,7 +62,7 @@
 
 #include "xg_private.h"
 #include "xc_core.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include <stdlib.h>
 #include <unistd.h>
 
diff --git a/tools/libxc/xc_private.c b/tools/libxc/xc_private.c
index 90974d572e..6ecdf6953f 100644
--- a/tools/libxc/xc_private.c
+++ b/tools/libxc/xc_private.c
@@ -19,7 +19,7 @@
 
 #include "xc_private.h"
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include <stdarg.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/tools/libxc/xg_dom_arm.c b/tools/libxc/xg_dom_arm.c
index 931404c222..3f66f1d890 100644
--- a/tools/libxc/xg_dom_arm.c
+++ b/tools/libxc/xg_dom_arm.c
@@ -24,7 +24,7 @@
 #include <xen-tools/libs.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 #define NR_MAGIC_PAGES 4
 #define CONSOLE_PFN_OFFSET 0
diff --git a/tools/libxc/xg_dom_armzimageloader.c b/tools/libxc/xg_dom_armzimageloader.c
index 0df8c2a4b1..4246c8e5fa 100644
--- a/tools/libxc/xg_dom_armzimageloader.c
+++ b/tools/libxc/xg_dom_armzimageloader.c
@@ -25,7 +25,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 #include <arpa/inet.h> /* XXX ntohl is not the right function... */
 
diff --git a/tools/libxc/xg_dom_binloader.c b/tools/libxc/xg_dom_binloader.c
index d6f7f2a500..870a921427 100644
--- a/tools/libxc/xg_dom_binloader.c
+++ b/tools/libxc/xg_dom_binloader.c
@@ -83,7 +83,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 #define round_pgup(_p)    (((_p)+(PAGE_SIZE_X86-1))&PAGE_MASK_X86)
 #define round_pgdown(_p)  ((_p)&PAGE_MASK_X86)
diff --git a/tools/libxc/xg_dom_boot.c b/tools/libxc/xg_dom_boot.c
index bb599b33ba..1e31e92244 100644
--- a/tools/libxc/xg_dom_boot.c
+++ b/tools/libxc/xg_dom_boot.c
@@ -31,7 +31,7 @@
 #include <zlib.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xc_core.h"
 #include <xen/hvm/params.h>
 #include <xen/grant_table.h>
diff --git a/tools/libxc/xg_dom_compat_linux.c b/tools/libxc/xg_dom_compat_linux.c
index b3d43feed9..b645f0b14b 100644
--- a/tools/libxc/xg_dom_compat_linux.c
+++ b/tools/libxc/xg_dom_compat_linux.c
@@ -30,7 +30,7 @@
 
 #include "xenctrl.h"
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 /* ------------------------------------------------------------------------ */
 
diff --git a/tools/libxc/xg_dom_core.c b/tools/libxc/xg_dom_core.c
index 327c8a8575..1c91cce315 100644
--- a/tools/libxc/xg_dom_core.c
+++ b/tools/libxc/xg_dom_core.c
@@ -32,7 +32,7 @@
 #include <assert.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "_paths.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libxc/xg_dom_decompress.h b/tools/libxc/xg_dom_decompress.h
index d9a21cf297..c5ab2e59eb 100644
--- a/tools/libxc/xg_dom_decompress.h
+++ b/tools/libxc/xg_dom_decompress.h
@@ -1,5 +1,5 @@
 #ifndef __MINIOS__
-# include "xc_dom.h"
+# include "xenctrl_dom.h"
 #else
 # include "xg_dom_decompress_unsafe.h"
 #endif
diff --git a/tools/libxc/xg_dom_decompress_unsafe.h b/tools/libxc/xg_dom_decompress_unsafe.h
index 64f68864b1..fb84b6add8 100644
--- a/tools/libxc/xg_dom_decompress_unsafe.h
+++ b/tools/libxc/xg_dom_decompress_unsafe.h
@@ -1,4 +1,4 @@
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 
 typedef int decompress_fn(unsigned char *inbuf, unsigned int len,
                           int (*fill)(void*, unsigned int),
diff --git a/tools/libxc/xg_dom_elfloader.c b/tools/libxc/xg_dom_elfloader.c
index b327db219d..7043c3bbba 100644
--- a/tools/libxc/xg_dom_elfloader.c
+++ b/tools/libxc/xg_dom_elfloader.c
@@ -26,7 +26,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
 #define XEN_VER "xen-3.0"
diff --git a/tools/libxc/xg_dom_hvmloader.c b/tools/libxc/xg_dom_hvmloader.c
index 3f0bd65547..995a0f3dc3 100644
--- a/tools/libxc/xg_dom_hvmloader.c
+++ b/tools/libxc/xg_dom_hvmloader.c
@@ -26,7 +26,7 @@
 #include <assert.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libxc/xg_dom_x86.c b/tools/libxc/xg_dom_x86.c
index 9439805eaa..842dbcccdd 100644
--- a/tools/libxc/xg_dom_x86.c
+++ b/tools/libxc/xg_dom_x86.c
@@ -38,7 +38,7 @@
 #include <xen-tools/libs.h>
 
 #include "xg_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xenctrl.h"
 
 /* ------------------------------------------------------------------------ */
diff --git a/tools/libxc/xg_offline_page.c b/tools/libxc/xg_offline_page.c
index 19538fc436..77e8889b11 100644
--- a/tools/libxc/xg_offline_page.c
+++ b/tools/libxc/xg_offline_page.c
@@ -28,7 +28,7 @@
 #include <xc_core.h>
 
 #include "xc_private.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xg_private.h"
 #include "xg_save_restore.h"
 
diff --git a/tools/libxc/xg_sr_common.h b/tools/libxc/xg_sr_common.h
index 35f23fabb5..13fcc47420 100644
--- a/tools/libxc/xg_sr_common.h
+++ b/tools/libxc/xg_sr_common.h
@@ -5,7 +5,7 @@
 
 #include "xg_private.h"
 #include "xg_save_restore.h"
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include "xc_bitops.h"
 
 #include "xg_sr_stream_format.h"
diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 34f8a29056..975a4d730a 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -3,7 +3,7 @@
 #include "libxl_libfdt_compat.h"
 #include "libxl_arm.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <stdbool.h>
 #include <libfdt.h>
 #include <assert.h>
diff --git a/tools/libxl/libxl_arm.h b/tools/libxl/libxl_arm.h
index 8aef210d4c..52c2ab5e3a 100644
--- a/tools/libxl/libxl_arm.h
+++ b/tools/libxl/libxl_arm.h
@@ -17,7 +17,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 _hidden
 int libxl__prepare_acpi(libxl__gc *gc, libxl_domain_build_info *info,
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 2814818e34..1031b75159 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -20,7 +20,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <xenguest.h>
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/e820.h>
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f2dc5696b9..fec4e0fbe5 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -19,7 +19,7 @@
 
 #include "libxl_internal.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <xen/hvm/e820.h>
 #include <sys/types.h>
 #include <pwd.h>
diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index f8661e90d4..e2dca64aa1 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -20,7 +20,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/e820.h>
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index c63d0686fd..e16ae9630b 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -57,7 +57,7 @@
 #include <xenctrl.h>
 #include <xenguest.h>
 #include <xenhypfs.h>
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libxl/libxl_vnuma.c b/tools/libxl/libxl_vnuma.c
index 8ec2abb2e6..c2e144ceae 100644
--- a/tools/libxl/libxl_vnuma.c
+++ b/tools/libxl/libxl_vnuma.c
@@ -17,7 +17,7 @@
 #include "libxl_arch.h"
 #include <stdlib.h>
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 bool libxl__vnuma_configured(const libxl_domain_build_info *b_info)
 {
diff --git a/tools/libxl/libxl_x86.c b/tools/libxl/libxl_x86.c
index e57f63282e..7d95506e00 100644
--- a/tools/libxl/libxl_x86.c
+++ b/tools/libxl/libxl_x86.c
@@ -1,7 +1,7 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
diff --git a/tools/libxl/libxl_x86_acpi.c b/tools/libxl/libxl_x86_acpi.c
index ed6610c84e..3df86c7be5 100644
--- a/tools/libxl/libxl_x86_acpi.c
+++ b/tools/libxl/libxl_x86_acpi.c
@@ -18,7 +18,7 @@
 #include <xen/hvm/e820.h>
 #include "libacpi/libacpi.h"
 
-#include <xc_dom.h>
+#include <xenctrl_dom.h>
 
  /* Number of pages holding ACPI tables */
 #define NUM_ACPI_PAGES 16
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 8fde5f311f..8c7b184f0b 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -17,7 +17,7 @@
 #include <arpa/inet.h>
 
 #include <xen/elfnote.h>
-#include "xc_dom.h"
+#include "xenctrl_dom.h"
 #include <xen/hvm/hvm_info_table.h>
 #include <xen/hvm/params.h>
 
diff --git a/tools/xcutils/readnotes.c b/tools/xcutils/readnotes.c
index e682dd1a21..a6b7358e70 100644
--- a/tools/xcutils/readnotes.c
+++ b/tools/xcutils/readnotes.c
@@ -12,7 +12,7 @@
 #include <sys/mman.h>
 
 #include <xg_private.h>
-#include <xc_dom.h> /* gunzip bits */
+#include <xenctrl_dom.h> /* gunzip bits */
 
 #include <xen/libelf/libelf.h>
 
-- 
2.26.2


