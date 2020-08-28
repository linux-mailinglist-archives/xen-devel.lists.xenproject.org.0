Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F913255D5E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfzO-0004y1-V5; Fri, 28 Aug 2020 15:08:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzM-0004eL-IB
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:24 +0000
X-Inumbo-ID: bdbb3cf6-aa30-4cc8-9081-c5debef4743e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdbb3cf6-aa30-4cc8-9081-c5debef4743e;
 Fri, 28 Aug 2020 15:07:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F24EFAF77;
 Fri, 28 Aug 2020 15:08:24 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v4 13/31] tools/libxc: rename libxenguest internal headers
Date: Fri, 28 Aug 2020 17:07:29 +0200
Message-Id: <20200828150747.25305-14-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
MIME-Version: 1.0
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

Rename the header files private to libxenguest from xc_*.h to xg_*.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
 tools/libxc/xg_dom_bzimageloader.c                              | 2 +-
 tools/libxc/{xc_dom_decompress.h => xg_dom_decompress.h}        | 2 +-
 tools/libxc/xg_dom_decompress_lz4.c                             | 2 +-
 tools/libxc/xg_dom_decompress_unsafe.c                          | 2 +-
 .../{xc_dom_decompress_unsafe.h => xg_dom_decompress_unsafe.h}  | 0
 tools/libxc/xg_dom_decompress_unsafe_bzip2.c                    | 2 +-
 tools/libxc/xg_dom_decompress_unsafe_lzma.c                     | 2 +-
 tools/libxc/xg_dom_decompress_unsafe_lzo1x.c                    | 2 +-
 tools/libxc/xg_dom_decompress_unsafe_xz.c                       | 2 +-
 tools/libxc/xg_sr_common.c                                      | 2 +-
 tools/libxc/{xc_sr_common.h => xg_sr_common.h}                  | 2 +-
 tools/libxc/xg_sr_common_x86.c                                  | 2 +-
 tools/libxc/{xc_sr_common_x86.h => xg_sr_common_x86.h}          | 2 +-
 tools/libxc/xg_sr_common_x86_pv.c                               | 2 +-
 tools/libxc/{xc_sr_common_x86_pv.h => xg_sr_common_x86_pv.h}    | 2 +-
 tools/libxc/xg_sr_restore.c                                     | 2 +-
 tools/libxc/xg_sr_restore_x86_hvm.c                             | 2 +-
 tools/libxc/xg_sr_restore_x86_pv.c                              | 2 +-
 tools/libxc/xg_sr_save.c                                        | 2 +-
 tools/libxc/xg_sr_save_x86_hvm.c                                | 2 +-
 tools/libxc/xg_sr_save_x86_pv.c                                 | 2 +-
 tools/libxc/{xc_sr_stream_format.h => xg_sr_stream_format.h}    | 0
 22 files changed, 20 insertions(+), 20 deletions(-)
 rename tools/libxc/{xc_dom_decompress.h => xg_dom_decompress.h} (77%)
 rename tools/libxc/{xc_dom_decompress_unsafe.h => xg_dom_decompress_unsafe.h} (100%)
 rename tools/libxc/{xc_sr_common.h => xg_sr_common.h} (99%)
 rename tools/libxc/{xc_sr_common_x86.h => xg_sr_common_x86.h} (98%)
 rename tools/libxc/{xc_sr_common_x86_pv.h => xg_sr_common_x86_pv.h} (98%)
 rename tools/libxc/{xc_sr_stream_format.h => xg_sr_stream_format.h} (100%)

diff --git a/tools/libxc/xg_dom_bzimageloader.c b/tools/libxc/xg_dom_bzimageloader.c
index a7d70cc7c6..f959a77602 100644
--- a/tools/libxc/xg_dom_bzimageloader.c
+++ b/tools/libxc/xg_dom_bzimageloader.c
@@ -32,7 +32,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress.h"
+#include "xg_dom_decompress.h"
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libxc/xc_dom_decompress.h b/tools/libxc/xg_dom_decompress.h
similarity index 77%
rename from tools/libxc/xc_dom_decompress.h
rename to tools/libxc/xg_dom_decompress.h
index 42cefa3f0e..d9a21cf297 100644
--- a/tools/libxc/xc_dom_decompress.h
+++ b/tools/libxc/xg_dom_decompress.h
@@ -1,7 +1,7 @@
 #ifndef __MINIOS__
 # include "xc_dom.h"
 #else
-# include "xc_dom_decompress_unsafe.h"
+# include "xg_dom_decompress_unsafe.h"
 #endif
 
 int xc_try_lz4_decode(struct xc_dom_image *dom, void **blob, size_t *size);
diff --git a/tools/libxc/xg_dom_decompress_lz4.c b/tools/libxc/xg_dom_decompress_lz4.c
index b6a33f27a8..97ba620d86 100644
--- a/tools/libxc/xg_dom_decompress_lz4.c
+++ b/tools/libxc/xg_dom_decompress_lz4.c
@@ -4,7 +4,7 @@
 #include <stdint.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress.h"
+#include "xg_dom_decompress.h"
 
 #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 
diff --git a/tools/libxc/xg_dom_decompress_unsafe.c b/tools/libxc/xg_dom_decompress_unsafe.c
index 164e35558f..21d964787d 100644
--- a/tools/libxc/xg_dom_decompress_unsafe.c
+++ b/tools/libxc/xg_dom_decompress_unsafe.c
@@ -3,7 +3,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 static struct xc_dom_image *unsafe_dom;
 static unsigned char *output_blob;
diff --git a/tools/libxc/xc_dom_decompress_unsafe.h b/tools/libxc/xg_dom_decompress_unsafe.h
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe.h
rename to tools/libxc/xg_dom_decompress_unsafe.h
diff --git a/tools/libxc/xg_dom_decompress_unsafe_bzip2.c b/tools/libxc/xg_dom_decompress_unsafe_bzip2.c
index 4dcabe4061..9d3709e6cc 100644
--- a/tools/libxc/xg_dom_decompress_unsafe_bzip2.c
+++ b/tools/libxc/xg_dom_decompress_unsafe_bzip2.c
@@ -3,7 +3,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 #include "../../xen/common/bunzip2.c"
 
diff --git a/tools/libxc/xg_dom_decompress_unsafe_lzma.c b/tools/libxc/xg_dom_decompress_unsafe_lzma.c
index 4ee8cdbab1..5d178f0c43 100644
--- a/tools/libxc/xg_dom_decompress_unsafe_lzma.c
+++ b/tools/libxc/xg_dom_decompress_unsafe_lzma.c
@@ -3,7 +3,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 #include "../../xen/common/unlzma.c"
 
diff --git a/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c b/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
index 59888b9da2..a4f8ebd42d 100644
--- a/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
+++ b/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
@@ -5,7 +5,7 @@
 #include <stdint.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 typedef uint8_t u8;
 typedef uint32_t u32;
diff --git a/tools/libxc/xg_dom_decompress_unsafe_xz.c b/tools/libxc/xg_dom_decompress_unsafe_xz.c
index fe7a7f49b4..ff6824b38d 100644
--- a/tools/libxc/xg_dom_decompress_unsafe_xz.c
+++ b/tools/libxc/xg_dom_decompress_unsafe_xz.c
@@ -6,7 +6,7 @@
 #include <inttypes.h>
 
 #include "xg_private.h"
-#include "xc_dom_decompress_unsafe.h"
+#include "xg_dom_decompress_unsafe.h"
 
 // TODO
 #define XZ_DEC_X86
diff --git a/tools/libxc/xg_sr_common.c b/tools/libxc/xg_sr_common.c
index 7c54b03414..17567ab133 100644
--- a/tools/libxc/xg_sr_common.c
+++ b/tools/libxc/xg_sr_common.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xc_sr_common.h"
+#include "xg_sr_common.h"
 
 #include <xen-tools/libs.h>
 
diff --git a/tools/libxc/xc_sr_common.h b/tools/libxc/xg_sr_common.h
similarity index 99%
rename from tools/libxc/xc_sr_common.h
rename to tools/libxc/xg_sr_common.h
index f3bdea8006..35f23fabb5 100644
--- a/tools/libxc/xc_sr_common.h
+++ b/tools/libxc/xg_sr_common.h
@@ -8,7 +8,7 @@
 #include "xc_dom.h"
 #include "xc_bitops.h"
 
-#include "xc_sr_stream_format.h"
+#include "xg_sr_stream_format.h"
 
 /* String representation of Domain Header types. */
 const char *dhdr_type_to_str(uint32_t type);
diff --git a/tools/libxc/xg_sr_common_x86.c b/tools/libxc/xg_sr_common_x86.c
index 77ea044a74..6f12483907 100644
--- a/tools/libxc/xg_sr_common_x86.c
+++ b/tools/libxc/xg_sr_common_x86.c
@@ -1,4 +1,4 @@
-#include "xc_sr_common_x86.h"
+#include "xg_sr_common_x86.h"
 
 int write_x86_tsc_info(struct xc_sr_context *ctx)
 {
diff --git a/tools/libxc/xc_sr_common_x86.h b/tools/libxc/xg_sr_common_x86.h
similarity index 98%
rename from tools/libxc/xc_sr_common_x86.h
rename to tools/libxc/xg_sr_common_x86.h
index e08d81e0e7..b55758c96d 100644
--- a/tools/libxc/xc_sr_common_x86.h
+++ b/tools/libxc/xg_sr_common_x86.h
@@ -1,7 +1,7 @@
 #ifndef __COMMON_X86__H
 #define __COMMON_X86__H
 
-#include "xc_sr_common.h"
+#include "xg_sr_common.h"
 
 /*
  * Obtains a domains TSC information from Xen and writes a X86_TSC_INFO record
diff --git a/tools/libxc/xg_sr_common_x86_pv.c b/tools/libxc/xg_sr_common_x86_pv.c
index d3d425cb82..cd33406aab 100644
--- a/tools/libxc/xg_sr_common_x86_pv.c
+++ b/tools/libxc/xg_sr_common_x86_pv.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xc_sr_common_x86_pv.h"
+#include "xg_sr_common_x86_pv.h"
 
 xen_pfn_t mfn_to_pfn(struct xc_sr_context *ctx, xen_pfn_t mfn)
 {
diff --git a/tools/libxc/xc_sr_common_x86_pv.h b/tools/libxc/xg_sr_common_x86_pv.h
similarity index 98%
rename from tools/libxc/xc_sr_common_x86_pv.h
rename to tools/libxc/xg_sr_common_x86_pv.h
index 2ed03309af..953b5bfb8d 100644
--- a/tools/libxc/xc_sr_common_x86_pv.h
+++ b/tools/libxc/xg_sr_common_x86_pv.h
@@ -1,7 +1,7 @@
 #ifndef __COMMON_X86_PV_H
 #define __COMMON_X86_PV_H
 
-#include "xc_sr_common_x86.h"
+#include "xg_sr_common_x86.h"
 
 /* Virtual address ranges reserved for hypervisor. */
 #define HYPERVISOR_VIRT_START_X86_64 0xFFFF800000000000ULL
diff --git a/tools/libxc/xg_sr_restore.c b/tools/libxc/xg_sr_restore.c
index bc811e6e3a..b57a787519 100644
--- a/tools/libxc/xg_sr_restore.c
+++ b/tools/libxc/xg_sr_restore.c
@@ -2,7 +2,7 @@
 
 #include <assert.h>
 
-#include "xc_sr_common.h"
+#include "xg_sr_common.h"
 
 /*
  * Read and validate the Image and Domain headers.
diff --git a/tools/libxc/xg_sr_restore_x86_hvm.c b/tools/libxc/xg_sr_restore_x86_hvm.c
index a77624cc9d..d6ea6f3012 100644
--- a/tools/libxc/xg_sr_restore_x86_hvm.c
+++ b/tools/libxc/xg_sr_restore_x86_hvm.c
@@ -1,7 +1,7 @@
 #include <assert.h>
 #include <arpa/inet.h>
 
-#include "xc_sr_common_x86.h"
+#include "xg_sr_common_x86.h"
 
 /*
  * Process an HVM_CONTEXT record from the stream.
diff --git a/tools/libxc/xg_sr_restore_x86_pv.c b/tools/libxc/xg_sr_restore_x86_pv.c
index d086271efb..dc50b0f5a8 100644
--- a/tools/libxc/xg_sr_restore_x86_pv.c
+++ b/tools/libxc/xg_sr_restore_x86_pv.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xc_sr_common_x86_pv.h"
+#include "xg_sr_common_x86_pv.h"
 
 static xen_pfn_t pfn_to_mfn(const struct xc_sr_context *ctx, xen_pfn_t pfn)
 {
diff --git a/tools/libxc/xg_sr_save.c b/tools/libxc/xg_sr_save.c
index 80b1d5de1f..d74c72cba6 100644
--- a/tools/libxc/xg_sr_save.c
+++ b/tools/libxc/xg_sr_save.c
@@ -1,7 +1,7 @@
 #include <assert.h>
 #include <arpa/inet.h>
 
-#include "xc_sr_common.h"
+#include "xg_sr_common.h"
 
 /*
  * Writes an Image header and Domain header into the stream.
diff --git a/tools/libxc/xg_sr_save_x86_hvm.c b/tools/libxc/xg_sr_save_x86_hvm.c
index 0b2abb26bd..1634a7bc43 100644
--- a/tools/libxc/xg_sr_save_x86_hvm.c
+++ b/tools/libxc/xg_sr_save_x86_hvm.c
@@ -1,6 +1,6 @@
 #include <assert.h>
 
-#include "xc_sr_common_x86.h"
+#include "xg_sr_common_x86.h"
 
 #include <xen/hvm/params.h>
 
diff --git a/tools/libxc/xg_sr_save_x86_pv.c b/tools/libxc/xg_sr_save_x86_pv.c
index c7e246ef4f..4964f1f7b8 100644
--- a/tools/libxc/xg_sr_save_x86_pv.c
+++ b/tools/libxc/xg_sr_save_x86_pv.c
@@ -1,7 +1,7 @@
 #include <assert.h>
 #include <limits.h>
 
-#include "xc_sr_common_x86_pv.h"
+#include "xg_sr_common_x86_pv.h"
 
 /* Check a 64 bit virtual address for being canonical. */
 static inline bool is_canonical_address(xen_vaddr_t vaddr)
diff --git a/tools/libxc/xc_sr_stream_format.h b/tools/libxc/xg_sr_stream_format.h
similarity index 100%
rename from tools/libxc/xc_sr_stream_format.h
rename to tools/libxc/xg_sr_stream_format.h
-- 
2.26.2


