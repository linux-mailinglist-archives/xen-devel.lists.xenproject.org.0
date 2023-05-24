Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9588D70F538
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538975.839475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcq-0000Bg-3g; Wed, 24 May 2023 11:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538975.839475; Wed, 24 May 2023 11:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcp-0008UB-Tu; Wed, 24 May 2023 11:25:51 +0000
Received: by outflank-mailman (input) for mailman id 538975;
 Wed, 24 May 2023 11:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mcn-0006nQ-Ue
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba94cc4c-fa25-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:25:48 +0200 (CEST)
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
X-Inumbo-ID: ba94cc4c-fa25-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FFrjGy0N3rUhXRjNR9bsStAp23/y+xkzRX/aa0Az0Wg=;
  b=DLSU54IfRzMS8Ancg76nmyn6IvmSihDJLpJ5JAs7qiiKh5SgJcbYDJW2
   naLLtxFHAquerPqT/rhVglecqpQSLQjyD4YgbBTr82wiqO46a98lMkWsp
   /1XnaYyk00BQtJj0IaIg5Hw7b0WNbokWnoUJYmgna5nwznM76pHaAFPDr
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112680542
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:09FfLa8X5Ql3PVKIFV8kDrUDiH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WAYCmzXMvnbZDOjLdB1boq380wE6J/RydNlGVE5q3s8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmOKoX5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklyx
 /4yOGlcTCunxO3p4eyDWsh9puE8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxxzG9
 jqboz6R7hcyBOWH2zrdrliVoLHEpyTiAKYLDZf7z6s/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yySzC3UATzVBQMc7r8JwTjsvv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqWR0GZxtcsvvYhMI80TORdsZCAY6QkYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoIiN2dDB0zWirhRdMOS
 BG7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHXoHEwOx7MhD68yiDAdJ3T3
 r/CK66R4YsyU/w7nFJauc9GuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5MKL7Hae1Y3RwnMyZb5mNscRmCspIwN/s+gw
 513chUwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:zMW3caHMfC45vcAUpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:zOqA4mDk5zJoqX36ExVV9mQEQ5EHSVmewyjxfXeoKHdJbaLAHA==
X-Talos-MUID: 9a23:MxLm+gXM+pQtQl/q/A/VnCNibJtC2oLwA3oKiM0iotCudhUlbg==
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="112680542"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 04/10] x86/cpu-policy: MSR_ARCH_CAPS feature names
Date: Wed, 24 May 2023 12:25:20 +0100
Message-ID: <20230524112526.3475200-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Seed the default visibility from the dom0 special case, which for the most
part just exposes the *_NO bits.  EIBRS is the one non-*_NO bit, which is
"just" a status bit to the guest indicating a change in implemention of IBRS
which is already fully supported.

Insert a block dependency from the ARCH_CAPS CPUID bit to the entire content
of the MSR.  This is because MSRs have no structure information similar to
CPUID, and used by x86_cpu_policy_clear_out_of_range_leaves(), in order to
bulk-clear inaccessable words.

The overall CPUID bit is still max-only, so all of MSR_ARCH_CAPS is hidden in
the default policies.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

There is no libxl logic because libxl still uses the older xend format which
is specific to CPUID data.  That is going to need untangling at some other
point.

v2:
 * Don't expose SKIP_L1DFL to guests (it's only applicable for nested virt)
 * Fix SBDR_SSDP_NO and FBSDP_NO names.
 * Extend the commit message.
---
 tools/misc/xen-cpuid.c                      | 13 ++++++++++++
 xen/include/public/arch-x86/cpufeatureset.h | 23 +++++++++++++++++++++
 xen/tools/gen-cpuid.py                      |  3 +++
 3 files changed, 39 insertions(+)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 15ad2d33e2a1..8925a583edd5 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -228,6 +228,19 @@ static const char *const str_7d2[32] =
 
 static const char *const str_10Al[32] =
 {
+    [ 0] = "rdcl-no",             [ 1] = "eibrs",
+    [ 2] = "rsba",                [ 3] = "skip-l1dfl",
+    [ 4] = "intel-ssb-no",        [ 5] = "mds-no",
+    [ 6] = "if-pschange-mc-no",   [ 7] = "tsx-ctrl",
+    [ 8] = "taa-no",              [ 9] = "mcu-ctrl",
+    [10] = "misc-pkg-ctrl",       [11] = "energy-ctrl",
+    [12] = "doitm",               [13] = "sbdr-ssdp-no",
+    [14] = "fbsdp-no",            [15] = "psdp-no",
+    /* 16 */                      [17] = "fb-clear",
+    [18] = "fb-clear-ctrl",       [19] = "rrsba",
+    [20] = "bhi-no",              [21] = "xapic-status",
+    /* 22 */                      [23] = "ovrclk-status",
+    [24] = "pbrsb-no",
 };
 
 static const char *const str_10Ah[32] =
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 032cec3ccba2..033b1a72feea 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -308,6 +308,29 @@ XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
 XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
+XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
+XEN_CPUFEATURE(EIBRS,              16*32+ 1) /*A  Enhanced IBRS */
+XEN_CPUFEATURE(RSBA,               16*32+ 2) /*!A RSB Alternative (Retpoline not safe) */
+XEN_CPUFEATURE(SKIP_L1DFL,         16*32+ 3) /*   Don't need to flush L1D on VMEntry */
+XEN_CPUFEATURE(INTEL_SSB_NO,       16*32+ 4) /*A  No Speculative Store Bypass */
+XEN_CPUFEATURE(MDS_NO,             16*32+ 5) /*A  No Microarchitectural Data Sampling */
+XEN_CPUFEATURE(IF_PSCHANGE_MC_NO,  16*32+ 6) /*A  No Instruction fetch #MC */
+XEN_CPUFEATURE(TSX_CTRL,           16*32+ 7) /*   MSR_TSX_CTRL */
+XEN_CPUFEATURE(TAA_NO,             16*32+ 8) /*A  No TSX Async Abort */
+XEN_CPUFEATURE(MCU_CTRL,           16*32+ 9) /*   MSR_MCU_CTRL */
+XEN_CPUFEATURE(MISC_PKG_CTRL,      16*32+10) /*   MSR_MISC_PKG_CTRL */
+XEN_CPUFEATURE(ENERGY_FILTERING,   16*32+11) /*   MSR_MISC_PKG_CTRL.ENERGY_FILTERING */
+XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing Mode */
+XEN_CPUFEATURE(SBDR_SSDP_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */
+XEN_CPUFEATURE(FBSDP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */
+XEN_CPUFEATURE(PSDP_NO,            16*32+15) /*A  No Primary Stale Data Propagation */
+XEN_CPUFEATURE(FB_CLEAR,           16*32+17) /*A  Fill Buffers cleared by VERW */
+XEN_CPUFEATURE(FB_CLEAR_CTRL,      16*32+18) /*   MSR_OPT_CPU_CTRL.FB_CLEAR_DIS */
+XEN_CPUFEATURE(RRSBA,              16*32+19) /*!A Restricted RSB Alternative */
+XEN_CPUFEATURE(BHI_NO,             16*32+20) /*A  No Branch History Injection  */
+XEN_CPUFEATURE(XAPIC_STATUS,       16*32+21) /*   MSR_XAPIC_DISABLE_STATUS */
+XEN_CPUFEATURE(OVRCLK_STATUS,      16*32+23) /*   MSR_OVERCLOCKING_STATUS */
+XEN_CPUFEATURE(PBRSB_NO,           16*32+24) /*A  No Post-Barrier RSB predictions */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 86d00bb3c273..f28ff708a2fc 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -325,6 +325,9 @@ def crunch_numbers(state):
 
         # In principle the TSXLDTRK insns could also be considered independent.
         RTM: [TSXLDTRK],
+
+        # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
+        ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
     }
 
     deep_features = tuple(sorted(deps.keys()))
-- 
2.30.2


