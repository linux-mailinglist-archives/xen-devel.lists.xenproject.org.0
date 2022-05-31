Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A55396EB
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 21:22:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340033.564968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw7Rb-0004zC-Cf; Tue, 31 May 2022 19:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340033.564968; Tue, 31 May 2022 19:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw7Rb-0004wL-9i; Tue, 31 May 2022 19:22:19 +0000
Received: by outflank-mailman (input) for mailman id 340033;
 Tue, 31 May 2022 19:22:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tbfe=WH=citrix.com=prvs=143db7279=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nw7Ra-0004wF-3B
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 19:22:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fabd491b-e116-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 21:22:16 +0200 (CEST)
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
X-Inumbo-ID: fabd491b-e116-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654024936;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7h7PX7RlSkGJjR7XUpJqrkxgy5v0lPFG2diRMD1lqF0=;
  b=JcVt89BSy5Qd4T/BdgFizVrNjS0RslX6GYf4BvCFehcbyvBvWCT4W464
   vM/AvL2Lb5W0ugGvmGivpyU9fRoRIKwA9I/wpFHVeMGJKq3/XH7J2W7HP
   RY/6lj0eD4RgBRPbh4JWYdbalKtkjEkKiSW4HyCPldCRf5YVEdL1c2jfI
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71913602
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JDIWrq8mREloy7H8jYp5DrUD0H6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GNOUGuFPv/cZmCkctx3a4zi909VvpHUy4VgHQFlrSA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IPgW1jlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbKITQQIY5f2ofwieRRdSCRSHKMFo5aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 JNIMGExNE6ojxtnF2Y9MdEmrteR32jCawFgmEqvtaMJyj2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajk4HtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUU0AWO6/fu2T+BOUIJS2VERP0o95QfEGlCO
 kCyoz/5OdB+mOTLFCnDr+rJ82Pa1Ts9djFbO3JdJecRy5y6+dxo0EqSJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+aTNT8D2BQwQKHhcus1a7AJrV7g
 FAKmtKF8McFBoyXmSqGTY0lRe/0u67famWD3wE2RvHNEghBHFb6JOhtDMxWfh81Yq7ohxeyC
 KMshe+hzMAKZyb7BUOGS4mwF94r3cDdKDgRbdiNNoAmSsEoLGevpXgyDWbNjjuFuBV9zskC1
 WKzLJ/E4YAyUvw3klJbho41jNcW+8zJ7TiLHcGnn07+ieL2ibz8Ye5tDWZip9sRtMusyDg5O
 f4FXydW432ziNHDXxQ=
IronPort-HdrOrdr: A9a23:UuwRl6jouRlt8MWnrZvncNBkAXBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="scan'208";a="71913602"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Enumeration for new Intel BHI controls
Date: Tue, 31 May 2022 20:21:37 +0100
Message-ID: <20220531192137.12468-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/branch-history-injection.html

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

These are defined now, but support in hardware hasn't been released yet.
---
 xen/arch/x86/include/asm/msr-index.h        | 7 +++++++
 xen/include/public/arch-x86/cpufeatureset.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 31964b88af7a..6c250bfcadad 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -36,7 +36,12 @@
 #define  SPEC_CTRL_IBRS                     (_AC(1, ULL) <<  0)
 #define  SPEC_CTRL_STIBP                    (_AC(1, ULL) <<  1)
 #define  SPEC_CTRL_SSBD                     (_AC(1, ULL) <<  2)
+#define  SPEC_CTRL_IPRED_DIS_U              (_AC(1, ULL) <<  3)
+#define  SPEC_CTRL_IPRED_DIS_S              (_AC(1, ULL) <<  4)
+#define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
+#define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
 #define  SPEC_CTRL_PSFD                     (_AC(1, ULL) <<  7)
+#define  SPEC_CTRL_BHI_DIS_S                (_AC(1, ULL) << 10)
 
 #define MSR_PRED_CMD                        0x00000049
 #define  PRED_CMD_IBPB                      (_AC(1, ULL) <<  0)
@@ -66,6 +71,8 @@
 #define  ARCH_CAPS_IF_PSCHANGE_MC_NO        (_AC(1, ULL) <<  6)
 #define  ARCH_CAPS_TSX_CTRL                 (_AC(1, ULL) <<  7)
 #define  ARCH_CAPS_TAA_NO                   (_AC(1, ULL) <<  8)
+#define  ARCH_CAPS_RRSBA                    (_AC(1, ULL) << 19)
+#define  ARCH_CAPS_BHI_NO                   (_AC(1, ULL) << 20)
 
 #define MSR_FLUSH_CMD                       0x0000010b
 #define  FLUSH_CMD_L1D                      (_AC(1, ULL) <<  0)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 0c27f5bbaf37..101698941074 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -304,6 +304,9 @@ XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory
 
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
+XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
+XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*   MSR_SPEC_CTRL.RRSBA_DIS_* */
+XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
 XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
 
 #endif /* XEN_CPUFEATURE */
-- 
2.11.0


