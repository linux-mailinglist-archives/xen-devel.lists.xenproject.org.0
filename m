Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED976A5E57
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 18:40:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503619.775949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3xR-0007GN-1Y; Tue, 28 Feb 2023 17:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503619.775949; Tue, 28 Feb 2023 17:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX3xQ-00077z-SN; Tue, 28 Feb 2023 17:40:08 +0000
Received: by outflank-mailman (input) for mailman id 503619;
 Tue, 28 Feb 2023 17:40:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WuWh=6Y=citrix.com=prvs=4168872ba=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1pX3xO-0006WI-UU
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 17:40:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef57482e-b78e-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 18:40:05 +0100 (CET)
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
X-Inumbo-ID: ef57482e-b78e-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677606004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=K+j4WJCkOxdn46mcun2tYyo0EwVo6CxR547z8EwP1Wk=;
  b=hn6936WubqsBfq8vtIBgAzKnMEEeh2lgvfdh5f80AB04KF9/BJxkFnDu
   O0MZBNcsZxNGFPMXji4GubKjDpiGwEwP26eUtdU1Z2U5ltaVggqa5jmC7
   bOwQtima2Ap/2h+VCe2vCcNauQ2kayOE/Y0MClamKVYzYLbP0hepRhqvk
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101312543
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:lP4rBKC5e5R+VhVW/+fjw5YqxClBgxIJ4kV8jS/XYbTApDklgjEOm
 GIeXWnQOf2LM2XyetAjYYzg/RkF6MfSz95hQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GlC7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw18VLUTBM3
 PwhEw8kdzyCruW9kKmyRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIIkzhuillz/zYjRDrFO9rqsr+WnDigd21dABNfKMIoXRHJ8Iwh3wS
 mTuwkHpJS0UCu6m2DvC1l2xrMqfxTrdR9dHfFG/3qEz2wDCroAJMzUUWkG8uuKRkVOlVpRUL
 El80igzqak/8mS7Q9+7WAe3yFafpQIVUddUF+w86SmOx7DS7gLfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85jrQSv5zHajzicf6cQwc2
 BjT8nJ43e9Ky5dWiePipwuvby+QSobhYy0JtlTVd2Kc1TxQfaKkToujuUPS4qMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2OF3wM2d3U133H0oiP4I9gMiN1rDB0xWvvobwMFd
 6M6Vel5wJZIdEWnYqZsC25aI5R7lPOwfTgJux29UzavXnSTXFXalM2NTRTKt4wIrKTLufBXB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTBOyPPE+ZdbArSP4jVCZ9oRy2Pr
 r5i2zaikU0DAIUSnAGMmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkc5wz5mNscl3het/0NzI/gp
 yjtMnK0PXKj3RUr3y3WMCE8AF4uNL4jxU8G0dsEZg74iiVzMN30s8/ytfIfJNEayQCq9tYsJ
 9FtRilKKq4npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:M7EdZqvktGcXvi5gaOrui5S+7skDi9V00zEX/kB9WHVpm5qj5q
 STdZUguSMc5wx9ZJhNo6H4BEDEewK7yXcX2+Ys1NWZLWzbUTCTXeJfBOLZqlXd8m/FltK1s5
 0QEZSWJ+eAdWSS5vyKhzVQfexL/PC3tIi0gO/F1XdkSkVPY6FkqyN0EBySHEEzZAQuP/QEPa
 vZztdDryC7eXwRKuCyBnxAYvPKoMfCno/nZxlDJxNP0mizZGOTg4LHLw==
X-IronPort-AV: E=Sophos;i="5.98,222,1673931600"; 
   d="scan'208";a="101312543"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v2/RFC 1/3] xen/hypfs: add initial cpuinfo directory
Date: Tue, 28 Feb 2023 17:39:30 +0000
Message-ID: <20230228173932.28510-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230228173932.28510-1-sergey.dyasli@citrix.com>
References: <20230228173932.28510-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Currently it's impossible to get CPU's microcode revision after late
loading without looking into Xen logs which is not always convenient.

Leverage xenhypfs to expose struct cpu_signature in a new cpuinfo dir.
The tree structure is:

    /
      cpuinfo/
        cpu-signature
        microcode-revision
        processor-flags

The most useful bit is cpu microcode revision which will get updated
after late ucode loading.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
 xen/arch/x86/cpu/common.c | 58 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 5ad347534a..aa864fdbab 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -1005,3 +1005,61 @@ const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
 	}
 	return NULL;
 }
+
+#ifdef CONFIG_HYPFS
+#include <xen/hypfs.h>
+#include <xen/guest_access.h>
+#include <asm/microcode.h>
+
+static unsigned int cpu_signature;
+static unsigned int processor_flags;
+static unsigned int ucode_revision;
+
+int cf_check hypfs_read_cpusig(
+    const struct hypfs_entry *entry, XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct hypfs_entry_leaf *l;
+    unsigned int size = entry->funcs->getsize(entry);
+    const struct cpu_signature *sig = &per_cpu(cpu_sig,
+                                               cpumask_first(&cpu_online_map));
+
+    l = container_of(entry, const struct hypfs_entry_leaf, e);
+
+    cpu_signature = sig->sig;
+    processor_flags = sig->pf;
+    ucode_revision = sig->rev;
+
+    return copy_to_guest(uaddr, l->u.content, size) ?  -EFAULT : 0;
+}
+
+const struct hypfs_funcs ucode_rev_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = hypfs_read_cpusig,
+    .write = hypfs_write_deny,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_DIR_INIT(cpuinfo, "cpuinfo");
+static HYPFS_FIXEDSIZE_INIT(signature, XEN_HYPFS_TYPE_UINT, "cpu-signature",
+                            cpu_signature, &ucode_rev_funcs, 0);
+static HYPFS_FIXEDSIZE_INIT(pf, XEN_HYPFS_TYPE_UINT, "processor-flags",
+                            processor_flags, &ucode_rev_funcs, 0);
+static HYPFS_FIXEDSIZE_INIT(revision, XEN_HYPFS_TYPE_UINT, "microcode-revision",
+                            ucode_revision, &ucode_rev_funcs, 0);
+
+static int __init cf_check cpuinfo_init(void)
+{
+    hypfs_add_dir(&hypfs_root, &cpuinfo, true);
+    hypfs_add_leaf(&cpuinfo, &signature, true);
+
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+        hypfs_add_leaf(&cpuinfo, &pf, true);
+
+    hypfs_add_leaf(&cpuinfo, &revision, true);
+
+    return 0;
+}
+__initcall(cpuinfo_init);
+#endif /* CONFIG_HYPFS */
-- 
2.17.1


