Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED68203EC2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 20:07:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnQqI-0002Jh-9I; Mon, 22 Jun 2020 18:06:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tVQB=AD=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jnQqH-0002Jc-GW
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 18:06:49 +0000
X-Inumbo-ID: 232b9a68-b4b3-11ea-beb6-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 232b9a68-b4b3-11ea-beb6-12813bfff9fa;
 Mon, 22 Jun 2020 18:06:47 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 85B54A2894;
 Mon, 22 Jun 2020 20:06:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 6FA8CA2881;
 Mon, 22 Jun 2020 20:06:45 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id KLl5yrCTlsJO; Mon, 22 Jun 2020 20:06:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id C3B55A2894;
 Mon, 22 Jun 2020 20:06:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oQ3AfMYdIzwJ; Mon, 22 Jun 2020 20:06:44 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 90A17A2881;
 Mon, 22 Jun 2020 20:06:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 73AE821890;
 Mon, 22 Jun 2020 20:06:14 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QL2k4gIO7Y9l; Mon, 22 Jun 2020 20:06:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id D030521C2B;
 Mon, 22 Jun 2020 20:06:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8N5wYx1KKGyw; Mon, 22 Jun 2020 20:06:08 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id AA27421890;
 Mon, 22 Jun 2020 20:06:08 +0200 (CEST)
Date: Mon, 22 Jun 2020 20:06:08 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
Subject: [PATCH v3 0/7] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: fAatEklvenYpYrSWj77J6AQD/dj+xA==
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
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
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

Changed since v2:
  * trace buffer is now allocated on domain creation (in v2 it was
    allocated when hvm param was set)
  * restored 32-item limit in mfn/gfn arrays in acquire_resource
    and instead implemented hypercall continuations
  * code changes according to Jan's and Roger's review

Michal Leszczynski (7):
  memory: batch processing in acquire_resource()
  x86/vmx: add Intel PT MSR definitions
  x86/vmx: add IPT cpu feature
  x86/vmx: add do_vmtrace_op
  tools/libxc: add xc_vmtrace_* functions
  tools/libxl: add vmtrace_pt_size parameter
  tools/proctrace: add proctrace tool

 docs/man/xl.cfg.5.pod.in                    |  10 +
 tools/golang/xenlight/helpers.gen.go        |   2 +
 tools/golang/xenlight/types.gen.go          |   1 +
 tools/libxc/Makefile                        |   1 +
 tools/libxc/include/xenctrl.h               |  39 +++
 tools/libxc/xc_vmtrace.c                    |  94 ++++++
 tools/libxl/libxl_create.c                  |   1 +
 tools/libxl/libxl_types.idl                 |   2 +
 tools/proctrace/COPYING                     | 339 ++++++++++++++++++++
 tools/proctrace/Makefile                    |  50 +++
 tools/proctrace/proctrace.c                 | 158 +++++++++
 tools/xl/xl_parse.c                         |   4 +
 xen/arch/x86/hvm/hvm.c                      | 168 ++++++++++
 xen/arch/x86/hvm/vmx/vmcs.c                 |   7 +-
 xen/arch/x86/hvm/vmx/vmx.c                  |  31 ++
 xen/arch/x86/mm.c                           |  28 ++
 xen/common/domain.c                         |   3 +
 xen/common/memory.c                         |  32 +-
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/hvm/hvm.h               |   9 +
 xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
 xen/include/asm-x86/hvm/vmx/vmx.h           |  14 +
 xen/include/asm-x86/msr-index.h             |  37 +++
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/domctl.h                 |   1 +
 xen/include/public/hvm/hvm_op.h             |  26 ++
 xen/include/public/hvm/params.h             |   2 +-
 xen/include/public/memory.h                 |   1 +
 xen/include/xen/sched.h                     |   4 +
 xen/include/xlat.lst                        |   1 +
 30 files changed, 1066 insertions(+), 5 deletions(-)
 create mode 100644 tools/libxc/xc_vmtrace.c
 create mode 100644 tools/proctrace/COPYING
 create mode 100644 tools/proctrace/Makefile
 create mode 100644 tools/proctrace/proctrace.c

-- 
2.20.1


