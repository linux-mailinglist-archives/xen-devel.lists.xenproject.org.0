Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKdNMuajqml6UwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 10:52:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92E21E3F9
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 10:52:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247519.1546100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRqU-0004sl-HT; Fri, 06 Mar 2026 09:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247519.1546100; Fri, 06 Mar 2026 09:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRqU-0004rI-EX; Fri, 06 Mar 2026 09:51:46 +0000
Received: by outflank-mailman (input) for mailman id 1247519;
 Fri, 06 Mar 2026 09:51:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfUi=BG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1vyRqS-0004rC-NE
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 09:51:44 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 116daccf-1942-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 10:51:38 +0100 (CET)
Received: from SJ0PR05CA0164.namprd05.prod.outlook.com (2603:10b6:a03:339::19)
 by CY5PR12MB9053.namprd12.prod.outlook.com (2603:10b6:930:37::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:51:33 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::1a) by SJ0PR05CA0164.outlook.office365.com
 (2603:10b6:a03:339::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 09:51:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:51:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 03:51:31 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 03:51:31 -0600
Received: from [10.71.193.38] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Mar 2026 03:51:30 -0600
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
X-Inumbo-ID: 116daccf-1942-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdY6W02NzBT6Ytc9SZmxr3tMC8fDCZfhekFpbTYelh5BIUoaC+UJvSX4Zztp8AaZJJWpCNUb6UIjXlZ5B6kOX3gGItItRo1dtHIbY5DQZ7fei8UMwyCgEjMpARE8+UYW7nVh6li4JThm1ux8i73Gb5OIi/NreBpOwS7oipXVTPCbK6stYeVN4JXkNFAzjFxv6gTmGyXH6+bi5Vg438j2tzvZTGwvDB+Ilh/WY0pFlxPdn7WJYZ7/KYnTsrp6PVsG6BpzeSyaTQyzZJPmSRxhj/Ie2N5702iVqPZ5LnL/e+nSDI8ozcqNmWbpUyZXVnaKfp9Ix5QiF/r8OVByYpLDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGZFDK9QIGeO2suqIMiWdlWd1ku7OPxRvj593QqKcbA=;
 b=k6wtJNyOO4V9gC5a/GWMxok4WJKxRT+i6/nIlyLWaJKPCaKIVcfr1ZC6pCjVzHmmC+ggPbMyAvp8eEXzWzLb9jngMlTX9uKx5qcHOYcQXBkzh8RaFIBvorjhKf3j1PHZYI09EdcYwadYRG2KbSYzZqxtU9B1Bv6Z7Tyt5gjmLx24ahvU4jwx54CnK8dA+jdohvz7vh40JT9dNYfDwOTAnkUEcKyzgaUBxwqJuPl6B2ROMXYo0sz8nwGMiltEIx1BUirG+BEXOwn+yIJl/N7gym0Y1U47S36J5n+JEFFA2FfMtWIR1fk80g5Z8vmdTrJm2etpO5NLRFhd55Z/L3VO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGZFDK9QIGeO2suqIMiWdlWd1ku7OPxRvj593QqKcbA=;
 b=xP2mrHBDcQF/AwqU1aYgfjhJwfu+honXdYg2F2visyeAp56coAup/wxfs5+HsmfnMvqtB1R5j2HLSsnvdKpM7AjADq5GjPp0h1pHkVODJZFdvbo8Eomj46FnYgvTigrGLezN3Up1LCwZSipGVXmHKyQ5vWNP7zR/usxvKlThdFw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f10e2a5e-446c-42f2-b9ce-44498acbfb1e@amd.com>
Date: Fri, 6 Mar 2026 09:51:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
To: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260305194358.2564387-1-ayan.kumar.halder@amd.com>
 <f1a5a509-bc6d-4616-872c-c5bb1ecf9da7@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <f1a5a509-bc6d-4616-872c-c5bb1ecf9da7@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|CY5PR12MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e4801b-0ef3-4e58-14ec-08de7b65f240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|30052699003|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info:
	yYnKyjQjRFIOeip+FDQOm2o6LvPgXoNk2ZBgfV7XW9RrPEU6WGOzJ64tSxK8inMOHAYZ/up0d3s6YGEf8owbiEfxoSABbQpZop9cxnWaLrHJ7X4y6eIp7xrFTAMMPfYyW0g3VX2ocwiIBW+68zf8uAXIYJGCmBxXzO4SyITM29qjLBWyNVVCjkutqmqChc4vaMT+qiSwzB8IZSZmJO4rc3TYYnfi0ic0CFm2VQSCZID/EHpHFg8PEWcQAeXotKowi//Ro0SlBqTI+7bfCbsOlOb36u3dkrB0qobICZS2pKjoIeOF8OIuxrC21xCK20OPbQpFnIJgTPqrcAvZ0XiMog/G0Av7OjSFa0r/oa5/FBZLb4RCG0PB93UXlBNS5hboOxBADLPBL0eKYuCQfa1Q97oyxzPxM7B9aYU/AhqXLikgCdQd+9haRhLjHKS9s3o7btXhMzMIZlzdLJBLtR6VAd69jG8uptU6UT6QzYTBSm8b4K11g6RgjPno8KW9TfFdxz8UQ+3wfpd56/dEtpaUWQEqJLJGzX53OGX8LVryFetngGqVcnBM0cEHXUqsjO+QywIIxY32wCsghSXhdIjlnaScyO714Laa5vogpwCpCwVoi6+sFAsBR4riuk0qtQ44igtnVELuaY+aYqBBe3O27sAa/1JCDBBmIg3ds2kr1NfZnvaRlG5nMW86FOas4WD2dLyKgMdll0o5kcd/YUyQzpdovOVcIgCK+jw4npw9f3nNOilgcY92jSZ2nNY13ZGsjYLawI0EfYK/rwK+JOGk2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(30052699003)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3RUc/GLAZ8hKe0yYnEndv4/IOJSFNiSXTBDCxNycPuzj3VJ74pIaSS82X8Cy8Co2Sf9ltbIR+Y1bX8E6jllfVOoYZvb/2Ts4CvtEdnINN/e3FbznUtyh/WdCLjl0lc9AoQywLqK4YYFgWG7c94khK7NQ4Esc4ZxVmNYKRHUCHGW8OE3HYuWF80Anqdkeq+r4M1QQDmjoXxJRQTlRrAkKwDTNjFagZkkvJJVP2WDpmEyRiezKl4El/XVOJJFiq8QoW432D0zAsJpLLlk+1uJYgnvbPt2NHG5BeWAwArOw8Yk1aPPz7dq/lO53pebqP/BZIr5DBy8j5sjc1EREiwHIiOtgMFHmp7JHN/7zxdGRuqrJ0G8VG4SoejaSV15Ulz+CL6l72nwRWxfZm6K/HzAaW3ahrxde7wiChi5RQRNdkgwymxDLyRcFUDy1BdzxiJXq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:51:31.8054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e4801b-0ef3-4e58-14ec-08de7b65f240
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9053
X-Rspamd-Queue-Id: 3F92E21E3F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On 06/03/2026 09:24, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 05/03/2026 19:43, Ayan Kumar Halder wrote:
>> Set GICV3_NR_LRS as per the number of list registers in the supported
>> hardware. This ensures:
>>
>> 1. In gicv3_save_lrs()/gicv3_restore_lrs(), use the number of list
>> registers from GICV3_NR_LRS (if defined) instead of gicv3_info.nr_lrs.
>> This ensures that if the hardware does not support more than 4 LRs
>> (for example), the code accessing LR 4-15 is never reached. The
>> compiler can eliminate the unsupported cases as the switch case uses a
>> constant conditional.
>>
>> 2. Similarly In gicv3_ich_read_lr()/gicv3_ich_write_lr() , we can
>> justify that the unsupported LRs (4-15) will never be reached as Xen
>> will panic if the runtime value (lr) exceeds GICV3_NR_LRS. Some
>> compiler can eliminate the code accessing LR 4-15.
>> In this situation, using panic() is better than accessing a list
>> register which is not present in the hardware
>>
>> 3. Whenever GICV3_NR_LRS is defined, the default condition and the
>> related BUG() cannot be reached at all.
>
> I am not sure how this is better. You will still crash Xen is 'lr' >= 
> GICV3_NR_LRS. Can you provide some details?
>
> > > As part of functional safety effort, we are trying to enable system
>> integrator to configure Xen for a specific platform with a predefind
>> set of GICv3 list registers. So that we can minimize the chance of
>> runtime issues and reduce the codesize that will execute.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/Kconfig  |  9 +++++++++
>>   xen/arch/arm/gic-v3.c | 12 ++++++++++--
>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 2f2b501fda..6540013f97 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -276,6 +276,15 @@ config PCI_PASSTHROUGH
>>     endmenu
>>   +config GICV3_NR_LRS
>> +    int "Number of GICv3 Link Registers supported" if EXPERT
>> +    depends on GICV3
>> +    range 0 16
>> +    default 0
>> +    help
>> +      Controls the number of Link registers to be accessed.
>> +      Keep it set to 0 to use a value obtained from a hardware 
>> register.
>> +
>>   menu "ARM errata workaround via the alternative framework"
>>       depends on HAS_ALTERNATIVE
>>   diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index bc07f97c16..fb2985fd52 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -51,6 +51,8 @@ static DEFINE_PER_CPU(void __iomem*, rbase);
>>   #define GICD                   (gicv3.map_dbase)
>>   #define GICD_RDIST_BASE        (this_cpu(rbase))
>>   #define GICD_RDIST_SGI_BASE    (GICD_RDIST_BASE + SZ_64K)
>> +#define lrs                    (CONFIG_GICV3_NR_LRS ?: \
>> +                                gicv3_info.nr_lrs)
>
> We should avoid lowercase define, in particular with generic names 
> like 'lrs'. I think in this case, I would rather update 
> gicv3_info.nr_lrs:
>
> gicv3_info.nr_lrs = min(gv3_info.nr_lrs, CONFIG_GICV3_NR_LRS);

But we want to enforce the user to set CONFIG_GICV3_NR_LRS , so that we 
don't have to rely on gicv3_info.nr_lrs.

The only reason to use gicv3_info.nr_lrs is for backward compatibility 
i.e. when the user forgot to set the config and as a result it used the 
default value as 0. We don't want to allow this for the safety use cases.

>
> This would solve another problem where you don't sanity check that the 
> system effectively support CONFIG_GICV3_NR_LRS.
>
>> @@ -121,7 +123,7 @@ static inline void gicv3_save_lrs(struct vcpu *v)
>>   static inline void gicv3_restore_lrs(const struct vcpu *v)
>>   {
>>       /* Fall through for all the cases */
>> -    switch ( gicv3_info.nr_lrs )
>> +    switch ( lrs )
>>       {
>>       case 16:
>>           WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
>> @@ -178,6 +180,9 @@ static inline void gicv3_restore_lrs(const struct 
>> vcpu *v)
>>     static uint64_t gicv3_ich_read_lr(int lr)
>>   {
>> +    if ( lr >= lrs )
>> +        panic("Unsupported number of LRs\n");
>
> Do we really have to panic in production build? Wouldn't it be better 
> to return '0' and maybe use ASSERT for a crash in debug build? Same 
> below.
You are right, we may not need this. One option I am thinking is ...
>
>> +
>>       switch ( lr )

switch ( lr & (lrs - 1) )

This ensures that we do not hit the unsupported cases.

- Ayan


