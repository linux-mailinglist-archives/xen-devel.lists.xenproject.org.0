Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA609C3565
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 01:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833284.1248404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAIV8-00078a-Cn; Mon, 11 Nov 2024 00:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833284.1248404; Mon, 11 Nov 2024 00:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAIV8-00075e-8n; Mon, 11 Nov 2024 00:41:54 +0000
Received: by outflank-mailman (input) for mailman id 833284;
 Mon, 11 Nov 2024 00:41:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lXmN=SG=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tAIV7-00075Y-6T
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 00:41:53 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [2a01:111:f403:2408::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b83cfb74-9fc5-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 01:41:43 +0100 (CET)
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by BL3PR12MB6403.namprd12.prod.outlook.com (2603:10b6:208:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 00:41:38 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::f5) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Mon, 11 Nov 2024 00:41:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 00:41:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 10 Nov
 2024 18:41:37 -0600
Received: from [172.17.143.135] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 10 Nov 2024 18:41:36 -0600
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
X-Inumbo-ID: b83cfb74-9fc5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwODo6NjMxIiwiaGVsbyI6Ik5BTTA0LUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImI4M2NmYjc0LTlmYzUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMjg1NzAzLjA4NDQ3OSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUdlEl4wR+DX8e/bGLQUwK7cT5baBT2Vlw6DR8dMjNvZvfU41mYsFAsOXwR3knCOyx55voKYsVg5Dq5/auoPD92lxdO8ludI9JG9XXJjWGdja86P/0rGPNSWa34kneI4LZIr/G+243cLObPm5N6sm1hSzsCTt+4879tsy2t40P1EueoWOfU8NE1o55gQv5bIib/2i0Y+g7AoTPvxwqW7CXPDoFcJcBZflh3jNguOhvTr0RiewYXJkw888cOJywGv1tW09Qx720o/whv8kxqB97VsJNKkOkmm6ANaKv0ABqank3BAmuJm4aAOFF/OzOqc9v9OK+8PVWONRGr4wCWQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABJUv5E9o58HhKmF0WeZnKV+R/ZPY+Ymo+vs/dthYmI=;
 b=Xkf9ukrnK3kBh6rvU8tKl7Do7zE0xZtrMZhAMCUu25Sx1++9RBZWRAhgfo1lD1q7Xrk1m1cwne1PV1qnWOMQ9g5jmKc1tJFVNMV+FVRtOHl3+DoftV5T23jqs+ttOunAakCrZBO/V6WWXoAy5BW4E/oDQn1KY3CAMlwRvNhT+F+VzRAelP1Cje7sdk+Fuw+qJ33ajwsjZ2fSWQockfzgN/DO2YdLdGIb2p1dUkgZbgLYzZvPvbt9ke1AFwSO6Lzhu4hMY971AdKmBnKa+q/0/BckvVK+e4WvleZbtcvaKt5BMnuG5laEgfLn71gtM9nH3U0Yjvs9boPF5Evr6zOrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABJUv5E9o58HhKmF0WeZnKV+R/ZPY+Ymo+vs/dthYmI=;
 b=My+QP3ddWSIRhMdKFpvV4tFbxV6zV+N+DLj5Bi3V8Y/pRO/pbUCMyj4V1HbqHi6exXn4YzQ1nuUQpRB+1ZmcUp9a/YrstmE5nXsh5LbZU4JvXm2YeqktpSk3XpMr9H1l94sEp6wagBnP7pZNCYHK/1SW6KHX9ZkkOFJJOm92TKc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <92898f00-cff8-4a96-906b-2390b082e719@amd.com>
Date: Sun, 10 Nov 2024 19:41:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 09/12] x86/boot: add start and size fields to struct
 boot_module
To: Andrew Cooper <andrew.cooper3@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-10-dpsmith@apertussolutions.com>
 <bd4fa542-7e05-463d-99d7-b5c57781a56e@amd.com>
 <c8d690f9-a357-44de-a6e5-4bbab4256c51@apertussolutions.com>
 <54d9913f-55ff-46a8-b43c-2e20c5640985@amd.com>
 <f1aa733c-b4eb-493e-88db-73e2192c8320@citrix.com>
Content-Language: en-US
In-Reply-To: <f1aa733c-b4eb-493e-88db-73e2192c8320@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|BL3PR12MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: bbfa0be5-323b-45a1-1d6b-08dd01e999fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmxVaUN5UEpMamgyci93dU5PM0Z6SXVaS1FxeVRPOVBNVklTdE5YUXBHTFBB?=
 =?utf-8?B?Rk1DL1pQaThReHdaY1BxTHgvdEF2VndudERIWTNLbUlTelNSUUNnYzR5MXQy?=
 =?utf-8?B?SmZjZGt4QXlyOVJRZzVoSS83bkZuSXZKM1poeHFkTzZmZEVkOGtia2ZNaXVk?=
 =?utf-8?B?KzYyZlZVYmhXYnVPTnhHbGNyK3QxSVpBZVZyRW8xRHNmQnJWamhUc2E4Ukdo?=
 =?utf-8?B?TFovQXhkOUpWelJnejN2ZFBLQ0xsWWNvaXpEMGVWdnZiVFpFemFBS0xRaUhm?=
 =?utf-8?B?QkdQaTFGbkVKcnd0RG10RXhzME5sOHVEMExPN0I5TVd5elRQOThUeThkN09B?=
 =?utf-8?B?T0xJY2ZSQW1sTHNBUUdlcTZJUU9hRGNlUC9SM1VESkFWNVdEWE1leE12VEVB?=
 =?utf-8?B?QUV6OE90MGpLbmFxOEFsbjU4cjBZRXZwM0lYZFhYQnBYUUdXOW1INmtoc1p2?=
 =?utf-8?B?WmhnM095Rk16S0FjOHEvMDZ4MjU2UjVqd28rT2JoOWxlZHgxTzNkMXc2eGZk?=
 =?utf-8?B?OGVqOW15djRLL3pLc1NBU0UvL081RnZ2c0I5MEpwNytzbXVraEgxdGgyZW5G?=
 =?utf-8?B?UzFLczFIQVZqbnY5Q3ZIeFBQYnJpTkUwR0FCajgwa29IYjNpbS90UDlIVTMv?=
 =?utf-8?B?ZTgxL2dZOHJwZ05oeXZBeWQrdDdONkl4ck5JYXgyU1dFUlVFZ1F4TFZvSEQz?=
 =?utf-8?B?YXZIZm8zbmNxaHhsNWRkWXAyeHpCanl2OEU3ZHFoWjdZRG5JYzM0VFRpK3hu?=
 =?utf-8?B?WDM1dEZ3aHVlZDAvR0pxN0ZzczBPaXVKQm12bmdJWU5rdmVUQmw1VlV5MFNI?=
 =?utf-8?B?cUliZGo5eHJVOFVaNUhhZTdFVDVqM0dQL2hUZUxLWnE1NEdTR1lzZjhyMzNX?=
 =?utf-8?B?Myt3ZWEwb1NnNjFBSWMxa0VrSEZVajBuaUdRQUZpc2FqcGFaamNUbHZpMnV2?=
 =?utf-8?B?VEVQaDkxSlJlN0NidTFlQS85L0VNVFQzMWRyWWNzSEJJWjRyNkVDSmJERGJo?=
 =?utf-8?B?ektQbmxFNjhWZFJ3bXRBOFRzanZPdGErYkMzT0hVanE5VXlSN3ROUTZjVzNT?=
 =?utf-8?B?VTVXUHp4OCtodFl4RXZUemVEenN3eklQYldYc05SUG05KysyTHcxVzBlcitu?=
 =?utf-8?B?S2N2Z2Z3WmR5ZituNHlCc2NEZDZkMURERGxrUGZ1bTNZdDZEWEh2SW9yeTd5?=
 =?utf-8?B?dndOVXJiZFY1Q3poZFdQQVdiaFlEUnV1VTdEdURXRi9UMjB0anRWQVlQNE5u?=
 =?utf-8?B?eUJQREtrWlV2cDk4anpybTI5M2JaZ1M3Njc3MFZKcDNiMWlGZGJMcFJCM2l2?=
 =?utf-8?B?MGFHa1d2cWxQTUIwRkJDRndDeUdTS2JVVUYweXpuRVNEOGs3Znp1S3N3OHN4?=
 =?utf-8?B?QlZKS3g5KzREWXF0S0ZaY2N6bE5FNjR5N1lBR2ZKQVg3NlhuYk5adjQ0RzZF?=
 =?utf-8?B?dXFsMFloc3pxWkxxKzFJNWY4TkxMaDY4TUpxZ1hSeVFMYVJkZEF0S2EyTS9k?=
 =?utf-8?B?bSszZE5WdWo0ZlRBUHE1Y1M3MmNiOUdPbWovMG9rek8vUTZXM29EYWNDcHRD?=
 =?utf-8?B?cWgzSGNQVkhDRGpWKy9CbExtaGJ2RUpuWC95MGl0MGR0blhrRmdON0hLRm1l?=
 =?utf-8?B?WEJtcDhUV0JnRHpUdSt2cHUxOVljSlg5RG5ibmJ3KzZLWS9aVTd0cjUxZW8r?=
 =?utf-8?B?QnMvZGtjc2ZTQWtyalQ2S1NUaithUVhOYTIyL2dieFVpcktGY0s3WFVjYmZ3?=
 =?utf-8?B?WTl5SjFSWllIKzNpR0xYZXRLTituMk1KbTR3eHhYMDJ0UVJwTnFhblBrRmR6?=
 =?utf-8?B?RDk1WjlleG95VWhoTWJib2loc09MSGRCUFdUU1J4ZExIeUQ0V3hYK080aTNx?=
 =?utf-8?B?eUYvSFp2RlhCRkZ4WlJ2dm4xYXdjYUZFWmJMQTZEZVdzV0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 00:41:37.8272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfa0be5-323b-45a1-1d6b-08dd01e999fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6403

On 2024-11-08 16:10, Andrew Cooper wrote:
> On 08/11/2024 8:48 pm, Jason Andryuk wrote:
>> On 2024-11-08 14:17, Daniel P. Smith wrote:
>>> On 11/7/24 15:47, Jason Andryuk wrote:
>>>> On 2024-11-02 13:25, Daniel P. Smith wrote:
>>>>> @@ -1745,13 +1733,11 @@ void asmlinkage __init noreturn
>>>>> __start_xen(void)
>>>>>        for ( i = 0; i < bi->nr_modules; ++i )
>>>>>        {
>>>>> -        const struct boot_module *bm = &bi->mods[i];
>>>>> +        unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
>>>>> -        set_pdx_range(bm->mod->mod_start,
>>>>> -                      bm->mod->mod_start + PFN_UP(bm->mod->mod_end));
>>>>> -        map_pages_to_xen((unsigned long)mfn_to_virt(bm->mod-
>>>>>> mod_start),
>>>>> -                         _mfn(bm->mod->mod_start),
>>>>> -                         PFN_UP(bm->mod->mod_end), PAGE_HYPERVISOR);
>>>>> +        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s) + PFN_UP(l));
>>>>
>>>> This is fine today since s (.start) is checked for page alignment.
>>>> The other option would be `paddr_to_pfn(s + l) + 1`, but I'm not
>>>> sure that is an improvement.
>>>
>>> Out of curiosity, why are you thinking that module start would never
>>> be paged aligned?
>>
>> I think you have an extra negation - the module start is always page
>> aligned as checked elsewhere.
>>
>> While reviewing, I was just noting that this code starts rounding
>> addresses when it previously operated on pfns.  Non page-aligned s + l
>> could then cross a page boundary.
> 
> It's worth saying that until this patch, Xen critically depends on
> modules having 4k alignment.
> 
> This patch finally breaks that dependency, so we can e.g. load microcode
> actually-early on boot.
> 
> While the modules are currently aligned, lets try and write code which
> doesn't assume it.
> 
> So yes, probably best to have
> 
>      set_pdx_range(paddr_to_pfn(s), PFN_UP(s + l));
> 
> here.  (I think?)

I think PFN_UP(s + l) is wrong when it ends on an address ending in 
0x1000 since it will not be rounded up.

s=0x1000
l=0x1000
PFN_UP(0x2000) = 2, but I think we want to pass 3 set_pdx_range.

So I think we want:
     paddr_to_pfn(s + l) + 1

I was wondering if we needed s + l - 1.  But size is set as
mod_end - mod_start, so s + l is correct.

Regards,
Jason

