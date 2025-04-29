Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A577CAA095B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972044.1360459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iub-0006k6-R0; Tue, 29 Apr 2025 11:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972044.1360459; Tue, 29 Apr 2025 11:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iub-0006i5-OE; Tue, 29 Apr 2025 11:14:05 +0000
Received: by outflank-mailman (input) for mailman id 972044;
 Tue, 29 Apr 2025 11:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9iua-0006hy-MM
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:14:04 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2409::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d261673-24eb-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 13:14:01 +0200 (CEST)
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 11:13:57 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:86:cafe::e) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 11:13:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 11:13:56 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 06:13:54 -0500
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
X-Inumbo-ID: 0d261673-24eb-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoSfW31U5F+br87+d2zaCuwCeA5DOuMEm63s+uZZ9+zUA1+Bra+3cWShSglXHY0caXy4QohCL/8VKOZjeH2mIMdmuw57HiVX/kUddPkEb9FklbRbuHduyz/Z1MB33hu58pC3D3n4DC4C3YUpV+tW5KZ+VtCxb/t1hG0SxTrN7v9jYZURenYph24iIMqZ82h+VQj8UKjWvjdVxN4Ii4tEqT9gXOw2zkhMX9I66y8VbKR1aZmhTVl72/Na0KKMSYGJOc5F1dlL87M0IiRkqY6bQJlcB+DvwRWRLb3j/XlX6nOOnHxs8JuAmqZSYwz8JaUWObr0mypY1h/tWjrebZ2ZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AupN6ieuL+06yRgtfvU4DU+GH8vYdBa1fXIFCXwZnrY=;
 b=n8j+bGIsUTOIiPT59wzXGpis4coihdHbzH0jn4ModIAltKtK0kgSXniF3V54orqa3KlS4ZKeaZlakpBhjhGmNW9gtVzf8t8ok09nAcesTNp0ufz2imBQuxqv3l6R5rhbAsTFlestF8+yPk3xxJMkbhzdhq1PwJZc6BTpjysupPfeCL9iczN12rbCTod/eO4w7VwjaHH+iSKK8L4nPuCTbjS7wDqGQ1I648827rM2mVp2jH1mwSqBFTDr8x8sJ//dxybQkQIZw0jHZMZXt7tiNcaUF7Qrk6vStG4rxD7lhEyjLxDIPEbXQ41NcU+QBfSxB3f3Gag+HZKGp82WYX/Oqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AupN6ieuL+06yRgtfvU4DU+GH8vYdBa1fXIFCXwZnrY=;
 b=Ob0hS8KJDr8e8ajW3hrocdk3unOR08gW2lRw7+zSQqWUsw6udMnOXNO6MNhRI+5LGRkAugMspz8N2A31/q2hA6wEo5fEjIGinOcUnexYd3Tf5Lqc/Zt6eckgaawlD3QYOzM2RPMdErlyZAHfiLRSXk4ra641AAZGUr30C3nje74=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Apr 2025 12:13:51 +0100
Message-ID: <D9J2UATLKGFN.2SPPU3A77VJHE@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ariadne Conill
	<ariadne@ariadne.space>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>, "Jan Beulich"
	<jbeulich@suse.com>, "Alexander M . Merritt" <alexander@edera.dev>
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
From: Alejandro Vallejo <agarciav@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.20.1
References: <20250425234331.65875-1-ariadne@ariadne.space>
 <aA9NMJVbyXeMOOY-@macbook.lan> <D9I7TPLT0EJD.3F5P95H69CT5K@amd.com>
 <97d28edb-4274-408f-a825-d09fa771e21d@citrix.com>
 <D9I904ZOCMVN.31C4DUMXROGDK@amd.com> <aBCKsI4qhHWq4Iiz@macbook.lan>
In-Reply-To: <aBCKsI4qhHWq4Iiz@macbook.lan>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: c64f45f9-7455-41da-0335-08dd870eef2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXBHTXFNaWJyUEJDNkcxQzUvSndoUmVLcll4RG9KeEI1OWFGUW5vOS9Ycngx?=
 =?utf-8?B?SnkwMEtKTkljRU1Lek8rMytWRiswZVo3UWtrQVB2NUhiajVKUkVBUVRMdW9F?=
 =?utf-8?B?ZmJBR085Y2tzUDFoeGswK2p2QmVhVUIwQXBYVjZtb3BBVUtCdUljQTVURTJN?=
 =?utf-8?B?M0JRelZRcFJFMVJaVHJ3d1VraC85eVpzUnQ0Nyt1eFBLbzN1MlBFMVg0RU1E?=
 =?utf-8?B?WHZldDh3VEQzS3NhSVRjS1VtdUNHczJkYklOdDU3NlZiTGF5djFLUW0vNzM0?=
 =?utf-8?B?QTl0TG9mVTdqZTNaaVJiU1ZiY1l2dkJLT1FDOUVaSUZYby9vUmoyeHhiODNt?=
 =?utf-8?B?SUV1aHVwaFJrWjNvVlJFNGRTTlpVM3BsSVEwSWcxZFBLQmkzVHZXeURTUWZG?=
 =?utf-8?B?SUdlMVFrSk4vaVlMSG93ZTc0VjJDYWlGVVZweC9lVXR6TDhEUVZucXQ5OHpK?=
 =?utf-8?B?UnpETjI1eGV4TTJPTGk0eWdoRDNyOU1rWTlKSmtoMzFVMW5NZmFBa1Q2R2d3?=
 =?utf-8?B?eHlMVHhCb01yNmF2NVpBaDlsR3NFM2lmODNBQVM2WUt2OTQ1WG12enQ0Z3Fr?=
 =?utf-8?B?NVVMZ1RFTU05ZTVFdVlGb3dtUG0ya0JzTXRhb0dTT3hpQkFaV2pBUmUrQnVr?=
 =?utf-8?B?U3hlS29LMnY4TGZySWtmdlo4NTQyVy9NUTg5MTg2UjkxQkFuUGxkd3JXRGtX?=
 =?utf-8?B?VlkwNTcrOUJINTlPRWQyMUlROE1FdEVsNGFQeWxGL2xvUGRwNEFJd001SzBM?=
 =?utf-8?B?WUtPKzYvd3lXekFSdEU5aDExUHlDbUdMd21BNlJUMm4vTklMeU93dkc4Y0d3?=
 =?utf-8?B?Ri96NlA5RTcvcWY5aGNzeWhQV2VGTlJlOVhuZ3hHSG8xdU9LdlF1cnVjR0tq?=
 =?utf-8?B?YklYT3R0TDBWRHpMVSszQk1FYTZIMjBWaGFqb01iYlR2Zi9DZnc0eTBHaXNS?=
 =?utf-8?B?SGhmT2hDUGtrUlhQelFJMFN1UnM1dkJMd1VlSklrdHFFU1BTYjNHS3VLYkRz?=
 =?utf-8?B?MEtCNUV2WllHNjN4cTdBR25lZDVoU05adzhoNnZXeXFxT2VlSEtDTkZ4dkR0?=
 =?utf-8?B?a3oyTGN6NEJkVXhtbytyUUdHQjJRY3NVcVFEV0Z1VnFSTEtpV3BDUUZXdnEy?=
 =?utf-8?B?bmhkU2NDQlhBRFRpRHpDWFdZcTBRamFWSnNsK20xa3orR2Exd0IzWjhmOXhH?=
 =?utf-8?B?elM4Yldua2UwK3hPTjZFMHpENHRVWjZCUHlPWmNWcXU3bkgrTGhKQWdOMWJt?=
 =?utf-8?B?TlFwZEV6V3o2cW9Lb2xNSFdVQTNhMmh2SUtEZElKaTN1NmRCZ1FSNEZ6SXlw?=
 =?utf-8?B?RnQ3d1FDdFlhbnJIUkZ0Rm1pNWtzWG4rYkNGQ3E3eVA3YndDbmhMdE1oNnBN?=
 =?utf-8?B?UXc5QklLNEY3WFpNdGVDZ0NKOW80NEh1ZlBkTjJnSzZFM3BpWHUwMGY3SkFT?=
 =?utf-8?B?YXBBbDRSMWhhU2FGdTNHakUyNFBETFR0RnZmMUVieXZuN2FEMnEzL1VpMXF0?=
 =?utf-8?B?MFRIQjRlWENtV2k4V3RmaHFQenRNenc1THhWRm9iU1ZPMlEvOE9FMC9DaWhn?=
 =?utf-8?B?NGlYZTRoRzBVYlM4S2hQbVZGS3d2aTBpRlEyYzYybTMydWdCS2hHdkd1QWQ4?=
 =?utf-8?B?SVRJRFFweGp6VlFqNUlKcFYwcDMyVnBDYkhyU3JhZkFvT3hQY1RqNjNHTWty?=
 =?utf-8?B?cU1wT1gvaGhIaGhHODd1L0tIdkM2OUJ2MlFsY0g3TWMvdS91N1hzWFNhZTdG?=
 =?utf-8?B?bWFxb2R0RDhnYWFURHhWYVVCYjZOL05FTnIrWUZyRnM5VUoyU2k2bnJSNGJD?=
 =?utf-8?B?ZnRYRVdIa2s5N3JlWEliWnZpVyt5WW5FMlVBWmM0L3FBZTg1Y0dkR29TRkJt?=
 =?utf-8?B?ZjdsNG1wVVJSZnlVeE9RV0RHbzE1Y004ZG5nY1JoZVdHYmtoTVB2SlBQMG5N?=
 =?utf-8?B?NzBLNExnTlFzTlpMTSs0M2g3aTl5MVIyY3A1TllpeDVkaDZWaEJmTm9vUHJo?=
 =?utf-8?B?dGtZd1pQUXhvNGViM2hQSUR0ZjAwS2drOEwzbVNvaUFQMVh2cDNtT05qVW9i?=
 =?utf-8?Q?2Ei+nz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 11:13:56.7061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64f45f9-7455-41da-0335-08dd870eef2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136

On Tue Apr 29, 2025 at 9:15 AM BST, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 28, 2025 at 12:50:55PM +0100, Alejandro Vallejo wrote:
>> On Mon Apr 28, 2025 at 12:07 PM BST, Andrew Cooper wrote:
>> > On 28/04/2025 11:55 am, Alejandro Vallejo wrote:
>> >> On Mon Apr 28, 2025 at 10:41 AM BST, Roger Pau Monn=C3=A9 wrote:
>> >>> On Fri, Apr 25, 2025 at 04:43:31PM -0700, Ariadne Conill wrote:
>> >>>> Previously Xen placed the hypercall page at the highest possible MF=
N,
>> >>>> but this caused problems on systems where there is more than 36 bit=
s
>> >>>> of physical address space.
>> >>>>
>> >>>> In general, it also seems unreliable to assume that the highest pos=
sible
>> >>>> MFN is not already reserved for some other purpose.
>> >>>>
>> >>>> Changes from v1:
>> >>>> - Continue to use fixmap infrastructure
>> >>>> - Use panic in Hyper-V setup() function instead of returning -ENOME=
M
>> >>>>   on hypercall page allocation failure
>> >>>>
>> >>>> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
>> >>>> Cc: Alejandro Vallejo <agarciav@amd.com>
>> >>>> Cc: Alexander M. Merritt <alexander@edera.dev>
>> >>>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
>> >>>> ---
>> >>>>  xen/arch/x86/guest/hyperv/hyperv.c      | 17 +++++++----------
>> >>>>  xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
>> >>>>  2 files changed, 7 insertions(+), 13 deletions(-)
>> >>>>
>> >>>> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/gues=
t/hyperv/hyperv.c
>> >>>> index 6989af38f1..0305374a06 100644
>> >>>> --- a/xen/arch/x86/guest/hyperv/hyperv.c
>> >>>> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
>> >>>> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
>> >>>>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>> >>>>      if ( !hypercall_msr.enable )
>> >>>>      {
>> >>>> -        mfn =3D HV_HCALL_MFN;
>> >>>> +        void *hcall_page =3D alloc_xenheap_page();
>> >>>> +        if ( !hcall_page )
>> >>>> +            panic("Hyper-V: Failed to allocate hypercall trampolin=
e page");
>> >>>> +
>> >>>> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hcall_=
page);
>> >>> This likely wants to be a dprintk, and possibly also print the
>> >>> physical address of the used page?  And no period at the end of the
>> >>> sentence IMO.
>> >>>
>> >>> I think Xen might have used the last page in the physical address
>> >>> range to prevent HyperV from possibly shattering a superpage in the
>> >>> second stage translation page-tables if normal RAM was used?
>> >>>
>> >>> However I don't know whether HyperV will shatter super-pages if a
>> >>> sub-page of it is used to contain the hypercall page (I don't think =
it
>> >>> should?)
>> >> I think it's quite unlikely.
>> >
>> > It will shatter superpages.
>> >
>> > The overlay is not part of guest memory, and will hide whatever is
>> > behind it while it is mapped, which will force a 4k PTE in EPT/NPT.
>>=20
>> That's an implementation detail. They can very well copy the trampoline
>> to guest memory when there is such (and save the previous contents
>> elsewhere) and restore them when disabling the trampoline. It's a
>> trivial optimisation that would prevent shattering while being fully
>> compliant with the TLFS.
>
> It's an implementation detail relevant from a guest perspective, as it
> impacts guest performance.  IOW: we care about the specific (current)
> implementation, as it's meaningful to how the guest-side should be
> implemented.

Indeed, I didn't mean otherwise.

My reply had more to do with the assertiveness of "it will shatter". The
reality is that we can't know, short of microbenching a read into the
trampoline after a TLB flush. And even then it may very well be
version-dependent (where old did, and newer doesn't, for instance).

>
>> The actual physical location of the trampoline is fully undefined. It
>> is defined to be an overlay; but that's a specification, not an
>> implementation.
>>=20
>> >
>> > Thinking about it, a better position would be adjacent to the APIC MMI=
O
>> > window, so at 0xfee01000.=C2=A0 The APIC MMIO window is forced to be a=
 4k
>> > mapping too, and the rest of the 2M window is normally empty.
>> >
>>=20
>> Sounds like an assumption waiting to be broken. Just like the last page
>> of guest-physical was.
>
> As a compromise - could we try to allocate from < 4GB first, and
> resort to high memory if that doesn't work?  That would at least limit
> shattering (if done) to the low 4GB, which is quite likely fragmented
> already:
>
> hcall_page =3D alloc_xenheap_pages(0, MEMF_bits(32));
> if ( !hcall_page )
>     hcall_page =3D alloc_xenheap_page();
> if ( !hcall_page )
>     panic(...);
>
> That will need a comment to describe what's going on.

Sounds far more resilient to me. I could get behind that, sure.

Ariadne, thoughts?

Cheers,
Alejandro

