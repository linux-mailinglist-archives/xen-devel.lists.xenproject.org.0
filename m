Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFWSEsky42laDQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2026 09:29:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1E64204A0
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2026 09:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284842.1566394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wE06j-0006OM-9X; Sat, 18 Apr 2026 07:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284842.1566394; Sat, 18 Apr 2026 07:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wE06j-0006Me-5n; Sat, 18 Apr 2026 07:28:49 +0000
Received: by outflank-mailman (input) for mailman id 1284842;
 Sat, 18 Apr 2026 07:28:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wE06i-0006MY-0L
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2026 07:28:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wE06g-00BkpQ-Rz
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2026 09:28:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69e3325e-bab6-0a2a0a5309dd-0a2a450990aa-40
 for <xen-devel@lists.xenproject.org>; Sat, 18 Apr 2026 09:28:46 +0200
Received: from [40.107.201.29]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69e332ad-2497-0a2a45090019-286bc91d372b-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Apr 2026 09:28:46 +0200
Received: from BY5PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:1d0::14)
 by DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Sat, 18 Apr
 2026 07:28:41 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::e1) by BY5PR04CA0004.outlook.office365.com
 (2603:10b6:a03:1d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Sat,
 18 Apr 2026 07:28:41 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 18 Apr 2026 07:28:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 18 Apr
 2026 02:28:39 -0500
Received: from [10.252.194.40] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 18 Apr 2026 02:28:24 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZU4TI3Ix3u7+Gp2N7ionZBPyyE0XJDfOMVw8U/nkKGy8sSYXR4pMM1sCcVSDdFsabcO0SKHLZGHXGNv8m6SVXUBN+NpHbUrD37PJZN35LK0cgc0oqrCD5HOlroP/51dNnruMzFyU3jK7R08bAi2rrXiN6fByghSvo9O8bv464q6X2zIGBq0lFksgomT5eidNUsRbklUHGGnPwFG+pX7YniZza4GMYGS4tu+MXVpIDZ7cGmz1zGsOAgvuVKftcWW5I8nHk8Gw0BQLzUhnlhds6JlSRy0X7/+u44gKThGf5b3KwrHHCdhBap7ReZX5ugsf6O2FfX2zfgiXLI2SeQztJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVU1EW8nR4fo4UYfWYf3iKbf5HlwfDbGYK0qu8l56GI=;
 b=SkR/CqSVsiVjnA9TeDHRr9qFgS+B7qBT8OIqZLIJmrVf8IIvvJt0f309QqDo2/2TSU/I8E+QIt7Ac41GykyZ5EbxUzudA+1sb+iJxfguV3UfZVMTImCZoaYXFAi5dsK6HekC0gkDCo6jyqFjmzoR+ccHjYcmz+iQT+PgRbeprXtVEidvpO/McO3SXemEEfRbN/va1TiROFWNO159XjTdmnItwCsyLeeVrjc7pEdNHm7yfGAgRKQr08gcHeF8P7XdyUg9x8owwNcOmXnFAzvo7MRxd6y6BgVFlvGWDIRi+KLuJxXzJX3LHq2cZGyKbe1aIyAztML2nWklzH7wY4jLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVU1EW8nR4fo4UYfWYf3iKbf5HlwfDbGYK0qu8l56GI=;
 b=iHyISO3IJaOSXK/rmBXB1Ey/rqyGXlgBaMjgg8nakeysX68dOeEhM1Sgsp4IME54mMVuaSOqNUVvrxe86tICLsqqoVekggsCQA0yC0+5TR50Q4o0LWbslhwLe1W+e0mb+DmMZsxl9NWxvnrS1Y3tiUm0AGjp7H5wvgecflw3enA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f834927b-a5a7-4b83-8e0a-d24263554e26@amd.com>
Date: Sat, 18 Apr 2026 08:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
 <83786d8b-d57a-4c79-8e8b-7115d4276568@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <83786d8b-d57a-4c79-8e8b-7115d4276568@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DM4PR12MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: ae28e254-f83c-4825-c84e-08de9d1c1cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ad0P3/IGZesYojPP1NZWa0YcxcYzkX5mIoUDGDdCxBvmIOnG4vsUdp+8lPv9Cj+ggBCkuwlkAm4TttU/8OctpV4pikajbUEzOVTMk60NScSsA2ya3vUXjtVH/2zxAEuCxe+A9jkUDYr7uLLne53jlfbYw+qMJBalDO1+hpILoM00hvPKw/KybQ6X906gEAWqFhAhDVJyu0YVHs3Tqqc/jzTz03CiIgUvrF+jc7vsMOB3HBd3OL4pHbuLJSORnXa+0etW4wg4F/Hmz50jNwzMiqtM19+JaHJHiaXUEgnd3mSEjtdS6llmB/xrnRhq6ZJo2UCI08cs8lgqeimKIR0JPM9VWu2jU18iSMFv/M/JT2/Sff0JV6MIKtl0x3Rtbkx9aHFGkJgzyyU9VZghX1APhha/tWGZUWUPSzSJY3FZ6+bb9ZXXt08xFnbMHDieTqcHqvA/oqks23twy6K8Ro+NgdEO2KXJ/ll4z26Rubuu2W3KfIIbdDhujkW2oNY9K44NPzur8pKvyHhenT25M2bIbsWu/U3pEvSRnyV1oJnxnl+3YLUA36C11ATdFngnfaafG6gw/TMkd3HJPZ5ueOAer7IIAouJqh0WG06DNDk/A7rmweZO14Di4SA7QWHgkwjOoYVjs5wbmGcdsDoKQRMF7gKWT+5Rum/F1MEooHcoJYGlzyMbKPXQ1bcTQBF4JxgkM7zknbBPt5/L0VKlK1ekKc5/pvER0Apk49etw+tzNbbH0+VhN5+RfyRPrpI/+txEx6QEv5IlJuJ89ZIn7LkRjw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RuV1bVi4lqXlFMQ+uYGOyhCpR+K4n2bgN32lkSZ5vGiQv6czBLxXxLPaHv0HwELxNHZB/orB+mMMT/5aavIxnjJIHPXlFJk9WdHUlgXvw85/46FB+BJglIjHrYbBMWA0NTFE98WbdtI0TipzLNODqGa8vumTn874/9SiY0QsdJg8udHmXbKR1HyZsGFUoWlGwpART0/oVcj6HkNSQk62DFBXmkqMC+LyBQe0dgmBajTm1qLt93g6exntfV5BicOXWE+H9b9xWul5kZTZ4vzFU0zAP7HSLL355WwvvUrvMVb/NtN0S/iYnAi4sF2SHfch5wSI3r+2WIxhhVMtG9qhv85yvaO24jrEymzQ3npQ0uyo//Nhm7IFOKaDOgasvKhfA/zGMMUOKxLCGJpVm5yo4Q9P6yrcCNeJf78djHbuguE/ee8Sezub39Op/I0kU34u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 07:28:40.2151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae28e254-f83c-4825-c84e-08de9d1c1cea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182
X-purgate-ID: tlsNG-bad1c0/1776497326-484A9A53-1DDB3538/0/0
X-purgate-type: clean
X-purgate-size: 7195
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 8E1E64204A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 14/04/2026 03:06, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 18/03/2026 23:09, Ayan Kumar Halder wrote:
>> One key requirement of Xen functional safety is to reduce the number
>> of lines of code to be safety certified. Besides, a safety certified
>> Xen requires a static hardware configuration to be defined. This static
>> hardware configuration is described as per the test hardware/emulator
>> hardware configuration against which Xen is verified.
>>
>> Introduce GICV3_NR_LRS with the two aims in mind:
>
> Out of interest, why is this limited to GICv3?

This was just my starting point of investigation. My intention is to 
have as much as a static defined hardware configuration, so that the 
code that cannot be tested on the hardware can be eliminated by one of 
the many ways (DCE, Kconfig or actual code removal).

The advantage of having a static defined configuration is that the 
system integrator will have the full control on how to configure Xen for 
a specific hardware platform. And we try to reduce as much as possible 
any code that cannot be used due to hardware limitations.

>
>> 1. User should set the number of GICV3 list registers as per the test
>> hardware so that the unwanted code can be removed using GCC's dead
>> code elimination or preprocessor's config.
>
> We discussed this offline, I am not fully convinced you can rely on 
> dead code elimination to always remove the BUG() in 
> gicv3_ich_read_lr(). If you want to rely on dead code eliminitation, 
> then you will want to call a function which have a prototype defined 
> but not implemented (similar to what we do for bitops with 
> __bad_atomic_read()) which would fail a link time if the compiler 
> didn't remove the code.

If you are ok, we can break this into 2 patches

1. Introduce GICV3_NR_LRS and make sure it is used consistently in the 
code. IOW, it should address the comments that Luca and you provided.

2. Implement a way for compiler to do DCE based on GICV3_NR_LRS.

>
>> 2. By doing #1, one can ensure that there is no untested code due to
>> unsupported hardware platform and thus there is no safety impact due
>> to untested code.
>>
>> However if the user does not set GICV3_NR_LRS, then it is set to 0.
>> Thus Xen will fallback to the default scenario (i.e. read the hardware
>> register to determine the number of LRS).
>>
>> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
>> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
>> This ensures that if the hardware does not support more than 4 LRs
>> (for example), the code accessing LR 4-15 is never reached. The
>> compiler can eliminate the unsupported cases as the switch case uses a
>> constant conditional.
>>
>> 2. RAZ/WI for the unsupported LRs.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changelog:
>>
>> v1 - 1. s/lrs/LRS
>> 2. Implement RAZ/WI instead of panic
>>
>> Few comments which were not addressed
>> 1. Do "gicv3_info.nr_lrs to LRS" in gicv3_hyp_init() and keep the code
>> unchanged in gicv3_save_lrs()/gicv3_restore_lrs() -- This prevents the
>> compiler from doing dead code elimination as the switch condition cannot
>> be evaluated at compile time.
>> I am not sure how to get around this issue.
>>
>>   xen/arch/arm/Kconfig  |  9 +++++++++
>>   xen/arch/arm/gic-v3.c | 14 ++++++++++++--
>>   2 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 2f2b501fda..6540013f97 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>>     endmenu
>>   +config GICV3_NR_LRS
>> +    int "Number of GICv3 Link Registers supported" if EXPERT
>
> Supported by who? The hardware? Xen? Asking, because I could forsee an 
> integrator wanted to limit the number of LRs to something smaller than 
> what the HW supports (in a lot of cases, 2 LRs is sufficient).

Ack

  ... "Number of GICv3 Link Registers used" if EXPERT

So it implies a decision to be taken by the system integrator. Does it 
sound ok ?

>
>> +    depends on GICV3
>> +    range 0 16
>> +    default 0
>> +    help
>> +      Controls the number of Link registers to be accessed.
>> +      Keep it set to 0 to use a value obtained from a hardware 
>> register.
>
> I still strongly think that if GICV3_NR_LRS is set, then it needs to 
> be checked against the value read by the hardware
Ack.
>
>> +
>>   menu "ARM errata workaround via the alternative framework"
>>       depends on HAS_ALTERNATIVE
>>   diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index bc07f97c16..eaae95eb4d 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>>   #define GICD                   (gicv3.map_dbase)
>>   #define GICD_RDIST_BASE        (this_cpu(rbase))
>>   #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
>> +#define LRS                    (CONFIG_GICV3_NR_LRS ?: \
>> +                                gicv3_info.nr_lrs)
>
> IMHO, LRS is a little bit vague. What about MAX_LRS? Or maybe NR_LRS?
NR_LRS .
>
>>     /*
>>    * Saves all 16(Max) LR registers. Though number of LRs implemented
>> @@ -59,7 +61,7 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>>   static inline void gicv3_save_lrs(struct vcpu *v)
>>   {
>>       /* Fall through for all the cases */
>> -    switch ( gicv3_info.nr_lrs )
>> +    switch ( LRS )
>>       {
>>       case 16:
>>           v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
>> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>>   static inline void gicv3_restore_lrs(const struct vcpu *v)
>>   {
>>       /* Fall through for all the cases */
>> -    switch ( gicv3_info.nr_lrs )
>> +    switch ( LRS )
>>       {
>>       case 16:
>>           WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
>> @@ -178,6 +180,10 @@ static inline void gicv3_restore_lrs(const 
>> struct vcpu *v)
>>     static uint64_t gicv3_ich_read_lr(int lr)
>>   {
>> +    /* RAZ for unsupported LR */
>> +    if ( lr >= LRS )
>> +        return 0;
>> +
>>       switch ( lr )
>>       {
>>       case 0: return READ_SYSREG_LR(0);
>> @@ -203,6 +209,10 @@ static uint64_t gicv3_ich_read_lr(int lr)
>>     static void gicv3_ich_write_lr(int lr, uint64_t val)
>>   {
>> +    /* WI for unsupported LR */
>
> AFAIU, this path is really not meant to happen. So I don't think we 
> want to silently ignore the write as it would mean an interrupt is 
> missing. I think in debug build, we probably want to use 
> ASSERT_UNREACHABLE(). If we want something for production as well, 
> then we could instead use WARN().

Ack. I will use WARN().

- Ayan

>
> Cheers,
>

