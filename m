Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074B1FFEC8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:40:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm48m-0001MM-N6; Thu, 18 Jun 2020 23:40:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jm48k-0001MG-VZ
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:40:15 +0000
X-Inumbo-ID: 0e4fef48-b1bd-11ea-bb0d-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e4fef48-b1bd-11ea-bb0d-12813bfff9fa;
 Thu, 18 Jun 2020 23:40:14 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 2B59FA30C7;
 Fri, 19 Jun 2020 01:40:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1E79FA3107;
 Fri, 19 Jun 2020 01:40:12 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ePoMG7alAwZC; Fri, 19 Jun 2020 01:40:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 9C30BA30D9;
 Fri, 19 Jun 2020 01:40:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wgORxRw3ojJL; Fri, 19 Jun 2020 01:40:11 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 7407FA30C7;
 Fri, 19 Jun 2020 01:40:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5D9502059A;
 Fri, 19 Jun 2020 01:39:41 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id NU5woIfCpQRp; Fri, 19 Jun 2020 01:39:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E60DD215FA;
 Fri, 19 Jun 2020 01:39:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5_UMZebq8ABB; Fri, 19 Jun 2020 01:39:35 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id BEFA72059A;
 Fri, 19 Jun 2020 01:39:35 +0200 (CEST)
Date: Fri, 19 Jun 2020 01:39:35 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <61296395.9820908.1592523575731.JavaMail.zimbra@cert.pl>
In-Reply-To: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
Subject: [PATCH v2 2/7] x86/vmx: add Intel PT MSR definitions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add Intel PT MSR definitions
Thread-Index: hSzh8Vr462omVBiCuz/GiNtdRkOdyPG5uWby
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
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Define constants related to Intel Processor Trace features.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/include/asm-x86/msr-index.h | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index b328a47ed8..812516f340 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -621,4 +621,41 @@
 #define MSR_PKGC9_IRTL			0x00000634
 #define MSR_PKGC10_IRTL			0x00000635
 
+/* Intel PT MSRs */
+#define MSR_RTIT_OUTPUT_BASE           0x00000560
+#define MSR_RTIT_OUTPUT_MASK           0x00000561
+#define MSR_RTIT_CTL                   0x00000570
+#define RTIT_CTL_TRACEEN               (_AC(1, ULL) << 0)
+#define RTIT_CTL_CYCEN                 (_AC(1, ULL) << 1)
+#define RTIT_CTL_OS                    (_AC(1, ULL) << 2)
+#define RTIT_CTL_USR                   (_AC(1, ULL) << 3)
+#define RTIT_CTL_PWR_EVT_EN            (_AC(1, ULL) << 4)
+#define RTIT_CTL_FUP_ON_PTW            (_AC(1, ULL) << 5)
+#define RTIT_CTL_FABRIC_EN             (_AC(1, ULL) << 6)
+#define RTIT_CTL_CR3_FILTER            (_AC(1, ULL) << 7)
+#define RTIT_CTL_TOPA                  (_AC(1, ULL) << 8)
+#define RTIT_CTL_MTC_EN                (_AC(1, ULL) << 9)
+#define RTIT_CTL_TSC_EN                (_AC(1, ULL) << 10)
+#define RTIT_CTL_DIS_RETC              (_AC(1, ULL) << 11)
+#define RTIT_CTL_PTW_EN                (_AC(1, ULL) << 12)
+#define RTIT_CTL_BRANCH_EN             (_AC(1, ULL) << 13)
+#define RTIT_CTL_MTC_FREQ_OFFSET       14
+#define RTIT_CTL_MTC_FREQ              (0x0fULL << RTIT_CTL_MTC_FREQ_OFFSET)
+#define RTIT_CTL_CYC_THRESH_OFFSET     19
+#define RTIT_CTL_CYC_THRESH            (0x0fULL << RTIT_CTL_CYC_THRESH_OFFSET)
+#define RTIT_CTL_PSB_FREQ_OFFSET       24
+#define RTIT_CTL_PSB_FREQ              (0x0fULL << RTIT_CTL_PSB_FREQ_OFFSET)
+#define RTIT_CTL_ADDR_OFFSET(n)        (32 + 4 * (n))
+#define RTIT_CTL_ADDR(n)               (0x0fULL << RTIT_CTL_ADDR_OFFSET(n))
+#define MSR_RTIT_STATUS                0x00000571
+#define RTIT_STATUS_FILTER_EN          (_AC(1, ULL) << 0)
+#define RTIT_STATUS_CONTEXT_EN         (_AC(1, ULL) << 1)
+#define RTIT_STATUS_TRIGGER_EN         (_AC(1, ULL) << 2)
+#define RTIT_STATUS_ERROR              (_AC(1, ULL) << 4)
+#define RTIT_STATUS_STOPPED            (_AC(1, ULL) << 5)
+#define RTIT_STATUS_BYTECNT            (0x1ffffULL << 32)
+#define MSR_RTIT_CR3_MATCH             0x00000572
+#define MSR_RTIT_ADDR_A(n)             (0x00000580 + (n) * 2)
+#define MSR_RTIT_ADDR_B(n)             (0x00000581 + (n) * 2)
+
 #endif /* __ASM_MSR_INDEX_H */
-- 
2.20.1


