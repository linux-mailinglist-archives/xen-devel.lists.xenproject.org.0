Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D117C1FFEAC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:35:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm43r-0000Mk-QC; Thu, 18 Jun 2020 23:35:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jm43q-0000MA-7c
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:35:10 +0000
X-Inumbo-ID: 55622500-b1bc-11ea-8496-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55622500-b1bc-11ea-8496-bc764e2007e4;
 Thu, 18 Jun 2020 23:35:03 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id CDD80A303E;
 Fri, 19 Jun 2020 01:35:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id B0FD1A3037;
 Fri, 19 Jun 2020 01:35:01 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xXyKT2Mq5nE9; Fri, 19 Jun 2020 01:35:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id D732FA303E;
 Fri, 19 Jun 2020 01:35:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6f9GeTGTX6mH; Fri, 19 Jun 2020 01:35:00 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A2865A3037;
 Fri, 19 Jun 2020 01:35:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 8602621447;
 Fri, 19 Jun 2020 01:34:30 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nZULIfJ6rzLJ; Fri, 19 Jun 2020 01:34:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id F0F4021493;
 Fri, 19 Jun 2020 01:34:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PJnnIJxFyCih; Fri, 19 Jun 2020 01:34:24 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id BBF6521447;
 Fri, 19 Jun 2020 01:34:24 +0200 (CEST)
Date: Fri, 19 Jun 2020 01:34:24 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
Subject: [PATCH v2 0/7] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: hSzh8Vr462omVBiCuz/GiNtdRkOdyA==
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
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, "Kang,
 Luwei" <luwei.kang@intel.com>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Intel Processor Trace is an architectural extension available in modern Intel 
family CPUs. It allows recording the detailed trace of activity while the 
processor executes the code. One might use the recorded trace to reconstruct 
the code flow. It means, to find out the executed code paths, determine 
branches taken, and so forth.

The abovementioned feature is described in Intel(R) 64 and IA-32 Architectures 
Software Developer's Manual Volume 3C: System Programming Guide, Part 3, 
Chapter 36: "Intel Processor Trace."

This patch series implements an interface that Dom0 could use in order to 
enable IPT for particular vCPUs in DomU, allowing for external monitoring. Such 
a feature has numerous applications like malware monitoring, fuzzing, or 
performance testing.

Also thanks to Tamas K Lengyel for a few preliminary hints before
first version of this patch was submitted to xen-devel.

Changed since v1:
  * MSR_RTIT_CTL is managed using MSR load lists
  * other PT-related MSRs are modified only when vCPU goes out of context
  * trace buffer is now acquired as a resource
  * added vmtrace_pt_size parameter in xl.cfg, the size of trace buffer
    must be specified in the moment of domain creation
  * trace buffers are allocated on domain creation, destructed on
    domain destruction
  * HVMOP_vmtrace_ipt_enable/disable is limited to enabling/disabling PT
    these calls don't manage buffer memory anymore
  * lifted 32 MFN/GFN array limit when acquiring resources
  * minor code style changes according to review

Michal Leszczynski (7):
  xen/mm: lift 32 item limit from mfn/gfn arrays
  x86/vmx: add Intel PT MSR definitions
  x86/vmx: add IPT cpu feature
  x86/vmx: add do_vmtrace_op
  tools/libxc: add xc_vmtrace_* functions
  tools/libxl: add vmtrace_pt_size parameter
  tools/proctrace: add proctrace tool

 tools/golang/xenlight/helpers.gen.go        |   2 +
 tools/golang/xenlight/types.gen.go          |   1 +
 tools/libxc/Makefile                        |   1 +
 tools/libxc/include/xenctrl.h               |  39 +++
 tools/libxc/xc_vmtrace.c                    |  97 ++++++
 tools/libxl/libxl_types.idl                 |   2 +
 tools/libxl/libxl_x86.c                     |   5 +
 tools/proctrace/COPYING                     | 339 ++++++++++++++++++++
 tools/proctrace/Makefile                    |  50 +++
 tools/proctrace/proctrace.c                 | 153 +++++++++
 tools/xl/xl_parse.c                         |   4 +
 xen/arch/x86/hvm/hvm.c                      | 167 ++++++++++
 xen/arch/x86/hvm/vmx/vmcs.c                 |   4 +
 xen/arch/x86/hvm/vmx/vmx.c                  |  24 ++
 xen/arch/x86/mm.c                           |  37 +++
 xen/common/domain.c                         |   1 +
 xen/common/memory.c                         |  39 +--
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/hvm/hvm.h               |   9 +
 xen/include/asm-x86/hvm/vmx/vmcs.h          |  17 +
 xen/include/asm-x86/msr-index.h             |  37 +++
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/hvm/hvm_op.h             |  23 ++
 xen/include/public/hvm/params.h             |   5 +-
 xen/include/public/memory.h                 |   1 +
 xen/include/xen/sched.h                     |   3 +
 26 files changed, 1039 insertions(+), 23 deletions(-)
 create mode 100644 tools/libxc/xc_vmtrace.c
 create mode 100644 tools/proctrace/COPYING
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

-- 
2.20.1

