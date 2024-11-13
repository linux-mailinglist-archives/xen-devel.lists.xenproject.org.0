Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF199C7773
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 16:41:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835859.1251716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFTw-0006Fh-Ce; Wed, 13 Nov 2024 15:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835859.1251716; Wed, 13 Nov 2024 15:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFTw-0006DN-8q; Wed, 13 Nov 2024 15:40:36 +0000
Received: by outflank-mailman (input) for mailman id 835859;
 Wed, 13 Nov 2024 15:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlJA=SI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tBFTu-0006DH-UC
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 15:40:34 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a37431b-a1d5-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 16:40:27 +0100 (CET)
Received: from BN9PR03CA0925.namprd03.prod.outlook.com (2603:10b6:408:107::30)
 by PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 15:40:22 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::aa) by BN9PR03CA0925.outlook.office365.com
 (2603:10b6:408:107::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Wed, 13 Nov 2024 15:40:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 15:40:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 09:40:18 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 09:40:16 -0600
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
X-Inumbo-ID: 9a37431b-a1d5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNDo6NjE0IiwiaGVsbyI6Ik5BTTExLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjlhMzc0MzFiLWExZDUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTEyNDI3LjMwNzI4OCwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3UWN4v8ZKkMFlAELIeLmVjSfLExmOjjVSCSft0L1zfKOdoK5jqF5Zwc4hyb62jzFF2dJVdJ/L1rry1O32AsdWRYPBFQTNu6gZCUE02OvdeglGOmw3nyE2LfFuPBQWP96GRzBuUR6SwVMioX+UV+1Z8Yp3iyxZWy9/lQZR2RdIi2vQFRwuKN6q/WG/KjEz9FFHC2jW6TYe7v2ibTnEa17h0xaAwdXu5bFfN0amO14+adq48i93iGUnFYq/WkkB6Yyv0aCJ+YJRVaj1y0x5HgY/4otFY+b56DsuhjhB5HEZpyPfFfhUM5T5DwfKrM/9NjAr+pCjL3HQA6yE2yB26EVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/FDKCnQOZF5yrtWxNQrp1Ut7BCPbxzOL104qhAtDwM=;
 b=iV9zx/xk30m2ESA22SGh+VDyUMNrkuni7sROdBI/ZhlRzD1rzQGV5z3UoxMz1xqesk6LE8L0ltmpTCL0sTHT9Tsa+dWv71h93I/UISI87oo2wv0+aIBezkIr/g31Ldu/XLxiaU0TvdNqBFs5XSUhPDe+v/lweS8ZuD5GoQuAzzkZbXyMmJLEGCcCWH8Pf8zEVVD6U/ky4m5Qh7DgseeQn+JYViEetcAn+zJa0/521ZANS9YOy3IhzobR0y6LiLWa5H1czNKbNvct6uKyxURHR3gbxD57/xHsAzOjeojPbaRd/W2fIMSMiBFJeMqLPFpFBgW/q7my6NKhMgmROaT6bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/FDKCnQOZF5yrtWxNQrp1Ut7BCPbxzOL104qhAtDwM=;
 b=mvydIBU9vC10Ec9ZAodSghD4wiBaRsi8FMnrez+3//HmFmJOLtmmzxxoPRsQXaid3sF7Y56PoHuRVLWIwDVDPI8ZxzXI+83YMh5bho/i/UToFSwS7S6bFcLYSdN6q5NthjwpmGr8+eAXs1UKknTs1UEZbUvusCNqw3sy2v98zNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
Date: Wed, 13 Nov 2024 16:40:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
To: Julien Grall <julien@xen.org>, Luca Fancellu <luca.fancellu@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: d1390922-895a-496c-5e7a-08dd03f97b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHNxZkNEV1FMU0pGMDhDVXgvOS96UTl1eXN4M3ZRZDZ4N2NQL28yNWJqa0l3?=
 =?utf-8?B?Qm1VdlNPakpleVFwYXVrSnU3OWFxRUM3UHRqRzYvcnFQRnZzVUJlMmQ0NHND?=
 =?utf-8?B?bW5CVkV0czRWVVJISDd6dlB2TThvK0U5UWxsY3gvVGlIN2lCVFgxS2g1aWo4?=
 =?utf-8?B?Z3NETmtBN3hxMXV1elVRZXhRekZ6dGk0aDI1dWlrNU1mamVuWDFqZGhscVRX?=
 =?utf-8?B?UGU1YWlwYnBZdkpaWE1XZXdRaGdJcDZEYVdrSjhnK1dJUG1LdHNnNTNaNmdE?=
 =?utf-8?B?czBGbzBOK3JPUzZwdmt2MHl1cm4wYVpPZDJCYUZkQWlXU2FKZnJQdXpyNjJI?=
 =?utf-8?B?a1gwZ3o0MGtuRUhMRmFBTWVhcFpLSVlEQjBlNVo1cnNWa0YvR2ZpU2ZXOWl3?=
 =?utf-8?B?ZHBIcnF1a0xES2pYbUU3cDAyOWQrKzF4RTEwbXRNVUg1RFQ3cnRkSVpmZ2ZL?=
 =?utf-8?B?a3ZuMXRIbFJCTmc2MU8rTFZuUWtzVFRQSG5wckdqYm9IYlBqZ3lnb0E0MGNt?=
 =?utf-8?B?cE4wMXJpdEQxcTNkWjNwenVYQ2tva3RUaUtnbXhueEdSeHZMSEdPZ3FwemdD?=
 =?utf-8?B?Um5Fcy9vczB6RkQ3QUwzcnhTZVI0UHBxN2tYSHN2djJncFJ2Y3pnUlZqZVFj?=
 =?utf-8?B?cFJyWFhRSTBGeFZTRXhIejUwa0Q5RXZid2xmZml1bjhaUGFybmtBMk42Y1hl?=
 =?utf-8?B?TWNZS2Z2N0VjZkdtMXN6SGdCUDVEVk1jRlFLbVhzcDFuWTZKOVdsaVJKa2VG?=
 =?utf-8?B?cGNsU3NkMzBVREtJWjVRYWVIUW1YVjJMNlBmdTNBMzNwcVNNVmRuRk8yNTVZ?=
 =?utf-8?B?U08vczNNTU13YkV6WWlhQWtReE10LzJWQUdTTzdOMnducjE1V013T3ZsRnhV?=
 =?utf-8?B?SktyUmF6QVpEbDFZUXh2NnJDRDBDWmVxZlI4SExQRzhpa2pHc3RzazBISlhX?=
 =?utf-8?B?L05lMzVxYXlHVHE1Y0VZTHE3YWlzTTZpWmxlVmI3TElCQSsvaTlHL1JiNlF1?=
 =?utf-8?B?OVprWG91UWRaUWxqS2UxN3ZSVDNqQWRRNVdZWHBwK1dnTk9VWmF0bzMyTUc3?=
 =?utf-8?B?U3VaQUFqclhDdDU4SXdzdXRmZXowcEJ2VTJ0YVYvVHN5VURTb1lKUW1DZHZt?=
 =?utf-8?B?QUxZRk9xbWd3VWs3K0t6UWZ4bFFDeHB5bTFvK1pFMmdoRlNRVjU1RXhGbUY4?=
 =?utf-8?B?SU1NKzJKdUFCZ2N6cGkrcHhhSDljYktDQ1BhTHdaSHVFVTd5aWVFYXI4eVFY?=
 =?utf-8?B?cFlmMHloUjVJTTQ4N3BWcmpjci81UlBxa2ZEYWhwVGE2S1ZKYTRmajRYS01N?=
 =?utf-8?B?N1hQNWRhaUtCaitKK2RlMVZsczBEMVQ0b0RIUUVjS3MxdjZmZHNVYVhLRUNQ?=
 =?utf-8?B?N2FBUWZsaXNnUlk3bHQ0UDVoQjdIczFIRkRIRGJZNjNwSTNBbFlrckFLcE9l?=
 =?utf-8?B?cFlpd0Z6NXRFRjZPUmcwU3dRN29UOHN3ODFzakhvNzhhSHlMZXBRZlY2dE9y?=
 =?utf-8?B?cHZ0MkNaQU9BdlhTN2NGRVFDcVIzOUd1dVVWVEtWbVRyZUdUN1hTY2lBZVQ4?=
 =?utf-8?B?NmZmRTJTMUhFNC82MUszVmFqblV6N2NTQUREOFNhYVlwS0tWK3JhQWFkb210?=
 =?utf-8?B?YWE3eTc5Z1VLZ0IxS3JsVzhTUTVJRlRFUkszTlJ6Vnl1My9BYXlmQlpydkJP?=
 =?utf-8?B?bjc4NGtpYTN6TUtmVTZTSTBkZWVPTXRROG1JckduVzZ1NUdwZ3VuV0pGVWRa?=
 =?utf-8?B?UFVZNkU4UVoyOWlKU0NqMTVDK2pFejkzSURxVUVYbDVkbmk0ZTZSN25xVmNI?=
 =?utf-8?B?N1pzTHppNkY5TDRScjdhY2R5L044WFQvTW9JY3NkUUMxTGl2YXh4R0VQN1dm?=
 =?utf-8?B?QVF5MXhqSFBFRkM2MU9xaVlmMjA3NDUzY1ZjNlcwajZDN252UjlZUDdlWkJn?=
 =?utf-8?Q?0+ci5xjID00=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 15:40:21.0168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1390922-895a-496c-5e7a-08dd03f97b8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469



On 13/11/2024 15:40, Julien Grall wrote:
> 
> 
> Hi,
> 
> On 13/11/2024 14:19, Michal Orzel wrote:
>>
>>
>> On 13/11/2024 14:50, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 06/11/2024 15:07, Michal Orzel wrote:
>>>>
>>>>
>>>> On 06/11/2024 14:41, Luca Fancellu wrote:
>>>>>
>>>>>
>>>>> There are some cases where the device tree exposes a memory range
>>>>> in both /memreserve/ and reserved-memory node, in this case the
>>>>> current code will stop Xen to boot since it will find that the
>>>>> latter range is clashing with the already recorded /memreserve/
>>>>> ranges.
>>>>>
>>>>> Furthermore, u-boot lists boot modules ranges, such as ramdisk,
>>>>> in the /memreserve/ part and even in this case this will prevent
>>>>> Xen to boot since it will see that the module memory range that
>>>>> it is going to add in 'add_boot_module' clashes with a /memreserve/
>>>>> range.
>>>>>
>>>>> When Xen populate the data structure that tracks the memory ranges,
>>>>> it also adds a memory type described in 'enum membank_type', so
>>>>> in order to fix this behavior, allow the 'check_reserved_regions_overlap'
>>>>> function to check for exact memory range match given a specific memory
>>>>> type; allowing reserved-memory node ranges and boot modules to have an
>>>>> exact match with ranges from /memreserve/.
>>>>>
>>>>> While there, set a type for the memory recorded during ACPI boot.
>>>>>
>>>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>>>>> Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>> ---
>>>>> I tested this patch adding the same range in a /memreserve/ entry and
>>>>> /reserved-memory node, and by letting u-boot pass a ramdisk.
>>>>> I've also tested that a configuration running static shared memory still works
>>>>> fine.
>>>>> ---
>>>> So we have 2 separate issues. I don't particularly like the concept of introducing MEMBANK_NONE
>>>> and the changes below look a bit too much for me, given that for boot modules we can only have
>>>> /memreserve/ matching initrd.
>>>
>>> How so? Is this an observation or part of a specification?
>> Not sure what specification you would want to see.
> 
> Anything that you bake your observation. My concern with observation is ...
> 
>   It's all part of U-Boot and Linux behavior that is not documented
> (except for code comments).
>> My statement is based on the U-Boot and Linux behavior. U-Boot part only present for initrd:
>> https://github.com/u-boot/u-boot/blob/master/boot/fdt_support.c#L249
> 
> ... a user is not forced to use U-boot. So this is not a good reason to
I thought that this behavior is solely down to u-boot playing tricks with memreserve.

> rely on it. If Linux starts to rely on it, then it is probably a better
> argument, but first I would need to see the code. Can you paste a link?
Not sure how I would do that given that it is all scattered. But if it means sth, here is kexec code
to create fdt. It is clear they do the same trick as u-boot.
https://github.com/torvalds/linux/blob/master/drivers/of/kexec.c#L355

> 
>>
>> For things that Xen can be interested in, only region for ramdisk for dom0 can match the /memreserve/ region.
>> Providing a generic solution (like Luca did) would want providing an example of sth else that can match which I'm not aware of.
> 
> I would argue this is the other way around. If we are not certain that
> /memreserve/ will not be used for any other boot module, then we should
> have a generic solution. Otherwise, we will end up with similar weird
> issue in the future.
We have 3 possible modules for bootloader->kernel workflow: kernel, dtb and ramdisk. The first 2 are not described in DT so I'm not sure
what are your examples of bootmodules for which you want kernel know about memory reservation other than ramdisk.

~Michal

