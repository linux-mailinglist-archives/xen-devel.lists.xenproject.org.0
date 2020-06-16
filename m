Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD461FB5DB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:17:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDKb-0008OO-SG; Tue, 16 Jun 2020 15:16:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlDKZ-0008OJ-P4
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:16:55 +0000
X-Inumbo-ID: 68f9762f-afe4-11ea-b8f8-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68f9762f-afe4-11ea-b8f8-12813bfff9fa;
 Tue, 16 Jun 2020 15:16:54 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id BDEB0A1EDC;
 Tue, 16 Jun 2020 17:16:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id ADA4AA1E57;
 Tue, 16 Jun 2020 17:16:52 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id d4Oc7ZxbE7vG; Tue, 16 Jun 2020 17:16:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 41D26A1EDC;
 Tue, 16 Jun 2020 17:16:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7gQ3RLl0PgFk; Tue, 16 Jun 2020 17:16:52 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 11628A1E57;
 Tue, 16 Jun 2020 17:16:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E7DC9214C8;
 Tue, 16 Jun 2020 17:16:21 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PXgAh7m7lCU2; Tue, 16 Jun 2020 17:16:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7E9B82174D;
 Tue, 16 Jun 2020 17:16:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wt5N3s1wAxGg; Tue, 16 Jun 2020 17:16:16 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 5861D215F4;
 Tue, 16 Jun 2020 17:16:16 +0200 (CEST)
Date: Tue, 16 Jun 2020 17:16:16 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
Subject: [PATCH v1 0/7] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hg==
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Intel Processor Trace is an architectural extension available in modern Intel family CPUs. It allows recording the detailed trace of activity while the processor executes the code. One might use the recorded trace to reconstruct the code flow. It means, to find out the executed code paths, determine branches taken, and so forth.

The abovementioned feature is described in Intel(R) 64 and IA-32 Architectures Software Developer's Manual Volume 3C: System Programming Guide, Part 3, Chapter 36: "Intel Processor Trace."

This patch series implements an interface that Dom0 could use in order to enable IPT for particular vCPUs in DomU, allowing for external monitoring. Such a feature has numerous applications like malware monitoring, fuzzing, or performance testing.

Michal Leszczynski (7):
  x86/vmx: add Intel PT MSR definitions
  x86/vmx: add IPT cpu feature
  x86/vmx: add ipt_state as part of vCPU state
  x86/vmx: add do_vmtrace_op
  tools/libxc: add xc_ptbuf_* functions
  tools/proctrace: add proctrace tool
  x86/vmx: switch IPT MSRs on vmentry/vmexit

 tools/libxc/include/xenctrl.h               |  59 ++++
 tools/libxc/xc_tbuf.c                       | 108 +++++++
 tools/proctrace/COPYING                     | 339 ++++++++++++++++++++
 tools/proctrace/Makefile                    |  49 +++
 tools/proctrace/proctrace.c                 | 139 ++++++++
 xen/arch/x86/hvm/hvm.c                      | 170 ++++++++++
 xen/arch/x86/hvm/vmx/vmx.c                  |  52 +++
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/hvm/hvm.h               |   9 +
 xen/include/asm-x86/hvm/vmx/vmcs.h          |  11 +
 xen/include/asm-x86/msr-index.h             |  37 +++
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/hvm/hvm_op.h             |  27 ++
 13 files changed, 1002 insertions(+)
 create mode 100644 tools/proctrace/COPYING
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

--
2.20.1

