Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ACF23389F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 20:59:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Dlb-0007FQ-05; Thu, 30 Jul 2020 18:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B2eQ=BJ=yujala.com=srini@srs-us1.protection.inumbo.net>)
 id 1k1DlZ-0007Eu-Kl
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 18:58:57 +0000
X-Inumbo-ID: b77728bc-d296-11ea-8dbb-bc764e2007e4
Received: from gproxy6-pub.mail.unifiedlayer.com (unknown [67.222.39.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b77728bc-d296-11ea-8dbb-bc764e2007e4;
 Thu, 30 Jul 2020 18:58:55 +0000 (UTC)
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
 by gproxy6.mail.unifiedlayer.com (Postfix) with ESMTP id C22F91E062D
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2020 12:58:52 -0600 (MDT)
Received: from md-71.webhostbox.net ([204.11.58.143]) by cmsmtp with ESMTP
 id 1DlUktopYwNNl1DlUkOFaP; Thu, 30 Jul 2020 12:58:52 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=MLZOZvRl c=1 sm=1 tr=0
 a=yS0qNmEK8ed8yKyeR8R6rg==:117 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=kj9zAlcOel0A:10:nop_charset_1 a=_RQrkK6FrEwA:10:nop_rcvd_month_year
 a=o-A10e_uY_YA:10:endurance_base64_authed_username_1 a=0f1Y9JmXAAAA:8
 a=19Ub0thILXFMuuj48kkA:9 a=ABtCjNrQ3t8YFW9y:21 a=NGdGghtINY4PGyVl:21
 a=CjuIK1q_8ugA:10:nop_charset_2 a=It28mvvgxjsq2WIeNnUB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=yujala.com; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OdAD0NdJtuLxZ7JxO9+aNL3a9/g0/jt4LU+dcJmWkpk=; b=bn5wXuWqHTwfe3ogBluD+PPso6
 n4TyaNor3B4AZNieyKPa6NaYcohYFLRnHKSKGyLt3Cjl/VcfmoSjnaCnmPV6V89SGEuNmgpSNiyJ9
 5JE2UkltkoWouSc5kASPRlsKpMcsmYOAmnQMzfAEMupApKmqLSZI0tB4EvEsIKOpQJ/9Jc9Bms8bI
 KgxIGHF5sAxSx8QDbFPyiR9PzE49P/crizT8KS9SM1TzGap0TZjFT/s4fydSbMaXn/5F2adu7UaSk
 mWOXQe14QfN72kROVDaxg399QbLJEuOknd9pRWxupwHG4Okij+A6uQfPYJ4DM2g5MBCo0ChSfhrZ6
 3k8BOJbg==;
Received: from md-71.webhostbox.net ([204.11.58.143]:37874)
 by md-71.webhostbox.net with esmtpa (Exim 4.93)
 (envelope-from <srini@yujala.com>)
 id 1k1DlT-000Omr-Oj; Thu, 30 Jul 2020 18:58:51 +0000
MIME-Version: 1.0
Date: Thu, 30 Jul 2020 18:58:51 +0000
From: srini@yujala.com
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Porting Xen to Jetson Nano
In-Reply-To: <alpine.DEB.2.21.2007291756380.1767@sstabellini-ThinkPad-T480s>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <9736680b-1c81-652b-552b-4103341bad50@xen.org>
 <000001d661cb$45cdaa10$d168fe30$@yujala.com>
 <5f985a6a-1bd6-9e68-f35f-b0b665688cee@xen.org>
 <67c102642b0932d88ab2f70e96742ef0@yujala.com>
 <alpine.DEB.2.21.2007291756380.1767@sstabellini-ThinkPad-T480s>
Message-ID: <bd49b460d390cd547ea0ca77e5a20f2d@yujala.com>
X-Sender: srini@yujala.com
User-Agent: Roundcube Webmail/1.3.13
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-71.webhostbox.net
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - yujala.com
X-BWhitelist: no
X-Source-IP: 204.11.58.143
X-Source-L: Yes
X-Exim-ID: 1k1DlT-000Omr-Oj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: md-71.webhostbox.net [204.11.58.143]:37874
X-Source-Auth: srini@yujala.com
X-Email-Count: 3
X-Source-Cap: c3JpbmlxbGw7c3JpbmlxbGw7bWQtNzEud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 'Christopher Clark' <christopher.w.clark@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-07-30 01:27, Stefano Stabellini wrote:
> On Wed, 29 Jul 2020, srini@yujala.com wrote:
>> Hi Julien,
>> 
>> On 2020-07-24 17:25, Julien Grall wrote:
>> > On 24/07/2020 16:01, Srinivas Bangalore wrote:
>> >
>> > I struggled to find your comment inline as your e-mail client doesn't
>> > quote my answer. Please configure your e-mail client to use some form
>> > of quoting (the usual is '>').
>> >
>> >
>> I have switched to a web-based email client, so I hope this is better 
>> now.
> 
> Seems better, thank you
> 
> 
>> > > (XEN) Freed 296kB init memory.
>> > > (XEN) dom0 IPA 0x0000000088080000
>> > > (XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
>> > > (XEN) 0TH[0x0] = 0x004000017f0f377f
>> > > (XEN) 1ST[0x2] = 0x02c00000800006fd
>> > > (XEN) Mem access check
>> > > (XEN) dom0 IPA 0x0000000088080000
>> > > (XEN) P2M @ 0000000803fc3d40 mfn:0x17f0f5
>> > > (XEN) 0TH[0x0] = 0x004000017f0f377f
>> > > (XEN) 1ST[0x2] = 0x02c00000800006fd
>> > > (XEN) Mem access check
>> >
>> > The instruction abort issue looks normal as the mapping is marked as
>> > non-executable.
>> >
>> > Looking at the rest of bits, bits 55:58 indicates the type of mapping
>> > used. The value suggest the mapping has been considered to be used
>> > p2m_mmio_direct_c (RW cacheable MMIO). This looks wrong to me because
>> > RAM should be mapped using p2m_ram_rw.
>> >
>> > Looking at your DT, it looks like the region is marked as reserved. On
>> > Xen 4.8, reserved-memory region are not correctly handled (IIRC this
>> > was only fixed in Xen 4.13). This should be possible to confirm by
>> > enable CONFIG_DEVICE_TREE_DEBUG in your .config.
>> >
>> > The option will debug more information about the mapping to dom0 on
>> > your console.
>> >
>> > However, given you are using an old release, you are at risk at keep
>> > finding bugs that have been resolved in more recent releases. It would
>> > probably better if you switch to Xen 4.14 and report any bug you can
>> > find there.
>> >
>> Ok. I applied to patch series to 4.14. Enabled EARLY_PRINTK, 
>> CONFIG_DEBUG and
>> DEVICE_TREE_DEBUG.
>> Here's the log...
>> 
>> ## Flattened Device Tree blob at e3500000
>>    Booting using the fdt blob at 0xe3500000
>>    reserving fdt memory region: addr=80000000 size=20000
>>    reserving fdt memory region: addr=e3500000 size=35000
>>    Loading Device Tree to 00000000fc7f8000, end 00000000fc82ffff ... 
>> OK
>> 
>> Starting kernel ...
>> 
>> - UART enabled -
>> - Boot CPU booting -
>> - Current EL 00000008 -
>> - Initialize CPU -
>> - Turning on paging -
>> - Zero BSS -
>> - Ready -
>> (XEN) Invalid size for reg
>> (XEN) fdt: node `reserved-memory': parsing failed
>> (XEN)
>> (XEN) MODULE[0]: 00000000e0000000 - 00000000e014b0c8 Xen
>> (XEN) MODULE[1]: 00000000fc7f8000 - 00000000fc82d000 Device Tree
>> (XEN)  RESVD[0]: 0000000080000000 - 0000000080020000
>> (XEN)  RESVD[1]: 00000000e3500000 - 00000000e3535000
>> (XEN)  RESVD[2]: 00000000fc7f8000 - 00000000fc82d000
>> (XEN)  RESVD[3]: 0000000040001000 - 000000004003ffff
>> (XEN)  RESVD[4]: 00000000b0000000 - 00000000b01fffff
>> (XEN)
>> (XEN)
>> (XEN) Command line: console=dtuart sync_console dom0_mem=128M 
>> loglvl=debug
>> guest_loglvl=debug console_to_ring
>> (XEN) Xen BUG at page_alloc.c:398
>> (XEN) ----[ Xen-4.14.0  arm64  debug=y   Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) PC:     00000000002b7b90 alloc_boot_pages+0x38/0x9c
>> (XEN) LR:     00000000002cda04
>> (XEN) SP:     0000000000307d40
>> (XEN) CPSR:   a00003c9 MODE:64-bit EL2h (Hypervisor, handler)
>> (XEN)      X0: 000fc80000002000  X1: 0000000000002000  X2: 
>> 0000000000000000
>> (XEN)      X3: 000fffffffffffff  X4: ffffffffffffffff  X5: 
>> 0000000000000000
>> (XEN)      X6: 0000000000307df0  X7: 0000000000000003  X8: 
>> 0000000000000008
>> (XEN)      X9: fffffffffffffffb X10: 0101010101010101 X11: 
>> 0000000000000007
>> (XEN)     X12: 0000000000000004 X13: ffffffffffffffff X14: 
>> ffffffffff000000
>> (XEN)     X15: ffffffffffffffff X16: 0000000000000000 X17: 
>> 0000000000000000
>> (XEN)     X18: 00000000fc834dd0 X19: 00000000002b5000 X20: 
>> 00000000fc7f8000
>> (XEN)     X21: 00000000fc7f8000 X22: 0000000000000000 X23: 
>> fc80000000000038
>> (XEN)     X24: 00000000fed9de28 X25: ffffffffffffffff X26: 
>> fc80000002000000
>> (XEN)     X27: 0000000002000000 X28: 0000000000000000  FP: 
>> 0000000000307d40
>> (XEN)
>> (XEN)   VTCR_EL2: 80000000
>> (XEN)  VTTBR_EL2: 0000000000000000
>> (XEN)
>> (XEN)  SCTLR_EL2: 30cd183d
>> (XEN)    HCR_EL2: 0000000000000038
>> (XEN)  TTBR0_EL2: 00000000e0145000
>> (XEN)
>> (XEN)    ESR_EL2: f2000001
>> (XEN)  HPFAR_EL2: 0000000000000000
>> (XEN)    FAR_EL2: 0000000000000000
>> (XEN)
>> (XEN) Xen stack trace from sp=0000000000307d40:
>> (XEN)    0000000000307df0 00000000002cf114 0000000000000000 
>> 0000000000307d68
>> (XEN)    00000000fc7f8000 00000000002ceeb0 0000000000400000 
>> 00676e69725f6f74
>> (XEN)    ffffffffffffffff 0000000000000000 0000000000000000 
>> 0000000000307df0
>> (XEN)    0000000000307df0 00000000002cef58 000000003fffffff 
>> 00000000fc7f8000
>> (XEN)    00000000fc7f8000 000fc80000002000 0000000000400000 
>> 0080000000000000
>> (XEN)    0000000000000000 000000000003ffff 00000000fc831170 
>> 00000000002001b8
>> (XEN)    00000000e0000000 00000000dfe00000 00000000fc7f8000 
>> 0000000000000000
>> (XEN)    0000000000400000 00000000fed9de28 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000400 0000000000000000 
>> 0000000000035000
>> (XEN)    00000000fc7f8000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000300000000 0000000000000000 
>> 00000040ffffffff
>> (XEN)    00000000ffffffff 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 
>> 0000000000000000
>> (XEN) Xen call trace:
>> (XEN)    [<00000000002b7b90>] alloc_boot_pages+0x38/0x9c (PC)
>> (XEN)    [<00000000002cda04>] setup_frametable_mappings+0xb4/0x310 
>> (LR)
>> (XEN)    [<00000000002cf114>] start_xen+0x3a0/0xc48
>> (XEN)    [<00000000002001b8>] arm64/head.o#primary_switched+0x10/0x30
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Xen BUG at page_alloc.c:398
>> (XEN) ****************************************
>> (XEN)
>> (XEN) Reboot in five seconds...
>> 
>> There seems to be a problem with the DT in the 'reserved-memory' node. 
>>  I
>> commented out the fb0-carveout, fb1-carveout sections, recompiled and 
>> tried to
>> boot again.
> 
> Yes, those reserved-memory nodes won't work correctly with Xen
> unfortunately: they either use "size" instead of "reg" (vpr-carveout) 
> or
> they specify "no-map". Only regular "reg" reserved memory regions
> without "no-map" are properly parsed by Xen at the moment.
> 
> 

I'll try to modify the nodes that use 'size and replace with 'reg'.

> 
>> This time the log shows the device tree messages (see attached log
>> file), but Xen fails at this point...
>> 
>> (XEN) Allocating PPI 16 for event channel interrupt
>> (XEN) Create hypervisor node
>> (XEN) Create PSCI node
>> (XEN) Create cpus node
>> (XEN) Create cpu@0 (logical CPUID: 0) node
>> (XEN) Create cpu@1 (logical CPUID: 1) node
>> (XEN) Create cpu@2 (logical CPUID: 2) node
>> (XEN) Create cpu@3 (logical CPUID: 3) node
>> (XEN) Create memory node (reg size 4, nr cells 4)
>> (XEN)   Bank 0: 0xe8000000->0xf0000000
>> (XEN) Create memory node (reg size 4, nr cells 8)
>> (XEN)   Bank 0: 0x40001000->0x40040000
>> (XEN)   Bank 1: 0xb0000000->0xb0200000
>> (XEN) Loading zImage from 00000000e1000000 to
>> 00000000e8080000-00000000ea23c808
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Unable to copy the kernel in the hwdom memory
>> (XEN) ****************************************
>> (XEN)
>> 
>> Device tree and log file attached. Is there an issue with the DT? Any 
>> pointers
>> on where I should be looking next?
> 
> Is it possible that the kernel image was loaded on a memory area not
> recognized as ram?
> 
> So xen/arch/arm/guestcopy.c:translate_get_page fails the check
> p2m_is_ram?
> 
The failure happens before p2m_is_ram is called.
This line:
page = get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &p2mt, 
P2M_ALLOC);

returns a NULL pointer.

> That would happen for instance if a device or special node is also
> covering that address range.

Is there a way to check such conflicts?

Thanks,
Srini

