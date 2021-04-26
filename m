Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DCE36B866
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 19:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117862.223809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5Rb-0005nh-Kc; Mon, 26 Apr 2021 17:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117862.223809; Mon, 26 Apr 2021 17:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5Rb-0005nA-H6; Mon, 26 Apr 2021 17:54:51 +0000
Received: by outflank-mailman (input) for mailman id 117862;
 Mon, 26 Apr 2021 17:54:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjXZ=JX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lb5RZ-0005en-7o
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 17:54:49 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c1a38a8-caa3-4c52-bbec-486e8f184571;
 Mon, 26 Apr 2021 17:54:44 +0000 (UTC)
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
X-Inumbo-ID: 2c1a38a8-caa3-4c52-bbec-486e8f184571
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619459683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TIlizZZ6/SV8wIV+HJj7CybmCt2XEZ70Xa/B8F5BtQ8=;
  b=c1Io0r+QDzNqq7Z1AHCVGEMx6Bn24e0gAmLJfnr3TPYfjyS1KlCaRhXg
   FiFPLSPF/Z7yenpTN86E5wNeFhid+asGFUW4snETIfAJQz6zjP9GpmeXN
   YqEmzmP/oBlW9QutP+YZXbclYpiOSox9x5Ewr2n5CwaIFrJqpp7AkVc4r
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aehgQZ+/NmRodpZ9D16q1mc5pNcQKyV/aE9VAYyl0d7leW+spjFIzsvC3kb/vyQkFm+w6lPH3E
 XR80BXh33vorbvjduxuVyHtUEJdef8z0ikvPL2tqSkq6+zK114MAd0jB6kaNZfWW75fy6hORYq
 4uD1Nsop3m3ij1oCysI2aQ9gvpfaSs70AFjRp8VqCYCUhPQwHTVstoc4OpJMG9b8hMzD5nV7iz
 fcVrVTIxENXWLnkGpjlIvs+pO9Vc7eWV6gil0yN/niRhg00MzjzdZ/tvupiYEl00iQy54S0stF
 hJc=
X-SBRS: 4.0
X-MesageID: 42553821
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:W7a0F6mWTV+u3jZQXfV+chzzwjPpDfKr3DAbvn1ZSRFFG/Gwve
 rGppUm/DXzjyscX2xlpMuJP7OOTWiZ2Zl+54QQOrnKZnifhEKDKoZ+4Yz+hwDxAiGWzJ8l6Y
 5Me7VzYeeAbmRSot395GCDfOoI4N7Cy6ywgPeb8nEFd3APV4hFzyNUTjmWCVd3Qg4uP+teKL
 O56tBcrzStPVQ7B/7LZEUtZOTIq93VmJ+OW3dvbHRLhDWmtj+m5KX3FBKVxH4lIlRy6Iwv7H
 TflEjB7rij2svLsSP07XPZ7JhdhbLaqudrOcrksKYoAwSprg6pYYh7Mofy2QwInA==
X-IronPort-AV: E=Sophos;i="5.82,252,1613451600"; 
   d="scan'208";a="42553821"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 3/3] x86/VT-x: Enumeration for CET
Date: Mon, 26 Apr 2021 18:54:21 +0100
Message-ID: <20210426175421.30497-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210426175421.30497-1-andrew.cooper3@citrix.com>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

VT-x has separate entry/exit control for loading guest/host state.  Saving
guest state on vmexit is performed unconditionally.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c        |  6 ++++++
 xen/include/asm-x86/hvm/vmx/vmcs.h | 11 ++++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index f9f9bc18cd..5849817630 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -2014,6 +2014,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
     printk("RFLAGS=0x%08lx (0x%08lx)  DR7 = 0x%016lx\n",
            vmr(GUEST_RFLAGS), regs->rflags,
            vmr(GUEST_DR7));
+    if ( vmentry_ctl & VM_ENTRY_LOAD_GUEST_CET )
+        printk("SSP = 0x%016lx S_CET = 0x%016lx ISST = 0x%016lx\n",
+               vmr(GUEST_SSP), vmr(GUEST_S_CET), vmr(GUEST_ISST));
     printk("Sysenter RSP=%016lx CS:RIP=%04x:%016lx\n",
            vmr(GUEST_SYSENTER_ESP),
            vmr32(GUEST_SYSENTER_CS), vmr(GUEST_SYSENTER_EIP));
@@ -2057,6 +2060,9 @@ void vmcs_dump_vcpu(struct vcpu *v)
            vmr(HOST_GDTR_BASE), vmr(HOST_IDTR_BASE));
     printk("CR0=%016lx CR3=%016lx CR4=%016lx\n",
            vmr(HOST_CR0), vmr(HOST_CR3), vmr(HOST_CR4));
+    if ( vmexit_ctl & VM_EXIT_LOAD_HOST_CET )
+        printk("SSP = 0x%016lx S_CET = 0x%016lx ISST = 0x%016lx\n",
+               vmr(HOST_SSP), vmr(HOST_S_CET), vmr(HOST_ISST));
     printk("Sysenter RSP=%016lx CS:RIP=%04x:%016lx\n",
            vmr(HOST_SYSENTER_ESP),
            vmr32(HOST_SYSENTER_CS), vmr(HOST_SYSENTER_EIP));
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index 8073af323b..4c4246f190 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -46,7 +46,8 @@ struct ept_data {
             uint64_t mt:3,   /* Memory Type. */
                      wl:3,   /* Walk length -1. */
                      ad:1,   /* Enable EPT A/D bits. */
-                     :5,     /* rsvd. */
+                     sss:1,  /* Supervisor Shadow Stack. */
+                     :4,     /* rsvd. */
                      mfn:52;
         };
         u64 eptp;
@@ -238,6 +239,7 @@ extern u32 vmx_pin_based_exec_control;
 #define VM_EXIT_LOAD_HOST_EFER          0x00200000
 #define VM_EXIT_SAVE_PREEMPT_TIMER      0x00400000
 #define VM_EXIT_CLEAR_BNDCFGS           0x00800000
+#define VM_EXIT_LOAD_HOST_CET           0x10000000
 extern u32 vmx_vmexit_control;
 
 #define VM_ENTRY_IA32E_MODE             0x00000200
@@ -247,6 +249,7 @@ extern u32 vmx_vmexit_control;
 #define VM_ENTRY_LOAD_GUEST_PAT         0x00004000
 #define VM_ENTRY_LOAD_GUEST_EFER        0x00008000
 #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
+#define VM_ENTRY_LOAD_GUEST_CET         0x00100000
 extern u32 vmx_vmentry_control;
 
 #define SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES 0x00000001
@@ -516,6 +519,9 @@ enum vmcs_field {
     GUEST_PENDING_DBG_EXCEPTIONS    = 0x00006822,
     GUEST_SYSENTER_ESP              = 0x00006824,
     GUEST_SYSENTER_EIP              = 0x00006826,
+    GUEST_S_CET                     = 0x00006828,
+    GUEST_SSP                       = 0x0000682a,
+    GUEST_ISST                      = 0x0000682c,
     HOST_CR0                        = 0x00006c00,
     HOST_CR3                        = 0x00006c02,
     HOST_CR4                        = 0x00006c04,
@@ -528,6 +534,9 @@ enum vmcs_field {
     HOST_SYSENTER_EIP               = 0x00006c12,
     HOST_RSP                        = 0x00006c14,
     HOST_RIP                        = 0x00006c16,
+    HOST_S_CET                      = 0x00006c18,
+    HOST_SSP                        = 0x00006c1a,
+    HOST_ISST                       = 0x00006c1c,
 };
 
 #define VMCS_VPID_WIDTH 16
-- 
2.11.0


