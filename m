Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7B9C83E3
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 08:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836066.1251942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBU81-00069I-Dt; Thu, 14 Nov 2024 07:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836066.1251942; Thu, 14 Nov 2024 07:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBU81-00066L-Az; Thu, 14 Nov 2024 07:18:57 +0000
Received: by outflank-mailman (input) for mailman id 836066;
 Thu, 14 Nov 2024 07:18:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQsW=SJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tBU80-00066F-Bt
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 07:18:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2418::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b023edba-a258-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 08:18:47 +0100 (CET)
Received: from DM6PR12CA0003.namprd12.prod.outlook.com (2603:10b6:5:1c0::16)
 by PH0PR12MB8799.namprd12.prod.outlook.com (2603:10b6:510:28e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 07:18:41 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::63) by DM6PR12CA0003.outlook.office365.com
 (2603:10b6:5:1c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 07:18:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 07:18:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 01:18:40 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Nov 2024 01:18:39 -0600
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
X-Inumbo-ID: b023edba-a258-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxODo6NjI1IiwiaGVsbyI6Ik5BTTEyLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImIwMjNlZGJhLWEyNTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTY4NzI3Ljk3ODA3Miwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPO8ZbuGB9IcT+Gb+VqNPNZPZTqK25+HK48JLZqrCZe0OwI80e2njUMWGey6RzyxQ2akB67wXIAyi4r8YqDq904eNCN7b4cbfw8jAQHwW2keCHuEa5bS/PGuo0O7pP3UO4zKpYdognS6e69T1ntflAlCDGhFUQFH5DOYOuy822qN2HK79otvKkiM/HyueQy8y6gDFsuGjNd4udMQB4XtNTol0Ov3QqO3tFl4xtTRCTgbWZoTRYyKnxNv+RtrggxdXWz2nCZmCxCxdz1fzRkJ979gT/i+UTLA3Kkx001CC1VkLetXT2wjFnnZEyyDU52FEkvYHVn046i8jtXX2dDc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxEjBEtDvnMuSrN/OdQYW1BjvI8R1sO7TEaxd2sPYq0=;
 b=U1g9xZa09EqbKo8pu8h/BvWEHGAJjAlqmCV1BCxTVuZllr0BodPlK4Q1EW/FdYAKXWDiYTGUrcMVJvD+38jsMIo2lp3+5a7kJoXiGD9g4Sr9cMJLdfa2qOWib0Mf7FrjI8zrs+AR8exjGuQgKDFHA+IDNOEy1byfAf5dFRLoi6R41rEH0Jgz3/Sl61fMq69vXO22jbR90Q29verco14Lecm7MMv+901F6/MTWjBCZtVl1Hlp7s6keIUgLC6ML5R/D5bs4n8M1bWj7ShNLOhgSrKKRNgqxlzjvN1xL98U+CDSyyOQYsqkIxdWgioLk9SPSyfUWhghE+G5ccpnROW8XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxEjBEtDvnMuSrN/OdQYW1BjvI8R1sO7TEaxd2sPYq0=;
 b=o57Gp+TuN/851eG+o6hRwfyT79NJTn/AfJyq6wbByUa5h6yke96+dB5Jz1ZtqMwDKMZ3+zuxRmmN4/FzAU/Ztihj7nZrqy8B+4/E5LNCV56bqOqY/zu4VT8Djp5HwQ8hPle8rbOMoDVAzzmcTKNAFogwox6NwJOPjXfSpvRu86Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3d8ccf17-e140-47fc-a887-7df808d46716@amd.com>
Date: Thu, 14 Nov 2024 08:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
 <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
 <alpine.DEB.2.22.394.2411131410240.222505@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2411131410240.222505@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|PH0PR12MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: ea148583-b192-4199-2b82-08dd047c9149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHF4M214Q2dwR3o3MkNxUjdzYUM1MTVweElnN2NBNW5zVXJKUk9FdzZGckdp?=
 =?utf-8?B?WWZVQnFqZXZyZmpOUXFyV3Awa015bXg1Q3JuNU4wSTZvVjdvNmphWEpTMFZh?=
 =?utf-8?B?U0hTWGl0NXBGNjMyVC9iMk5tMElvYUt4SzFEMEplU3d5UUNKb0hVS0IxamVM?=
 =?utf-8?B?QXFYRDVQc3ZHNFJ5d1B6emYwYkFOaHNsQ1phcnkwUHRsWTIzNkJYYWhxQ3Y4?=
 =?utf-8?B?eDVmcGNMZG00UzZVL2UzMkxHZHlWWGdQK0FQYkZWclNWZkdDdS85ODJMZ05a?=
 =?utf-8?B?OUxxekcyamxmTWZoeXFqMTNwNHpEWHlrZi9DUUFwTHRSNFpoQXFhZEZaV1VF?=
 =?utf-8?B?SDhFbURHcHBDcllLNko4RDQrMmxlSmgzTEE0S0hHeXQ5amd5WHFucVpwL1R6?=
 =?utf-8?B?YnNCSkZrSjc1dllYOGZjRDFSbnh3T0J0bUpCOGVVei9EaUJZNzg5UnpzaVdl?=
 =?utf-8?B?ZVZtdG1icUtPNWFsWlJyTTR5cDA1eHNjZFdIbDM5RUdQYUw1Kzc0a3prb3p5?=
 =?utf-8?B?R1ZvcmZta04rbFRZSHgvZkcyNE9wbFNCMU5aYUgrTkh1Y2IzOGFJNDUyaEZD?=
 =?utf-8?B?bVlLdEhIekNGZlhlZ2g2Q21kUFljQ1BHSFQyQkVmYy9WYXd4c21LMFdPRCts?=
 =?utf-8?B?WThvb0FvbTYvZnBpdEY2bVptOWxSMzl4YjhVRE0zSGdDVGV2RVpaaCsrbENC?=
 =?utf-8?B?K1U3MnpaN2RhZ1B3SWVkNS8xN1Z4Qjk5eCtCLzBsbGYxdGpUVVJhdC80RGJ5?=
 =?utf-8?B?R0xVeEF5NUlHNVhFcmRYYkEyS2xXbmhlUnpOckUxcU94SVdqa1pLRUcwM25v?=
 =?utf-8?B?OURMZk9IR2lOa216S3JDWjJab3IxclFlUlRHYmtDZzF0Q1huQkVwVUQyN2tC?=
 =?utf-8?B?d0JXcWUyc0h0UWd0L3NzcnpGMGtkRVZ2dXNQcTlMSkpqdlVNcGhYMC9pVVpa?=
 =?utf-8?B?djB0T3BhQ0FVWlV2Wnp5V3lKQlk1dHJ4WDRORU9rakFFRlUrRGRwUGVnQmNr?=
 =?utf-8?B?RjY5eDNzbkxtbVp4R0VWd2dpYld1VFFOWkNMWFhHNVB6TGhSb09sNGdGVEkv?=
 =?utf-8?B?N1d4STI3RmtLbTBQN1hTSHJrYS9vbGkwR3RHWkcyN0IweHFFekR2VVdtWEdm?=
 =?utf-8?B?WWgwUG9reDV0UDcwWjN2ZExGbXJLK21vYitWUXRDQk1rM25Ob3VHQitxZktU?=
 =?utf-8?B?UEhLY0IzZk04TjMwTmFYcU8xWUpvT09mdTdicjBqWXhxa2U4bVlRaTNlUXls?=
 =?utf-8?B?NCtobHVndy84OFZka3VNcnpJQzMvUlM4VFFERWp2anhvZE5JaFBzVWFtdVhp?=
 =?utf-8?B?L2I5MmxnZGczK0hUMVpRTFlBckZjKzVBb3F0elNUbTI3TnJqbEFocStqVTdz?=
 =?utf-8?B?RFVkNHpCenR1ckZIZ21tdm9UVWlUdWFMU2FzWS9CQ2ZVUXkzNnB1KytGZHVQ?=
 =?utf-8?B?RHE3a0NBTWljeVhWY1hidUxDbWV6eVlzNHhWazlEMnJEV2Q3N245aTV1Yysr?=
 =?utf-8?B?aGxMT1RuWCt1ZW9WSHFxUktObExrQmo2MUNIR2UrSjV5TmxEWDA2MHFTSjVk?=
 =?utf-8?B?bWVzdytTVk4wRkpIMHlLUTRsWjRWUDVJUU9DZU4vSUxxSVQxSWRBQ0hRZ09u?=
 =?utf-8?B?TkhHcndjWXNBZHVkbWtHSVVuM0ZTOWtMSGM1UWNuMTFkMHh3Y293SE9nc0c0?=
 =?utf-8?B?OEV3QTZ0THUySnBLUVFIY2RoaGxTZ2xSOFBBNWpDRGxKTnFGWVlvTVR0T25C?=
 =?utf-8?B?TmpxekFnWHBGLzhxbFFwbUovMmNpWDVjODErSjBuMFk2aVZYbjFqeE9TbHpt?=
 =?utf-8?B?Zzc2S3hQV3FvS1JoRExhR3VybkE1T3JJbHg3c3FsMFVndDVpbDB1djRTTEo1?=
 =?utf-8?B?WFVtNDQ4YVkzK1JIQ3hjU3hJbTV1Ukp4czVnbVFEcEU1TkhmWUlDUkFxSmZn?=
 =?utf-8?Q?QxmzySSBO9Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 07:18:41.5332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea148583-b192-4199-2b82-08dd047c9149
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799



On 13/11/2024 23:41, Stefano Stabellini wrote:
> 
> 
> On Wed, 13 Nov 2024, Julien Grall wrote:
>> On 13/11/2024 15:40, Michal Orzel wrote:
>>> On 13/11/2024 15:40, Julien Grall wrote:
>>>> On 13/11/2024 14:19, Michal Orzel wrote:
>>>>> On 13/11/2024 14:50, Julien Grall wrote:
>>>>>> On 06/11/2024 15:07, Michal Orzel wrote:
>>>>>>> On 06/11/2024 14:41, Luca Fancellu wrote:
>>>>>>>> There are some cases where the device tree exposes a memory range
>>>>>>>> in both /memreserve/ and reserved-memory node, in this case the
>>>>>>>> current code will stop Xen to boot since it will find that the
>>>>>>>> latter range is clashing with the already recorded /memreserve/
>>>>>>>> ranges.
>>>>>>>>
>>>>>>>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>>>>>>>> in the /memreserve/ part and even in this case this will prevent
>>>>>>>> Xen to boot since it will see that the module memory range that
>>>>>>>> it is going to add in 'add_boot_module' clashes with a
>>>>>>>> /memreserve/
>>>>>>>> range.
>>>>>>>>
>>>>>>>> When Xen populate the data structure that tracks the memory
>>>>>>>> ranges,
>>>>>>>> it also adds a memory type described in 'enum membank_type', so
>>>>>>>> in order to fix this behavior, allow the
>>>>>>>> 'check_reserved_regions_overlap'
>>>>>>>> function to check for exact memory range match given a specific
>>>>>>>> memory
>>>>>>>> type; allowing reserved-memory node ranges and boot modules to
>>>>>>>> have an
>>>>>>>> exact match with ranges from /memreserve/.
>>>>>>>>
>>>>>>>> While there, set a type for the memory recorded during ACPI boot.
>>>>>>>>
>>>>>>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to
>>>>>>>> bootinfo.reserved_mem")
>>>>>>>> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>>>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>>>> ---
>>>>>>>> I tested this patch adding the same range in a /memreserve/ entry
>>>>>>>> and
>>>>>>>> /reserved-memory node, and by letting u-boot pass a ramdisk.
>>>>>>>> I've also tested that a configuration running static shared memory
>>>>>>>> still works
>>>>>>>> fine.
>>>>>>>> ---
>>>>>>> So we have 2 separate issues. I don't particularly like the concept
>>>>>>> of introducing MEMBANK_NONE
>>>>>>> and the changes below look a bit too much for me, given that for
>>>>>>> boot modules we can only have
>>>>>>> /memreserve/ matching initrd.
>>>>>>
>>>>>> How so? Is this an observation or part of a specification?
>>>>> Not sure what specification you would want to see.
>>>>
>>>> Anything that you bake your observation. My concern with observation is
>>>> ...
>>>>
>>>>    It's all part of U-Boot and Linux behavior that is not documented
>>>> (except for code comments).
>>>>> My statement is based on the U-Boot and Linux behavior. U-Boot part only
>>>>> present for initrd:
>>>>> https://github.com/u-boot/u-boot/blob/master/boot/fdt_support.c#L249
>>>>
>>>> ... a user is not forced to use U-boot. So this is not a good reason to
>>> I thought that this behavior is solely down to u-boot playing tricks with
>>> memreserve.
>>
>> Sure we noticed that U-boot is doing some we didn't expect. But this really
>> doesn't mean there are not other interesting behavior happening.
>>
>>>
>>>> rely on it. If Linux starts to rely on it, then it is probably a better
>>>> argument, but first I would need to see the code. Can you paste a link?
>>> Not sure how I would do that given that it is all scattered.
>>
>> There are no requirements to be all scattered.
>>
>>> But if it means sth, here is kexec code> to create fdt. It is clear they do
>> the same trick as u-boot.
>>> https://github.com/torvalds/linux/blob/master/drivers/of/kexec.c#L355
>>
>> Yet this doesn't provide any information why this only has to be an exact
>> region... It only tells me the current behavior.
>>
>>>
>>>>
>>>>>
>>>>> For things that Xen can be interested in, only region for ramdisk for
>>>>> dom0 can match the /memreserve/ region.
>>>>> Providing a generic solution (like Luca did) would want providing an
>>>>> example of sth else that can match which I'm not aware of.
>>>>
>>>> I would argue this is the other way around. If we are not certain that
>>>> /memreserve/ will not be used for any other boot module, then we should
>>>> have a generic solution. Otherwise, we will end up with similar weird
>>>> issue in the future.
>>> We have 3 possible modules for bootloader->kernel workflow: kernel, dtb and
>>> ramdisk. The first 2 are not described in DT so I'm not sure
>>> what are your examples of bootmodules for which you want kernel know about
>>> memory reservation other than ramdisk.
>>
>> The DTB is not described but the kernel is. We also have XSM modules. All of
>> which could in theory be in memreserve if for some reasons the bootloader
>> wanted to preserve the modules for future use (think Live-Update)...
>>
>> Anyway, to be honest, I don't understand why you are pushing back at a more
>> generic solution... Yes this may be what we just notice today, but I haven't
>> seen any evidence that it never happen.
>>
>> So I would rather go with the generic solution.
> 
> I looked into the question: "Is this an observation or part of a
> specification?"
> 
> Looking at the device tree specification
> source/chapter5-flattened-format.rst:"Memory Reservation Block"
> 
> It says:
> 
> "It is used to protect vital data structures from being overwritten by
> the client program." [...] "More specifically, a client program shall
> not access memory in a reserved region unless other information provided
> by the boot program explicitly indicates that it shall do so."
> 
> 
> I think it is better to stay on the safe side and implement in Xen a
> more generic behavior to support /memreserve/. It is possible that in a
> future board more information could be residing in a /memreserve/
> region. For instance, I could imagine EFI runtime services residing in a
> /memreserve/ region.
> 
> I am a bit confused by ranges that are both in /memreserve/ and
> /reserved-memory. Ranges under /memreserve/ should not be accessed at
> all (unless otherwise specified), ranges under /reserved-memory are
> reserved for specific drivers.
> 
> I guess ranges that are both in /memreserve/ and /reserved-memory are
> exactly the type of ranges that fall under this statement in the spec:
> "unless other information provided by the boot program explicitly
> indicates that it shall do so".
> 
> The way I see it from the device tree spec, I think Xen should not map
> /memreserve/ ranges to Dom0, and it should avoid accessing them itself.
> But if a range is both in /memreserve/ and also in /reserved-memory,
> then basically /reserved-memory takes precedence, so Xen should map it
> to Dom0.
> 
> Please have a look at the spec, and let me know if you come to the same
> conclusion.
If we are going to follow the spec here (which I agree to do), then taking into
consideration the following part:

"*shall not* access memory in a reserved region *unless other information* provided
by the boot program explicitly indicates that it shall do so."

the initrd case fits into the exception (otherwise we would not be able to provide initrd to dom0).
Yes, it is described by U-Boot as /memreserve/ but also follows Linux dt binding for "linux,initrd-{start,end}" which can be perceived
as *other information provided by the boot program* and therefore can be used as ramdisk for dom0.

However, I'm not aware of any other official DT binding related to dom0/Linux boot modules other than
initrd, where this *other information* would be present and indicate the possibility of use by client program
i.e. Xen/dom0. This was my only concern, but I decided not to stand in the way.

~Michal



