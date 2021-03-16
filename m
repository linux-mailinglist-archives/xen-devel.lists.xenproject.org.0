Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFC33D903
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 17:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98385.186642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMCPq-0002xn-41; Tue, 16 Mar 2021 16:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98385.186642; Tue, 16 Mar 2021 16:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMCPp-0002xH-W6; Tue, 16 Mar 2021 16:19:29 +0000
Received: by outflank-mailman (input) for mailman id 98385;
 Tue, 16 Mar 2021 16:19:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kyr7=IO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMCPo-0002wi-LF
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 16:19:28 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39508681-bf94-4099-8062-d0420bfaea3e;
 Tue, 16 Mar 2021 16:19:27 +0000 (UTC)
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
X-Inumbo-ID: 39508681-bf94-4099-8062-d0420bfaea3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615911567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=guXIUW2Hj1C8CTUWbOZUc8Q4qeZcP62gPTH+3TYZdDc=;
  b=NlHSVPvkzxS3vOeqhWrxYpA7PzB86h9LBpY4vqlBjcVwQFD79cm5zr7Q
   rnUgog+X/ko18MHB4Zv3aPFmYztPVJCcN3qO2RqraWnBriYHCpcvUOr+m
   0GnX85GXNu40Ooo+wRZV1sUUuBwl+YDpjZpb5amcLBDHZNwFVAlj3NFgt
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5K15W2ANNPrmne+aw5lDyfY7SCi7xsJBU1A+bb8JSMJNB8HllYsedpmc5XB7uCIC27OBpOO3v1
 XtmWFHXO2QGvIvvCB/AcBFCGf46AVs2AAI7n33SZLKcwpyiWZbd/YirGqOr17EubzOpwLSnRV1
 Q94nvWd3T9U/hHBspaJTCK3vQ/rxTbPNexlHgHgc3bKP+6Edh56Z5YCgQJy8ywb+9+BVMbQoB+
 a3DumS+HaWyuVyN4vY3swxv0yNZadUl0TUgs/AkhXnbqcf8WLlf8Cn7TdXNv4yuv2aAQOC0+7e
 Eqk=
X-SBRS: 5.1
X-MesageID: 40833138
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:AbhGrqrtED33HaFeaWT+3t4aV5qseYIsi2QD101hICF9WObwra
 GTtd4c0gL5jytUZWopnsqONLLFbXTX85N05od5B8bbYCDNvmy0IIZ+qbbz2jGIIVyGysdx3b
 ptGpIOa+HYIkN9ia/BjzWQM9Fl+9Wf9bDtuOG29QYIcShPS4VNqzh0ERyaFEoefnghObMcGI
 CH7sRK4xqMEE5nDPiTPXUOU+jdq9CjrvuPCnRqayIP0wWAgSil77T3CXGjr3AjeghC3Ks49i
 z9mxH5j5/TyM2T8APW1GPY8v1t+OfJ990rPqKxo/lQDj3tjwqyDb4RPoG/gA==
X-IronPort-AV: E=Sophos;i="5.81,251,1610427600"; 
   d="scan'208";a="40833138"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH 3/3] x86/msr: Fix Solaris and turbostat following XSA-351
Date: Tue, 16 Mar 2021 16:18:44 +0000
Message-ID: <20210316161844.1658-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210316161844.1658-1-andrew.cooper3@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15 This wants backporting to all security trees, as it is a fix to a
regression introduced in XSA-351.

Also it means that users don't need msr_relaxed=1 to unbreak Solaris guests,
which is a strict useability improvement.
---
 xen/arch/x86/msr.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 5927b6811b..a83a1d7fba 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -188,7 +188,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_TSX_CTRL:
     case MSR_MCU_OPT_CTRL:
     case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
-    case MSR_RAPL_POWER_UNIT:
     case MSR_PKG_POWER_LIMIT  ... MSR_PKG_POWER_INFO:
     case MSR_DRAM_POWER_LIMIT ... MSR_DRAM_POWER_INFO:
     case MSR_PP0_POWER_LIMIT  ... MSR_PP0_POLICY:
@@ -284,6 +283,18 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
             goto gp_fault;
         break;
 
+    case MSR_RAPL_POWER_UNIT:
+        /*
+         * This MSR is non-architectural.  However, some versions of Solaris
+         * blindly reads it without a #GP guard, and some versions of
+         * turbostat crash after expecting a read of /proc/cpu/0/msr not to
+         * fail.  Read as zero on Intel hardware.
+         */
+        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
+            goto gp_fault;
+        *val = 0;
+        break;
+
         /*
          * These MSRs are not enumerated in CPUID.  They have been around
          * since the Pentium 4, and implemented by other vendors.
-- 
2.11.0


