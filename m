Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EE20F503
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 14:49:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqFhD-0001MI-UV; Tue, 30 Jun 2020 12:49:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDXy=AL=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1jqFhD-0001MD-50
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 12:49:07 +0000
X-Inumbo-ID: 15068bd2-bad0-11ea-bca7-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15068bd2-bad0-11ea-bca7-bc764e2007e4;
 Tue, 30 Jun 2020 12:49:06 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 368E3A2C39;
 Tue, 30 Jun 2020 14:49:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1E886A17B5;
 Tue, 30 Jun 2020 14:49:04 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pfbd0BAHAd95; Tue, 30 Jun 2020 14:49:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 708D3A2A96;
 Tue, 30 Jun 2020 14:49:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dUw5_E_x6lqn; Tue, 30 Jun 2020 14:49:03 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 36B30A17B5;
 Tue, 30 Jun 2020 14:49:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 221D92249E;
 Tue, 30 Jun 2020 14:48:33 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id stYIECpH3HxV; Tue, 30 Jun 2020 14:48:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 7E7712256A;
 Tue, 30 Jun 2020 14:48:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RncgdOjtiJ9c; Tue, 30 Jun 2020 14:48:27 +0200 (CEST)
Received: from [192.168.70.4] (unknown [195.187.238.48])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 1927C21EB1;
 Tue, 30 Jun 2020 14:48:26 +0200 (CEST)
Subject: Re: [PATCH v4 00/10] Implement support for external IPT monitoring
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
Message-ID: <a6b3851d-fa3c-1d81-e781-d8765249cc34@cert.pl>
Date: Tue, 30 Jun 2020 14:48:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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
 Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/30/20 2:33 PM, Micha=C5=82 Leszczy=C5=84ski wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
>=20
> Intel Processor Trace is an architectural extension available in modern=
 Intel=20
> family CPUs. It allows recording the detailed trace of activity while t=
he=20
> processor executes the code. One might use the recorded trace to recons=
truct=20
> the code flow. It means, to find out the executed code paths, determine=
=20
> branches taken, and so forth.
>=20
> The abovementioned feature is described in Intel(R) 64 and IA-32 Archit=
ectures=20
> Software Developer's Manual Volume 3C: System Programming Guide, Part 3=
,=20
> Chapter 36: "Intel Processor Trace."
>=20
> This patch series implements an interface that Dom0 could use in order =
to=20
> enable IPT for particular vCPUs in DomU, allowing for external monitori=
ng. Such=20
> a feature has numerous applications like malware monitoring, fuzzing, o=
r=20
> performance testing.
>=20
> Also thanks to Tamas K Lengyel for a few preliminary hints before
> first version of this patch was submitted to xen-devel.
>=20
> Changed since v1:
>   * MSR_RTIT_CTL is managed using MSR load lists
>   * other PT-related MSRs are modified only when vCPU goes out of conte=
xt
>   * trace buffer is now acquired as a resource
>   * added vmtrace_pt_size parameter in xl.cfg, the size of trace buffer
>     must be specified in the moment of domain creation
>   * trace buffers are allocated on domain creation, destructed on
>     domain destruction
>   * HVMOP_vmtrace_ipt_enable/disable is limited to enabling/disabling P=
T
>     these calls don't manage buffer memory anymore
>   * lifted 32 MFN/GFN array limit when acquiring resources
>   * minor code style changes according to review
>=20
> Changed since v2:
>   * trace buffer is now allocated on domain creation (in v2 it was
>     allocated when hvm param was set)
>   * restored 32-item limit in mfn/gfn arrays in acquire_resource
>     and instead implemented hypercall continuations
>   * code changes according to Jan's and Roger's review
>=20
> Changed since v3:
>   * vmtrace HVMOPs are not implemented as DOMCTLs
>   * patches splitted up according to Andrew's comments
>   * code changes according to v3 review on the mailing list
>=20
>=20
> Michal Leszczynski (10):
>   x86/vmx: add Intel PT MSR definitions
>   x86/vmx: add IPT cpu feature
>   tools/libxl: add vmtrace_pt_size parameter
>   x86/vmx: implement processor tracing for VMX
>   common/domain: allocate vmtrace_pt_buffer
>   memory: batch processing in acquire_resource()
>   x86/mm: add vmtrace_buf resource type
>   x86/domctl: add XEN_DOMCTL_vmtrace_op
>   tools/libxc: add xc_vmtrace_* functions
>   tools/proctrace: add proctrace tool
>=20
>  docs/man/xl.cfg.5.pod.in                    |  10 +
>  tools/golang/xenlight/helpers.gen.go        |   2 +
>  tools/golang/xenlight/types.gen.go          |   1 +
>  tools/libxc/Makefile                        |   1 +
>  tools/libxc/include/xenctrl.h               |  39 +++
>  tools/libxc/xc_vmtrace.c                    |  73 +++++
>  tools/libxl/libxl.h                         |   8 +
>  tools/libxl/libxl_create.c                  |   1 +
>  tools/libxl/libxl_types.idl                 |   2 +
>  tools/proctrace/COPYING                     | 339 ++++++++++++++++++++
>  tools/proctrace/Makefile                    |  48 +++
>  tools/proctrace/proctrace.c                 | 163 ++++++++++
>  tools/xl/xl_parse.c                         |  20 ++
>  xen/arch/x86/domain.c                       |  11 +
>  xen/arch/x86/domctl.c                       |  48 +++
>  xen/arch/x86/hvm/vmx/vmcs.c                 |   7 +-
>  xen/arch/x86/hvm/vmx/vmx.c                  |  89 +++++
>  xen/arch/x86/mm.c                           |  25 ++
>  xen/common/domain.c                         |  46 +++
>  xen/common/memory.c                         |  32 +-
>  xen/include/asm-x86/cpufeature.h            |   1 +
>  xen/include/asm-x86/domain.h                |   4 +
>  xen/include/asm-x86/hvm/hvm.h               |  38 +++
>  xen/include/asm-x86/hvm/vmx/vmcs.h          |   4 +
>  xen/include/asm-x86/hvm/vmx/vmx.h           |  14 +
>  xen/include/asm-x86/msr-index.h             |  37 +++
>  xen/include/public/arch-x86/cpufeatureset.h |   1 +
>  xen/include/public/domctl.h                 |  27 ++
>  xen/include/public/memory.h                 |   1 +
>  xen/include/xen/domain.h                    |   2 +
>  xen/include/xen/sched.h                     |   4 +
>  31 files changed, 1094 insertions(+), 4 deletions(-)
>  create mode 100644 tools/libxc/xc_vmtrace.c
>  create mode 100644 tools/proctrace/COPYING
>  create mode 100644 tools/proctrace/Makefile
>  create mode 100644 tools/proctrace/proctrace.c
>=20

FYI, this patchset is also available at:
https://github.com/icedevml/xen/tree/ipt-patch-v4

Hubert Jasudowicz

