Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11C69C893D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 12:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836342.1252221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYLQ-00067g-R5; Thu, 14 Nov 2024 11:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836342.1252221; Thu, 14 Nov 2024 11:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBYLQ-000651-O6; Thu, 14 Nov 2024 11:49:04 +0000
Received: by outflank-mailman (input) for mailman id 836342;
 Thu, 14 Nov 2024 11:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wQsW=SJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tBYLO-00064v-Nr
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 11:49:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2417::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c3cc7f5-a27e-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 12:48:55 +0100 (CET)
Received: from DM6PR08CA0043.namprd08.prod.outlook.com (2603:10b6:5:1e0::17)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 11:48:50 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::2c) by DM6PR08CA0043.outlook.office365.com
 (2603:10b6:5:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Thu, 14 Nov 2024 11:48:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 11:48:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 05:48:48 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Nov 2024 05:48:47 -0600
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
X-Inumbo-ID: 6c3cc7f5-a27e-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjFkIiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjZjM2NjN2Y1LWEyN2UtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTg0OTM1LjIyMDc1OCwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7/sL1jOYVbiPxqroIcmduOUwv3Bfm4ye3IR6Ct32IGRchZvTnydt78g0NjOkAd3oBNmcB+kWNsxMZKF/9PyFYjFZUlemIh5vajvEdkioNXB63bNXQEJo3WVVvo2Y5PvD9gbcRjLLyvTtneT8HvrY7Bk3xcDTRORQgeQs030hb5RIDenIY/w/rnUJHGFBGL8yu8RMfNCPd3rAii3S4yo2DlL2Q2NOCkb5Zwlpy0GX6GAyF0VxvGfSqX3boe/h3XYfHU4yOILqWuc/rG4sKw4Gnkw2kuEEBuu3sSHg5nd7glsl1u9JB+O8Qn5p8S0m0oVLguLRndEC7/Jx+rhUhb7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7y0tbRpT4CRrKq9gn0uSBgTBByyKppoMoANKhFUVoo=;
 b=L85HknJHRyz0JFuVaWOQAZD/Zpemuj4O/YkzvWccwL31OCjKKWyzvEiSWvnYTyB2qheK0jN5Q60Gr/737GcDPJN3c38ZxNIkUg7JRXvgfO58bR2k+zC5o+94F/b7+azTXDmC0hIIXGFvUzFyhZwBNZYMMBxmizOJNBeV4UZmvGfkef0G3+9hM7K2G4ArN8OgJoooyWlQq1qgRphTI0VGKXl9Xq+10T1CxNrMu3Zl69O8B69FsL5W3vT17ECXnfhC387duh6iGJRyN8X9lMhohsAZOeXsqiZF4xUg3PFdA/GSypEVcw4kUBU2yW0e+Xv0cW+JlrbPd2u5I3PbymbRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7y0tbRpT4CRrKq9gn0uSBgTBByyKppoMoANKhFUVoo=;
 b=odMsrPPDuYVaFv8opK0uLDrzBLZI3VNExrHg4VJKyntrDWAfZTME9l+zAObb4Lgo5kG+5IkPgrvcasJ86h473gk6kMFvE2Evvmalp09Qm9HNv4k30P6dy4kaqmw2OcC7SOEQO2k3yddb0CEtMSGTXPHo6ztRuiml81QDBWrIGOM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e023a861-a1d6-415e-9be8-688664bf5680@amd.com>
Date: Thu, 14 Nov 2024 12:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
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
 <92564de9-24f7-4259-bc45-a95680101693@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <92564de9-24f7-4259-bc45-a95680101693@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|MN2PR12MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: be44bd32-8183-461c-d4f8-08dd04a24e35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzFPRHg3dDd0NVF6YWJCbER3Vnl2Q2RCZWpZSk5zS3F3YTdVdFVWZGd4dFhq?=
 =?utf-8?B?WlBiK2ZoMWhiOTljNnpCbUJqWVJESjRoOER5TFhoeE9GZnRNOGxvc2ZWK3E1?=
 =?utf-8?B?bWtZNWFwNGdJNEpuTGRIeEVhaStCdENhMjYxai80MGdLS0FRQTJWOWZHakxr?=
 =?utf-8?B?TUZxK1A0SDRHT3ZVT3dTN2xBVkRocVZBckRhSzlHMDFNYzRHVU9GNzVjUjRO?=
 =?utf-8?B?a3RwdFJicndzdWdjS2VyOGNqdy9hNE12a0lCRTRMVEYveTR1TXRNTFdYc1JU?=
 =?utf-8?B?cGhPQ3p3VVFnZjVhOEVXWTlkUlAvVFM1QTNLd2txUTlRVlFJS09JNXB5bGRk?=
 =?utf-8?B?TER4Ry9tR2JkbnlLS1ozSE9BcDVxbVo2RHVXRHYvTVFBUzl6SkRVZHBlZS9C?=
 =?utf-8?B?SDBPajBVcEFtUC85dExwd2VxWWRZUHRlbFVpbWxHLzRwWllOUlFPcGoxMkxk?=
 =?utf-8?B?Zk9xNVBLNmRRTUI5NlR3UllvazhRREdkRmd4Snd1N0p1RHlJS1lGUGZXQWN1?=
 =?utf-8?B?Vms2Q1pibmhwMG95THJ5dUhTeXNIbWJXRjhRbWNHQ3dWTE4wcFJKb2FrRnRJ?=
 =?utf-8?B?QUltSExkYjNIRzlicUl5K2FMVE43RkFLVzZLdjVsN0JVMlZCcnYzTFhZQWJF?=
 =?utf-8?B?RTd2MGIvU1VldlpRNUlST3hrdnhPNzRYWEI4aEsvVCt6dnYzSEtLVm54M3Ns?=
 =?utf-8?B?cS8xZWY5UFhnN0YzU29HUjFOTStMeE56NnFVa0hZdDhtZC9DOW5QSEJvTkdI?=
 =?utf-8?B?RFd2SUdRNC9iMy84UmxabVFKMzFzY05BbkVqR1Zpa1k0cWxUdHgzdlpoTjY0?=
 =?utf-8?B?WjBSaHpXRGJ4MlpPWlp3VDdwTGxHazlmUno2bC9INFpzUDRKeW1USXhEcEUy?=
 =?utf-8?B?K2xNcjEzYy91Uk5HRXRCM0JGY1hHY0ZiUDh0a3UzRDVRK3paVE1UQmtjeW1G?=
 =?utf-8?B?aXBTMGNHMGpHTFdaRHF3ZUxWdUl4NjZoTTd4MjNEMm00Vnd4QklsYVJpVm1D?=
 =?utf-8?B?cHIwbVVDT3pyOGdERk41emczczlmb2Y2K2VCaGpHNXMzeW1XOXREZHJMNW5h?=
 =?utf-8?B?RUFGcFVEeHlxaGZqRUh2SU5zRktXZU5CbmpnSVdFcTJlZUp1QzNMeUpUaDJC?=
 =?utf-8?B?MWNadUx6UGF6UzFBVkNrWkNoTzhxbjRieVMydEFiV09DRno3bXhyaVU3RW82?=
 =?utf-8?B?azl5WENnK3U1TXdZT25NQ1Q1UmRJTk5XWnhrNGt1OW9Pb2pLRlBrd2FqOHgx?=
 =?utf-8?B?Y0xDeS9UK2NsS2w4YmEzWkI3SjljNUlodDVSYkUwYjV5Sm5HRDRhTUhMa3FD?=
 =?utf-8?B?ZVRad2F2UEtVQmwrNS9KM3JYaG90ZCszT1p4QWNvNHpoa3hLc2pXUEQyR0Ur?=
 =?utf-8?B?QWNrK0xJQWROVlF1UDlBc3FqZHhnSkdhWXJuYis3LzBlTWRoUlFzZ3E1bS9S?=
 =?utf-8?B?ZktJUHVURWEyaTVYb2k0ZHhvT2NNeUUwaXJxODQvZ045NXk3eElUR3RIOW9B?=
 =?utf-8?B?dWRBbGVUTFNBVGtaL20vWTl6dDBzOHluNkttb0hZcDlxbWVaOVlQc2VkbERL?=
 =?utf-8?B?V3hsbjhLSDFMSjNEZGc3OHUrVTkrc2ZRTWtwdlFLbHg4ajIxWEg3eStWbS9I?=
 =?utf-8?B?ckVkbDVmSDlTaTZrMlREWTFxbFc0eHZ4WURnMVd3OWtqTXlyRktBZWc2RjVu?=
 =?utf-8?B?VDJwN1RKUmYwWWtOUHY0WEtvVHFndVdOZWt0Z01mUWdJWUJ4Z3pjUmNhRFhN?=
 =?utf-8?B?clJ4N3hxWTZCaUpraGJiY0xDOUVucS8vMmRSQi8xS3M1THIyYW5zQncxRHhC?=
 =?utf-8?B?Z0JZRjJmSVRWVm9xRGdHcm04STQ0WEJ0a3B5RCtLSUY5WkFKUGhKTnNDdHRH?=
 =?utf-8?B?Q3l1ZGZ5SG1yYkxKbzR1Y3o5aG1QRG1ic21lLzZBano2L29tS0d1Y3V2OWVs?=
 =?utf-8?Q?M/YfepxNhuc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:48:49.8748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be44bd32-8183-461c-d4f8-08dd04a24e35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127



On 14/11/2024 11:31, Julien Grall wrote:
> 
> 
> Hi Stefano,
> 
> On 13/11/2024 22:41, Stefano Stabellini wrote:
>> On Wed, 13 Nov 2024, Julien Grall wrote:
>>> On 13/11/2024 15:40, Michal Orzel wrote:
>>>> On 13/11/2024 15:40, Julien Grall wrote:
>>>>> On 13/11/2024 14:19, Michal Orzel wrote:
>>>>>> On 13/11/2024 14:50, Julien Grall wrote:
>>>>>>> On 06/11/2024 15:07, Michal Orzel wrote:
>>>>>>>> On 06/11/2024 14:41, Luca Fancellu wrote:
>>>>>>>>> There are some cases where the device tree exposes a memory range
>>>>>>>>> in both /memreserve/ and reserved-memory node, in this case the
>>>>>>>>> current code will stop Xen to boot since it will find that the
>>>>>>>>> latter range is clashing with the already recorded /memreserve/
>>>>>>>>> ranges.
>>>>>>>>>
>>>>>>>>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>>>>>>>>> in the /memreserve/ part and even in this case this will prevent
>>>>>>>>> Xen to boot since it will see that the module memory range that
>>>>>>>>> it is going to add in 'add_boot_module' clashes with a
>>>>>>>>> /memreserve/
>>>>>>>>> range.
>>>>>>>>>
>>>>>>>>> When Xen populate the data structure that tracks the memory
>>>>>>>>> ranges,
>>>>>>>>> it also adds a memory type described in 'enum membank_type', so
>>>>>>>>> in order to fix this behavior, allow the
>>>>>>>>> 'check_reserved_regions_overlap'
>>>>>>>>> function to check for exact memory range match given a specific
>>>>>>>>> memory
>>>>>>>>> type; allowing reserved-memory node ranges and boot modules to
>>>>>>>>> have an
>>>>>>>>> exact match with ranges from /memreserve/.
>>>>>>>>>
>>>>>>>>> While there, set a type for the memory recorded during ACPI boot.
>>>>>>>>>
>>>>>>>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to
>>>>>>>>> bootinfo.reserved_mem")
>>>>>>>>> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>>>>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>>>>> ---
>>>>>>>>> I tested this patch adding the same range in a /memreserve/ entry
>>>>>>>>> and
>>>>>>>>> /reserved-memory node, and by letting u-boot pass a ramdisk.
>>>>>>>>> I've also tested that a configuration running static shared memory
>>>>>>>>> still works
>>>>>>>>> fine.
>>>>>>>>> ---
>>>>>>>> So we have 2 separate issues. I don't particularly like the concept
>>>>>>>> of introducing MEMBANK_NONE
>>>>>>>> and the changes below look a bit too much for me, given that for
>>>>>>>> boot modules we can only have
>>>>>>>> /memreserve/ matching initrd.
>>>>>>>
>>>>>>> How so? Is this an observation or part of a specification?
>>>>>> Not sure what specification you would want to see.
>>>>>
>>>>> Anything that you bake your observation. My concern with observation is
>>>>> ...
>>>>>
>>>>>     It's all part of U-Boot and Linux behavior that is not documented
>>>>> (except for code comments).
>>>>>> My statement is based on the U-Boot and Linux behavior. U-Boot part only
>>>>>> present for initrd:
>>>>>> https://github.com/u-boot/u-boot/blob/master/boot/fdt_support.c#L249
>>>>>
>>>>> ... a user is not forced to use U-boot. So this is not a good reason to
>>>> I thought that this behavior is solely down to u-boot playing tricks with
>>>> memreserve.
>>>
>>> Sure we noticed that U-boot is doing some we didn't expect. But this really
>>> doesn't mean there are not other interesting behavior happening.
>>>
>>>>
>>>>> rely on it. If Linux starts to rely on it, then it is probably a better
>>>>> argument, but first I would need to see the code. Can you paste a link?
>>>> Not sure how I would do that given that it is all scattered.
>>>
>>> There are no requirements to be all scattered.
>>>
>>>> But if it means sth, here is kexec code> to create fdt. It is clear they do
>>> the same trick as u-boot.
>>>> https://github.com/torvalds/linux/blob/master/drivers/of/kexec.c#L355
>>>
>>> Yet this doesn't provide any information why this only has to be an exact
>>> region... It only tells me the current behavior.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> For things that Xen can be interested in, only region for ramdisk for
>>>>>> dom0 can match the /memreserve/ region.
>>>>>> Providing a generic solution (like Luca did) would want providing an
>>>>>> example of sth else that can match which I'm not aware of.
>>>>>
>>>>> I would argue this is the other way around. If we are not certain that
>>>>> /memreserve/ will not be used for any other boot module, then we should
>>>>> have a generic solution. Otherwise, we will end up with similar weird
>>>>> issue in the future.
>>>> We have 3 possible modules for bootloader->kernel workflow: kernel, dtb and
>>>> ramdisk. The first 2 are not described in DT so I'm not sure
>>>> what are your examples of bootmodules for which you want kernel know about
>>>> memory reservation other than ramdisk.
>>>
>>> The DTB is not described but the kernel is. We also have XSM modules. All of
>>> which could in theory be in memreserve if for some reasons the bootloader
>>> wanted to preserve the modules for future use (think Live-Update)...
>>>
>>> Anyway, to be honest, I don't understand why you are pushing back at a more
>>> generic solution... Yes this may be what we just notice today, but I haven't
>>> seen any evidence that it never happen.
>>>
>>> So I would rather go with the generic solution.
>>
>> I looked into the question: "Is this an observation or part of a
>> specification?"
>>
>> Looking at the device tree specification
>> source/chapter5-flattened-format.rst:"Memory Reservation Block"
>>
>> It says:
>>
>> "It is used to protect vital data structures from being overwritten by
>> the client program." [...] "More specifically, a client program shall
>> not access memory in a reserved region unless other information provided
>> by the boot program explicitly indicates that it shall do so."
>>
>>
>> I think it is better to stay on the safe side and implement in Xen a
>> more generic behavior to support /memreserve/. It is possible that in a
>> future board more information could be residing in a /memreserve/
>> region. For instance, I could imagine EFI runtime services residing in a
>> /memreserve/ region.
> 
> I am not 100% sure about this one. The specification implies that if a
> region is reserved, then it would need to be marked as
> EfiReservedMemoryType in the EFI memory map. But for EFI runtime
> services, they should be using EfiRuntimeServicesCode or
> EfiRuntimeServicesData.
> 
>>
>> I am a bit confused by ranges that are both in /memreserve/ and
>> /reserved-memory. Ranges under /memreserve/ should not be accessed at
>> all (unless otherwise specified), ranges under /reserved-memory are
>> reserved for specific drivers.
> 
> IIUC /memreserve/ is the legacy approach for describing reserved regions.
> 
>> I guess ranges that are both in /memreserve/ and /reserved-memory are
>> exactly the type of ranges that fall under this statement in the spec:
>> "unless other information provided by the boot program explicitly
>> indicates that it shall do so".
> 
> Yes. The OS would be able to use the range based what /reserved-memory
> says. Note that you can also the describe a region from /memreserve/
> outside or /reserved-memory (such as the CPU spin table).
> 
>>
>> The way I see it from the device tree spec, I think Xen should not map
>> /memreserve/ ranges to Dom0, and it should avoid accessing them itself.
> 
> See above, Xen should be able to access the regions in /memreserve/. But
> it should map them in the directmap.
> 
>> But if a range is both in /memreserve/ and also in /reserved-memory,
>> then basically /reserved-memory takes precedence, so Xen should map it
>> to Dom0.
> 
> Unless Xen needs to use some of them. At which point this will need to
> be excluded from Dom0.
> 
> Looking at the code, I think /memreserve/ and /reserved-memory are not
> mapped in Xen and everything in /reserved-memory is mapped to dom0.
Why do we forward /reserved-memory to dom0 fdt but /memreserve/ not? From the discussion
we're having it seems like we should treat them equally. Also, looking at Luca patch,
we seem to special case /memreserve/ and only allow for overlap /memresrve/ with boot modules
and not /reserved-memory/ with boot modules. If we are going to claim that all the boot modules
can be marked as reserved by the bootloader, then I think we should treat them equally providing
the same experience to dom0.

Last thing I wanted to ask (for my clarity) is that if bootloader loads initrd at region A and marks
it as reserved (either in /memreserve/ or /reserved-memory/), and later on Xen copies initrd from region
A to B, shouldn't the reserved memory region be updated to cover new region for initrd?

~Michal

