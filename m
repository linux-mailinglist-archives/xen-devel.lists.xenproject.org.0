Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F736C6A4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 15:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118469.224612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNLx-0004ZZ-RC; Tue, 27 Apr 2021 13:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118469.224612; Tue, 27 Apr 2021 13:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNLx-0004ZA-Nk; Tue, 27 Apr 2021 13:02:13 +0000
Received: by outflank-mailman (input) for mailman id 118469;
 Tue, 27 Apr 2021 13:02:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbNLv-0004Z1-KQ
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 13:02:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b643ff9-b132-4f97-a415-5e1c4ebc5da4;
 Tue, 27 Apr 2021 13:02:10 +0000 (UTC)
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
X-Inumbo-ID: 8b643ff9-b132-4f97-a415-5e1c4ebc5da4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619528530;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j8rfiKwxLVCA9XN4GQqGSeIv+LVmoP8r/ogHPPMRtI8=;
  b=IRtxpZJq9jdeCu7s+vS0WUvTx3DwhU7ksj3/qcqtNPqjL1QIgfxU2FPN
   2/OME+ig/VJNrue2PM5DkYI1T0crgbKTDSm8PXSYcpZfMYiExuB84/voi
   +6u+XocT6tg+PzfXzMkqtlL6fECirsAdI4IM8B3pYZ/mEEmTGP9UgRf5y
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vQNol3zRlXtIlon/saqdVtXVuPC8eNJCKcs31b8GGwid6S3NkMt2IsbvRMWQuPVieefszOxWNg
 T2mgFcRpCH1QrxrNvWzaEPTmp22O1zh5OoglZML59nfsYrKOyA5gwzAwFitLOdKZnmdGfvdnPD
 i8SIkjY3HTzi36vMAsMqF2z3XdGYwKftj6aHdpw4Wrj5GLxOBOZxmrCVcUhHOf6MwSfX2uw6kZ
 5xG04JRlkTg3gNgn4Ty30QYayVwcBAm4VpuAUSoCP+zdiN+0XK/lk2cQUMlTB6cfbkdyhjinGR
 4/I=
X-SBRS: 5.1
X-MesageID: 44004430
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OL9FAanPvjOovgAbj7+xDaCLlg3pDfOFimdD5ilNYBxZY6Wkvu
 illvgDyFvQgDEeRHkvlbm7Sc+9aFvB6J945pQQN7++XA/g/FClNp1m8JGK+UyfJwTV8OlB2a
 B8N413D9PtBVZ35PyKkzWQOdAm3dWB7eSUlf7Tpk0dPz1CRql8425Ce2SmO2JsQg0uP/UEPb
 qaovFKvj+xPUkQB/7LYUUte8jmi5n1mIn9YRgAbiRXlzWmqT+z8rb1H1y5834lIlZy6Iwv+2
 TEjAD1j5/L25rXpiP07GPd449bn9Hs0LJ4daixo/IIITbhgBvAXuVccoCCpzw8raWO71sngb
 D30nQdFvlz8H/YcyWJpwLs0WDbsAoG1nmK8zGlqEqmhea8eDU7E9ZM7LgyTjLpr24b+PB1yu
 Ziwn+QvZs/N2K4oA3No/zzEyxMumXxi3w4iuIXh2FYSuIlGcdshL1a2ENQHJ0JBj+/zpsmHu
 loBNzb/59tACOnRkGcmmlqzNalRGl2JA6PRgw5sMqP31Ft7QFE5lpdyN0Um38B8J4nD51Io+
 /FPbhynrlSTskQKaJ7HvoIRsG6Y1a9PC7kISafMF7jHKECN2mIr5Oy6rMz6+GlEaZ4tqcaid
 DMQVlcvW43d1mrDcDLxpFC6RrNBGewTV3Wu71jzok8vKb9SrrtOTCCT15rk9LImYRlPvHm
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="44004430"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Drop HYPERVISOR_COMPAT_VIRT_START()
Date: Tue, 27 Apr 2021 14:02:01 +0100
Message-ID: <20210427130201.2142-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is pure obfuscation (in particular, hiding the two locations where the
variable gets set), and is longer than the code it replaces.

Also fix MACH2PHYS_COMPAT_VIRT_START to be expressed as a 1-parameter macro,
which is how it is used.  The current construct only works because
HYPERVISOR_COMPAT_VIRT_START was also a 1-parameter macro.

No functional change, but does create easier-to-follow logic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/domain.c                | 2 +-
 xen/arch/x86/pv/descriptor-tables.c  | 2 +-
 xen/arch/x86/pv/dom0_build.c         | 4 ++--
 xen/arch/x86/x86_64/mm.c             | 4 ++--
 xen/common/compat/kernel.c           | 2 +-
 xen/include/asm-x86/config.h         | 9 ++-------
 xen/include/asm-x86/x86_64/uaccess.h | 2 +-
 7 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4dc27f798e..5d8b864718 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -791,7 +791,7 @@ int arch_domain_create(struct domain *d,
     d->arch.emulation_flags = emflags;
 
 #ifdef CONFIG_PV32
-    HYPERVISOR_COMPAT_VIRT_START(d) =
+    d->arch.hv_compat_vstart =
         is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
 #endif
 
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 5e84704400..0d22759820 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -235,7 +235,7 @@ static bool check_descriptor(const struct domain *dom, seg_desc_t *d)
             if ( b & _SEGMENT_G )
                 limit <<= 12;
 
-            if ( (base == 0) && (limit > HYPERVISOR_COMPAT_VIRT_START(dom)) )
+            if ( (base == 0) && (limit > dom->arch.hv_compat_vstart) )
             {
                 a |= 0x0000ffff;
                 b |= 0x000f0000;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e0801a9e6d..5e70422678 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -432,7 +432,7 @@ int __init dom0_construct_pv(struct domain *d,
                 printk("Dom0 expects too high a hypervisor start address\n");
                 return -ERANGE;
             }
-            HYPERVISOR_COMPAT_VIRT_START(d) =
+            d->arch.hv_compat_vstart =
                 max_t(unsigned int, m2p_compat_vstart, value);
         }
 
@@ -603,7 +603,7 @@ int __init dom0_construct_pv(struct domain *d,
 
     /* Overlap with Xen protected area? */
     if ( compat
-         ? v_end > HYPERVISOR_COMPAT_VIRT_START(d)
+         ? v_end > d->arch.hv_compat_vstart
          : (v_start < HYPERVISOR_VIRT_END) && (v_end > HYPERVISOR_VIRT_START) )
     {
         printk("DOM0 image overlaps with Xen private area.\n");
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index c41ce847b3..a51c2b52d9 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1029,7 +1029,7 @@ int pagefault_by_memadd(unsigned long addr, struct cpu_user_regs *regs)
     struct domain *d = current->domain;
 
     return mem_hotplug && guest_mode(regs) && is_pv_32bit_domain(d) &&
-           (addr >= HYPERVISOR_COMPAT_VIRT_START(d)) &&
+           (addr >= d->arch.hv_compat_vstart) &&
            (addr < MACH2PHYS_COMPAT_VIRT_END);
 }
 
@@ -1048,7 +1048,7 @@ int handle_memadd_fault(unsigned long addr, struct cpu_user_regs *regs)
     if (!is_pv_32bit_domain(d))
         return 0;
 
-    if ( (addr < HYPERVISOR_COMPAT_VIRT_START(d)) ||
+    if ( (addr < d->arch.hv_compat_vstart) ||
          (addr >= MACH2PHYS_COMPAT_VIRT_END) )
         return 0;
 
diff --git a/xen/common/compat/kernel.c b/xen/common/compat/kernel.c
index 804b919bdc..57845a6c07 100644
--- a/xen/common/compat/kernel.c
+++ b/xen/common/compat/kernel.c
@@ -27,7 +27,7 @@ CHECK_TYPE(capabilities_info);
 #define xen_platform_parameters compat_platform_parameters
 #define xen_platform_parameters_t compat_platform_parameters_t
 #undef HYPERVISOR_VIRT_START
-#define HYPERVISOR_VIRT_START HYPERVISOR_COMPAT_VIRT_START(current->domain)
+#define HYPERVISOR_VIRT_START current->domain->arch.hv_compat_vstart
 
 #define xen_changeset_info compat_changeset_info
 #define xen_changeset_info_t compat_changeset_info_t
diff --git a/xen/include/asm-x86/config.h b/xen/include/asm-x86/config.h
index 883c2ef0df..130db90b5c 100644
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -254,21 +254,16 @@ extern unsigned char boot_edid_info[128];
 
 /* This is not a fixed value, just a lower limit. */
 #define __HYPERVISOR_COMPAT_VIRT_START 0xF5800000
-#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
-
-#else /* !CONFIG_PV32 */
-
-#define HYPERVISOR_COMPAT_VIRT_START(d) ((void)(d), 0)
 
 #endif /* CONFIG_PV32 */
 
-#define MACH2PHYS_COMPAT_VIRT_START    HYPERVISOR_COMPAT_VIRT_START
+#define MACH2PHYS_COMPAT_VIRT_START(d) (d)->arch.hv_compat_vstart
 #define MACH2PHYS_COMPAT_VIRT_END      0xFFE00000
 #define MACH2PHYS_COMPAT_NR_ENTRIES(d) \
     ((MACH2PHYS_COMPAT_VIRT_END-MACH2PHYS_COMPAT_VIRT_START(d))>>2)
 
 #define COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(d) \
-    l2_table_offset(HYPERVISOR_COMPAT_VIRT_START(d))
+    l2_table_offset((d)->arch.hv_compat_vstart)
 #define COMPAT_L2_PAGETABLE_LAST_XEN_SLOT  l2_table_offset(~0U)
 #define COMPAT_L2_PAGETABLE_XEN_SLOTS(d) \
     (COMPAT_L2_PAGETABLE_LAST_XEN_SLOT - COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(d) + 1)
diff --git a/xen/include/asm-x86/x86_64/uaccess.h b/xen/include/asm-x86/x86_64/uaccess.h
index ba79f950fb..8c7df060d5 100644
--- a/xen/include/asm-x86/x86_64/uaccess.h
+++ b/xen/include/asm-x86/x86_64/uaccess.h
@@ -55,7 +55,7 @@ extern void *xlat_malloc(unsigned long *xlat_page_current, size_t size);
      access_ok(addr, (count) * (size)))
 
 #define __compat_addr_ok(d, addr) \
-    ((unsigned long)(addr) < HYPERVISOR_COMPAT_VIRT_START(d))
+    ((unsigned long)(addr) < (d)->arch.hv_compat_vstart)
 
 #define __compat_access_ok(d, addr, size) \
     __compat_addr_ok(d, (unsigned long)(addr) + ((size) ? (size) - 1 : 0))
-- 
2.11.0


