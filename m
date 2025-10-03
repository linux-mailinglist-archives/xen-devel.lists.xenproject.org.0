Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1575BB668B
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 11:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136493.1473049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4cV9-00057R-4s; Fri, 03 Oct 2025 09:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136493.1473049; Fri, 03 Oct 2025 09:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4cV9-00054l-2A; Fri, 03 Oct 2025 09:54:59 +0000
Received: by outflank-mailman (input) for mailman id 1136493;
 Fri, 03 Oct 2025 09:54:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swgf=4M=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4cV7-00054f-EV
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 09:54:57 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 035277fc-a03f-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 11:54:56 +0200 (CEST)
Received: from CH0PR03CA0388.namprd03.prod.outlook.com (2603:10b6:610:119::30)
 by LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 09:54:46 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::df) by CH0PR03CA0388.outlook.office365.com
 (2603:10b6:610:119::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Fri,
 3 Oct 2025 09:54:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Fri, 3 Oct 2025 09:54:46 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 3 Oct
 2025 02:54:45 -0700
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
X-Inumbo-ID: 035277fc-a03f-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilrk3mdS5/QfeyVM0k3lmYymW5T7MEeqAKb5KB5CYu4jpvf+Hkmfxmh9D7txyoZ0jvXTqg3No15JODLpxb1E/W+AUhhp1nMMFI4YQN0UBdfpTtd854w82OmTtgzxmtCaM47pDbRXKhA6Hegvtr7s5pyCyE/OhoC1nHWdc8ceTGOI/w1oOY4fz9nVo8JgRiRMkFWt3mt7SEhUXZF/P2XPhJ3azovDmaJ+gzxh8txHJxBYDHBmvnJfQiO0nM9wWX+30wF9U/ZvMNu2Mpnd6sHJQtUHBUmAxogkBpnItolJM5/PilXUP2id13isDjO/0bwvfzH7/0qgDridClILjWU3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MiHAv37j6dSmJqAxPxj2GpalqdSIs6FqMaSEOCxcs8=;
 b=D+WJYRooLuVYaqK3jIemDlgjkBxYZV/TYnRWa85h0Oz9oThkPAr/+pfI8g6xr1h44zkqyjGCC8S3J3JxG1vv+ydThU7vweQDx9Z25Xlv9zWcIwKu5qZXxxI+zGsm4Z9vD1g8v6nwJ4zVUD77SFyKLoj/IO+3OKUySE5Uk1VvXWvT+6hRxJWVgHeJ6KMOM7znTNJtCJpHWutIwxxj6F+KJVgGn980zxKMWXtlY6h3gW0rpSnxT+wFxMPvvuRrufG+VfrYt28HRgABUCoBAicLmV+Kj9/tybtC7kh1OsKw+EghDrbhDrh/6hxLj5w003pSVxOrSlJywwISLQaDKO5F/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4MiHAv37j6dSmJqAxPxj2GpalqdSIs6FqMaSEOCxcs8=;
 b=U/F8AFTvqHzAPUyXcUrr9NY7BYLdSFvkvQRMw2o3z0kf5zw85V8xEbUeRdlEfFPfJ6pDwJexoC4/PlYqhUPusHjbY9HuzY4bMw3w/b3Fl8+Bb0tBvdk5Qq8S01XWD5DmjDtkQUFuqkyq6va8Bt1onY97CKBVvml2QZZXGisKzvY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 3 Oct 2025 11:54:43 +0200
Message-ID: <DD8LH8QW6SUQ.UE1TRDDUTI8W@amd.com>
Subject: Re: [XTF PATCH v2 2/2] x86: Allow exiting QEMU in TCG/QEMU
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
X-Mailer: aerc 0.20.1
References: <20251002135542.28076-1-alejandro.garciavallejo@amd.com>
 <20251002135542.28076-3-alejandro.garciavallejo@amd.com>
 <aN6KrO6LPPJFK17M@Mac.lan> <DD7X3QFGUK6Y.DTARYWAB2DF@amd.com>
 <aN6cQBwiM36q_75E@Mac.lan> <DD80XF7EVPJ9.1WTMKC34DSW65@amd.com>
 <aN-EGpxVJ7roK2gM@Mac.lan>
In-Reply-To: <aN-EGpxVJ7roK2gM@Mac.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|LV8PR12MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c31dde5-389d-41ac-346d-08de0262e26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUxscGIwbXRNMG5VdjBNODVEcm9WQzV0aTJ1OXRObXhTdDFSeVVqNmNGWHgz?=
 =?utf-8?B?TlVkWWpKYURMellaRW9mZUpsZlM2VWhDVFZpSDgzTG10eEd0N0QxOXlQdmNW?=
 =?utf-8?B?U2xmam02L1U3ZFdTWHpRVHlJOSt1eUx0dlVTY1FFd1ZIb1IrRFRiRnhHNExO?=
 =?utf-8?B?bTVHQTBWUzNiVFZYTDhVRU00WkFFTUV3ZW1WRkYzTENrL0RqRGR2RU9iUnFs?=
 =?utf-8?B?NXJKTzRyTWhoV3Y5NHMxNlBINlhkWXN6OUlzdVhjUkFrWk8rWUQwbE1UYXhJ?=
 =?utf-8?B?R1YrTU1lTitnRm1qSzMrRXJQVTJrYzJib0tyZUZkejNKUVhzT1pBV3ZMY3FL?=
 =?utf-8?B?WUp3alFiMW9zSW9NaEs0ZVozRXVCUk1MRHEyOElDNjJ0NzV0eWNROXNxSkJK?=
 =?utf-8?B?WkxxNkdqdk1YcG1JSTdJQmpkTy9GekVQZGxweEpBT3RkNTh3bVYrRkhUajYx?=
 =?utf-8?B?RWl2V1BBNWJpWG5FdTg0bUVJSU94bjBZM0NGdEc4ck9SWnV6M0ovV0JVNGQx?=
 =?utf-8?B?bUN6bE1xM2lHQUYwTFVrZkJqMUxDdlRxc3Jab3JXU2I3VUVMNC9xRS8xTEVL?=
 =?utf-8?B?K0NDZGFHMTFvbUpacmwxK2xIdVBsK1NtbDIzWE9uSzFBU09xb09TTGNOVWVO?=
 =?utf-8?B?UWlyZWFaeVNKZHEyYVpjU1RFWEpsT2lxMWN3akNPL0tNOFZYeS92Ni8wdEha?=
 =?utf-8?B?d0JMT3BGeDJMeElrVVQ4TUVhU1gxV1dqVXJtYVAyblVYYjlvQXBJTHlSWUlO?=
 =?utf-8?B?azhvYUI0TEl2MVN0NndNRHlxYjNnOHhsbDg0OE9NSVN2ZkIrU1JBejZ5U1g0?=
 =?utf-8?B?bzE4Q0tUd25vRHF1QVZQNEFDWHlWb0MvMHpFekxLNmlzbHZIYW1xYWVhM3RY?=
 =?utf-8?B?eWVVSytyQmNQUThRSHhSdGs5aTcrbUthZWVxL2JQTjl3d0x6bm5zU215UCts?=
 =?utf-8?B?UjVqOWdxWTlSWk5TQUdWM1hnMExac21pVkxucXBGSldQYWI3dGtGSmZRM25w?=
 =?utf-8?B?ZXk3R1BvUDgxbXZhd3p4QXJYYzAyMlhqUGhrWTJXTGdyR0MvSWZsMFUxZlB3?=
 =?utf-8?B?QkhvcmFiQWZwZEhIL2h3NmR1dUczWXRGMlpDdEUzd2V0NFp6ZGYwK29LVmo5?=
 =?utf-8?B?MGZvOUtIQXhLTDlUZ3ZRRVNsa0ZqbFVWQ1p4bFpuUDArb3QxNlBtU0sxYWI0?=
 =?utf-8?B?U3ZkWUg4UTk0YnVHUXRraFdjaGRhT3huR1Y5d25oZk9yb0QwVnZpbDdEVzF6?=
 =?utf-8?B?TjdwZTV2eFc5TjhLOEtPUlZoQ3lUU09EanhPZkYwQlpTK2JOU0FaS3o1V1BK?=
 =?utf-8?B?Y1ZzWEc5UWQzd081Q08rNy9lSUhvNDdDNVI5NmdvREZ1c0d4T1dha1lkUGFT?=
 =?utf-8?B?WkxxUXlNZG1kbUJWRlBUekpYdFd4c0JBZzkrUzlGNXFkZ3JWTmJUV2h3d3d0?=
 =?utf-8?B?dThzQW1keDRVdkFNSDNzZU1IUVFJMDZiYzRvOWprd3c4WmUwa0dTNmFmMzVH?=
 =?utf-8?B?MXp2d0FZVXh4em9vYUtuWUhCdk5CTzNFSFhHQUduMGJIWVNJSFM5K0R6Rk5a?=
 =?utf-8?B?TXJEN09UeTBXZmlFVCtxb3A0aGFpbW5jbEQvcXQrN2JBQTEwb1d6Y2xlRFFx?=
 =?utf-8?B?OGx2azM4ak0wblA3T1lua3lwVHB1bG0wNUdmUlhuVFdNSDJWWVZHa0FyVWs4?=
 =?utf-8?B?Wm1uMDZYb3ZpME9sb3g4TElzTExobU42TnBMNGllVkJyUGE3QXpYMXhTVS9a?=
 =?utf-8?B?SXc0YjFuTnhtN1VtSjZDRndtZnpIWHF2OTZJbGZlVmFNdkVSNng4bTdLenc5?=
 =?utf-8?B?OHhqOXJtS0VnS1VLSUp6akdkSGhMMFprcEtrbDZLZ3EzNFE1U2U2NUNjdUVQ?=
 =?utf-8?B?NzNHU21wbGZnNmhrRTgxNGZSem1IWmlIUm5WRmZSYld4VVFHSW1UMTA4T2lG?=
 =?utf-8?B?QTNiUkxaSHFtQ3hQK1MrL1Q1R2lEWFllQVFENGd1UXNsSFRkYk5tVU16b1o1?=
 =?utf-8?B?WnpyVG1RR3JEYXl0b2ZKaTZhYkNaWStEV3VjeGFNUGRZVG5vcXhvUTRSTzNF?=
 =?utf-8?B?dHFGU1QveVhGZGxJeDNxdmRaYVl2NkdORHUrbmZDZmt3QU9wRnkwK0l2YUt1?=
 =?utf-8?Q?QvYc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 09:54:46.1596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c31dde5-389d-41ac-346d-08de0262e26f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230

On Fri Oct 3, 2025 at 10:06 AM CEST, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 02, 2025 at 07:48:28PM +0200, Alejandro Vallejo wrote:
>> On Thu Oct 2, 2025 at 5:37 PM CEST, Roger Pau Monn=C3=A9 wrote:
>> > On Thu, Oct 02, 2025 at 04:48:38PM +0200, Alejandro Vallejo wrote:
>> >> On Thu Oct 2, 2025 at 4:22 PM CEST, Roger Pau Monn=C3=A9 wrote:
>> >> > On Thu, Oct 02, 2025 at 03:55:34PM +0200, Alejandro Vallejo wrote:
>> >> >> If QEMU has a debug isa-debug-exit device, we can simply write to =
it
>> >> >> to exit rather than spinning after a failed hypercall.
>> >> >>=20
>> >> >> While at it, reorder an out-of-order include.
>> >> >>=20
>> >> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> >> >> ---
>> >> >>  arch/x86/hvm/traps.c    | 16 +++++++++++++++-
>> >> >>  arch/x86/pv/traps.c     |  5 +++++
>> >> >>  common/lib.c            |  2 +-
>> >> >>  common/report.c         |  8 +++++---
>> >> >>  include/xtf/framework.h |  3 +++
>> >> >>  5 files changed, 29 insertions(+), 5 deletions(-)
>> >> >>=20
>> >> >> diff --git a/arch/x86/hvm/traps.c b/arch/x86/hvm/traps.c
>> >> >> index ad7b8cb..b8c4d0c 100644
>> >> >> --- a/arch/x86/hvm/traps.c
>> >> >> +++ b/arch/x86/hvm/traps.c
>> >> >> @@ -1,5 +1,6 @@
>> >> >> -#include <xtf/traps.h>
>> >> >> +#include <xtf/hypercall.h>
>> >> >>  #include <xtf/lib.h>
>> >> >> +#include <xtf/traps.h>
>> >> >> =20
>> >> >>  #include <arch/idt.h>
>> >> >>  #include <arch/lib.h>
>> >> >> @@ -139,6 +140,19 @@ void arch_init_traps(void)
>> >> >>                 virt_to_gfn(__end_user_bss));
>> >> >>  }
>> >> >> =20
>> >> >> +void arch_shutdown(unsigned int reason)
>> >> >> +{
>> >> >> +    hypercall_shutdown(reason);
>> >> >
>> >> > This relies on the hypercall page being poised with `ret`, which is
>> >> > IMO fragile.  I would rather have it poisoned with `int3` and preve=
nt
>> >> > such stray accesses in the first place.
>> >>=20
>> >> I dont' mind caching Xen presence somewhere, but that involves some c=
ode motion
>> >> from setup.c, which I wanted to avoid.
>> >
>> > I think it's very likely that at some point we will need to cache this=
?
>> >
>> > enum {
>> >     NATIVE,
>> >     XEN,
>> >     QEMU,
>> >     ...
>> > } hypervisor_env;
>> >
>> > Or similar.
>>=20
>> Maybe NATIVE, XEN_VIRT and NON_XEN_VIRT? I see no reason to distinguish =
between
>> TCG, KVM and any other accelerator; and QEMU is imprecise because we use=
 for
>> HVM. You could imagine chainloading XTF from GRUB to test the HVM env.
>
> Maybe not for XTF.  IIRC KVM also offers some PV interfaces (like the
> PV timer) that native QEMU doesn't.

Sure, but we don't want to test KVM PV. It _could_ be used for it, but KVM =
has
its own unit testing facilities already.

https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git

>
> Rather than having an exclusive hypervisor mode, we could signal what
> interfaces are available.  For example Xen (and I bet KVM too) can
> expose native interfaces plus viridian extensions, in which case we
> might want to detect both if present.  That would require using a
> separate boolean for each extra interface.  IOW:
>
> bool xen_hypercall;
> bool viridian_foo;
> bool qemu_debug;
> ...
>
> (Possibly not the best naming)

I'm of the opinion of not adding things not strictly required.

>
> BTW, is it possible for a guest to discover whether the
> "isa-debug-exit" functionality is present?

Besides ensuring a read gets zero, no. From the QEMU sources:

  static uint64_t debug_exit_read(void *opaque, hwaddr addr, unsigned size)
  {
      return 0;
  }

  static void debug_exit_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned width)
  {
      qemu_system_shutdown_request_with_code(SHUTDOWN_CAUSE_GUEST_SHUTDOWN,
                                             (val << 1) | 1);
  }

I didn't see any signaling anywhere in CPUID or elsewhere. Though I admit i=
t
was years ago that I last checked, this isn't the sort of feature that chan=
ges
very often.

>
> Sorry, I'm possibly derailing this patch series.

Can only mean you find it interesting. That's always good :)

But to concretise actions, I think I'll keep it simple for the time being a=
nd
add a single `cpu_has_xen` global boolean; then place the shutdown hypercal=
l
before the QEMU exit device write, gated by cpu_has_xen.

That prevents making a hypercall when the "wrong" hypervisor is present (or
none).

Cheers,
Alejandro

