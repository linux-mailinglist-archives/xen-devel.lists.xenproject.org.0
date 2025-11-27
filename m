Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF07C8E7FA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173839.1498835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOc9w-0006Ug-LS; Thu, 27 Nov 2025 13:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173839.1498835; Thu, 27 Nov 2025 13:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOc9w-0006S0-I8; Thu, 27 Nov 2025 13:35:44 +0000
Received: by outflank-mailman (input) for mailman id 1173839;
 Thu, 27 Nov 2025 13:35:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuYy=6D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOc9u-0006Rt-CS
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:35:42 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5c5897e-cb95-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 14:35:39 +0100 (CET)
Received: from PH8PR07CA0045.namprd07.prod.outlook.com (2603:10b6:510:2cf::14)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Thu, 27 Nov
 2025 13:35:28 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:2cf:cafe::77) by PH8PR07CA0045.outlook.office365.com
 (2603:10b6:510:2cf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 13:35:26 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.0 via Frontend Transport; Thu, 27 Nov 2025 13:35:28 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 07:35:21 -0600
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
X-Inumbo-ID: f5c5897e-cb95-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LU4sJwxxoWWaDaTnJATHK6LLknTbOBJMA/n48XAYuk8dRSkggCismerQL9Me7H2tVKbBrVuDfb8e2TxGTlvthbNMMneVmPic/QyMjfE1pmqaIkrwbWzL7dfRuzfy2n6zU+yG0GHR2vylotDdJdzf/AGIU7GNRApNWz8063/gOiPhnkc/FPMbHmOwk8/Qq7fK9XU2citt1+DzY40EO1p8YpHCFHXhnxGvANZOR11EoNN16wFaaPHah7lq8Qo/wgoI7TdxAOzCwjgIVUj0e4HRlE69HtT/eAn7lTnt0OA4f0cfN7Ag/kOWErQV0gYVDv59RoMFndnVVdlzxwnhlhK0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bX+Ra5hiAHCJPWIRL2zEekF2mv6h3m84b9MltReKLes=;
 b=sei7a7wgQDQ6MqabvRtSIFOyMyprSSXDZ4U6+Ze4Z1BRFUwCLFbi+YtiNtHh6r1HfxijIAES4qoPMB1qJyYMGM2MPo1xNJX2Ml+i/iCCpenoM1uUP1K+u+pnWNHruvnU26MAlMsyPlqHzSAXzasb1Zk0eAw95r0EBf/cnN5btmV8U4APrA8xqflaH2oT7AzkWB7WqkZrvMY9BmX2zV6UwlnklwdJra9ggIHHVWBCFAJQBSnRxikpgfcti3vT1CbL4HB+szSEob86drRlLClPqKvf3IS7lmCuAnVSzYv+TnyPM6BLZPFSJ24xI/4ywZP80OhIt8utFXXFVVqpQ9YqVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bX+Ra5hiAHCJPWIRL2zEekF2mv6h3m84b9MltReKLes=;
 b=puGlwJnxL1fRLF1aKEJRunWl4mlM+NFVLuOQs/Rl8msoUVRmR2GY8pboq9ruznO+6s/0cQ+EJ1GVnKyeUkjNqQcRUL/aTXiTPCiQrpYOCIWjI5Ml58oEsJFJjRl87GAoTkGMhid3+qL2rucRJTtgOWGbpMHmSVBHrOJ7RzKGG4M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Nov 2025 14:35:19 +0100
Message-ID: <DEJIM3SR50B4.2EEY2CX5KDM9M@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 04/11] x86: Refactor early vendor lookup code to use
 x86_vendor_is()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-5-alejandro.garciavallejo@amd.com>
 <ad217ce2-0b3c-4746-b32e-3b3bc7c9cc51@suse.com>
In-Reply-To: <ad217ce2-0b3c-4746-b32e-3b3bc7c9cc51@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 586a6bd6-0764-49ab-5e79-08de2db9d42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXRqWmZtTTMza09QbjBkNk1FQ0Q2QXVwQW11eXBMdjF2VDdqY0RYdHRvQ2JY?=
 =?utf-8?B?QXQzTVY1K01ja05BVXRBd081NVh5U3IxSEs1Z3RzOGQ1WmhzTHd5andKMjZU?=
 =?utf-8?B?Q1NRUGQzNEZuSmlwMzhIbU9ZaEZOS2UrU0VFTy9qc0xNUWhnS0xMZHFiT2I0?=
 =?utf-8?B?Q0FVdGlWYVVWMkpBemZSbU5hTHF0N2QxcEdHQXpRTGhYY3gyRE56elRVLy9o?=
 =?utf-8?B?VEozbWRlQlNORVgyem1vTmJoL1ZqZVJ1aTZRZW9oQXRHUitGdjFYdVJWb2dU?=
 =?utf-8?B?VTZ4L0JyK05VdG5hNlZlV1dId25pcGUxRWEreElFV0ZMMDlyVnloV082YmI4?=
 =?utf-8?B?cDArL0FGTXBJSktmWTJRemZPZm5YRnl4cHRiVklyUE8wZllKTFhkY3FPZEVs?=
 =?utf-8?B?S29KM2xJTHhhc2hzSTJoVVZyVTVXS1pmMkl3VlEwU2xZN1pxL0FTRWNCRnlu?=
 =?utf-8?B?UktNRXRuTW4zR0c1aGk3amRkNG9uOUJNYVJzd3hYK3FuOWNIakg4c3RwR2o2?=
 =?utf-8?B?cWNMSytNTVRLWXlQaDlkRFJWOXRYRU1jRTlDUHdBQ0RKMGU5a1F2VitXY1Jz?=
 =?utf-8?B?ZXZKZnJvdW9qcmxjUTJHV010WlZYZUEySDlmek1iZzVrNTlpZ2NiVGcyalFl?=
 =?utf-8?B?bWRvMDhaYThjOTdMVmxHS25oSFV0eFF2N0xhaldyR2FCWWFXOTdaM0o2Sk9O?=
 =?utf-8?B?UmcvWDRKRGJnRUZXNWxaWkRNVTdoc1dQYUF5N291OEhKakNicy9lY1l6NG4w?=
 =?utf-8?B?cDV1b0ZQeWRjU1FGZ0p3bDJqWmRreEh2UzdaT2lXejIwanJqUzlRSkswdjJn?=
 =?utf-8?B?V3diRmVQWDZrVFdUcGNWWEZPSVdLb0k0azMrNjVKSkJNWWRrZGxic3JCUk5t?=
 =?utf-8?B?V1ZLNTVleUNtTW5pWTRqb0JwQTRsdncxMGVBUXlNUlJwTTU1K2RQSkR3NSsx?=
 =?utf-8?B?TmZIYVcreXcySkhMNW1MMVdLajhSNHNxYlY5eEZXeWxWSVMrTTQvTjhTWG56?=
 =?utf-8?B?ODkxWVVkSlUzeSt4UDZLempEdy9RZWRKWURlS3hVU0RrRkZHL21VUURGcUJ2?=
 =?utf-8?B?WTV6c0VueFZhRTV0Vy9UcjBtQW1oNXFZQldEUFFKL3pHc0duZi9BM0ZiekxR?=
 =?utf-8?B?RUovL1V6NzluUHd4YTkySjFLdVNjT3FNaWNtMHlLRHRvaUE4M3F3OElVK0dJ?=
 =?utf-8?B?RC9UYnpKeVpXTENudCtxUGlsRzEySU9oR0FYcElpdG5HWUx6RnRsekQ5dGNC?=
 =?utf-8?B?aXJIS3NnV1BZYWRqQklwZlFNSlhlRUFhb0ZnN1JpQXVwbGkwWDNoRnpIR0s2?=
 =?utf-8?B?TmNQUUxCL01hNktROFZFTFR5U1JFL3RORnlucWdKVm5kMEFQWUZiNkpNaUZJ?=
 =?utf-8?B?azVJSW5CeG9lQU9TSGNhZ0xpYmJrWkVpQzNqVGdzb2FQaVhhN1dRd2R3M2xH?=
 =?utf-8?B?RmVORm1EaU5OWW1TNE91aHFvVkJldnB6ZEtOc21rbjVRZnJMMzlnNU1oS0ha?=
 =?utf-8?B?VXNNd2UwNi9JMGg3dFA5NjVwKytjQWZmVTg1UHJXUVRZTGVhZzdBTXVlWW14?=
 =?utf-8?B?c3VpcFdZUmsxWnQ0VnMzbi91NlIzZkI5dlp5YUxFMHFqVzE4TVB4djFmQlJv?=
 =?utf-8?B?a1UzQnZKaGRnOVAwakl1NmVYU3JyL2xyQk91VmZTYWFEaS8ybEdlV2xkaXlJ?=
 =?utf-8?B?N21sMUJoMy9EMXVRRWphTnRZbEFBVml6ajF1TWFTcnpOMWZ3TmRQQ29mdEgx?=
 =?utf-8?B?NzZ3YnBueXZVZUZQSGZwZElCSlhaWGVpUnlYcGFGbFJ2ZmVoOCtGSm1QcjNp?=
 =?utf-8?B?cDd1dkRYbHhyby9pa1VqSm1KdE9lZXNvZ1BJamJxV3hUenJFaERRamlId0RZ?=
 =?utf-8?B?dmxTQmozdGRjM0g5L0plOTNKeUFCcVdzZENsRnBGa2h4WXNHdzg2UHBoeFJV?=
 =?utf-8?B?OUd6RzUvWENFVGFkYWFaMUZVS0JwLzRvWVZoc2hMYjNlT2RsZndmV3F1K1VS?=
 =?utf-8?B?UUwrZFNMYW5vbUI3Smk5R1BLRnBiNUZGQTZhZG5VWTJiWmQ4UzEyUFVhSHQ4?=
 =?utf-8?B?N1hPbElDTkdSTFdnWndqMm1YSGo2S0VDbmlZbDcvYi9KWURqcWoyVEEyU3Rm?=
 =?utf-8?Q?8ZmE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 13:35:28.3924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 586a6bd6-0764-49ab-5e79-08de2db9d42f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013

On Thu Nov 27, 2025 at 11:51 AM CET, Jan Beulich wrote:
> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>> Move the "unknown" vendor ahead of all others and have it NOT rely
>> on x86_vendor_is(), as that would yield incorrect values for the
>> single-vendor+no-fallback case when running in incorrect hardware
>> (because x86_vendor_is() becomes a folded constant of the single
>> compiled-in vendor).
>>=20
>> This is one of the two places where x86_vendor_is() cannot be used,
>> along with the compatibility check on loaded guest CPU policies.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> ---
>>  xen/arch/x86/cpu/common.c | 31 +++++++++++++++++++++++--------
>>  1 file changed, 23 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>> index 393c30227f..c0c3606dd2 100644
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -342,23 +342,38 @@ void __init early_cpu_init(bool verbose)
>> =20
>>  	c->x86_vendor =3D x86_cpuid_lookup_vendor(ebx, ecx, edx) &
>>  	                X86_ENABLED_VENDORS;
>> -	switch (c->x86_vendor) {
>> -	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
>> -				  actual_cpu =3D intel_cpu_dev;    break;
>> -	case X86_VENDOR_AMD:      actual_cpu =3D amd_cpu_dev;      break;
>> -	case X86_VENDOR_CENTAUR:  actual_cpu =3D centaur_cpu_dev;  break;
>> -	case X86_VENDOR_SHANGHAI: actual_cpu =3D shanghai_cpu_dev; break;
>> -	case X86_VENDOR_HYGON:    actual_cpu =3D hygon_cpu_dev;    break;
>> -	default:
>> +
>> +	/*
>> +	 * We can't rely on x86_vendor_is() here due to the single-vendor
>> +	 * optimisation. It makes x86_vendor_is(x, y) rely on the constant `y`
>> +	 * matching the single vendor Xen was compiled for and ignore the
>> +	 * runtime variable `x`. In order to preserve sanity we must assert he=
re
>> +	 * that we never boot such a build in a CPU from another vendor, or
>> +	 * major chaos would ensue.
>> +	 */
>> +	if (c->x86_vendor =3D=3D X86_VENDOR_UNKNOWN)
>> +	{
>
> Nit: No mix of styles please. Here it wants to be Linux style.
>
>>  		if (verbose || !IS_ENABLED(CONFIG_UNKNOWN_CPU))
>>  			printk(XENLOG_ERR
>>  			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
>>  			       c->x86_vendor_id);
>> +
>>  		if (!IS_ENABLED(CONFIG_UNKNOWN_CPU))
>>  			panic("Cannot run in unknown/compiled-out CPU vendor.\n");
>> =20
>>  		actual_cpu =3D default_cpu;
>>  	}
>> +	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL)) {
>> +		intel_unlock_cpuid_leaves(c);
>> +		actual_cpu =3D intel_cpu_dev;
>> +	} else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD))
>> +		actual_cpu =3D amd_cpu_dev;
>> +	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_CENTAUR))
>> +		actual_cpu =3D centaur_cpu_dev;
>> +	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_SHANGHAI))
>> +		actual_cpu =3D shanghai_cpu_dev;
>> +	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_HYGON))
>> +		actual_cpu =3D hygon_cpu_dev;
>
> If it needs to be like this, then so be it, but I view it as a downside t=
o
> not be able to use switch() anymore. It's not quite clear to me though wh=
at
> extra gains the transformation brings. The masking by X86_ENABLED_VENDORS
> already does most of what you want, and X86_VENDOR_UNKNOWN continues to b=
e
> handled separately anyway.

In this particular switch that's the case, but it's not so elsewhere.

Any switch would resolve to an unavoidable runtime check with compiled-out
branches left out (so long as the variable is ANDed with the enabled vendor=
s
mask, which it currently isn't). However, this still forces the compiler to=
 emit
a runtime check in case the vendor is actually zero. The conversion to if-e=
lseif
ensures we can statically decide a branch at compile time and remove all ot=
hers
(including the default one).

On a more stylistic note, though obviously this is all subjective, the patc=
h
that migrates switch statements to if-elseif chains shaves 100 LoC and mana=
ges
to squash multiple checks onto single ones by making use of the bitmap natu=
re of
the vendor field. The gains there are marginal, so I don't care that much, =
about
that but it's a measurable benefit in LoC and a (small) benefit in codegen.

Cheers,
Alejandro

