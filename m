Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBB624EC89
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:36:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9mQ8-0005YX-Uh; Sun, 23 Aug 2020 09:36:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQ7-0004t9-Se
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:11 +0000
X-Inumbo-ID: 666e2964-7854-4f3c-a61e-e217fa76ea62
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 666e2964-7854-4f3c-a61e-e217fa76ea62;
 Sun, 23 Aug 2020 09:35:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01E0DAE46;
 Sun, 23 Aug 2020 09:35:55 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 20/38] tools/libxc: rename all libxenguest sources to xg_*
Date: Sun, 23 Aug 2020 11:35:01 +0200
Message-Id: <20200823093519.18386-21-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
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

Some sources of libxenguest are named xg_*.c and some xc_*.c. Rename
the xc_*.c files to xg_*.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libxc/Makefile                          | 59 ++++++++++---------
 .../libxc/{xc_cpuid_x86.c => xg_cpuid_x86.c}  |  0
 tools/libxc/{xc_dom_arm.c => xg_dom_arm.c}    |  0
 ...imageloader.c => xg_dom_armzimageloader.c} |  0
 ...{xc_dom_binloader.c => xg_dom_binloader.c} |  0
 tools/libxc/{xc_dom_boot.c => xg_dom_boot.c}  |  0
 ...bzimageloader.c => xg_dom_bzimageloader.c} |  0
 ...m_compat_linux.c => xg_dom_compat_linux.c} |  0
 tools/libxc/{xc_dom_core.c => xg_dom_core.c}  |  0
 ...compress_lz4.c => xg_dom_decompress_lz4.c} |  0
 ...ss_unsafe.c => xg_dom_decompress_unsafe.c} |  0
 ...ip2.c => xg_dom_decompress_unsafe_bzip2.c} |  0
 ...lzma.c => xg_dom_decompress_unsafe_lzma.c} |  0
 ...o1x.c => xg_dom_decompress_unsafe_lzo1x.c} |  0
 ...afe_xz.c => xg_dom_decompress_unsafe_xz.c} |  0
 ...{xc_dom_elfloader.c => xg_dom_elfloader.c} |  0
 ...{xc_dom_hvmloader.c => xg_dom_hvmloader.c} |  0
 tools/libxc/{xc_dom_x86.c => xg_dom_x86.c}    |  0
 .../libxc/{xc_nomigrate.c => xg_nomigrate.c}  |  0
 .../{xc_offline_page.c => xg_offline_page.c}  |  0
 .../libxc/{xc_sr_common.c => xg_sr_common.c}  |  0
 ...{xc_sr_common_x86.c => xg_sr_common_x86.c} |  0
 ..._common_x86_pv.c => xg_sr_common_x86_pv.c} |  0
 .../{xc_sr_restore.c => xg_sr_restore.c}      |  0
 ...tore_x86_hvm.c => xg_sr_restore_x86_hvm.c} |  0
 ...estore_x86_pv.c => xg_sr_restore_x86_pv.c} |  0
 tools/libxc/{xc_sr_save.c => xg_sr_save.c}    |  0
 ...sr_save_x86_hvm.c => xg_sr_save_x86_hvm.c} |  0
 ...c_sr_save_x86_pv.c => xg_sr_save_x86_pv.c} |  0
 tools/libxc/{xc_suspend.c => xg_suspend.c}    |  0
 30 files changed, 30 insertions(+), 29 deletions(-)
 rename tools/libxc/{xc_cpuid_x86.c => xg_cpuid_x86.c} (100%)
 rename tools/libxc/{xc_dom_arm.c => xg_dom_arm.c} (100%)
 rename tools/libxc/{xc_dom_armzimageloader.c => xg_dom_armzimageloader.c} (100%)
 rename tools/libxc/{xc_dom_binloader.c => xg_dom_binloader.c} (100%)
 rename tools/libxc/{xc_dom_boot.c => xg_dom_boot.c} (100%)
 rename tools/libxc/{xc_dom_bzimageloader.c => xg_dom_bzimageloader.c} (100%)
 rename tools/libxc/{xc_dom_compat_linux.c => xg_dom_compat_linux.c} (100%)
 rename tools/libxc/{xc_dom_core.c => xg_dom_core.c} (100%)
 rename tools/libxc/{xc_dom_decompress_lz4.c => xg_dom_decompress_lz4.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe.c => xg_dom_decompress_unsafe.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe_bzip2.c => xg_dom_decompress_unsafe_bzip2.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe_lzma.c => xg_dom_decompress_unsafe_lzma.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe_lzo1x.c => xg_dom_decompress_unsafe_lzo1x.c} (100%)
 rename tools/libxc/{xc_dom_decompress_unsafe_xz.c => xg_dom_decompress_unsafe_xz.c} (100%)
 rename tools/libxc/{xc_dom_elfloader.c => xg_dom_elfloader.c} (100%)
 rename tools/libxc/{xc_dom_hvmloader.c => xg_dom_hvmloader.c} (100%)
 rename tools/libxc/{xc_dom_x86.c => xg_dom_x86.c} (100%)
 rename tools/libxc/{xc_nomigrate.c => xg_nomigrate.c} (100%)
 rename tools/libxc/{xc_offline_page.c => xg_offline_page.c} (100%)
 rename tools/libxc/{xc_sr_common.c => xg_sr_common.c} (100%)
 rename tools/libxc/{xc_sr_common_x86.c => xg_sr_common_x86.c} (100%)
 rename tools/libxc/{xc_sr_common_x86_pv.c => xg_sr_common_x86_pv.c} (100%)
 rename tools/libxc/{xc_sr_restore.c => xg_sr_restore.c} (100%)
 rename tools/libxc/{xc_sr_restore_x86_hvm.c => xg_sr_restore_x86_hvm.c} (100%)
 rename tools/libxc/{xc_sr_restore_x86_pv.c => xg_sr_restore_x86_pv.c} (100%)
 rename tools/libxc/{xc_sr_save.c => xg_sr_save.c} (100%)
 rename tools/libxc/{xc_sr_save_x86_hvm.c => xg_sr_save_x86_hvm.c} (100%)
 rename tools/libxc/{xc_sr_save_x86_pv.c => xg_sr_save_x86_pv.c} (100%)
 rename tools/libxc/{xc_suspend.c => xg_suspend.c} (100%)

diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index f3f1edc07b..e1b2c24106 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -54,20 +54,20 @@ CTRL_SRCS-y       += xc_devicemodel_compat.c
 GUEST_SRCS-y :=
 GUEST_SRCS-y += xg_private.c
 GUEST_SRCS-y += xg_domain.c
-GUEST_SRCS-y += xc_suspend.c
+GUEST_SRCS-y += xg_suspend.c
 ifeq ($(CONFIG_MIGRATE),y)
-GUEST_SRCS-y += xc_sr_common.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_common_x86.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_common_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_restore_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_restore_x86_hvm.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_save_x86_pv.c
-GUEST_SRCS-$(CONFIG_X86) += xc_sr_save_x86_hvm.c
-GUEST_SRCS-y += xc_sr_restore.c
-GUEST_SRCS-y += xc_sr_save.c
-GUEST_SRCS-y += xc_offline_page.c
+GUEST_SRCS-y += xg_sr_common.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_common_x86.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_common_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_restore_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_restore_x86_hvm.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_save_x86_pv.c
+GUEST_SRCS-$(CONFIG_X86) += xg_sr_save_x86_hvm.c
+GUEST_SRCS-y += xg_sr_restore.c
+GUEST_SRCS-y += xg_sr_save.c
+GUEST_SRCS-y += xg_offline_page.c
 else
-GUEST_SRCS-y += xc_nomigrate.c
+GUEST_SRCS-y += xg_nomigrate.c
 endif
 
 vpath %.c ../../xen/common/libelf
@@ -88,25 +88,26 @@ GUEST_SRCS-y                 += cpuid.c msr.c
 endif
 
 # new domain builder
-GUEST_SRCS-y                 += xc_dom_core.c xc_dom_boot.c
-GUEST_SRCS-y                 += xc_dom_elfloader.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_bzimageloader.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_decompress_lz4.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_hvmloader.c
-GUEST_SRCS-$(CONFIG_ARM)     += xc_dom_armzimageloader.c
-GUEST_SRCS-y                 += xc_dom_binloader.c
-GUEST_SRCS-y                 += xc_dom_compat_linux.c
-
-GUEST_SRCS-$(CONFIG_X86)     += xc_dom_x86.c
-GUEST_SRCS-$(CONFIG_X86)     += xc_cpuid_x86.c
-GUEST_SRCS-$(CONFIG_ARM)     += xc_dom_arm.c
+GUEST_SRCS-y                 += xg_dom_core.c
+GUEST_SRCS-y                 += xg_dom_boot.c
+GUEST_SRCS-y                 += xg_dom_elfloader.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_bzimageloader.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_decompress_lz4.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_hvmloader.c
+GUEST_SRCS-$(CONFIG_ARM)     += xg_dom_armzimageloader.c
+GUEST_SRCS-y                 += xg_dom_binloader.c
+GUEST_SRCS-y                 += xg_dom_compat_linux.c
+
+GUEST_SRCS-$(CONFIG_X86)     += xg_dom_x86.c
+GUEST_SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
+GUEST_SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
 
 ifeq ($(CONFIG_LIBXC_MINIOS),y)
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_bzip2.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_lzma.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_lzo1x.c
-GUEST_SRCS-y                 += xc_dom_decompress_unsafe_xz.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_bzip2.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_lzma.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_lzo1x.c
+GUEST_SRCS-y                 += xg_dom_decompress_unsafe_xz.c
 endif
 
 -include $(XEN_TARGET_ARCH)/Makefile
diff --git a/tools/libxc/xc_cpuid_x86.c b/tools/libxc/xg_cpuid_x86.c
similarity index 100%
rename from tools/libxc/xc_cpuid_x86.c
rename to tools/libxc/xg_cpuid_x86.c
diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xg_dom_arm.c
similarity index 100%
rename from tools/libxc/xc_dom_arm.c
rename to tools/libxc/xg_dom_arm.c
diff --git a/tools/libxc/xc_dom_armzimageloader.c b/tools/libxc/xg_dom_armzimageloader.c
similarity index 100%
rename from tools/libxc/xc_dom_armzimageloader.c
rename to tools/libxc/xg_dom_armzimageloader.c
diff --git a/tools/libxc/xc_dom_binloader.c b/tools/libxc/xg_dom_binloader.c
similarity index 100%
rename from tools/libxc/xc_dom_binloader.c
rename to tools/libxc/xg_dom_binloader.c
diff --git a/tools/libxc/xc_dom_boot.c b/tools/libxc/xg_dom_boot.c
similarity index 100%
rename from tools/libxc/xc_dom_boot.c
rename to tools/libxc/xg_dom_boot.c
diff --git a/tools/libxc/xc_dom_bzimageloader.c b/tools/libxc/xg_dom_bzimageloader.c
similarity index 100%
rename from tools/libxc/xc_dom_bzimageloader.c
rename to tools/libxc/xg_dom_bzimageloader.c
diff --git a/tools/libxc/xc_dom_compat_linux.c b/tools/libxc/xg_dom_compat_linux.c
similarity index 100%
rename from tools/libxc/xc_dom_compat_linux.c
rename to tools/libxc/xg_dom_compat_linux.c
diff --git a/tools/libxc/xc_dom_core.c b/tools/libxc/xg_dom_core.c
similarity index 100%
rename from tools/libxc/xc_dom_core.c
rename to tools/libxc/xg_dom_core.c
diff --git a/tools/libxc/xc_dom_decompress_lz4.c b/tools/libxc/xg_dom_decompress_lz4.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_lz4.c
rename to tools/libxc/xg_dom_decompress_lz4.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe.c b/tools/libxc/xg_dom_decompress_unsafe.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe.c
rename to tools/libxc/xg_dom_decompress_unsafe.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe_bzip2.c b/tools/libxc/xg_dom_decompress_unsafe_bzip2.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe_bzip2.c
rename to tools/libxc/xg_dom_decompress_unsafe_bzip2.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe_lzma.c b/tools/libxc/xg_dom_decompress_unsafe_lzma.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe_lzma.c
rename to tools/libxc/xg_dom_decompress_unsafe_lzma.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe_lzo1x.c b/tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe_lzo1x.c
rename to tools/libxc/xg_dom_decompress_unsafe_lzo1x.c
diff --git a/tools/libxc/xc_dom_decompress_unsafe_xz.c b/tools/libxc/xg_dom_decompress_unsafe_xz.c
similarity index 100%
rename from tools/libxc/xc_dom_decompress_unsafe_xz.c
rename to tools/libxc/xg_dom_decompress_unsafe_xz.c
diff --git a/tools/libxc/xc_dom_elfloader.c b/tools/libxc/xg_dom_elfloader.c
similarity index 100%
rename from tools/libxc/xc_dom_elfloader.c
rename to tools/libxc/xg_dom_elfloader.c
diff --git a/tools/libxc/xc_dom_hvmloader.c b/tools/libxc/xg_dom_hvmloader.c
similarity index 100%
rename from tools/libxc/xc_dom_hvmloader.c
rename to tools/libxc/xg_dom_hvmloader.c
diff --git a/tools/libxc/xc_dom_x86.c b/tools/libxc/xg_dom_x86.c
similarity index 100%
rename from tools/libxc/xc_dom_x86.c
rename to tools/libxc/xg_dom_x86.c
diff --git a/tools/libxc/xc_nomigrate.c b/tools/libxc/xg_nomigrate.c
similarity index 100%
rename from tools/libxc/xc_nomigrate.c
rename to tools/libxc/xg_nomigrate.c
diff --git a/tools/libxc/xc_offline_page.c b/tools/libxc/xg_offline_page.c
similarity index 100%
rename from tools/libxc/xc_offline_page.c
rename to tools/libxc/xg_offline_page.c
diff --git a/tools/libxc/xc_sr_common.c b/tools/libxc/xg_sr_common.c
similarity index 100%
rename from tools/libxc/xc_sr_common.c
rename to tools/libxc/xg_sr_common.c
diff --git a/tools/libxc/xc_sr_common_x86.c b/tools/libxc/xg_sr_common_x86.c
similarity index 100%
rename from tools/libxc/xc_sr_common_x86.c
rename to tools/libxc/xg_sr_common_x86.c
diff --git a/tools/libxc/xc_sr_common_x86_pv.c b/tools/libxc/xg_sr_common_x86_pv.c
similarity index 100%
rename from tools/libxc/xc_sr_common_x86_pv.c
rename to tools/libxc/xg_sr_common_x86_pv.c
diff --git a/tools/libxc/xc_sr_restore.c b/tools/libxc/xg_sr_restore.c
similarity index 100%
rename from tools/libxc/xc_sr_restore.c
rename to tools/libxc/xg_sr_restore.c
diff --git a/tools/libxc/xc_sr_restore_x86_hvm.c b/tools/libxc/xg_sr_restore_x86_hvm.c
similarity index 100%
rename from tools/libxc/xc_sr_restore_x86_hvm.c
rename to tools/libxc/xg_sr_restore_x86_hvm.c
diff --git a/tools/libxc/xc_sr_restore_x86_pv.c b/tools/libxc/xg_sr_restore_x86_pv.c
similarity index 100%
rename from tools/libxc/xc_sr_restore_x86_pv.c
rename to tools/libxc/xg_sr_restore_x86_pv.c
diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xg_sr_save.c
similarity index 100%
rename from tools/libxc/xc_sr_save.c
rename to tools/libxc/xg_sr_save.c
diff --git a/tools/libxc/xc_sr_save_x86_hvm.c b/tools/libxc/xg_sr_save_x86_hvm.c
similarity index 100%
rename from tools/libxc/xc_sr_save_x86_hvm.c
rename to tools/libxc/xg_sr_save_x86_hvm.c
diff --git a/tools/libxc/xc_sr_save_x86_pv.c b/tools/libxc/xg_sr_save_x86_pv.c
similarity index 100%
rename from tools/libxc/xc_sr_save_x86_pv.c
rename to tools/libxc/xg_sr_save_x86_pv.c
diff --git a/tools/libxc/xc_suspend.c b/tools/libxc/xg_suspend.c
similarity index 100%
rename from tools/libxc/xc_suspend.c
rename to tools/libxc/xg_suspend.c
-- 
2.26.2


