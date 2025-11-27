Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A3C8E478
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 13:36:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173782.1498785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObEq-0004lf-E3; Thu, 27 Nov 2025 12:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173782.1498785; Thu, 27 Nov 2025 12:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObEq-0004iw-Af; Thu, 27 Nov 2025 12:36:44 +0000
Received: by outflank-mailman (input) for mailman id 1173782;
 Thu, 27 Nov 2025 12:36:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuYy=6D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vObEo-0004io-Mh
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 12:36:42 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7c87a50-cb8d-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 13:36:39 +0100 (CET)
Received: from SJ0PR03CA0038.namprd03.prod.outlook.com (2603:10b6:a03:33e::13)
 by CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 12:36:34 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::b2) by SJ0PR03CA0038.outlook.office365.com
 (2603:10b6:a03:33e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 12:36:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 12:36:34 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 06:36:32 -0600
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
X-Inumbo-ID: b7c87a50-cb8d-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPYji3hVNPEvPP1+HX99HY0P8HgzAwCzfFDjjJAIlzmGdchAsmu+itHtWq0TBJiD+ho5XK/CJN7CsXqVlcU4T7a1K5qh0B7//TMm7eAT2Ej3uiPmjiScYfmfSasU23Bm0KR2P9OeL0wJga3h6sSSoGoYzsWqQUB0mpofeauOeaIStHvbjByY+WF+iNDiTAgRUD12cr9liSgMo0Y+3UTeEOYCj3mQE5faiGApGDRD5fEYEHUnZc8SYKz2xpMjZZPumCNarqqaWzHyu7CiT3LmIwzjymKZCRLG16YADjDm5wVud+huc7g1AMuPdIiyA6Dv8CKGLA4UaMV8jSQTpVl4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lY2T4cOqfO9SP6BWPv2HqdiPTKYDvs7uorxHSZhMCFc=;
 b=ELIPfQWB8gdEBwny+kS36vEY0DBS59hR88agClkSg47O7Yloo/B+anI64Mx2eVjHK0x1MvqiC/Sl9Z8eYJBu8GmXyS4PZJ4OWjvY+VaANo6+tXMtx5AMonDzBZctXwLOiX+yeFtQo++XvebS7ETLVNgoh+bs0Um6iZBjGYs9oGrSYoSVVfVxRLM+DXvKjwSSxG6xHg4IYEdOhWchH94o7/lVY6/Ru9+kA/LiWzR/KzTgfESSWPbr/oE8+szmUNqllHBMjMEMTd+YD0b42bYuHy4ovK5IhzFcyyDJpJYJuyun9QxcF5rNeBJMBoqOZnCL9U+yxIfkl4t+KQxe2mbRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY2T4cOqfO9SP6BWPv2HqdiPTKYDvs7uorxHSZhMCFc=;
 b=a2HDoj9Urqr89Bvih8yTReHkMWcLNEYv613Awyy4JyoXoRH2Z797vXQIYJWCQYwbqwGNAVzmlrgrpgCjTjHngMYsxQL3wABtWLLHiK/+u6fk89fBJZZ/8qURGuq9uHhUJgwnjJzc/RGV+h32hKsBYKUPoWqhPDc9k8k69z8sxlg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Nov 2025 13:36:26 +0100
Message-ID: <DEJHD0L6BMLD.1IWHHEXGAHH4I@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 01/11] x86: Add more granularity to the vendors in
 Kconfig
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
 <868f28fe-f2dd-469d-a0cf-111885184dfe@suse.com>
In-Reply-To: <868f28fe-f2dd-469d-a0cf-111885184dfe@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|CH3PR12MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: f89fcefd-ad7d-463e-90a6-08de2db199f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXkyZ1lieDJSclJOT0JneXBJRHU5UFc2UmZyOVVVd2lRWkM0amllNzQwWGR0?=
 =?utf-8?B?ak5kMCtKSnZhK1dCaVlJYjA0akg5endBWXM5L2VYbHh0N1pLUWUxVHpJQkFD?=
 =?utf-8?B?Q05ZeXNXRXRWbklpUytRYlQ5cXMybkF1dnExSFI3MHIwa0l5bDZGOUNzdndD?=
 =?utf-8?B?OTFvcWs3dTZKS0pxYW9OS1h6a1JHTGc1YXJxYzdPV1E2QnVhVllhZWdlOEQr?=
 =?utf-8?B?OXdPSEF1Ni8zMFRlaGN3YWdORGdnRTZ0TGJORE0zRC93RlBYcWtqMHp3V3dk?=
 =?utf-8?B?VzE2eFloZXAvMTRvMTlRSytDSmpDWUZMVVBYV1R3blF6YjhxRGg2ZkY0Yk84?=
 =?utf-8?B?Rnc3cUlCVlJMeTVPYzJQd3pRZmxGWkx3cWhxNzRjTXh3WjFuSFZleDZRK0RY?=
 =?utf-8?B?b3IyQlQvTDRPUmJGUGR3dlAycHM4YW10djJPYXUrZ3VzWFkyR25TZHdvbUxy?=
 =?utf-8?B?alNTMnQ4cFlLd21JclFhT2VNKzU5dG1RV2dQNWNTSnhJZlQrcm8rczZqN3hQ?=
 =?utf-8?B?S0dSc21nYmNYd2s1c01TUmxqZ3lOZ2tNeE5tb3cvN1dQZFBWdDNHWWpkdEhh?=
 =?utf-8?B?b3ZpUU90Q0ZvVUxqMml3c3RJenIrU1dLQnV6TlRaNVhuQ0xwaVI3ZFFzVmZ6?=
 =?utf-8?B?aE1CWXMvVFh0bmp3c0Uvb21BU2NLRTBNN1NyR2ZTOFIxSy9UZGZiN3JEdDRj?=
 =?utf-8?B?SUIvVHgxcTQwcUhERFkwSEwzS2NTQ252WVpadTRKZ3M0L29rRWJpV0JGNStx?=
 =?utf-8?B?bk1MY2cvMjVYbzhpcFFXbUFqNmpsRW1sL0RWZWV1REpMVnRac2FKNkVkSUY2?=
 =?utf-8?B?Z3lTVXFUUkNjYVBoWi81Z2NGdE5nV0h2UnNQQ2p6MVFrUkdHNitSQU84ZzhP?=
 =?utf-8?B?ZUdaTUppcXZKRHUvSm54L3RiSmZ2Z1dDS2dTMWRhc1NqaUdDcDFNUTNXNitG?=
 =?utf-8?B?R2NiMkQvUkViTlYxSFFmaVBOQVNWTGdDd3ZHUE9WMEFRT1JmL2ltUGtrVnVQ?=
 =?utf-8?B?ZnVmMmppZ1d4TCtpK3ZYczIyVTVIb3ZLdjdwbmVnN0N5clZzZlowQmNseTd2?=
 =?utf-8?B?Ympsb3lxU1FFUUpOeHVkQXJEQnJwZXluTDFVTVdzMGtvWStYT2ZrOGc1VGpo?=
 =?utf-8?B?OWhMNWlET0NZTzl3dzhwa2VkSGVDb2RSMFFTckg4TkZjQUs1ZkJXeWthaTN3?=
 =?utf-8?B?dS9EbklNRlZxYXZNMG9ZdklBRHNmdC9uR05wMDQ1V2lNdUxiRmdoVFZtK3Zs?=
 =?utf-8?B?clVWSnc5cC84SW9Qa296RmhIbW5qTDh5Vkd6K3VVeGUzY1phSmZ1RXpDOGtU?=
 =?utf-8?B?QjZQeFpXdGpvM1JSZ2ZCNnIyV0diUitYTVhkQkNQL1JBbmFRYUlnUGtMRk8x?=
 =?utf-8?B?ekNvYittdWtnVXc2VDdmU2pJYU1ETjR5bVJxSk92NTYyYnV5RGs5SEpKQkYz?=
 =?utf-8?B?TmxsZzF3T1RvM0Y4RTlwVTd1SVNOSjZNeVg0VlFvMWd6WkE0aGpzVXVtSkdD?=
 =?utf-8?B?VElRM2hEaDhyQXFRZ3IxNUZ6d2E3RUppTnZBQllmODJONnc4Yy9oMTdxSnRv?=
 =?utf-8?B?ODFsUWtaTTJzT0o0VVNKOUtaY2NDaml1RE5KWWt0NUJXSVlhMGR2emdlWEtq?=
 =?utf-8?B?YVN3cjJORWxLMW9xRms4aXlENHNNWTJZZnBuQjVxL2hRWGRBakltZm10Sm1N?=
 =?utf-8?B?MXNtV2F4SDl3REF0WmdPSjZKZlgyVGdtNk1aZGdBQ3g4ZDB6NDk3VG5ESU5U?=
 =?utf-8?B?U1pGcU1qTnFNdSt6NTh5SEFWcGtDYlR2emhDYTgrSG1YNGlPUFp5MkZXOGJK?=
 =?utf-8?B?cWFRQkVkZ0FmL1prOXlzVXNrK0Z4bDdFNFp2S01jMjRRZmdZUVdiR1hPUFow?=
 =?utf-8?B?djV1Ym9XVmxEOUxQR2ZJbDhWSUFnVVZUQWtFUWpJU1ZmTEtSdXppVUhqa0VS?=
 =?utf-8?B?aEluMVEvdkNVamZNSVJ5Yk45dWwvSndtZkEwUjdLVkN1Uzc0ZGpXbjhlZHZu?=
 =?utf-8?B?bEwxMXU3c0dpZVZ1TmZ3TFZqRjdIbVR6UkQ1ZzBGRTQ2eUh5QnVyWDdBbmtX?=
 =?utf-8?B?cG1EbGptSEZKTmZBanNMTEhPTUMzbWVTTG9YVmRFTVhNWGZiWmxMZnBIOU1L?=
 =?utf-8?Q?mI4k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 12:36:34.7120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f89fcefd-ad7d-463e-90a6-08de2db199f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284

Hi,

Thanks for taking the time to look at this

On Thu Nov 27, 2025 at 10:43 AM CET, Jan Beulich wrote:
> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>> This enables very aggressive DCE passes on single-vendor builds in later
>> patches, as it will allow most vendor checks to become statically chosen
>> branches. A lot of statics go away and a lot more inlining is allowed.
>>=20
>> In order to allow x86_vendor_is() to fold into constants, expand Kconfig
>> to have the full set of vendors. Adds Hygon, Centaur, Shanghai and the
>> default path.
>>=20
>> Have Hygon depend on AMD, and Centaur+Shanghai depend on Intel.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  xen/arch/x86/Kconfig.cpu         | 45 ++++++++++++++++++++++++++++++++
>>  xen/arch/x86/cpu/common.c        | 17 +++++++-----
>>  xen/arch/x86/include/asm/cpuid.h |  7 +++++
>>  3 files changed, 62 insertions(+), 7 deletions(-)
>
> Shouldn't patch 5 be folded into here? Or, if there were some dependencie=
s
> on patches 2-4 (albeit I can't spot anything, as the files are all self-
> contained), at least the parts which can be done right away?

I didn't expect that to work before transforming the switch, but of course
the prior & X86_ENABLED_VENDORS is already telling the compiler which switc=
h
branches are unreachable.

Will do and send soon as non-RFC if there's no objection to the full vendor
palette (including the unknown vendor case) being on display in Kconfig.

>
>> --- a/xen/arch/x86/Kconfig.cpu
>> +++ b/xen/arch/x86/Kconfig.cpu
>> @@ -19,4 +19,49 @@ config INTEL
>>  	  May be turned off in builds targetting other vendors.  Otherwise,
>>  	  must be enabled for Xen to work suitably on Intel platforms.
>> =20
>> +config HYGON
>> +	bool "Support Hygon CPUs"
>> +	depends on AMD
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Hygon platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Hygon platforms.
>> +
>> +
>> +config CENTAUR
>> +	bool "Support Centaur CPUs"
>> +	depends on INTEL
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Centaur platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Centaur platforms.
>> +
>> +config SHANGHAI
>> +	bool "Support Shanghai CPUs"
>> +	depends on INTEL
>> +	default y
>> +	help
>> +	  Detection, tunings and quirks for Shanghai platforms.
>> +
>> +	  May be turned off in builds targetting other vendors.  Otherwise,
>> +	  must be enabled for Xen to work suitably on Shanghai platforms.
>> +
>> +config UNKNOWN_CPU
>> +	bool "Support unknown CPUs"
>
> "Unknown CPUs" can be of two kinds: Such of vendors we don't explicitly s=
upport,
> and such of vendors we do explicitly support, but where we aren't aware o=
f the
> particular model. This needs to be unambiguous here, perhaps by it becomi=
ng
> UNKNOWN_CPU_VENDOR (and the prompt changing accordingly).

Right, what I do in this RFC is have compiled-out vendors fall back onto th=
e
unknown vendor path. Because it really is unknown to the binary.

I could call it GENERIC_CPU_VENDOR, or anything else, but the main question
is whether a toggle for this seems acceptable upstream. I don't see obvious
drawbacks.

>
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -118,7 +118,7 @@ static void cf_check default_init(struct cpuinfo_x86=
 * c)
>>  	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
>>  }
>> =20
>> -static const struct cpu_dev __initconst_cf_clobber __used default_cpu =
=3D {
>> +static const struct cpu_dev __initconst_cf_clobber default_cpu =3D {
>
> This change isn't explained in the description. __used here was introduce=
d not
> all this long ago together with __initconst_cf_clobber. Maybe this really=
 was
> a mistake, but if so it's correction should be explained.

It wasn't clear to me why __used was there (I assume it shouldn't have been=
),
but it definitely clashes with the intent of having it gone when UNKNOWN_CP=
U=3Dn.

If __used was misplaced to begin with I'm happy to get rid of it in a separ=
ate
patch. I don't think it warrants a Fixes tag, though.

>
>> @@ -340,7 +340,8 @@ void __init early_cpu_init(bool verbose)
>>  	*(u32 *)&c->x86_vendor_id[8] =3D ecx;
>>  	*(u32 *)&c->x86_vendor_id[4] =3D edx;
>> =20
>> -	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx);
>> +	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx) &
>> +	                X86_ENABLED_VENDORS;
>
> May I suggest the & to move ...
>
>>  	switch (c->x86_vendor) {
>
> ... here? Yes, you panic() below, but I see no reason to store inaccurate
> data when that's easy to avoid.

That's intentional. Otherwise further checks of c->x86_vendor in other part=
s of
the code may not go through the same branch as the one here.

>
>>  	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
>>  				  actual_cpu =3D intel_cpu_dev;    break;
>> @@ -349,12 +350,14 @@ void __init early_cpu_init(bool verbose)
>>  	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
>>  	case X86_VENDOR_HYGON:    actual_cpu =3D hygon_cpu_dev;    break;
>>  	default:
>> +		if (verbose || !IS_ENABLED(CONFIG_UNKNOWN_CPU))
>> +			printk(XENLOG_ERR
>> +			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
>> +			       c->x86_vendor_id);
>> +		if (!IS_ENABLED(CONFIG_UNKNOWN_CPU))
>> +			panic("Cannot run in unknown/compiled-out CPU vendor.\n");
>
> The text reads somewhat odd to me, "run in" in particular. Also nit: No f=
ull stop
> please at the end of log messages, except maybe in extraordinary situatio=
ns.

ack. As for the text, might as well be just "Unsupported hardware\n". The p=
rior
printk already gives all relevant information. The particulars on the text =
can
be argued after I send a non-RFC version.

>
> Jan


