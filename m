Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9296A0738B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868071.1279610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpxc-00085Y-IA; Thu, 09 Jan 2025 10:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868071.1279610; Thu, 09 Jan 2025 10:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpxc-00082l-FD; Thu, 09 Jan 2025 10:40:20 +0000
Received: by outflank-mailman (input) for mailman id 868071;
 Thu, 09 Jan 2025 10:40:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjpQ=UB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tVpxa-00082f-TD
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:40:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2417::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ccd21f6-ce76-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 11:40:16 +0100 (CET)
Received: from CH0PR03CA0053.namprd03.prod.outlook.com (2603:10b6:610:b3::28)
 by DS0PR12MB7558.namprd12.prod.outlook.com (2603:10b6:8:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 10:40:12 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::88) by CH0PR03CA0053.outlook.office365.com
 (2603:10b6:610:b3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.10 via Frontend Transport; Thu,
 9 Jan 2025 10:40:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 10:40:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 9 Jan
 2025 04:40:11 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 9 Jan 2025 04:40:09 -0600
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
X-Inumbo-ID: 1ccd21f6-ce76-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s08GleCleiNzRpuKaCMkmJQMkvADMTGsjZX22b+Iat1pR6gUsfWGF7jpFA6kgHevaOeA3PBASPV65DBTubFOpN9QOjaNzuK+7segskuNqMUCC6LD7zqTu7N4WYH+L493y1w8sWV17kWZI4s6osB9jmnKSHw1cojYs7pXRL9YQRfb85rinE5sgGy02qsNA1i5m3qixD2IJz3XIlbcdbossChC87FyqzNS11mTZatVODQom9uGguRBkALhNxo89tJICtLUhKOKK+DnHjWCYC15NvvlALUJyerkTG/+mpApGUpzhZrLj/b/FkuR4N/nP5cW/9n0belpQZpOueAD0rFBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3uFLwah+omgXXutzDQHS5DnICGLb/iZ8oPUrNnKKuQ=;
 b=KlpAWn7aNT6MG/kZxVpXR5FsWm93x9zTAFi/hu33C84LXwCvitr2JCUXPB0h1Keb69CKXvnKrXWPc72uGRovS+o+Sv/YXCoqJsOBqCDvAItYyDoBsXwkYh/SfIl2QWmcT6meWgpN3Uj1XuTlEx8a4ChU8TBNjHL0KwGJ9rrmNdeoNHjzc54beQfqc2o5ry6bBPBbKMd8QNqQbQQeDCtfe23bqu7eyjWEbZ5fN7pwB88R9wazQ19u/Nx0ECrbyY5exjAf91LP9I5edxhiG7Pb5RNeYmxnIc92DxvdWePijP71D0ICkW/8QFWZVKK4bkB1mrAZMH7B3l0YNRkNEkJbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3uFLwah+omgXXutzDQHS5DnICGLb/iZ8oPUrNnKKuQ=;
 b=LESylf6Y8lmWFNrijG8+KTHfkvrI4u7xw/R5J7yfZO+rTIncllciE8qqnJvZ526/+SRurUqmh11SOJJO6mkjrcRgK/m47dQZw5AV9z/BWlpNcalA98hf2uppyTcIik/0H/c8ve4Prs+1/LQt9TnDaVwkkrMLjtUxeb2eLUzwiHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c6a02fdc-96a7-412d-8517-c1aa308648f6@amd.com>
Date: Thu, 9 Jan 2025 11:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Fully initialise struct membanks_hdr fields
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250109092816.1619834-1-luca.fancellu@arm.com>
 <e9477b85-1c9a-4aa6-b7fe-90286fcd461b@amd.com>
 <7D68D11E-E4EF-4521-9017-112DAA2B9B11@arm.com>
 <822cde40-a4a2-4d25-90e1-5421caa7b334@amd.com>
 <3F4D5A7A-0999-417C-91E6-3EE2ECD4759A@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <3F4D5A7A-0999-417C-91E6-3EE2ECD4759A@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|DS0PR12MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 889e4f22-d864-4731-899c-08dd3099febd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3ViNUt1R1V0bWdETFFJcHp3dURuOFNmVS9oZndrT203Rm9GZm5mMjFzelZm?=
 =?utf-8?B?ZGptYjUxTE5GM3BNV2QxUGZDT3JCd1pQZmNaZStjUWlpTm1BbjhpTmpYdEZT?=
 =?utf-8?B?bDgraE9OTU42ekNrRDV2Wk5FSjFIdW10bGJzam5VbzB4RTQzSGROSXpYaXcr?=
 =?utf-8?B?ZG05QW5SOFBOd3JUZTEwYjZyM3pSelRNNnFkaEVHLzErTkt3ZWg4WXh5MURY?=
 =?utf-8?B?TDRqdWNnUElnVVRKdHVUNzFZdlFuR0lhbkxGaVE3WHZkaHp5aDRaTHlPTjZl?=
 =?utf-8?B?SndST0dsN2pkcStCclpDaEJ0TVkwa0NrTWxVOHdCbWtuVm4rclVkTzluR1JT?=
 =?utf-8?B?TU05aUxKbk1aN3V6b3Y4azhNbDUzckxyVUplV3J1NWxlU0c2SlFRNXNoRFh5?=
 =?utf-8?B?Yzcva254WHp6MmJWdVJlbDRWelhocFA5cFVjeEJLWElkUzUySlkzUExBMnlV?=
 =?utf-8?B?UEc2d0l5RjU3b1VoZzcrTVpoSDhXOVYwb2t2eWowNjlYcXNmSEV1WVllM3JN?=
 =?utf-8?B?aGFXNWVORndydnJpZUZiYkNBRjc5MVVmdFhiR2U4Yzg1SzByUjJJM0lnRHEx?=
 =?utf-8?B?NEpxejdYYVlNME5NejVyTGhjZmhrNWVmWHVXalVhQXA0RTRnREFCSUlDSkN2?=
 =?utf-8?B?bVR1Y0pjU2hudkxiOUdnNUcyaXdUY05JQnhCMDN4bGxLTzUxRFJnR1I5cGZn?=
 =?utf-8?B?UFAvek5aeUlkYXZERFlEakhXN2Y3L3cvYXk1RE9nRnNtZWpWa1laVWFyRXdT?=
 =?utf-8?B?THFROUFaTEx6SWt5TG5oUzFBakk5MXZlYlZyM05Jckcyc0U0Z2V5S3pVWURx?=
 =?utf-8?B?QWg1c0JYaUx0Rm80RUJRZ1BFamw0eDk0M3hMelFmVG1UZVdUdU1oWktJNG04?=
 =?utf-8?B?TTR4OUtYbW1mVGR4M3JmSTJUR29qdjVseGlSWk5IZjVHbXd4bENvQ2ZadGsy?=
 =?utf-8?B?RXRJK25KTnhUQjlWU2VkMi9QZ1RKMjIvUG8rVkhKaWpObC9XYUJTaWMyY0NG?=
 =?utf-8?B?VVcvNW8vU3JFSDMwRithbEdIQmI1WVAvRmlkZktRYzZiZWJ6YmVMTG84emRY?=
 =?utf-8?B?cDBxYjAyYkNGQ1hxMHd3ZHVudTNmMlB1UUw3ZlM2c3VVbTliaGtJYnkwQm9U?=
 =?utf-8?B?SVA5S1FwWFNvdXg0ZzdkNEJGMXZnaktBWkpiUFk3UnFjRUdKT2JrR3JDRmF2?=
 =?utf-8?B?N3RtMC9NL01EVHVpcUtrdlBuSjRsNW1oU2NMeENRMWdVZ1lGU0VZdG5majZ4?=
 =?utf-8?B?S3JWbVVQdkxqdVZ2V2pNbEZDMlpaN1NSTGtvbW1LMnl5Z0x4aHozcXpoWHVh?=
 =?utf-8?B?ak5IR2V4NWZIMTZDU1Y1TXJHTkQxZ29WRkFqSGU5YTFrRThEdnBZN0liNnpQ?=
 =?utf-8?B?aFFsNG91bW8ybjBKbmFNenhXZGhKZ1pUdTJxNERmZlVqRmY5M1dNTzlVd3dW?=
 =?utf-8?B?SGJwTGJOMWUwV2JYdFJVS2V2Yit3N0tLcVpMV0diVkFCQ25GcmtsL1p4R3pu?=
 =?utf-8?B?ck5td21VajVJZjNEZ3Y0STFaSVhxcXFhWkN2K3lzNmdVZEhoKzJFNlF0eHdJ?=
 =?utf-8?B?VjIrNVJIQVd4eHpsUUVxY0lpeHhsSDgzM2dubCtRR3NTYU9PYzkweW1uUWdi?=
 =?utf-8?B?M0hWcW8zdEtybitldkV4ZjB2RGlkSHdqSHBLT1cvM1FyajZxY3JoWllhc25O?=
 =?utf-8?B?bUE0b1QwN0pGWWs4K2VOMGV3Y20zaHVVYmd3am9tZEozdmVxaTh1a3dkRXR0?=
 =?utf-8?B?WnZYMGRHNWVDOTlTNE1EZzJPVDllTUg1S1F0WXlsK3dFaVNXak9FOEswdldL?=
 =?utf-8?B?bzZRN2hWOE05d3FYbVJKUWRJT01UYmZrM1FLOEYvSXVqd0lPYVVUN2FhczRQ?=
 =?utf-8?B?YXEza3BPSUt4eHhaemVzNDVBTXFwa1VtMWdCUkVkQVVGVzVaMHN0QmhVbUpv?=
 =?utf-8?B?bFRLV3lxcHdGOTV0T0tZWW1wWjNHM0RxSkI5RHRqYXVPb1pua0JBelNlNEI3?=
 =?utf-8?Q?0PaPqgTI3FuaR6sUZFcUEy67pbr5bI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 10:40:11.7504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 889e4f22-d864-4731-899c-08dd3099febd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7558



On 09/01/2025 11:27, Luca Fancellu wrote:
> 
> 
>>>
>>>>
>>>>> ---
>>>>> ---
>>>>> xen/arch/arm/domain_build.c       | 13 ++++---------
>>>>> xen/arch/arm/include/asm/kernel.h |  5 ++++-
>>>>> xen/arch/arm/static-shmem.c       |  3 ++-
>>>>> xen/include/xen/bootfdt.h         | 16 ++++++++++++++++
>>>>> 4 files changed, 26 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>>>> index b072a16249fe..9e3132fb21d8 100644
>>>>> --- a/xen/arch/arm/domain_build.c
>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>> @@ -1039,7 +1039,7 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>>>     */
>>>>>    if ( is_hardware_domain(d) )
>>>>>    {
>>>>> -        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
>>>>> +        struct membanks *gnttab = membanks_xzalloc(1, RESERVED_MEMORY);
>>>>>        /*
>>>>>         * Exclude the following regions:
>>>>>         * 1) Remove reserved memory
>>>>> @@ -1057,13 +1057,10 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>>>>>        gnttab->bank[0].start = kinfo->gnttab_start;
>>>>>        gnttab->bank[0].size = kinfo->gnttab_size;
>>>>>
>>>>> -        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
>>>>> -                                             NR_MEM_BANKS);
>>>>> +        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
>>>>>        if ( !hwdom_free_mem )
>>>>>            goto fail;
>>>>>
>>>>> -        hwdom_free_mem->max_banks = NR_MEM_BANKS;
>>>>> -
>>>>>        if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>>>>>                                     hwdom_free_mem, add_hwdom_free_regions) )
>>>>>            goto fail;
>>>>> @@ -1293,7 +1290,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>>>>>                                             struct membanks *ext_regions)
>>>>> {
>>>>>    int res;
>>>>> -    struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
>>>>> +    struct membanks *gnttab = membanks_xzalloc(1, RESERVED_MEMORY);
>>>>>
>>>>>    /*
>>>>>     * Exclude the following regions:
>>>>> @@ -1374,12 +1371,10 @@ int __init make_hypervisor_node(struct domain *d,
>>>>>    }
>>>>>    else
>>>>>    {
>>>>> -        ext_regions = xzalloc_flex_struct(struct membanks, bank, NR_MEM_BANKS);
>>>>> +        ext_regions = membanks_xzalloc(NR_MEM_BANKS, RESERVED_MEMORY);
>>>> I'm a bit confused what is the expectations behind using different types of enum region_type, mostly because it can point to
>>>> different address spaces depending on the context. Above, you marked gnttab as RESERVED_MEMORY (I guess because this
>>>> region has already been found - but in fact it is still unused) and hwdom_free_mem as MEMORY. So I would at least expect
>>>> ext_regions to be of MEMORY type as well. After all both hwdom_free_mem and ext_regions contain
>>>> banks of unused/free memory (although former lists host memory while latter can also contain guest physical
>>>> memory). Could you please clarify the intended use?
>>>
>>> You are right, that should be MEMORY, my bad! Could it be something addressable on commit or should I send another one?
>> I can do that on commit but first, can you please answer what is the intended use of enum region_type?
>> At first I was expecting gnttab to be MEMORY as well. I don't see a difference between a region prepared by Xen
>> for domain to store gnttab vs extended regions. Both specify regions of unused address space. It's just that the region
>> for gnttab must always be present but extended regions don't have to.
> 
> Right, at first I thought gnttab could be reserved memory, but now that you pointed out it’s not the right thing to do, I remember
> now that these type reflects the device tree grouping for the memory banks, so RESERVED_MEMORY is only for these regions
> in the /reserved-memory tree, STATIC_SHARED_MEMORY is for the 'xen,domain-shared-memory-v1’ comaptible node and
> MEMORY is for /memory regions.
> 
> Now I would say that we could use MEMORY also for regions prepared by Xen as long as we don’t need to differentiate them in
> a different way from /memory regions.
> 
> Please let me know your thoughts.
Yes, this is in line with my understanding. Please send a v3 with proper types as discusses. With that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


