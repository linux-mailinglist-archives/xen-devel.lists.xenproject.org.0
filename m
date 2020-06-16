Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D11FB5E9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:20:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDO2-0000ld-C9; Tue, 16 Jun 2020 15:20:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlDO0-0000lW-Lq
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:20:28 +0000
X-Inumbo-ID: e7e79543-afe4-11ea-b8fa-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7e79543-afe4-11ea-b8fa-12813bfff9fa;
 Tue, 16 Jun 2020 15:20:27 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 61494A2F7F;
 Tue, 16 Jun 2020 17:20:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 5932FA2F1B;
 Tue, 16 Jun 2020 17:20:25 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ygcaQrcrZZFG; Tue, 16 Jun 2020 17:20:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id DF56DA2F83;
 Tue, 16 Jun 2020 17:20:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YzAseoL7iKyk; Tue, 16 Jun 2020 17:20:24 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B8BA2A2F7F;
 Tue, 16 Jun 2020 17:20:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id A898C214C8;
 Tue, 16 Jun 2020 17:19:54 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0s9kBhbUbJkK; Tue, 16 Jun 2020 17:19:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 4831B219C6;
 Tue, 16 Jun 2020 17:19:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LDyti-DuYn1R; Tue, 16 Jun 2020 17:19:49 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 2BCD721979;
 Tue, 16 Jun 2020 17:19:49 +0200 (CEST)
Date: Tue, 16 Jun 2020 17:19:49 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <2141998496.8765382.1592320789155.JavaMail.zimbra@cert.pl>
In-Reply-To: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
Subject: [PATCH v1 1/7] x86/vmx: add Intel PT MSR definitions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: x86/vmx: add Intel PT MSR definitions
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hpInjbCi
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Define constants related to Intel Processor Trace features.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 xen/include/asm-x86/msr-index.h | 37 +++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index b328a47ed8..ecf0dd8bab 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -621,4 +621,41 @@
 #define MSR_PKGC9_IRTL			0x00000634
 #define MSR_PKGC10_IRTL			0x00000635
 
+/* Intel PT MSRs */
+#define MSR_IA32_RTIT_CTL              0x00000570
+#define RTIT_CTL_TRACEEN               (1ULL << 0)
+#define RTIT_CTL_CYCEN                 (1ULL << 1)
+#define RTIT_CTL_OS                    (1ULL << 2)
+#define RTIT_CTL_USR                   (1ULL << 3)
+#define RTIT_CTL_PWR_EVT_EN            (1ULL << 4)
+#define RTIT_CTL_FUP_ON_PTW            (1ULL << 5)
+#define RTIT_CTL_FABRIC_EN             (1ULL << 6)
+#define RTIT_CTL_CR3_FILTER            (1ULL << 7)
+#define RTIT_CTL_TOPA                  (1ULL << 8)
+#define RTIT_CTL_MTC_EN                (1ULL << 9)
+#define RTIT_CTL_TSC_EN                (1ULL << 10)
+#define RTIT_CTL_DIS_RETC              (1ULL << 11)
+#define RTIT_CTL_PTW_EN                (1ULL << 12)
+#define RTIT_CTL_BRANCH_EN             (1ULL << 13)
+#define RTIT_CTL_MTC_FREQ_OFFSET       14
+#define RTIT_CTL_MTC_FREQ              (0x0fULL << RTIT_CTL_MTC_FREQ_OFFSET)
+#define RTIT_CTL_CYC_THRESH_OFFSET     19
+#define RTIT_CTL_CYC_THRESH            (0x0fULL << RTIT_CTL_CYC_THRESH_OFFSET)
+#define RTIT_CTL_PSB_FREQ_OFFSET       24
+#define RTIT_CTL_PSB_FREQ              (0x0fULL << RTIT_CTL_PSB_FREQ_OFFSET)
+#define RTIT_CTL_ADDR_OFFSET(n)        (32 + 4 * (n))
+#define RTIT_CTL_ADDR(n)               (0x0fULL << RTIT_CTL_ADDR_OFFSET(n))
+#define MSR_IA32_RTIT_STATUS           0x00000571
+#define RTIT_STATUS_FILTER_EN          (1ULL << 0)
+#define RTIT_STATUS_CONTEXT_EN         (1ULL << 1)
+#define RTIT_STATUS_TRIGGER_EN         (1ULL << 2)
+#define RTIT_STATUS_ERROR              (1ULL << 4)
+#define RTIT_STATUS_STOPPED            (1ULL << 5)
+#define RTIT_STATUS_BYTECNT            (0x1ffffULL << 32)
+#define MSR_IA32_RTIT_CR3_MATCH        0x00000572
+#define MSR_IA32_RTIT_OUTPUT_BASE      0x00000560
+#define MSR_IA32_RTIT_OUTPUT_MASK      0x00000561
+#define MSR_IA32_RTIT_ADDR_A(n)        (0x00000580 + (n) * 2)
+#define MSR_IA32_RTIT_ADDR_B(n)        (0x00000581 + (n) * 2)
+
 #endif /* __ASM_MSR_INDEX_H */
-- 
2.20.1


