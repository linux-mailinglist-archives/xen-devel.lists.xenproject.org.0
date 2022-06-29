Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F601560988
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 20:46:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358036.587003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ch8-00016X-Tt; Wed, 29 Jun 2022 18:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358036.587003; Wed, 29 Jun 2022 18:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6ch8-00013o-QQ; Wed, 29 Jun 2022 18:45:46 +0000
Received: by outflank-mailman (input) for mailman id 358036;
 Wed, 29 Jun 2022 18:45:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6b1=XE=citrix.com=prvs=172711fe8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o6ch6-0000mL-SD
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 18:45:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad1bcc4c-f7db-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 20:45:43 +0200 (CEST)
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
X-Inumbo-ID: ad1bcc4c-f7db-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656528343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hZZKKx5wLOQQOp1PoQBnMdpXG5SbkLDIEV13BnQaatU=;
  b=HrlqaoZDyhdg+N6BC1sIu9MvlyMQlxWnGtIOFLnHKaJ9PMJoFrWmT2UO
   HB+9Bv6z5MnxyksKgs6wso77UgX0eRr4imFqxgVrDLK/svAXVV1JJ2WOl
   Yefhj201e/C3Oj5dYH5VOrEP1GhnFVN0sA9KEdB/6GZKdHXv8fET6WkGt
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74746992
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3VTefatbpT3L9DzYjk7fsfh2UOfnVAleMUV32f8akzHdYApBsoF/q
 tZmKWDTbPaMNjT8Kd5wYd/gpE8B6MPXm4VmGwBr+3o0FC5A+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW13X6
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8TbqORu6MbUiB6Chp+ZqB5943jDkGG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWUzM0ieMkwVUrsRIKwSxuGvnnr9TzdB9HGv/6A7wlD50DUkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S36xCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l8PraviXeAGk9bCd6aIcri8AEYRMT7
 wrc9z/2PgCDoIF5WFrEqOrK8GrjZXRMRYMRTXRaFFVYurEPtKl210uSFYg7TcZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhKTysDA3Fd4acO6koqCp5
 RDoYfS24uEUFo2qnyeQWugLF7zBz6/bbWOA3Qc2QcJxqmjFF5ufkWZ4uWAWyKBBYq45lcLBO
 heP6Wu9GrcJVJdVUUOHS93oUJl7pUQRPd/kSurVfrJzX3SFTyfepHsGTRfJhwjFyRFw+Ylia
 MzzWZv9Uh4n5VFPkWPeqxE1iud7mEjTBAr7GPjG8vhQ+eHENCLEGetdbQDmgyJQxPrsnTg5O
 u13b6OioyizmsWnCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:S0kXN6GqN+pPxrBSpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74746992"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] x86/spec-ctrl: Only adjust MSR_SPEC_CTRL for idle with legacy IBRS
Date: Wed, 29 Jun 2022 19:45:07 +0100
Message-ID: <20220629184508.15956-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220629184508.15956-1-andrew.cooper3@citrix.com>
References: <20220629184508.15956-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Back at the time of the original Spectre-v2 fixes, it was recommended to clear
MSR_SPEC_CTRL when going idle.  This is because of the side effects on the
sibling thread caused by the microcode IBRS and STIBP implementations which
were retrofitted to existing CPUs.

However, there are no relevant cross-thread impacts for the hardware
IBRS/STIBP implementations, so this logic should not be used on Intel CPUs
supporting eIBRS, or any AMD CPUs; doing so only adds unnecessary latency to
the idle path.

Furthermore, there's no point playing with MSR_SPEC_CTRL in the idle paths if
SMT is disabled for other reasons.

Fixes: 8d03080d2a33 ("x86/spec-ctrl: Cease using thunk=lfence on AMD")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/include/asm/cpufeatures.h |  2 +-
 xen/arch/x86/include/asm/spec_ctrl.h   |  5 +++--
 xen/arch/x86/spec_ctrl.c               | 10 ++++++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index bd45a144ee78..493d338a085e 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -33,7 +33,7 @@ XEN_CPUFEATURE(SC_MSR_HVM,        X86_SYNTH(17)) /* MSR_SPEC_CTRL used by Xen fo
 XEN_CPUFEATURE(SC_RSB_PV,         X86_SYNTH(18)) /* RSB overwrite needed for PV */
 XEN_CPUFEATURE(SC_RSB_HVM,        X86_SYNTH(19)) /* RSB overwrite needed for HVM */
 XEN_CPUFEATURE(XEN_SELFSNOOP,     X86_SYNTH(20)) /* SELFSNOOP gets used by Xen itself */
-XEN_CPUFEATURE(SC_MSR_IDLE,       X86_SYNTH(21)) /* (SC_MSR_PV || SC_MSR_HVM) && default_xen_spec_ctrl */
+XEN_CPUFEATURE(SC_MSR_IDLE,       X86_SYNTH(21)) /* Clear MSR_SPEC_CTRL on idle */
 XEN_CPUFEATURE(XEN_LBR,           X86_SYNTH(22)) /* Xen uses MSR_DEBUGCTL.LBR */
 /* Bits 23,24 unused. */
 XEN_CPUFEATURE(SC_VERW_IDLE,      X86_SYNTH(25)) /* VERW used by Xen for idle */
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 751355f471f4..7e83e0179fb9 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -78,7 +78,8 @@ static always_inline void spec_ctrl_enter_idle(struct cpu_info *info)
     uint32_t val = 0;
 
     /*
-     * Branch Target Injection:
+     * It is recommended in some cases to clear MSR_SPEC_CTRL when going idle,
+     * to avoid impacting sibling threads.
      *
      * Latch the new shadow value, then enable shadowing, then update the MSR.
      * There are no SMP issues here; only local processor ordering concerns.
@@ -114,7 +115,7 @@ static always_inline void spec_ctrl_exit_idle(struct cpu_info *info)
     uint32_t val = info->xen_spec_ctrl;
 
     /*
-     * Branch Target Injection:
+     * Restore MSR_SPEC_CTRL on exit from idle.
      *
      * Disable shadowing before updating the MSR.  There are no SMP issues
      * here; only local processor ordering concerns.
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1f275ad1fb5d..57f4fcb21398 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1151,8 +1151,14 @@ void __init init_speculation_mitigations(void)
     /* (Re)init BSP state now that default_spec_ctrl_flags has been calculated. */
     init_shadow_spec_ctrl_state();
 
-    /* If Xen is using any MSR_SPEC_CTRL settings, adjust the idle path. */
-    if ( default_xen_spec_ctrl )
+    /*
+     * For microcoded IBRS only (i.e. Intel, pre eIBRS), it is recommended to
+     * clear MSR_SPEC_CTRL before going idle, to avoid impacting sibling
+     * threads.  Activate this if SMT is enabled, and Xen is using a non-zero
+     * MSR_SPEC_CTRL setting.
+     */
+    if ( boot_cpu_has(X86_FEATURE_IBRSB) && !(caps & ARCH_CAPS_IBRS_ALL) &&
+         hw_smt_enabled && default_xen_spec_ctrl )
         setup_force_cpu_cap(X86_FEATURE_SC_MSR_IDLE);
 
     xpti_init_default(caps);
-- 
2.11.0


