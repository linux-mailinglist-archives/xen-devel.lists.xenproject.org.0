Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A49F50DD9D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 12:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312700.530034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nivcX-00052k-BW; Mon, 25 Apr 2022 10:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312700.530034; Mon, 25 Apr 2022 10:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nivcX-000501-8Z; Mon, 25 Apr 2022 10:07:05 +0000
Received: by outflank-mailman (input) for mailman id 312700;
 Mon, 25 Apr 2022 10:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eo9G=VD=citrix.com=prvs=107e1699f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nivcV-0004zv-Gw
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 10:07:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72a58353-c47f-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 12:07:02 +0200 (CEST)
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
X-Inumbo-ID: 72a58353-c47f-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650881221;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zGvmq1TIl1lbCHKhcswvVthKTJC5MAI1Qajbd0Y/xNg=;
  b=R/K2ZMrNQ3jdfQTuIosu8ktx930LPXG9Z8QOdRCuWQ14PCReSwM5OF0B
   CEfmn2EzNr3kUYfaV/yX4wGqu2aguc0IRa5FZMa8He8uWEbBbMLCTWoNR
   VaqwCUGvXT3sVYd2+HNqtFlNFog9M3lZlI3iVJzqCAbdhLrqcWoZVnEas
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70247504
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mz6q4qmsdNwXNcRdjhRISdXo5gxsJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXW2+PaaneYjT1LdB1O4vl9R5UvMfQy4QyTlNu+y1hQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWV/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYaQNxL5aQwMUhVTZJDC9OIbAexO+ECC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJGMWAzM0mYP3WjPH9JUqA7wLyMiEDNXDdii0qto5RpszTcmVkZPL/Fb4OOJ43iqd9utkSXv
 GXd5EziHwoXcteYzFKt0Fihm+vOliPTQ58JGfuz8fsCqFee3HAJARsaE16yu+Cki1WWUshab
 UcT/0IGk68280C6S8jnaDexqnWEox00VsJZFqsx7wTl4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDht8PkA3ljvaOYTVqZ96yItnWiNC4NN2gAaCQYCwwf7LHLopw3jx/JZsZuFuiylNKdMS706
 yCHqm45nbp7sCIQ//zlpxad2Wvq/8WXCF5ujunKYo67xiN9PJ+eO9SJ1V70/OlOHJqEFmXR/
 1FRzqBy89syJZ2KkSWMRsAEE7eo++uJPVXgvLJ/I3Uy32/zoiD+JOi89Bk7fR40aZhcJVcFd
 WeJ4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUiwyiDAcollY
 P93lPpA6l5AVMxaIMKeHbt17FPS7nlWKZnvbZ761Q+79rGVeWSYT7wIWHPXML1hs/7d+F+Er
 owBXydv9/m5eLenCsUw2dRNRW3m0FBhXcymwyCpXrPrzvVa9JEJVKaKnOJJl31NlKVJjObYl
 kxRqWcDoGcTcUbvcF3QAlg6MeuHdc8m/RoTYHx9VX71iiNLSdv+s88im24fIOBPGBpLlqUvE
 ZHouqyoX5xyd9gw02lDPcSl8Nw+JXxGR2umZkKYXdT2RLY4LyShxzMuVlGHGPUmZsZvifYDn
 g==
IronPort-HdrOrdr: A9a23:Lnc81K4AUwhPo/HSMgPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.90,287,1643691600"; 
   d="scan'208";a="70247504"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v2] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Date: Mon, 25 Apr 2022 11:06:42 +0100
Message-ID: <20220425100642.14383-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When CONFIG_GDBSX is compiled out, iommu_do_domctl() falls over a NULL
pointer.  One of several bugs here is known-but-compiled-out subops falling
into the default chain and hitting unrelated logic.

Remove the CONFIG_GDBSX ifdefary in arch_do_domctl() by implementing
gdbsx_domctl() and moving the logic across.

As minor cleanup,
 * gdbsx_guest_mem_io() can become static
 * Remove opencoding of domain_vcpu() and %pd

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

v2:
 * Implement the "split into new function" approach from the RFC.
---
 xen/arch/x86/domctl.c            | 61 +----------------------------------
 xen/arch/x86/gdbsx.c             | 68 +++++++++++++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/gdbsx.h | 15 +++++++--
 3 files changed, 80 insertions(+), 64 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index c20ab4352715..9131acb8a230 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -816,71 +816,12 @@ long arch_do_domctl(
     }
 #endif
 
-#ifdef CONFIG_GDBSX
     case XEN_DOMCTL_gdbsx_guestmemio:
-        ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
-        if ( !ret )
-           copyback = true;
-        break;
-
     case XEN_DOMCTL_gdbsx_pausevcpu:
-    {
-        struct vcpu *v;
-
-        ret = -EBUSY;
-        if ( !d->controller_pause_count )
-            break;
-        ret = -EINVAL;
-        if ( domctl->u.gdbsx_pauseunp_vcpu.vcpu >= d->max_vcpus ||
-             (v = d->vcpu[domctl->u.gdbsx_pauseunp_vcpu.vcpu]) == NULL )
-            break;
-        ret = vcpu_pause_by_systemcontroller(v);
-        break;
-    }
-
     case XEN_DOMCTL_gdbsx_unpausevcpu:
-    {
-        struct vcpu *v;
-
-        ret = -EBUSY;
-        if ( !d->controller_pause_count )
-            break;
-        ret = -EINVAL;
-        if ( domctl->u.gdbsx_pauseunp_vcpu.vcpu >= d->max_vcpus ||
-             (v = d->vcpu[domctl->u.gdbsx_pauseunp_vcpu.vcpu]) == NULL )
-            break;
-        ret = vcpu_unpause_by_systemcontroller(v);
-        if ( ret == -EINVAL )
-            printk(XENLOG_G_WARNING
-                   "WARN: d%d attempting to unpause %pv which is not paused\n",
-                   currd->domain_id, v);
-        break;
-    }
-
     case XEN_DOMCTL_gdbsx_domstatus:
-    {
-        struct vcpu *v;
-
-        domctl->u.gdbsx_domstatus.vcpu_id = -1;
-        domctl->u.gdbsx_domstatus.paused = d->controller_pause_count > 0;
-        if ( domctl->u.gdbsx_domstatus.paused )
-        {
-            for_each_vcpu ( d, v )
-            {
-                if ( v->arch.gdbsx_vcpu_event )
-                {
-                    domctl->u.gdbsx_domstatus.vcpu_id = v->vcpu_id;
-                    domctl->u.gdbsx_domstatus.vcpu_ev =
-                        v->arch.gdbsx_vcpu_event;
-                    v->arch.gdbsx_vcpu_event = 0;
-                    break;
-                }
-            }
-        }
-        copyback = true;
+        ret = gdbsx_domctl(d, domctl, &copyback);
         break;
-    }
-#endif
 
     case XEN_DOMCTL_setvcpuextstate:
     case XEN_DOMCTL_getvcpuextstate:
diff --git a/xen/arch/x86/gdbsx.c b/xen/arch/x86/gdbsx.c
index 6ef46e8ea77d..d8067ec90fd4 100644
--- a/xen/arch/x86/gdbsx.c
+++ b/xen/arch/x86/gdbsx.c
@@ -152,7 +152,8 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
     return len;
 }
 
-int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop)
+static int gdbsx_guest_mem_io(struct domain *d,
+                              struct xen_domctl_gdbsx_memio *iop)
 {
     if ( d && !d->is_dying )
     {
@@ -178,6 +179,71 @@ void domain_pause_for_debugger(void)
         send_global_virq(VIRQ_DEBUGGER);
 }
 
+long gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback)
+{
+    struct vcpu *v;
+    long ret = 0;
+
+    switch ( domctl->cmd )
+    {
+    case XEN_DOMCTL_gdbsx_guestmemio:
+        ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
+        if ( !ret )
+            *copyback = true;
+        break;
+
+    case XEN_DOMCTL_gdbsx_pausevcpu:
+        ret = -EBUSY;
+        if ( !d->controller_pause_count )
+            break;
+        ret = -EINVAL;
+        if ( (v = domain_vcpu(d, domctl->u.gdbsx_pauseunp_vcpu.vcpu)) == NULL )
+            break;
+        ret = vcpu_pause_by_systemcontroller(v);
+        break;
+
+    case XEN_DOMCTL_gdbsx_unpausevcpu:
+        ret = -EBUSY;
+        if ( !d->controller_pause_count )
+            break;
+        ret = -EINVAL;
+        if ( (v = domain_vcpu(d, domctl->u.gdbsx_pauseunp_vcpu.vcpu)) == NULL )
+            break;
+        ret = vcpu_unpause_by_systemcontroller(v);
+        if ( ret == -EINVAL )
+            printk(XENLOG_G_WARNING
+                   "WARN: %pd attempting to unpause %pv which is not paused\n",
+                   current->domain, v);
+        break;
+
+    case XEN_DOMCTL_gdbsx_domstatus:
+        domctl->u.gdbsx_domstatus.vcpu_id = -1;
+        domctl->u.gdbsx_domstatus.paused = d->controller_pause_count > 0;
+        if ( domctl->u.gdbsx_domstatus.paused )
+        {
+            for_each_vcpu ( d, v )
+            {
+                if ( v->arch.gdbsx_vcpu_event )
+                {
+                    domctl->u.gdbsx_domstatus.vcpu_id = v->vcpu_id;
+                    domctl->u.gdbsx_domstatus.vcpu_ev =
+                        v->arch.gdbsx_vcpu_event;
+                    v->arch.gdbsx_vcpu_event = 0;
+                    break;
+                }
+            }
+        }
+        *copyback = true;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        ret = -ENOSYS;
+    }
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/gdbsx.h b/xen/arch/x86/include/asm/gdbsx.h
index 938eb74e2e25..8d357e5c9102 100644
--- a/xen/arch/x86/include/asm/gdbsx.h
+++ b/xen/arch/x86/include/asm/gdbsx.h
@@ -2,18 +2,27 @@
 #ifndef __X86_GDBX_H__
 #define __X86_GDBX_H__
 
-#ifdef CONFIG_GDBSX
+#include <xen/stdbool.h>
 
 struct domain;
-struct xen_domctl_gdbsx_memio;
+struct xen_domctl;
 
-int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop);
+#ifdef CONFIG_GDBSX
 
 void domain_pause_for_debugger(void);
 
+long gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback);
+
 #else
 
+#include <xen/errno.h>
+
 static inline void domain_pause_for_debugger(void) {}
 
+long gdbsx_domctl(struct domain *d, struct xen_domctl *domctl, bool *copyback)
+{
+    return -ENOSYS;
+}
+
 #endif /* CONFIG_GDBSX */
 #endif /* __X86_GDBX_H__ */
-- 
2.11.0


