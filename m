Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EF529F1C6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 17:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14343.35468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYB08-00077N-I6; Thu, 29 Oct 2020 16:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14343.35468; Thu, 29 Oct 2020 16:42:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYB08-00076x-Ex; Thu, 29 Oct 2020 16:42:12 +0000
Received: by outflank-mailman (input) for mailman id 14343;
 Thu, 29 Oct 2020 16:42:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q+Bh=EE=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1kYB06-00076r-Co
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:42:10 +0000
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f72ce307-175a-4c16-afd7-e9503d4241ee;
 Thu, 29 Oct 2020 16:42:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:42:06 -0700
Received: from ichao-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.87.139])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:42:05 -0700
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=q+Bh=EE=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
	id 1kYB06-00076r-Co
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:42:10 +0000
X-Inumbo-ID: f72ce307-175a-4c16-afd7-e9503d4241ee
Received: from mga11.intel.com (unknown [192.55.52.93])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f72ce307-175a-4c16-afd7-e9503d4241ee;
	Thu, 29 Oct 2020 16:42:08 +0000 (UTC)
IronPort-SDR: L/PoWEqABikXI8HwTgEh/tF4phOl5T23F/LcHrVvR+sUYmlbJYmPY2F8AERZDQc7e3Ty3BjzFi
 GJL/5qn18QVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="164967052"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="164967052"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 09:42:06 -0700
IronPort-SDR: wCHGdkfs93RJGDBx7WxBU9CfqgrEGLy6+Jd1HVSXgF54pEZt0VA6cVG9Uz0cTs1hl28hkweL2c
 PWWVTjDNjm/g==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="395219071"
Received: from ichao-mobl.amr.corp.intel.com (HELO ubuntu.localdomain) ([10.212.87.139])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 09:42:05 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools: add noidentpt domain config option
Date: Thu, 29 Oct 2020 09:41:51 -0700
Message-Id: <93aec8d6e90c5b1c571297a9d4822d1868417be7.1603989586.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Identity Pagetable is currently being created for all HVM VMs during setup.
This was only necessary for running HVM guests on Intel CPUs where EPT was
available but unrestricted guest mode was not.

Add option to skip the creation of the Identity Pagetable via the "noidentpt"
xl config option. This allows a system administrator to skip this step when
the hardware is known to have the required features.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
Further context: while running VM forks a significant bottle-neck was
identified when HVM_PARAM_IDENT_PT is getting copied from the parent VM. This
is due to the fact that setting this parameter requires obtaining a Xen-wide
lock (domctl_lock_acquire). When running several VM forks in parallel during
fuzzing the fork reset hypercall can fail due to the lock being taken by
another fork that's being reset at the same time. This whole situation can be
avoided if there is no Identity-map pagetable to begin with as on modern CPUs
this identity-map pagetable is not actually required.
---
 docs/man/xl.cfg.5.pod.in         |  5 +++++
 tools/include/xenguest.h         |  1 +
 tools/libs/guest/xg_dom_x86.c    | 31 +++++++++++++++++--------------
 tools/libs/light/libxl_create.c  |  2 ++
 tools/libs/light/libxl_dom.c     |  2 ++
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              |  2 ++
 7 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0532739c1f..4d992fe346 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -587,6 +587,11 @@ which are incompatible with migration. Currently this is limited to
 enabling the invariant TSC feature flag in CPUID results when TSC is
 not emulated.
 
+=item B<noidentpt=BOOLEAN>
+
+Disable the creation of the Identity-map Pagetable that was required to run HVM
+guests on Intel CPUs with EPT where no unrestricted guest mode was available.
+
 =item B<driver_domain=BOOLEAN>
 
 Specify that this domain is a driver domain. This enables certain
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index a9984dbea5..998a8c57ba 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -26,6 +26,7 @@
 
 #define XCFLAGS_LIVE      (1 << 0)
 #define XCFLAGS_DEBUG     (1 << 1)
+#define XCFLAGS_NOIDENTPT (1 << 2)
 
 #define X86_64_B_SIZE   64 
 #define X86_32_B_SIZE   32
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 2953aeb90b..827bea7eb7 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -718,20 +718,23 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
         goto out;
     }
 
-    /*
-     * Identity-map page table is required for running with CR0.PG=0 when
-     * using Intel EPT. Create a 32-bit non-PAE page directory of superpages.
-     */
-    if ( (ident_pt = xc_map_foreign_range(
-              xch, domid, PAGE_SIZE, PROT_READ | PROT_WRITE,
-              special_pfn(SPECIALPAGE_IDENT_PT))) == NULL )
-        goto error_out;
-    for ( i = 0; i < PAGE_SIZE / sizeof(*ident_pt); i++ )
-        ident_pt[i] = ((i << 22) | _PAGE_PRESENT | _PAGE_RW | _PAGE_USER |
-                       _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_PSE);
-    munmap(ident_pt, PAGE_SIZE);
-    xc_hvm_param_set(xch, domid, HVM_PARAM_IDENT_PT,
-                     special_pfn(SPECIALPAGE_IDENT_PT) << PAGE_SHIFT);
+    if ( !(dom->flags & XCFLAGS_NOIDENTPT) )
+    {
+        /*
+         * Identity-map page table is required for running with CR0.PG=0 when
+         * using Intel EPT. Create a 32-bit non-PAE page directory of superpages.
+         */
+        if ( (ident_pt = xc_map_foreign_range(
+                  xch, domid, PAGE_SIZE, PROT_READ | PROT_WRITE,
+                  special_pfn(SPECIALPAGE_IDENT_PT))) == NULL )
+            goto error_out;
+        for ( i = 0; i < PAGE_SIZE / sizeof(*ident_pt); i++ )
+            ident_pt[i] = ((i << 22) | _PAGE_PRESENT | _PAGE_RW | _PAGE_USER |
+                           _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_PSE);
+        munmap(ident_pt, PAGE_SIZE);
+        xc_hvm_param_set(xch, domid, HVM_PARAM_IDENT_PT,
+                         special_pfn(SPECIALPAGE_IDENT_PT) << PAGE_SHIFT);
+    }
 
     dom->console_pfn = special_pfn(SPECIALPAGE_CONSOLE);
     xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 321a13e519..62b06b359c 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -256,6 +256,8 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
 
     libxl_defbool_setdefault(&b_info->disable_migrate, false);
 
+    libxl_defbool_setdefault(&b_info->disable_identpt, false);
+
     for (i = 0 ; i < b_info->num_iomem; i++)
         if (b_info->iomem[i].gfn == LIBXL_INVALID_GFN)
             b_info->iomem[i].gfn = b_info->iomem[i].start;
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 01d989a976..a4b3fd808c 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -1126,6 +1126,8 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     dom->console_domid = state->console_domid;
     dom->xenstore_domid = state->store_domid;
 
+    dom->flags |= libxl_defbool_val(info->disable_identpt) ? XCFLAGS_NOIDENTPT : 0;
+
     rc = libxl__domain_device_construct_rdm(gc, d_config,
                                             info->u.hvm.rdm_mem_boundary_memkb*1024,
                                             dom);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9d3f05f399..02eb6a0b40 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -508,6 +508,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("exec_ssid_label", string),
     ("localtime",       libxl_defbool),
     ("disable_migrate", libxl_defbool),
+    ("disable_identpt", libxl_defbool),
     ("cpuid",           libxl_cpuid_policy_list),
     ("blkdev_start",    string),
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index cae8eb679c..ac4a6f2124 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1531,6 +1531,8 @@ void parse_config_data(const char *config_source,
 
     xlu_cfg_get_defbool(config, "nomigrate", &b_info->disable_migrate, 0);
 
+    xlu_cfg_get_defbool(config, "noidentpt", &b_info->disable_identpt, 0);
+
     if (!xlu_cfg_get_long(config, "tsc_mode", &l, 1)) {
         const char *s = libxl_tsc_mode_to_string(l);
         fprintf(stderr, "WARNING: specifying \"tsc_mode\" as an integer is deprecated. "
-- 
2.25.1


