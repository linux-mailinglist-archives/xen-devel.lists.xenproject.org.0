Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B85835E4FB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 19:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110022.209988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMmp-0002GK-Dr; Tue, 13 Apr 2021 17:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110022.209988; Tue, 13 Apr 2021 17:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMmp-0002Fy-Ac; Tue, 13 Apr 2021 17:25:15 +0000
Received: by outflank-mailman (input) for mailman id 110022;
 Tue, 13 Apr 2021 17:25:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFP6=JK=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lWMmn-0002Ft-4y
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:25:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e602962d-fabd-4f00-be0e-cb381fdef53e;
 Tue, 13 Apr 2021 17:25:12 +0000 (UTC)
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
X-Inumbo-ID: e602962d-fabd-4f00-be0e-cb381fdef53e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618334712;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=o4Ix7LV1Jb/xS2UvOPAA2Ov/njQHfZ5Ek7CWlt/G++U=;
  b=bzVp4DfyemQJylx5a4HWzrQyM9G9FJ1dWEhGtOfVjb1mq/AvbgT3KtRy
   4yqUqwyxIrU0xe7ZR1An+URkKV4+admmdVj5ryvFpWMjHTfr3aoCSwLHk
   0sA4MBUWXmFty8oAipv3TNQhNVRBczh2lqObntFxEGSkaddqU9rrRBxLi
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: /sRVmIeUSEUWR6VTGHYsB8x405l0ZP2nvo5+8hWAN5hBObfxf643MkiWzgaF1XVSFcqwlsL1Yb
 dSM58swrn1kaDzfbTjGDUPewlfCufY8KS8EXp2vRXOB74tuLAa6itMkW/gRYS0C6iH49gbjIht
 XPp4tPyq1sSFzQFPLr2vLJDRXA8sb3Rkp2x/8xRnLnNayUv31u2iwW1OrxAwphKgFJv+KZ6EH8
 gqLrpuHYjX9/F0zeDar/6c53vggoFn4AmP2Cy37YFmPD8Q3UsMloUTbV8KxJOXhce2R9w3ujj8
 SSw=
X-SBRS: 4.0
X-MesageID: 41636314
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jHRe3a4hhzu048Rf5wPXwRKBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3Xa6JJz/M0tLa6vNTOW3VeAAaNDyc/ZwzPmEzDj7eI178
 1dWoV3FdGYNzdHpOng5g3QKbgd6f2m1IztuuvE1XdqSmhRGsNdxiN0EBySHEEzZCQuP/oEPa
 GR7MZGuDasEE5/BqiGL0IIQvTZoJnznI/mCCRsOzcc9AKMgTm0gYSKcCSw4xF2aVJy6IZny0
 fpuUjT5qKvs/a0oyWsrVP73tBtt/bKjvdGDMyIoMAJJjvrkRbAXvUdZ5Sy+AobjcvqxFE2kM
 TdgxpIBbUO11rhOlubjDGo+w783C0g43XvoGXo/kfLkIjCax8RT+9i7LgpFifx2g4bk/xXlJ
 9v5Sa/saFaCBvR9R6Nn+TgZlVRuWef5UY5nfV7tQ05baIuLIV/gKY4501vHJIJDEvBmfsaOd
 grNs3a6fpMGGnqCUzxjy1qyNyoaHw5Ag2LdEgEotCUyDhbhhlCvjIl+PA=
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41636314"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jun.nakajima@intel.com>, <kevin.tian@intel.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH] x86/vPMU: Extend vPMU support to version 5
Date: Tue, 13 Apr 2021 18:25:01 +0100
Message-ID: <1618334701-8263-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Version 5 is backwards compatible with version 3. This allows to enable
vPMU on Ice Lake CPUs.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 xen/arch/x86/cpu/vpmu_intel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 6e97ce7..0dfc256 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -839,7 +839,7 @@ int vmx_vpmu_initialise(struct vcpu *v)
         return 0;
 
     if ( v->domain->arch.cpuid->basic.pmu_version <= 1 ||
-         v->domain->arch.cpuid->basic.pmu_version >= 5 )
+         v->domain->arch.cpuid->basic.pmu_version >= 6 )
         return -EINVAL;
 
     if ( (arch_pmc_cnt + fixed_pmc_cnt) == 0 )
@@ -909,8 +909,9 @@ int __init core2_vpmu_init(void)
     switch ( version )
     {
     case 4:
-        printk(XENLOG_INFO "VPMU: PMU version 4 is not fully supported. "
-               "Emulating version 3\n");
+    case 5:
+        printk(XENLOG_INFO "VPMU: PMU version %u is not fully supported. "
+               "Emulating version 3\n", version);
         /* FALLTHROUGH */
 
     case 2:
-- 
2.7.4


