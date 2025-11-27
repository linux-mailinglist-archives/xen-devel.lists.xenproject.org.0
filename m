Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8286C8E63D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173816.1498815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObqW-0002uc-Q3; Thu, 27 Nov 2025 13:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173816.1498815; Thu, 27 Nov 2025 13:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObqW-0002rp-Ms; Thu, 27 Nov 2025 13:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1173816;
 Thu, 27 Nov 2025 13:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuYy=6D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vObqV-0002rj-Ht
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:15:39 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26e6c34c-cb93-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 14:15:33 +0100 (CET)
Received: from DS7PR06CA0042.namprd06.prod.outlook.com (2603:10b6:8:54::23) by
 DS7PR12MB5909.namprd12.prod.outlook.com (2603:10b6:8:7a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.14; Thu, 27 Nov 2025 13:15:27 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::8b) by DS7PR06CA0042.outlook.office365.com
 (2603:10b6:8:54::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Thu,
 27 Nov 2025 13:15:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 13:15:27 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 07:15:24 -0600
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
X-Inumbo-ID: 26e6c34c-cb93-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFwkflESS4JadDM6ABQFXJ4rr1I9kDY9/v5PkAJkMtYkRgBmmPiylm9DKFLCuQTHHtVL479Q1MASKPiSaHmcCJeTupNNKX/3O1Ey8zd2OuEti5hviduCGwJ8DUfgeTc68IEUOX8DeQUl6RglBeUBC0Aw1VAgifotVbBNWB3Seo48M+cO7Gx9HO/pdGqmSz0lgF2JXr+ZG/fDnn7Gh4eVP2KaYQRUMW4JQRtwVXMdZpvbduqAhtiWQxARjtGy7YnTNMWJsHtBzWpXPAcq4gXojH7447VUgZ/L6xE4wIEU2AhtatL1UcOPHMkufRjLo7fvi3daKtMNZINuSHwj3SkTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEapHTWYhu3Uj1n2dDG4GB1BobNXQAIYymW86qvANkE=;
 b=AW9BsZnJj7WGnvz0adEH5IZSf8/Fsf/qcjHTSGwa0L7yeFpTyWp5AiCAw9T0gyFRfmY6zE54maVYib6vs5sBCpCTA7/l5CQlo1mTct6W51KgJlvq6uCWsTD/KqPql6vcyl044MhLYLcQfcoGeI1lIHqsgl8iAQxST9eCDVqiLrI8/fh2yN53IkNCZ5u+Ygor3/j0FlfKE+CANJPUQbc8Hi+Q2PPWbXYDKBOn1XQeXX4jyDGN9AoB1HS1t9XoJO7X7u3CmyJPx6i80V+KQqQDVLP51bdXrfX+6B30xpst1se1f4OdqmyjCdpH7d7wmkd08sOzrpQOLcVBYN35hRwmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEapHTWYhu3Uj1n2dDG4GB1BobNXQAIYymW86qvANkE=;
 b=OBFdfZseUR5k/wGcaTud2IxskbG/dgkyG6Jw0ZVjX0CJl927d/ssgcsETV0TtwOmA1xtwZemWLxK6ZyKrqTzx97BBsDtqd1owC9nqgtT0Zc1jHBDlIClXf5BZqYtkwggGV4kSjV/2clA6h5Dzko/osL/AkgcP2A63KlCR5afbWM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Nov 2025 14:15:22 +0100
Message-ID: <DEJI6U37EMDI.1F7QHW1I7WV76@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 03/11] x86: Add x86_vendor_is() by itself before
 using it
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
 <d71b6b55-6745-4ba4-9a4f-d5e7b08f0aec@suse.com>
In-Reply-To: <d71b6b55-6745-4ba4-9a4f-d5e7b08f0aec@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|DS7PR12MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: a88b88fe-ffa6-4382-25e0-08de2db70846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjJ6NkpZdUFWUjB4SjNRdkxCMjFuVnNXQ3d3bUFvek52bGwvNTJ0TGhJTnMx?=
 =?utf-8?B?eUN1NUs3V2s4V2ZlRnJJcjIyaG9ZbkV3K2ZmejIvZG1vS2diRjdlWDJYTlFx?=
 =?utf-8?B?UEh6UTJ3K3JhdEpTYzRDa2FrTHQ1dHluWHl3d29KdnRCM3ZIb05EdGJJOTl6?=
 =?utf-8?B?WWhrM3JQSzRmdGpNZmZPV3FMYlBWVXRtUHowcGNLL0FmL2dxeGhKQjBOZzRj?=
 =?utf-8?B?NnF3VnVPeHVYVFJDTVp1clZjaHRScHVCOHJIVS9Wa3dsdmhreXdSNC9aQy95?=
 =?utf-8?B?c0ptSlhVMndNWXNhU1Z4VW1qb0xYRmc4OEdCRkhTdElTMU1BbndTRnEvNC93?=
 =?utf-8?B?S3J0VitOYU05SmN0Yytnd29nZ0xyMEFyRFRoZVFoWm1YTXpPQnhmK3RhU0ty?=
 =?utf-8?B?ODF4MEhqZ2d6cGVEUFg4a1N2NTJyMm5obFZZZGdzZWFNMUVndk9zL2hIamM1?=
 =?utf-8?B?bVJDa05rYXdFNkQrSm8vVm03VkRyWFJRNmljVGVXZDVZekpsamRnemlEQllR?=
 =?utf-8?B?SkhTT1JvU1JGRWxGTExtQVZ6VkVqaE1JWUxJWHh1RUw0SERFaWcvdHhFTUF3?=
 =?utf-8?B?akxKTUxLVXRWcWV3OWJIQVlIU0Z6UVJzcHZDNk9JQWxNV3RzR0RqajhQSTVG?=
 =?utf-8?B?ZW43ZGJVRGNHY0xDSmMwTUVPSEVyYTU3OVIvMmV3a2djYWFCa2cxcW5DTGEz?=
 =?utf-8?B?ODk5a1ZuUndlT3RGYUxQUmNrT2E2dXA0bjBZSVY5ZGhHMEFVbEN0eUo0WG1U?=
 =?utf-8?B?QWY1aWJXQ2hQaE0wL0doblppOTN0NHplNC93TkV4Q2FSZEdac3B4RmxuNU1j?=
 =?utf-8?B?N2xoL0ZkMnRrMCtYR2dMMlVySi9yOVBhRmE5akhSRitkbm0zMVo4WnpER3Ja?=
 =?utf-8?B?OVkxeVZwbmgwWHhjWmU0WHNXUXZhYUpkR3A5MUhLQ3diQjJxVERta3laZlhN?=
 =?utf-8?B?ZlQxTitlNjcxNmdEVWpMMmZQT1ErNmNldU9mOFMzNHFqOHh4WUZyYTdNcDMx?=
 =?utf-8?B?NjNQMjNUTEVJYUNlVnJ5QXRiNit1ZkxCbHBFRUplK1MzbTVNSXhkYy9xdysv?=
 =?utf-8?B?SmZDckhNYysvVy9WNXRuV2tyZlgwRDNyZGNleHBtSUJvaTJhU2hkZlVBWGZ5?=
 =?utf-8?B?MVlicTNjUUpCaWljTEZTNnArRVIvcC9Oc2ZvLzdwNk5vdXR0UzI0UmRoUEJ6?=
 =?utf-8?B?aUJhRHNmWmMrcmtjTi9UVEdsKzVIT2RyS2w1Y1ErUTNXWk9jZ0hRdUROdUd6?=
 =?utf-8?B?TjlEajFEc1B4N0NGRHRpamRlK3ljM2ttVEdVaHhmeit3VWR3dlNFbUJwcndL?=
 =?utf-8?B?cHBHTEw5VlRkYWZYSFVGZENkVzFtNDBKb0p3WHJXK1pGZEFLVnZ5eXJxUWFV?=
 =?utf-8?B?cEZJalduV1UwamlBUnp4bUdaaSt1QkVkQnExOHhWQnpwOUlYSHhCcUZYdDUr?=
 =?utf-8?B?RFpYVUlpZWZTV1FyVlh6bXZxQzdhMWlDSm02YVB4QjRvakxQODMwMElMOWli?=
 =?utf-8?B?aENNbklBVFdGZUIxMnFNaGFPdHBSQ3FqN0p2ckV4YUJscXJrM2VQSHJ5Z3Js?=
 =?utf-8?B?b0J0UWJkdkZDcXRnbjQyMFhSUGFuaDRKT2V6LytaU0tIdGcrcnZGVTFmd2Rz?=
 =?utf-8?B?SExyb0xpTmx1eGtDQi9Bdm05WSsyRExycWRneW1HT21UNWQzR3MyWEI2U29a?=
 =?utf-8?B?OTh0M2lWeiswaDB3YkRoam5sTFZaOXhUZzdxQ3hRUENGVGdvRGhEZXlORlhN?=
 =?utf-8?B?ZXJMaDhyNnQvN1NyTC9XS0kwZ2hpZUJBRWQzWWRuL0IzT3JnRkhkZnVPUStQ?=
 =?utf-8?B?bUJFWGxjenNlZjVKR1BGc1JOTEJuM2U4NFZmOTVMQzNwOHNjU3JwSmZwZTVH?=
 =?utf-8?B?VlVXNWJGUmVwQlkvSTBtK2I4TUJNckExdWZsRWNZbndRa0dPZW1RUE1JZnAw?=
 =?utf-8?B?ZlJqZU1lSWphSVV4QU9lVjh4dVd1MFBkd3ZWY3JpOStUMGF5WUNrYjJ1NUJv?=
 =?utf-8?B?bXJLVWxYTnFSN2p4TUY1clZKSnlwTkpUaTFiZjVYV1lSRStzMFk4ZzVKU1Zi?=
 =?utf-8?B?RC9nazlhMjRZRzk4bnkxajlvV2J0ZERRQWZNb3RRTlVyY1lLN1d5RGdFU2pD?=
 =?utf-8?Q?9bHU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 13:15:27.3459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a88b88fe-ffa6-4382-25e0-08de2db70846
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5909

Hi,

On Thu Nov 27, 2025 at 11:46 AM CET, Jan Beulich wrote:
> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>> This function is meant to replace all instances of the following
>> patterns in CPU policies and boot_cpu_data:
>>=20
>>   - x->x86_vendor =3D=3D X86_VENDOR_FOO
>>   - x->x86_vendor !=3D X86_VENDOR_FOO
>>   - x->x86_vendor & (X86_VENDOR_FOO | X86_VENDOR_BAR)
>>=20
>> The secret sauce is that all branches inside the helper resolve at
>> compile time, so for the all-vendors-compiled-in case the function
>> resolves to equivalent code as that without the helper and you get
>> progressively more aggressive DCE as you disable vendors. The function
>> folds into a constant once you remove the fallback CPU vendor setting.
>
> Here and below in the comment, "fallback CPU vendor" wants clarifying. I
> don't view it as obvious that what's presently named UNKNOWN_CPU is that
> "fallback" (as imo that really isn't any kind of fallback, but merely a
> placeholder).

I'll rename all fallback references in commits/comments to "generic vendor"=
.
Though do note there's a fallback behaviour. It's introduced in patch 1 due
to the ANDing of the x86_vendor with the mask of compiled-in vendors.

We can trivially get rid of this behaviour, but I assumed booting in untune=
d
mode is preferable to panicking. And if you _do_ care about panicking when =
you
don't know about a CPU you're better off setting UNKNOWN_CPU=3Dn and gettin=
g that
exact behaviour.

>
>> While at this, move an include out of place so they sort alphabetically.
>
> I'd rather suggest to simply ...
>
>> --- a/xen/arch/x86/include/asm/cpuid.h
>> +++ b/xen/arch/x86/include/asm/cpuid.h
>> @@ -2,10 +2,12 @@
>>  #define __X86_CPUID_H__
>> =20
>>  #include <asm/cpufeatureset.h>
>> +#include <asm/x86-vendors.h>
>> =20
>> -#include <xen/types.h>
>> +#include <xen/compiler.h>
>>  #include <xen/kernel.h>
>>  #include <xen/percpu.h>
>> +#include <xen/types.h>
>
> ... drop it. xen/kernel.h, for example, already gets it for you anyway.

Good call.

>
>> @@ -56,6 +58,51 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>>       (IS_ENABLED(CONFIG_SHANGHAI) ? X86_VENDOR_SHANGHAI : 0) | \
>>       (IS_ENABLED(CONFIG_HYGON)    ? X86_VENDOR_HYGON    : 0))
>> =20
>> +/*
>> + * When compiling Xen for a single vendor with no fallback vendor there=
's no
>> + * need no check the candidate. `vendor` is always a compile-time const=
ant,
>> + * which means this all can fold into a constant boolean.
>
> DYM "`vendor` is always supposed to be a compile-time constant, ..." ?

Yes. We could guard against it not being so by having an initial branch whe=
re:

if ( !__builtin_constant_p(vendor) )
    return candidate & filtered_vendor;
>
>> + * A runtime check at the time of CPUID probing guarantees we never run=
 on
>> + * wrong hardware and another check when loading CPU policies guarantee=
s we
>> + * never run policies for a vendor in another vendor's silicon.
>> + *
>> + * By the same token, the same folding can happen when no vendor is com=
piled
>> + * in and the fallback path is present.
>> + */
>> +static always_inline bool x86_vendor_is(uint8_t candidate, uint8_t vend=
or)
>
> I fear the comment, no matter that it's pretty large already, doesn't mak=
e
> clear how this function is to be used, i.e. how for this being an "is"
> predicate the two arguments should be chosen. My typical expectation woul=
d be
> for "is" predicates to apply to a single property, with other parameters =
(if
> any) only being auxiliary ones. Maybe it would already help if the first
> parameter wasn't named "candidate" but e.g. "actual" (from looking at jus=
t
> the next patch). Or maybe (depending on the number of possible different
> inputs for the first parameter) there want to be a few wrappers, so the
> "single property" aspect would be achieved at use sites.
>
> Then I see no reason for the parameters to be other than unsigned int. (S=
ame
> for the local variable then, obviously.)

I could also call it x86_vendor_in(), to mean it's a set membership check,
leaving its prototype as:

bool x86_vendor_in(unsigned int actual, unsigned int bitmap);

bitmap is a special kind because literal 0 has a special meaning (unknown).=
 So

I'd expect x86_vendor_in(X86_VENDOR_UNKNOWN, X86_VENDOR_UNKNOWN) to return =
true
when UNKNOWN_CPU=3Dy. One way to alleviate complexity would be to promote t=
he
unknown case to a first-class bit. It's not like it's zero for any good rea=
son.

As for the what goes in the first parameter, it's invariably the x86_vendor
field of cpuinfo_x86 (for boot_cpu_data), or of any cpu_policy.

This is meant to replace checks on vendors, so a natural (and universally u=
sed)
pattern across the codebase is to have a runtime variable checked against a
constant. Here's a longer list of patterns and expected transformations.

  from: cp->x86_vendor =3D=3D X86_VENDOR_AMD
    to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)

  from: cp->x86_vendor !=3D X86_VENDOR_AMD
    to: !x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)

  from: cp->x86_vendor & X86_VENDOR_AMD
    to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)

  from: cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)
    to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON)

  from: !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))
    to: !x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON)

  from: cp->x86_vendor =3D=3D X86_VENDOR_UNKNOWN
    to: x86_vendor_is(cp->x86_vendor, X86_VENDOR_UNKNOWN)

And switch statements converted to if-elseif chains.

With the second argument alaways being a constant there's j


> I'm further uncertain this is a good place for the function. In the old d=
ays
> it may have been, but cpuid.[ch] now are only about guest exposure of CPU=
ID,

This function would be used for both cpuinfo_x86 and cpu policies. Either h=
ere
or cpufeature.h works. I used to have it in x86-vendors.h, but that's expos=
ed
to the toolstack and nothing would come out of doing that.

> when this predicate is intended to be used for both host and guest. (As I
> realize only now, this also applies to the addition patch 1 does.) One
> might think processor.h might be a good home, but we're actually trying t=
o
> slim that one down. So one of cpufeature.h and cpufeatures.h, I guess. (M=
aybe
> other x86 maintainers also have thoughts here.)
>
>> +{
>> +    uint8_t filtered_vendor =3D vendor & X86_ENABLED_VENDORS;
>> +
>> +    if ( vendor =3D=3D X86_VENDOR_UNKNOWN )
>> +    {
>> +        if ( IS_ENABLED(CONFIG_UNKNOWN_CPU) )
>> +            /* no-vendor optimisation */
>
> Nit: Comment style (also again below).
>
>> +            return X86_ENABLED_VENDORS ? vendor =3D=3D candidate : true=
;
>
> With the surrounding if() this effectively (and more explicitly) is
>
>             return X86_ENABLED_VENDORS ? candidate =3D=3D X86_VENDOR_UNKN=
OWN : true;

Sure.

>
> First: Would one ever pass X86_VENDOR_UNKNOWN for "vendor"? The next patc=
h,
> for example, specifically doesn't.

I don't think so. There's definitely not any existing case atm. Still, I th=
ink
it's better to preserve the invariant that the follwing transformation:

  from: cp->x86_vendor =3D=3D X86_VENDOR_X
    to: x86_vendor_is(cp->x86_vendor, X86_VENDOR_X)

holds for every vendor variant in the "everything compiled-in" case.

> And then why not shorter as
>             return !X86_ENABLED_VENDORS || candidate =3D=3D X86_VENDOR_UN=
KNOWN;

Because I didn't think of it. I like your version better.

>
> Which raises the next question: Should we even allow a hypervisor to be b=
uilt
> with X86_ENABLED_VENDORS =3D=3D 0?

That's the most extreme case of "should we boot on a CPU known CPU vendor t=
hat=20
has been compiled out?", the current code in the RFC uses the unknown vendo=
r
as fallback. We could also panic. We could be trying to exercise the
"no assumptions about the vendor" paths.

It's a policy decision for you (x86 mantainers) to take. I personally think=
 the
default path is silly in this day and age and we could get rid of it entire=
ly.
Without it X86_ENABLED_VENDORS=3D0 would be indeed illegal. On that topic..=
.

> Plus, question more on patch 1, what's the (useful) difference between a =
build with all vendors set to N and
> (a) UNKNOWN_CPU=3Dn vs (b) UNKNOWN_CPU=3Dy? With all vendor support expli=
citly
> turned off, all CPUs are going to be "unknown".

... (a) causes a panic because all vendor go on the unknown path that leads=
 to
such panic, (b) has them run as if they belonged to a new unknown vendor FO=
OBAR.

You could do (b) to exercise the paths on unknown vendors. Or we could get =
rid
of it altogether and panic on compiled-out vendors. Kconfig is a middle-gro=
und
where the default CPU path serves a not-so-theoretical purpose.

>
>> +
>> +        /* unknown-vendor-elimination optimisation */
>> +        return false;
>> +    }
>> +
>> +    /* single-vendor optimisation */
>> +    if ( !IS_ENABLED(CONFIG_UNKNOWN_CPU) &&
>> +         (ISOLATE_LSB(X86_ENABLED_VENDORS) =3D=3D X86_ENABLED_VENDORS) =
)
>> +        return filtered_vendor =3D=3D X86_ENABLED_VENDORS;
>> +
>> +    /* compiled-out-vendor-elimination optimisation */
>> +    if ( !filtered_vendor )
>> +        return false;
>> +
>> +    /*
>> +     * When checking against a single vendor, perform an equality check=
, as
>> +     * it yields (marginally) better codegen
>> +     */
>> +    if ( ISOLATE_LSB(filtered_vendor) =3D=3D filtered_vendor )
>
> So one may pass a combination of multiple vendors for "vendor"? Is so, wh=
y
> is the parameter name singular?

Yes, it's a bitmap. Parameter could be in fact "bitmap", except the 0 case =
is
a special.

>
>> +        return filtered_vendor =3D=3D candidate ;
>
> Nit: Stray blank.

Oops.

Cheers,
Alejandro

