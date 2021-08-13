Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABC3EB426
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 12:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166723.304307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEUcC-0007kG-Ox; Fri, 13 Aug 2021 10:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166723.304307; Fri, 13 Aug 2021 10:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEUcC-0007i7-Ln; Fri, 13 Aug 2021 10:40:40 +0000
Received: by outflank-mailman (input) for mailman id 166723;
 Fri, 13 Aug 2021 10:40:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rK1=NE=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mEUcB-0007i1-60
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 10:40:39 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4ed2ee8-fc22-11eb-a275-12813bfff9fa;
 Fri, 13 Aug 2021 10:40:37 +0000 (UTC)
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
X-Inumbo-ID: e4ed2ee8-fc22-11eb-a275-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628851237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CL3znfpWELLv4litjeLtI8c/M9lffSXcm1hEov0YUxw=;
  b=bSe65Wzv+NxBHpifTcRlh03zTsmKKeJqB36g3wedL0hIVHbTAPlVFOoc
   P9d89foetvbHp54ThbW2L3ShB4FCA31D/20yujqfjZWlvnbs3kB10RZ2D
   nFSNz0grCp4f2cIZO1POC5zs0+zd57Nb/W6CtwwMltSBuwlxEtggYDCUe
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Jdp/9oH666MMhv76DXNHRE93TGnOjwO9Pk92Z9WuDQBlyLmLSUcweu8ocuSwiRuMm0jz0knCNZ
 AW2dS/lSkBrKk++LIYnwulisQD839IGMiPZ1eWHrOTdbuwjNJ1hzfi/tikrp6ZzFOAaz9ZkPuU
 ZdiT0JxSDD85y9RbY05vNs0hc9FCR4j/7EWlCl73ZBvaHZGUxtEU/rJKXETENjzlwSy40FTV4R
 4mgXfzxFPxl4z8M0qHftvs1hZF3AwtcC8M7V2t7pIUaSLhNP8TtX3dvoFgc/oowziBVcbBQ6AG
 C5tvwA8Mb2P+kJZXMoErdhFN
X-SBRS: 5.1
X-MesageID: 50373501
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nFboU6j8QM9HRew3ct/Zo5C2pXBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.84,318,1620705600"; 
   d="scan'208";a="50373501"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 1/2] x86/pv: Provide more helpful error when CONFIG_PV32 is absent
Date: Fri, 13 Aug 2021 11:40:24 +0100
Message-ID: <20210813104025.2063-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently, when booting a 32bit dom0 kernel, the message isn't very
helpful:

  (XEN)  Xen  kernel: 64-bit, lsb
  (XEN)  Dom0 kernel: 32-bit, PAE, lsb, paddr 0x100000 -> 0x112000
  (XEN) Mismatch between Xen and DOM0 kernel
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Could not construct domain 0
  (XEN) ****************************************

With this adjustment, it now looks like this:

  (XEN)  Xen  kernel: 64-bit, lsb
  (XEN) Found 32-bit PV kernel, but CONFIG_PV32 missing
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Could not construct domain 0
  (XEN) ****************************************

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/pv/dom0_build.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index af47615b22..80e6c6e35b 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -362,9 +362,9 @@ int __init dom0_construct_pv(struct domain *d,
     compatible = false;
     machine = elf_uval(&elf, elf.ehdr, e_machine);
 
-#ifdef CONFIG_PV32
     if ( elf_32bit(&elf) )
     {
+#ifdef CONFIG_PV32
         if ( parms.pae == XEN_PAE_BIMODAL )
             parms.pae = XEN_PAE_EXTCR3;
         if ( parms.pae && machine == EM_386 )
@@ -377,8 +377,12 @@ int __init dom0_construct_pv(struct domain *d,
 
             compatible = true;
         }
-    }
+#else
+        printk("Found 32-bit PV kernel, but CONFIG_PV32 missing\n");
+        rc = -ENODEV;
+        goto out;
 #endif
+    }
 
     compat = is_pv_32bit_domain(d);
 
-- 
2.11.0


