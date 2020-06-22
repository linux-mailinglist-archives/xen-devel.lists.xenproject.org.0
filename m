Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3987F203ED6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 20:11:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnQuh-00039U-3p; Mon, 22 Jun 2020 18:11:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnQuf-00039K-Gy
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 18:11:21 +0000
X-Inumbo-ID: c5d378c6-b4b3-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5d378c6-b4b3-11ea-bca7-bc764e2007e4;
 Mon, 22 Jun 2020 18:11:20 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id AF2D3A28AD;
 Mon, 22 Jun 2020 20:11:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A2E8AA289F;
 Mon, 22 Jun 2020 20:11:18 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TEka0gx5_A-v; Mon, 22 Jun 2020 20:11:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3219CA28AD;
 Mon, 22 Jun 2020 20:11:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FROVCkMHABuq; Mon, 22 Jun 2020 20:11:18 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0C7C7A289F;
 Mon, 22 Jun 2020 20:11:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id EDE4921C91;
 Mon, 22 Jun 2020 20:10:47 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7KSDxykLdhlt; Mon, 22 Jun 2020 20:10:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 53AFA21760;
 Mon, 22 Jun 2020 20:10:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3YWADGKblyU0; Mon, 22 Jun 2020 20:10:42 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 345C9212DF;
 Mon, 22 Jun 2020 20:10:42 +0200 (CEST)
Date: Mon, 22 Jun 2020 20:10:42 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <639255187.11443691.1592849442180.JavaMail.zimbra@cert.pl>
In-Reply-To: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
Subject: [PATCH v3 2/7] x86/vmx: add Intel PT MSR definitions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add Intel PT MSR definitions
Thread-Index: fAatEklvenYpYrSWj77J6AQD/dj+xEaWCbCH
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Kang, Luwei" <luwei.kang@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Define constants related to Intel Processor Trace features.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/include/asm-x86/msr-index.h | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index b328a47ed8..0203029be9 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -69,6 +69,43 @@
 #define MSR_MCU_OPT_CTRL                    0x00000123
 #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
 
+/* Intel PT MSRs */
+#define MSR_RTIT_OUTPUT_BASE                0x00000560
+
+#define MSR_RTIT_OUTPUT_MASK                0x00000561
+
+#define MSR_RTIT_CTL                        0x00000570
+#define  RTIT_CTL_TRACEEN                    (_AC(1, ULL) <<  0)
+#define  RTIT_CTL_CYCEN                      (_AC(1, ULL) <<  1)
+#define  RTIT_CTL_OS                         (_AC(1, ULL) <<  2)
+#define  RTIT_CTL_USR                        (_AC(1, ULL) <<  3)
+#define  RTIT_CTL_PWR_EVT_EN                 (_AC(1, ULL) <<  4)
+#define  RTIT_CTL_FUP_ON_PTW                 (_AC(1, ULL) <<  5)
+#define  RTIT_CTL_FABRIC_EN                  (_AC(1, ULL) <<  6)
+#define  RTIT_CTL_CR3_FILTER                 (_AC(1, ULL) <<  7)
+#define  RTIT_CTL_TOPA                       (_AC(1, ULL) <<  8)
+#define  RTIT_CTL_MTC_EN                     (_AC(1, ULL) <<  9)
+#define  RTIT_CTL_TSC_EN                     (_AC(1, ULL) <<  10)
+#define  RTIT_CTL_DIS_RETC                   (_AC(1, ULL) <<  11)
+#define  RTIT_CTL_PTW_EN                     (_AC(1, ULL) <<  12)
+#define  RTIT_CTL_BRANCH_EN                  (_AC(1, ULL) <<  13)
+#define  RTIT_CTL_MTC_FREQ                   (_AC(0x0F, ULL) <<  14)
+#define  RTIT_CTL_CYC_THRESH                 (_AC(0x0F, ULL) <<  19)
+#define  RTIT_CTL_PSB_FREQ                   (_AC(0x0F, ULL) <<  24)
+#define  RTIT_CTL_ADDR(n)                    (_AC(0x0F, ULL) <<  (32 + (4 * (n))))
+
+#define MSR_RTIT_STATUS                     0x00000571
+#define  RTIT_STATUS_FILTER_EN               (_AC(1, ULL) <<  0)
+#define  RTIT_STATUS_CONTEXT_EN              (_AC(1, ULL) <<  1)
+#define  RTIT_STATUS_TRIGGER_EN              (_AC(1, ULL) <<  2)
+#define  RTIT_STATUS_ERROR                   (_AC(1, ULL) <<  4)
+#define  RTIT_STATUS_STOPPED                 (_AC(1, ULL) <<  5)
+#define  RTIT_STATUS_BYTECNT                 (_AC(0x1FFFF, ULL) <<  32)
+
+#define MSR_RTIT_CR3_MATCH                  0x00000572
+#define MSR_RTIT_ADDR_A(n)                  (0x00000580 + (n) * 2)
+#define MSR_RTIT_ADDR_B(n)                  (0x00000581 + (n) * 2)
+
 #define MSR_U_CET                           0x000006a0
 #define MSR_S_CET                           0x000006a2
 #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
-- 
2.20.1


