Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30273ED301
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 13:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167275.305318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFaep-0003Eh-AV; Mon, 16 Aug 2021 11:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167275.305318; Mon, 16 Aug 2021 11:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFaep-000397-6n; Mon, 16 Aug 2021 11:19:55 +0000
Received: by outflank-mailman (input) for mailman id 167275;
 Mon, 16 Aug 2021 11:19:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJmv=NH=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mFaen-00035k-Qj
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 11:19:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26164abd-8000-429c-adc3-3f943538038c;
 Mon, 16 Aug 2021 11:19:52 +0000 (UTC)
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
X-Inumbo-ID: 26164abd-8000-429c-adc3-3f943538038c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629112792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=twjVT0hpM+jfF0v59i+A2bLDQBPw7Rbw47Q79jWXs1Y=;
  b=TNDGPf0I1TkUdP1ObXus+SFrOX914GYP/WB11f+ZPYYH+gW8xP1U+uMx
   JSGoonc88gELpaUBGayuaC0Ee1QkoFk6hZsoR1GUj/5gZDq5r9591wFad
   DsGh/fI+2InpHvv7DWNnVZd19BuLD4X5Y83tM8Vu/YaTT9vT4CpHoizqy
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: N6oGc2WK4UymlR6aYbVvQzsu7BDTS1kGx/krzmmk8nXBgcHbnD/f6gy3pHspphQrnkRGAusgIp
 q2HvTqj6D/vg2cWn603tiZk+JGWCApPUTNe89V3yOlubRPK+rqggg6s157m41p9N/me/fnEwH3
 jUdHPtkxPfcxoN9F59UV65a9Yw6tpH4pyR0vLziHShigQHMoqNPo40cG5d8NJVwJn2dBA4iyCv
 2lLBOU2oFBvFEMf4zMhO2HPrJkhUwvQzz0q9mU1lJw7EY4RsbO+ZGiJ4c5i/xs8qah8NmPltsk
 aKKiwmhF5n9YBXl8JXLGnD32
X-SBRS: 5.1
X-MesageID: 50533571
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yz4jaa6bOuPanSlyfQPXwPLXdLJyesId70hD6qhwISY1TiX+rb
 HXoB17726MtN9/YgBCpTntAsa9qDbnhPpICOoqTNGftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkENDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.84,324,1620705600"; 
   d="scan'208";a="50533571"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 1/2] x86/pv: remove unnecessary use of goto out in construct_dom0()
Date: Mon, 16 Aug 2021 12:19:26 +0100
Message-ID: <20210816111927.16913-2-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210816111927.16913-1-jane.malalane@citrix.com>
References: <20210816111927.16913-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

elf_check_broken() only needs to be invoked after elf_xen_parse() and
after elf_load_binary().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * add into series
 * fixup ordering error with CONFIG_PV32 change
---
 xen/arch/x86/pv/dom0_build.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index af47615b22..8712baccc1 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -400,8 +400,7 @@ int __init dom0_construct_pv(struct domain *d,
     if ( !compatible )
     {
         printk("Mismatch between Xen and DOM0 kernel\n");
-        rc = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
     if ( parms.elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type != XEN_ENT_NONE )
@@ -409,8 +408,7 @@ int __init dom0_construct_pv(struct domain *d,
         if ( !pv_shim && !test_bit(XENFEAT_dom0, parms.f_supported) )
         {
             printk("Kernel does not support Dom0 operation\n");
-            rc = -EINVAL;
-            goto out;
+            return -EINVAL;
         }
     }
 
@@ -607,8 +605,7 @@ int __init dom0_construct_pv(struct domain *d,
          : (v_start < HYPERVISOR_VIRT_END) && (v_end > HYPERVISOR_VIRT_START) )
     {
         printk("DOM0 image overlaps with Xen private area.\n");
-        rc = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
     if ( compat )
@@ -753,8 +750,7 @@ int __init dom0_construct_pv(struct domain *d,
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


