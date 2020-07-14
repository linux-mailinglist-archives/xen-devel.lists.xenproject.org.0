Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3170A21F22C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 15:13:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvKje-0005MX-4M; Tue, 14 Jul 2020 13:12:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S7fe=AZ=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jvKjd-0005MS-Bv
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 13:12:37 +0000
X-Inumbo-ID: aec7fba8-c5d3-11ea-8496-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aec7fba8-c5d3-11ea-8496-bc764e2007e4;
 Tue, 14 Jul 2020 13:12:35 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 61C3BA2BA8;
 Tue, 14 Jul 2020 15:12:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 45090A1796;
 Tue, 14 Jul 2020 15:12:33 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JzGPGcf6Nwfj; Tue, 14 Jul 2020 15:12:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 83634A2BA8;
 Tue, 14 Jul 2020 15:12:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dotFs9edIDvX; Tue, 14 Jul 2020 15:12:32 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 4FEF7A1796;
 Tue, 14 Jul 2020 15:12:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 1E0CD205EA;
 Tue, 14 Jul 2020 15:12:02 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id LjkiNPvFauii; Tue, 14 Jul 2020 15:11:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 52E6020DB0;
 Tue, 14 Jul 2020 15:11:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tiy1MUQ1TTHP; Tue, 14 Jul 2020 15:11:56 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 218CE206F7;
 Tue, 14 Jul 2020 15:11:56 +0200 (CEST)
Date: Tue, 14 Jul 2020 15:11:55 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: xen-devel@lists.xenproject.org
Message-ID: <878376484.57739222.1594732315968.JavaMail.zimbra@cert.pl>
In-Reply-To: <cover.1594150543.git.michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 00/11] Implement support for external IPT monitoring
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: Implement support for external IPT monitoring
Thread-Index: JnwhUhLclswxe0oQ1Qji7hws02nUzA==
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
 Stefano Stabellini <sstabellini@kernel.org>, luwei kang <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 tamas lengyel <tamas.lengyel@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

----- 7 lip 2020 o 21:39, Micha=C5=82 Leszczy=C5=84ski michal.leszczynski@c=
ert.pl napisa=C5=82(a):

> Intel Processor Trace is an architectural extension available in modern I=
ntel
> family CPUs. It allows recording the detailed trace of activity while the
> processor executes the code. One might use the recorded trace to reconstr=
uct
> the code flow. It means, to find out the executed code paths, determine
> branches taken, and so forth.
>=20
> The abovementioned feature is described in Intel(R) 64 and IA-32 Architec=
tures
> Software Developer's Manual Volume 3C: System Programming Guide, Part 3,
> Chapter 36: "Intel Processor Trace."
>=20
> This patch series implements an interface that Dom0 could use in order to
> enable IPT for particular vCPUs in DomU, allowing for external monitoring=
. Such
> a feature has numerous applications like malware monitoring, fuzzing, or
> performance testing.
>=20
> Also thanks to Tamas K Lengyel for a few preliminary hints before
> first version of this patch was submitted to xen-devel.
>=20
> Changed since v1:
>  * MSR_RTIT_CTL is managed using MSR load lists
>  * other PT-related MSRs are modified only when vCPU goes out of context
>  * trace buffer is now acquired as a resource
>  * added vmtrace_pt_size parameter in xl.cfg, the size of trace buffer
>    must be specified in the moment of domain creation
>  * trace buffers are allocated on domain creation, destructed on
>    domain destruction
>  * HVMOP_vmtrace_ipt_enable/disable is limited to enabling/disabling PT
>    these calls don't manage buffer memory anymore
>  * lifted 32 MFN/GFN array limit when acquiring resources
>  * minor code style changes according to review
>=20
> Changed since v2:
>  * trace buffer is now allocated on domain creation (in v2 it was
>    allocated when hvm param was set)
>  * restored 32-item limit in mfn/gfn arrays in acquire_resource
>    and instead implemented hypercall continuations
>  * code changes according to Jan's and Roger's review
>=20
> Changed since v3:
>  * vmtrace HVMOPs are not implemented as DOMCTLs
>  * patches splitted up according to Andrew's comments
>  * code changes according to v3 review on the mailing list
>=20
> Changed since v4:
>  * rebased to commit be63d9d4
>  * fixed dependencies between patches
>    (earlier patches don't reference further patches)
>  * introduced preemption check in acquire_resource
>  * moved buffer allocation to common code
>  * splitted some patches according to code review
>  * minor fixes according to code review
>=20
> Changed since v5:
>  * trace buffer size is now dynamically determined by the proctrace
>    tool
>  * trace buffer size variable is uniformly defined as uint32_t
>    processor_trace_buf_kb in hypervisor, toolstack and ABI
>  * buffer pages are not freed explicitly but reference count is
>    now used instead
>  * minor fixes according to code review
>=20
> This patch series is available on GitHub:
> https://github.com/icedevml/xen/tree/ipt-patch-v6
>=20
>=20
> Michal Leszczynski (11):
>  memory: batch processing in acquire_resource()
>  x86/vmx: add Intel PT MSR definitions
>  x86/vmx: add IPT cpu feature
>  common: add vmtrace_pt_size domain parameter
>  tools/libxl: add vmtrace_pt_size parameter
>  x86/hvm: processor trace interface in HVM
>  x86/vmx: implement IPT in VMX
>  x86/mm: add vmtrace_buf resource type
>  x86/domctl: add XEN_DOMCTL_vmtrace_op
>  tools/libxc: add xc_vmtrace_* functions
>  tools/proctrace: add proctrace tool
>=20
> docs/man/xl.cfg.5.pod.in                    |  13 ++
> tools/golang/xenlight/helpers.gen.go        |   2 +
> tools/golang/xenlight/types.gen.go          |   1 +
> tools/libxc/Makefile                        |   1 +
> tools/libxc/include/xenctrl.h               |  40 +++++
> tools/libxc/xc_vmtrace.c                    |  87 ++++++++++
> tools/libxl/libxl.h                         |   8 +
> tools/libxl/libxl_create.c                  |   1 +
> tools/libxl/libxl_types.idl                 |   4 +
> tools/proctrace/Makefile                    |  45 +++++
> tools/proctrace/proctrace.c                 | 179 ++++++++++++++++++++
> tools/xl/xl_parse.c                         |  22 +++
> xen/arch/x86/domain.c                       |  27 +++
> xen/arch/x86/domctl.c                       |  50 ++++++
> xen/arch/x86/hvm/vmx/vmcs.c                 |  15 +-
> xen/arch/x86/hvm/vmx/vmx.c                  | 110 ++++++++++++
> xen/common/domain.c                         |  46 +++++
> xen/common/memory.c                         |  80 ++++++++-
> xen/include/asm-x86/cpufeature.h            |   1 +
> xen/include/asm-x86/hvm/hvm.h               |  20 +++
> xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
> xen/include/asm-x86/hvm/vmx/vmx.h           |  14 ++
> xen/include/asm-x86/msr-index.h             |  24 +++
> xen/include/public/arch-x86/cpufeatureset.h |   1 +
> xen/include/public/domctl.h                 |  29 ++++
> xen/include/public/memory.h                 |   1 +
> xen/include/xen/domain.h                    |   2 +
> xen/include/xen/sched.h                     |   7 +
> 28 files changed, 828 insertions(+), 6 deletions(-)
> create mode 100644 tools/libxc/xc_vmtrace.c
> create mode 100644 tools/proctrace/Makefile
> create mode 100644 tools/proctrace/proctrace.c
>=20
> --
> 2.17.1


Kind reminder about this new patch version for external IPT monitoring.


Best regards,
Micha=C5=82 Leszczy=C5=84ski
CERT Polska

