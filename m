Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE040B528
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 18:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186958.335698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQBXJ-0005wZ-Op; Tue, 14 Sep 2021 16:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186958.335698; Tue, 14 Sep 2021 16:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQBXJ-0005uX-L3; Tue, 14 Sep 2021 16:43:57 +0000
Received: by outflank-mailman (input) for mailman id 186958;
 Tue, 14 Sep 2021 16:43:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqqe=OE=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mQBXI-0005uR-6w
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 16:43:56 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2af4720-157a-11ec-b457-12813bfff9fa;
 Tue, 14 Sep 2021 16:43:54 +0000 (UTC)
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
X-Inumbo-ID: f2af4720-157a-11ec-b457-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631637834;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ackbs8ldT2lfoTN6n5zVtWeptYPWxyqD2XRJg4SRF/w=;
  b=a9+RizmGNpZBAsjUaOc3ceufUAhxngfyV0haaxTIj8Acptm5kRGejYgB
   Lc2132Na8tFSOpJuDKxXaJd93OUtMKgj3HxQvUWrtwM4UPJibVyhXg8l7
   gqS1ggWi9nUpbfTKegp59td6R3+unbgk/48AJjc3hitGGGfqHvOT7zII7
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ImFavC2M3FRwXOJDiwoSOeVLlj+33Xz5eey6YhaFhap9F2kmL3fPZXu7C5faq5uFq2lS9YiJjJ
 idmGNFOXJsao7+HBTbZ/JyeU5qB7Ul62m65cqfWNByEZf8fQNAwEGIvvhwKAMAq5p2g3TsWc3I
 FdZX/1ttXD1kdefX/++X5slXAG7bZV23VJHlZS15R6yvBjgHcgIR30YIQLZ6SmWXJvZtOHUGe5
 VvrMeb+wV+oGug93MMP7kOg6vEuxVLQ5b9ZUohhDhNrhI83VDVNHx3kK6QhGIhcwwZLNpwxqxZ
 qs0Xn1zvet5jX8Xus+MUcpDf
X-SBRS: 5.1
X-MesageID: 52694767
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N8dsEanaqXaa5/Lj3FtzCtvo5gy5IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdUW6Fb6qDa2qjL9l+bYmz801VvsOBytAwGgdrrnw3FSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09c02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OpdjJ2vSj9zBPbnxrkPWisGHQtRM6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBOrmIoIZ/Ep8wD/QC/E4aZvCX7/L9ZlT2zJYasVmQKyAN
 pZGN2UHgBLoRhMTN20VUI0Hrvb0lkP7YyR7sX+JjP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7CBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QV5SgGvaU07FasTNT2Q1u/unHsg/IHc4MOSatgsljLk/eKpVbCboQZctJfQOM2jc4pRgRw7
 ASiwY77DA4xvpe6R33Io994sgiO1TgpwX4qPHFfFFZUvIa9+enfnTqUEY0yS/fdYsndXGiqm
 mHU9nBWa6A70JZTv5hX62wrlN5FSnLhdQcz+gyfdWas9AoRiGWNNtHwtASzARqtKu+kori9U
 JoswJP2AAMmV8jleMmxrAMlRu/BCxGtamG0vLKXN8N9nwlBAlb6FWyq3N2bGKuPGpxVEdMOS
 BSI0T69GbcJZCf6BUOJS9vpVqzGMpQM5fy6D6uJP7Kik7BadROd/TEGWKJj9zm2yyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ea5LRmkkACbanCsQVmKZKRW03wbEALcieg6RqmiSre2KKwUktVK3cx60PYYtgk/gHn+vE5
 CjlCERZ1ED+lTvMLgDTMiJvb7bmXJBeq3MnPHNzYQb0iiZ7OYv/vr0Cc5YXfKU88LAxx/BDU
 PRYKd6LBe5CS2qb9m1FP4X9toFraD+imRmKY3i+eDE6cpM5H17J99bocxHB7i4LCibr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBncnWjgOU2LscALQT46gGbj
 wvGUw0FoeTtopMu9IWbj66zsIr0QfB1GVBXHjeH4O/uZzXa5Geq3aRJTP2MIWLGTGrx9aivO
 bdVwvX7PKFVlVpGqdMhQbNizKZ47Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xLd4MReNJWIJNjhQQwYKwcSZ+ie0e0Zx2vJ5vMvLUSmvCJ68dJri6mJ08VgXMCFEIZIDQ==
IronPort-HdrOrdr: A9a23:JFLz/qBUJJmqMCflHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8/
 xG/c5rsyMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnOzfKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52694767"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v2] tools/libxl: Correctly align the ACPI tables
Date: Tue, 14 Sep 2021 17:43:23 +0100
Message-ID: <20210914164323.14904-1-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The memory allocator currently calculates alignment in libxl's virtual
address space, rather than guest physical address space. This results
in the FACS being commonly misaligned.

Furthermore, the allocator has several other bugs.

The opencoded align-up calculation is currently susceptible to a bug
that occurs in the corner case that the buffer is already aligned to
begin with. In that case, an align-sized memory hole is introduced.

The while loop is dead logic because its effects are entirely and
unconditionally overwritten immediately after it.

Rework the memory allocator to align in guest physical address space
instead of libxl's virtual memory and improve the calculation, drop
errant extra page in allocated buffer for ACPI tables, and give some
of the variables better names/types.

Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>

v2: Rewrite completely, to align in guest physical address space
---
 tools/libs/light/libxl_x86_acpi.c | 47 +++++++++++++------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 3eca1c7a9f..8b6dee2e05 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -20,6 +20,7 @@
 
  /* Number of pages holding ACPI tables */
 #define NUM_ACPI_PAGES 16
+#define ALIGN(p, a) (((p) + ((a) - 1)) & ~((a) - 1))
 
 struct libxl_acpi_ctxt {
     struct acpi_ctxt c;
@@ -28,10 +29,10 @@ struct libxl_acpi_ctxt {
     unsigned int page_shift;
 
     /* Memory allocator */
-    unsigned long alloc_base_paddr;
-    unsigned long alloc_base_vaddr;
-    unsigned long alloc_currp;
-    unsigned long alloc_end;
+    unsigned long guest_start;
+    unsigned long guest_curr;
+    unsigned long guest_end;
+    void *buf;
 };
 
 extern const unsigned char dsdt_pvh[];
@@ -43,8 +44,7 @@ static unsigned long virt_to_phys(struct acpi_ctxt *ctxt, void *v)
     struct libxl_acpi_ctxt *libxl_ctxt =
         CONTAINER_OF(ctxt, struct libxl_acpi_ctxt, c);
 
-    return (((unsigned long)v - libxl_ctxt->alloc_base_vaddr) +
-            libxl_ctxt->alloc_base_paddr);
+    return libxl_ctxt->guest_start + (v - libxl_ctxt->buf);
 }
 
 static void *mem_alloc(struct acpi_ctxt *ctxt,
@@ -58,20 +58,16 @@ static void *mem_alloc(struct acpi_ctxt *ctxt,
     if (align < 16)
         align = 16;
 
-    s = (libxl_ctxt->alloc_currp + align) & ~((unsigned long)align - 1);
+    s = ALIGN(libxl_ctxt->guest_curr, align);
     e = s + size - 1;
 
     /* TODO: Reallocate memory */
-    if ((e < s) || (e >= libxl_ctxt->alloc_end))
+    if ((e < s) || (e >= libxl_ctxt->guest_end))
         return NULL;
 
-    while (libxl_ctxt->alloc_currp >> libxl_ctxt->page_shift != 
-           e >> libxl_ctxt->page_shift)
-        libxl_ctxt->alloc_currp += libxl_ctxt->page_size;
+    libxl_ctxt->guest_curr = e;
 
-    libxl_ctxt->alloc_currp = e;
-
-    return (void *)s;
+    return libxl_ctxt->buf + (s - libxl_ctxt->guest_start);
 }
 
 static void acpi_mem_free(struct acpi_ctxt *ctxt,
@@ -163,7 +159,6 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     struct acpi_config config = {0};
     struct libxl_acpi_ctxt libxl_ctxt;
     int rc = 0, acpi_pages_num;
-    void *acpi_pages;
     unsigned long page_mask;
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_PVH)
@@ -186,19 +181,17 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     config.rsdp = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
     config.infop = (unsigned long)libxl__malloc(gc, libxl_ctxt.page_size);
     /* Pages to hold ACPI tables */
-    acpi_pages =  libxl__malloc(gc, (NUM_ACPI_PAGES + 1) *
-                                libxl_ctxt.page_size);
+    libxl_ctxt.buf = libxl__malloc(gc, NUM_ACPI_PAGES *
+                                   libxl_ctxt.page_size);
 
     /*
      * Set up allocator memory.
      * Start next to acpi_info page to avoid fracturing e820.
      */
-    libxl_ctxt.alloc_base_paddr = ACPI_INFO_PHYSICAL_ADDRESS +
-        libxl_ctxt.page_size;
-    libxl_ctxt.alloc_base_vaddr = libxl_ctxt.alloc_currp =
-        (unsigned long)acpi_pages;
-    libxl_ctxt.alloc_end = (unsigned long)acpi_pages +
-        (NUM_ACPI_PAGES * libxl_ctxt.page_size);
+    libxl_ctxt.guest_start = libxl_ctxt.guest_curr = libxl_ctxt.guest_end =
+        ACPI_INFO_PHYSICAL_ADDRESS + libxl_ctxt.page_size;
+
+    libxl_ctxt.guest_end += NUM_ACPI_PAGES * libxl_ctxt.page_size;
 
     /* Build the tables. */
     rc = acpi_build_tables(&libxl_ctxt.c, &config);
@@ -208,10 +201,8 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     }
 
     /* Calculate how many pages are needed for the tables. */
-    acpi_pages_num =
-        ((libxl_ctxt.alloc_currp - (unsigned long)acpi_pages)
-         >> libxl_ctxt.page_shift) +
-        ((libxl_ctxt.alloc_currp & page_mask) ? 1 : 0);
+    acpi_pages_num = (ALIGN(libxl_ctxt.guest_curr, libxl_ctxt.page_size) -
+                      libxl_ctxt.guest_start) >> libxl_ctxt.page_shift;
 
     dom->acpi_modules[0].data = (void *)config.rsdp;
     dom->acpi_modules[0].length = 64;
@@ -231,7 +222,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     dom->acpi_modules[1].length = 4096;
     dom->acpi_modules[1].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS;
 
-    dom->acpi_modules[2].data = acpi_pages;
+    dom->acpi_modules[2].data = libxl_ctxt.buf;
     dom->acpi_modules[2].length = acpi_pages_num  << libxl_ctxt.page_shift;
     dom->acpi_modules[2].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS +
         libxl_ctxt.page_size;
-- 
2.25.1


