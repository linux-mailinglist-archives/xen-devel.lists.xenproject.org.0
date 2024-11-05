Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B349F9BCAB3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 11:43:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830174.1245093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8H1T-0000Q4-NG; Tue, 05 Nov 2024 10:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830174.1245093; Tue, 05 Nov 2024 10:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8H1T-0000Mu-Iv; Tue, 05 Nov 2024 10:42:55 +0000
Received: by outflank-mailman (input) for mailman id 830174;
 Tue, 05 Nov 2024 10:42:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5xKx=SA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1t8H1R-0000Mi-WB
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 10:42:54 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:2417::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2933b8d-9b62-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 11:42:47 +0100 (CET)
Received: from BN1PR12CA0006.namprd12.prod.outlook.com (2603:10b6:408:e1::11)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 10:42:43 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:408:e1:cafe::5a) by BN1PR12CA0006.outlook.office365.com
 (2603:10b6:408:e1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31 via Frontend
 Transport; Tue, 5 Nov 2024 10:42:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 10:42:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 04:42:42 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 04:42:42 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 5 Nov 2024 04:42:40 -0600
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
X-Inumbo-ID: b2933b8d-9b62-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjAyIiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImIyOTMzYjhkLTliNjItMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODAzMzY4LjA0MzIyNywic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KatCPrHqjk3E6yipBFac804aYwIQIbzLIFpJZoTVAf9J6Jh4mHXbpeBkN0ZRFqjrBXWucyD7NyWkHfLHAofC1zbZ7AJi2GP9S3varbGqQ/GjzmwEgxdnSfJE/cX1tuLZ4w4eMZNHNB/f9rol85G4D4FVwX9qi1+zbl45PNHgfntQR3/1asc1w9qSTMiY2l1c6GrqZ9TU3mPjOkgy61QeCQ4AeTmqRK0Mx+p43Hwlki1FbWKyYO3MeSwpVQTMBLE/wFXg7DcVWYbE+owSX8X8611ex3vyNMciqCwrnWENi+3wltBYRqHJ3FbSL7kDxmWGjHKdJqKf2sN69TRb6fczqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21zpqIf82GSln0iomSD2pWmKyIL5z78tMjowGuQ1mbg=;
 b=Qt1sFoKeHdHx3h0NpAkthSMSX5soM3EMx8TzOoCRfPW0r7c4oLLfHdVX86sgC9TpYR5qZCq2LU32y/9tsUMzbi1mCK3Egs5eReyFxt5G4tjWhu8OusBaOAL2B3zRtr8taGei6bXDHeV0plzq8+NrejoNUMOwDj5q3YpGnGC9YhHF1PelbE9U0XHgiZu+352xYT9N0n6okw8KBM4Y+Xt5rL8DfEjGxUIg1VvyysywuGLQTk4vN1tO3BEaTSyA+oa7cvNZ7yh5cqhIQSRg3DrqOPQ/R7hYWIM/yQOeEGvwekNLdKc8UmO8nSRxdIkTbC1UxDSCV6wDtbdW33btGGnfDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21zpqIf82GSln0iomSD2pWmKyIL5z78tMjowGuQ1mbg=;
 b=tk/71bB+MF8EfaP6gomWL4rwAQboVGCOnEQtcHLgJBESOpeQ3d52c69JrF082J3+aDoK5V19Ntx1v8gA//9ogFLr+Y8OyQlTwcvqSwhJu6fIGl+ZR0OX/vkCH8RtYP8DR34Z4+rYsC7OLAx3j/ImJVWCwrW1BA4ThCJRLoI0wf0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <418b801a-0a1c-406a-99ab-7e3bf81374b2@amd.com>
Date: Tue, 5 Nov 2024 11:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/device-tree: Let DT reserve map entries
 overlap reserved-memory
To: Grygorii Strashko <grygorii_strashko@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, <xen-devel@lists.xenproject.org>, "Luca
 Fancellu" <luca.fancellu@arm.com>
CC: <tpearson@raptorengineering.com>, Jan Beulich <jbeulich@suse.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
 <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
 <1ae100b3-17f0-4ac5-beb3-fdd2f12adee7@amd.com>
 <a127edbb-8006-466d-a529-1b7a80af21b1@epam.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <a127edbb-8006-466d-a529-1b7a80af21b1@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: c4339ca2-c711-4f5d-c0f5-08dcfd869408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ni9uc3JiR0doc0pyZGRuTDNZNG9iR1lnL1ppcXNhcm0vMGlwYW9qbUdqWm03?=
 =?utf-8?B?RW5iUlBmb0ljOW5vdEFoVUZ5eGsyVzY3Q2tvNnlFcGFHRTFtZ0lNOGVocXFz?=
 =?utf-8?B?dVFvMldpUVFKTnplbThsWXNrenZUTDErSXpNZTRvR3hNZlFiU2I5ODB0cllt?=
 =?utf-8?B?K1FLQlhVRkZNRnludXBabkxrWGEzWTNDTEtFNVFweXdXZFZHNXBLUnZRN3pq?=
 =?utf-8?B?dDJsZStTZnlRVHdJeXRYK0Jna21qelFSdGJsUzl5OHl3Z0JKZGdpb1ZhamRV?=
 =?utf-8?B?YVRMN2tRVnpQTUprbWp2RGtib0pDTzc0VHd6SW42U0hPODlHOG0vbzJ1bWVO?=
 =?utf-8?B?ZFllYTZkU0JtRjBlUGtWQ3NBZkxMVjVOYXQ3M1ZKVE1mR05BbTEzbUFXR3JJ?=
 =?utf-8?B?UUQwMnJFUzRuQTVVRFlDMmE3cjNZa2V0ck9vNk9GWWlHNWdLRllkSllWY05x?=
 =?utf-8?B?K3hSSnRPanZ4SGVXSkJCT0F0Wmx4SHNMbHd6dXBHOEpSM1VxNWx0OHpORTRu?=
 =?utf-8?B?L1Rrck1EWVJSYWVHSGJRL05WTk5DTUxCN0JNOHA3Y0hLWUFqajN2U0YwMzMw?=
 =?utf-8?B?NERDZnhzcnJYemFTYUJQa0gwbnRoSlVMRG05UWFtYUZ0a0Zrakpra0EvYmVH?=
 =?utf-8?B?MC9EcUNlTlMrQTc4b0ZocG5QTkwyeFBLc2VlSG8rVVhrVXR0VkhQcEpsbzN3?=
 =?utf-8?B?L216WmVXTzMyck5UM0YrYXFQRzRMbnI3R1h0aFRYL2p1MHdhdnIxdC84RTBT?=
 =?utf-8?B?ZTlLUW5YS25aWnQvaDU5ZXdGTUg4WXc1YjdwVmZja3p5WklGYzJ4eWdqSGRr?=
 =?utf-8?B?cUZqelJBTlNoSEl3emw0Q2hpZy80MG1RaGVlNzB0T2l2VmdvM0pFTGpETk40?=
 =?utf-8?B?RHRJd3NFSk5iYVZ1ZnRjTlFoeFhwZjhoczBldWZjcXhzSEMvR1NNNUJabUJu?=
 =?utf-8?B?NDBRTFZIODVTL3dack1TeGl6V2t5ZXd0azdQSUpudEpHVmI3ZE9UOXVXOFh5?=
 =?utf-8?B?bGo3YTlFMEZkRnNIMjlMdVFTbmdtbUdHZEZyZlFhYjUzV3NFd0lpNXhHQkFo?=
 =?utf-8?B?Ry9YZERnbHJKSmtOUTEzU2w4YWc5VjJMSFp4OXFpMVFJaVlpem1JN1h0c2Nz?=
 =?utf-8?B?VmVhdVFuejdTUHBZaG5XTCs4ajhyVndFVUFUc1RHUzMzdTBGRlNRTTViUXJS?=
 =?utf-8?B?OGVvS2YxQVNJSVRTN2loaHUzQWVZNHRxakVyYkRJTFNrRlZKZHAyeExHRnZm?=
 =?utf-8?B?VTdwUWpXT2RnRko5aC92TzRoczBHK202VEhacmFaZlhrd1Uxc2lZTFVub0Nh?=
 =?utf-8?B?Q1JJK3lBTUVBNFFPU0RXQ1N6Q0VSVHNTWXpNQWs5NjhJdDJYdXltVHBmM3Fm?=
 =?utf-8?B?UjVUY3F1eEZ2QXdaWTlTV3QraTY5NW02UUI1MkliamhlSlZEV0dzaVZQYWg1?=
 =?utf-8?B?TVFuNGxGMWY1TnI5WVRzcUkwQU4yNmp3WVZUblEwWTBWbzRLenVEQ0dKek5p?=
 =?utf-8?B?aVBVMjJjSSt0cU1lWU5YVC9mRFhTWUFxa1NYdDJsVnQ1MEplNUlzbi9HbkF5?=
 =?utf-8?B?TldhWGh2RzNWS2dTN3QyemQvNTBzM1U4bUt2SGg2TWowSjFwS1NDSGZQMGU0?=
 =?utf-8?B?RUpQR3FWN0M4dWlQcGcvc2w5RlVWMFRna2Z2SWJMYmlGdVVESFVGckM4Yzdo?=
 =?utf-8?B?NFBwSW9DUWZycXpkbFA5SzVKN2o2Qk5MTUU3aGxhc3FhRDZ2OTNna2JySEZQ?=
 =?utf-8?B?bUhyTWJ2REtzVSttRTk3OUhaSUdLdWtJYVdvS05PclY3UWE4bnhFQVFXYjdp?=
 =?utf-8?B?YUE3aGpYY0NoY2Jpb0F6bWJQcFZhTUZoZGhPQU9YdzhaaTl3NXY0S3RtaXY1?=
 =?utf-8?B?cmw3dXpEY3RmRkZFQ3BJMW5wczJsb0VmNVhtUTZLc21YNVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 10:42:43.0033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4339ca2-c711-4f5d-c0f5-08dcfd869408
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452



On 04/11/2024 13:39, Grygorii Strashko wrote:
> 
> 
> Hi All,
> 
> On 04.11.24 12:49, Michal Orzel wrote:
>>
>>
>> On 27/09/2024 00:24, Shawn Anastasio wrote:
>>>
>>>
>>> Commit 53dc37829c31 ("xen/arm: Add DT reserve map regions to
>>> bootinfo.reserved_mem") changes the way reserve map regions are tracked,
>>> and as a result broke bootfdt's ability to handle device trees in which
>>> the reserve map and the `reserved-memory` node contain the same entries
>>> as each other, as is the case on PPC when booted by skiboot.
>>>
>>> Fix this behavior by moving the reserve map check to after the DT has
>>> been parsed and by explicitly allowing overlap with entries created by
>>> `reserved-memory` nodes.
>>>
>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> ---
>>>   xen/common/device-tree/bootfdt.c  | 28 +++++++++++++++++++++++-----
>>>   xen/common/device-tree/bootinfo.c | 11 +++++++++--
>>>   xen/include/xen/bootfdt.h         |  3 ++-
>>>   3 files changed, 34 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>>> index 911a630e7d..2a51ee44a3 100644
>>> --- a/xen/common/device-tree/bootfdt.c
>>> +++ b/xen/common/device-tree/bootfdt.c
>>> @@ -177,7 +177,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>>>       {
>>>           device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
>>>           if ( mem == bootinfo_get_reserved_mem() &&
>>> -             check_reserved_regions_overlap(start, size) )
>>> +             check_reserved_regions_overlap(start, size, NULL) )
>>>               return -EINVAL;
>>>           /* Some DT may describe empty bank, ignore them */
>>>           if ( !size )
>>> @@ -590,14 +590,36 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>>       if ( nr_rsvd < 0 )
>>>           panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
>>>
>>> +    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
>> This should be moved before fdt_num_mem_rsv so that the program flow makes sense. In your case nr_rsvd is
>> not used immediately after.
>>
>>> +    if ( ret )
>>> +        panic("Early FDT parsing failed (%d)\n", ret);
>>> +
>>>       for ( i = 0; i < nr_rsvd; i++ )
>>>       {
>>> +        const struct membanks *overlap = NULL;
>>>           struct membank *bank;
>>>           paddr_t s, sz;
>>>
>>>           if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
>>>               continue;
>>>
>>> +        if ( check_reserved_regions_overlap(s, sz, &overlap) )
>>> +        {
>>> +            if ( overlap == bootinfo_get_reserved_mem() )
>>> +            {
>>> +                /*
>>> +                 * Some valid device trees, such as those generated by OpenPOWER
>>> +                 * skiboot firmware, expose all reserved memory regions in the
>>> +                 * FDT memory reservation block (here) AND in the
>>> +                 * reserved-memory node which has already been parsed. Thus, any
>>> +                 * overlaps in the mem_reserved banks should be ignored.
>>> +                 */
>>> +                 continue;
>> I think this is incorrect. Imagine this scenario:
>> /memreserve/ 0x40000000 0x40000000;
>> and /reserved-memory/foo with:
>> reg = <0x0 0x7FFFF000 0x0 0x1000>;
>>
>> You would ignore the entire region described with /memreserve/ even though it overlaps just the last page.
>>
>> The problem you're describing is about regions that match 1:1 in /memreserve/ and /reserved-memory/.
>> Therefore I think you should check that the overlapped regions match exactly.
>>
> 
> I've also discovered an issue with Commit 53dc37829c31 ("xen/arm: Add DT reserve map
> regions to bootinfo.reserved_mem") - the bootloader adds Initrd in
> FDT reserved map which then conflicts with Initrd module (ARM64).
> 
> This patch, as is, doesn't fix an issue for me:
> 
> (XEN) Checking for initrd in /chosen
> (XEN) Initrd 0000000084000040-0000000086152ac6
> (XEN) Region: [0x00000084000040, 0x00000086152ac6) overlapping with mod[2]: [0x00000084000040, 0x00000086152ac6)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) FDT reserve map overlapped with membanks/modules
> (XEN) ****************************************
> 
> So I did fast try of Michal Orzel suggestion and it seems working for me.
> And if it's working for PPC - may be that's it (feel free to incorporate). Diff below.
> 
> (XEN) Checking for initrd in /chosen
> (XEN) Initrd 0000000084000040-0000000086152ac6
> (XEN) RAM: 0000000048000000 - 00000000bfffffff
> (XEN) RAM: 0000000480000000 - 00000004ffffffff
> (XEN) RAM: 0000000600000000 - 00000006ffffffff
> (XEN)
> (XEN) MODULE[0]: 0000000048080000 - 00000000481ec000 Xen
> (XEN) MODULE[1]: 0000000048000000 - 000000004801e080 Device Tree
> (XEN) MODULE[2]: 0000000084000040 - 0000000086152ac6 Ramdisk
> (XEN) MODULE[3]: 0000000048300000 - 000000004a300000 Kernel
> (XEN) MODULE[4]: 0000000048070000 - 0000000048080000 XSM
> (XEN)  RESVD[0]: 0000000060000000 - 000000007fffffff
> (XEN)  RESVD[1]: 00000000b0000000 - 00000000bfffffff
> (XEN)  RESVD[2]: 00000000a0000000 - 00000000afffffff
> ...
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 0000000048300000
> (XEN) Loading ramdisk from boot module @ 0000000084000040
> (XEN) Allocating 1:1 mappings totalling 256MB for dom0:
> (XEN) BANK[0] 0x00000050000000-0x00000060000000 (256MB)
> ...
> 
> 
> ---
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index f2e6a1145b7c..10e997eeca8d 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -124,6 +124,30 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
>       return false;
>   }
> 
> +static bool __init meminfo_is_exist(const struct membanks *mem,
> +                                         paddr_t region_start,
> +                                         paddr_t region_size)
> +{
> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, bank_num = mem->nr_banks;
> +
> +    for ( i = 0; i < bank_num; i++ )
> +    {
> +        bank_start = mem->bank[i].start;
> +        bank_end = bank_start + mem->bank[i].size;
> +
> +        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
> +             region_start >= bank_end )
> +            continue;
> +
> +        if ( region_start == bank_start && region_end  == bank_end)
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
>   /*
>    * TODO: '*_end' could be 0 if the module/region is at the end of the physical
>    * address space. This is for now not handled as it requires more rework.
> @@ -154,6 +178,29 @@ static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
>       return false;
>   }
> 
> +static bool __init bootmodules_is_exist(struct bootmodules *bootmodules,
> +                                             paddr_t region_start,
> +                                             paddr_t region_size)
> +{
> +    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
> +    paddr_t region_end = region_start + region_size;
> +    unsigned int i, mod_num = bootmodules->nr_mods;
> +
> +    for ( i = 0; i < mod_num; i++ )
> +    {
> +        mod_start = bootmodules->module[i].start;
> +        mod_end = mod_start + bootmodules->module[i].size;
> +
> +        if ( region_end <= mod_start || region_start >= mod_end )
> +            continue;
> +
> +        if (region_start == mod_start && region_end == mod_end)
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
>   void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>                                     void (*cb)(paddr_t ps, paddr_t pe),
>                                     unsigned int first)
> @@ -201,6 +248,37 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>       return false;
>   }
> 
> +bool __init check_reserved_regions_is_exist(paddr_t region_start,
> +                                            paddr_t region_size)
> +{
> +    const struct membanks *mem_banks[] = {
> +        bootinfo_get_reserved_mem(),
> +#ifdef CONFIG_ACPI
> +        bootinfo_get_acpi(),
> +#endif
> +#ifdef CONFIG_STATIC_SHM
> +        bootinfo_get_shmem(),
> +#endif
> +    };
> +    unsigned int i;
> +
> +    /*
> +     * Check if input region is overlapping with reserved memory banks or
> +     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or static
> +     * shared memory banks (when static shared memory feature is enabled)
> +     */
> +    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
> +        if ( meminfo_is_exist(mem_banks[i], region_start, region_size) )
> +            return true;
> +
> +    /* Check if input region is overlapping with bootmodules */
> +    if ( bootmodules_is_exist(&bootinfo.modules,
> +                                   region_start, region_size) )
> +        return true;
> +
> +    return false;
> +}
> +
>   struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                                             paddr_t start, paddr_t size,
>                                             bool domU)
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 16fa05f38f38..b8db1335be6c 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -159,6 +159,8 @@ extern struct bootinfo bootinfo;
> 
>   bool check_reserved_regions_overlap(paddr_t region_start,
>                                       paddr_t region_size);
> +bool check_reserved_regions_is_exist(paddr_t region_start,
> +                                     paddr_t region_size);
> 
>   struct bootmodule *add_boot_module(bootmodule_kind kind,
>                                      paddr_t start, paddr_t size, bool domU);
> 
> 
> 
> 

I don't think there is a need for introduction of that many functions. For a simple exact matching case
we can opencode the logic a bit. On top of Shawn patch, the minimal version would look as follows:

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index d35b2629e5a1..759c790888f9 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -586,14 +586,14 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)

     add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);

-    nr_rsvd = fdt_num_mem_rsv(fdt);
-    if ( nr_rsvd < 0 )
-        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
-
     ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
     if ( ret )
         panic("Early FDT parsing failed (%d)\n", ret);

+    nr_rsvd = fdt_num_mem_rsv(fdt);
+    if ( nr_rsvd < 0 )
+        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
+
     for ( i = 0; i < nr_rsvd; i++ )
     {
         const struct membanks *overlap = NULL;
@@ -605,19 +605,33 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)

         if ( check_reserved_regions_overlap(s, sz, &overlap) )
         {
-            if ( overlap == bootinfo_get_reserved_mem() )
+            unsigned int j;
+            bool match = false;
+
+            if ( overlap != reserved_mem )
+                panic("FDT reserve map overlapped with membanks/modules\n");
+
+            /*
+             * Some valid device trees, such as those generated by OpenPOWER
+             * skiboot firmware, expose all reserved memory regions in the
+             * FDT memory reservation block (here) AND in the
+             * reserved-memory node which has already been parsed. Thus, any
+             * matching overlaps in the mem_reserved banks should be ignored.
+             */
+            for ( j = 0; j < overlap->nr_banks; j++ )
             {
-                /*
-                 * Some valid device trees, such as those generated by OpenPOWER
-                 * skiboot firmware, expose all reserved memory regions in the
-                 * FDT memory reservation block (here) AND in the
-                 * reserved-memory node which has already been parsed. Thus, any
-                 * overlaps in the mem_reserved banks should be ignored.
-                 */
-                 continue;
+                if ( (overlap->bank[j].start == s) &&
+                     (overlap->bank[j].size == sz) )
+                {
+                    match = true;
+                    break;
+                }
             }
-            else
-                panic("FDT reserve map overlapped with membanks/modules\n");
+
+            if ( match )
+                continue;
+
+            panic("FDT reserve map partially overlaps with /reserved-memory\n");
         }

         if ( reserved_mem->nr_banks < reserved_mem->max_banks )

Let's wait for Shawn test and other DT maintainers opinion.

~Michal


