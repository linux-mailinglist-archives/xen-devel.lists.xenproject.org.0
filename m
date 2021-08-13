Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA03EB458
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 13:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166750.304362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEUy3-0003dL-Is; Fri, 13 Aug 2021 11:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166750.304362; Fri, 13 Aug 2021 11:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEUy3-0003bR-Ff; Fri, 13 Aug 2021 11:03:15 +0000
Received: by outflank-mailman (input) for mailman id 166750;
 Fri, 13 Aug 2021 11:03:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8rK1=NE=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mEUy1-0003bL-D3
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 11:03:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ccd5958-fc26-11eb-a278-12813bfff9fa;
 Fri, 13 Aug 2021 11:03:12 +0000 (UTC)
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
X-Inumbo-ID: 0ccd5958-fc26-11eb-a278-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628852592;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VTtXdfmHWN3UTQRMXbEyPVPeXu58zs2GlFEQM3mE6aI=;
  b=Jp4eM1ePgZkMZp/Fxchar1cES8WjenuVxc8WDCpiPKWAAn8pVadYOf7w
   x2ZpDsOnSyHeTYXuWqEIQsLt8FcWgSy/yvDLyUpo+VDraC0LqQ/ual1SX
   8HM2ukF0MybbuA6QCe75Vxe4guHEN3Ni8EnWzRViRC631xn+6gaTd7zWl
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4YCVcmoxdc15E5oYmarOCg8zC79FXxL3WKhjiS2pG7YwlBr9cehpVYzGO1S61bTve5aj3riibr
 wJJbxea1fpHNDiCiOXrkSYRrW2EIVBOeHxLj/0u5O5XXL6h/R4tp/aznQAxCFZjl3qRg8UP5E4
 Zi48AyxWLJSD2i7cfWCDUfOix/g8inMqbJfVHES9e5RnOv/qywtnFh3UnPEePRHBBLRF8riTcL
 TPQPETzp3qx0E6ydkVCFcZlN3poTY42YBayHeFr8Z+7P/krU3wmDnzYv+x8+swjGqO0uhJi/+O
 EjpCJvVX2Sx9fFdw8Gy0J4Qw
X-SBRS: 5.1
X-MesageID: 52103811
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DTRa7q5/SDnBBYGujQPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.84,318,1620705600"; 
   d="scan'208";a="52103811"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] x86/pv: remove unnecessary use of goto out in construct_dom0()
Date: Fri, 13 Aug 2021 12:02:24 +0100
Message-ID: <20210813110224.14820-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

elf_check_broken() only needs to be invoked after elf_xen_parse() and
after elf_load_binary().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/pv/dom0_build.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 80e6c6e35b..db1e1e5edd 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -379,8 +379,7 @@ int __init dom0_construct_pv(struct domain *d,
         }
 #else
         printk("Found 32-bit PV kernel, but CONFIG_PV32 missing\n");
-        rc = -ENODEV;
-        goto out;
+        return -ENODEV;
 #endif
     }
 
@@ -404,8 +403,7 @@ int __init dom0_construct_pv(struct domain *d,
     if ( !compatible )
     {
         printk("Mismatch between Xen and DOM0 kernel\n");
-        rc = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
     if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
@@ -413,8 +411,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
         {
             printk("Kernel does not support Dom0 operation\n");
-            rc = -EINVAL;
-            goto out;
+            return -EINVAL;
         }
     }
 
@@ -611,8 +608,7 @@ int __init dom0_construct_pv(struct domain *d,
          : (v_start < HYPERVISOR_VIRT_END) && (v_end > HYPERVISOR_VIRT_START) )
     {
         printk("DOM0 image overlaps with Xen private area.\n");
-        rc = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
     if ( compat )
@@ -757,8 +753,7 @@ int __init dom0_construct_pv(struct domain *d,
             mapcache_override_current(NULL);
             switch_cr3_cr4(current->arch.cr3, read_cr4());
             printk("Invalid HYPERCALL_PAGE field in ELF notes.\n");
-            rc = -EINVAL;
-            goto out;
+            return -EINVAL;
         }
         init_hypercall_page(d, _p(parms.virt_hypercall));
     }
-- 
2.11.0


