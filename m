Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E996F9CDDFE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837308.1253315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv1v-0002PU-1G; Fri, 15 Nov 2024 12:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837308.1253315; Fri, 15 Nov 2024 12:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv1u-0002Mj-Sp; Fri, 15 Nov 2024 12:02:26 +0000
Received: by outflank-mailman (input) for mailman id 837308;
 Fri, 15 Nov 2024 12:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHts=SK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tBut8-0005UF-MO
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:22 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20607.outbound.protection.outlook.com
 [2a01:111:f403:2408::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3296ca28-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:16 +0100 (CET)
Received: from BN8PR04CA0028.namprd04.prod.outlook.com (2603:10b6:408:70::41)
 by SA3PR12MB8021.namprd12.prod.outlook.com (2603:10b6:806:305::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 11:53:12 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:408:70:cafe::58) by BN8PR04CA0028.outlook.office365.com
 (2603:10b6:408:70::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 11:53:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 11:53:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 05:53:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 05:53:11 -0600
Received: from [172.30.86.253] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 05:53:10 -0600
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
X-Inumbo-ID: 3296ca28-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwODo6NjA3IiwiaGVsbyI6Ik5BTTA0LUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjMyOTZjYTI4LWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTk2LjcwMDU3LCJzZW5kZXIiOiJzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHN8r+RODQMRYIjyFthuionoG3YTVqTVy+MGwjZ03pJPIL629iI/OcNUu83wbUvGbuW24BL8ZDj/HqSVxgJnQTXi2YW5MwQ3LYS3AqPiPplLotiGXGLBSFqtDoUyQCHhKgTnMSzD8i8Vw5lguYVvulvI8L0jiMy+DvqOaVyijp/zPqypFxsTgbD4Jn3lT3GB96qNjtxsVErpHNMzDB80P25+SSTzRuHlnT08fM260cFzU+KLLwiTjjW+Mn7kQB6Tz/vpAjUdEgAPYRzdqG1Vll2gs77U5yWXUMlkpmlpC2A6By1+PAnOqGUhT3Ok4Ugu7zMSj2+FtZLB68dvguA1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=364/DgW48fE10Pe7XEFHWNwrLlFlYwITFQpfFQeOhXw=;
 b=RyVsZA8fgBPa6UITfSEYyyjD0FmbphM6mwylmefYka9oZpJKq8HHwI/lHj+tboFjhmmHMPvsosmS8GNnemO/I+2QrLmNf5OwyWvZdUlVPpMHwI7IWoAdu1DT05phps4peeV2dmIvN1L2yk8IV0l10H6jZMdusmHOb+rDs2xnCvAFL0ptLjPv+4q5ZLxPzD6suIVnnpx95MG3ntRmlS9upRA3QV7+oiagD4ZUJOWpUvi3LACfeYmSfKL+3SYhzd73rqCfmSlST+aG1M4Z18R5wFo5dcanHw+zKbt7eoh1QzXxAlV+6y1IN2nVF82zcJeXpWD44jD+YMrrhyDdydtTUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=364/DgW48fE10Pe7XEFHWNwrLlFlYwITFQpfFQeOhXw=;
 b=b4CgovTy+fPNiOq9/pm4X+26iewSoThZLq1o0ZFs2wdR2EsMvz8GXDMmNU0HC/KdwjSC452J28raC2YgbCC1JmjcjLRUSOZH4Ome0NiifguCYsQ98WU4GKqALeMr4XBAjZMvWEtBWMzpz43NFfRGmrXJxnBya6c0+VF8yIxELxU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2938c2b1-f2db-43f4-9241-09b21e428f69@amd.com>
Date: Fri, 15 Nov 2024 06:53:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] xen/pci: introduce PF<->VF links
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20241112205321.186622-1-stewart.hildebrand@amd.com>
 <20241112205321.186622-2-stewart.hildebrand@amd.com>
 <975e3dbd-40e8-49c6-8aab-7e7bde1a233f@suse.com>
 <06149848-c14c-4f44-80b8-b596479505cf@amd.com>
 <69f9e816-6f17-4821-b26e-668f451e24c5@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <69f9e816-6f17-4821-b26e-668f451e24c5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|SA3PR12MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e850e6-c97a-45f7-5e9c-08dd056c1515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2tnOE1EMDlDWExQOGcrUjZ5Y3NmdVVYNm1BcnZNcUNqWkNBNG5JN0g0cnUv?=
 =?utf-8?B?d1pYaHFjdUdZSmNvRithaW4wcEcxSzA1SDl5a3g4Wm16Z2RBaVQxdldVZVBT?=
 =?utf-8?B?dlZEeWE2eVArODFPOHUvWU5NMGJub3RTWmRPZTkyOThVZnUyaCtDbTdrZlpY?=
 =?utf-8?B?dUlCQlpmbk94K0VhV250Z3RteHBmNjE5akd4Rll0NmY1dlN1TVV6bDVZZm11?=
 =?utf-8?B?RnlhUWhMSVlYR1FtRVVNZVVVQU4yYWk4OGZpSFlwclJxcURlYTdiR3NWU3U1?=
 =?utf-8?B?aHFxK2FqRUNYcFc0dm5YS0JQUWJBNnV2UGVNbHVOV3dEcmc0R3ZhbXVRNDNr?=
 =?utf-8?B?ZHVYYXlTZm9rUWhrVTFrZFlBUFU3YUVBeSs1MHo0c3VwRmJ6d1RWODV4bHdu?=
 =?utf-8?B?ZEpXYUhxbVIzRHpHcTNrVEtCUGVSeHF1cVJ5WkwwY0pMVlNpRXMxbWMzSzd6?=
 =?utf-8?B?WEJqVnpsQUxKWDhTU2JzckovZTdQMEpxcDFwN3RiVzU5enp2bnZ5b0hacmpm?=
 =?utf-8?B?RDNtQm1ZYWlPSEJZaEI0ZzZ5RktoT1hxak5XczlEQTBBUUcxcGtsU0g4Smdw?=
 =?utf-8?B?TmVoekVzUVJ4NWdWSWl4NW1WdjJVNUtSL0k3QUxneXRtNkFPb3BTcWlZZE0v?=
 =?utf-8?B?bDUzNUg0K1hXM3R0VzNTRDFuVUJwbmNmZVRUTlJhUmROTFhiQTUxU1dsZ21s?=
 =?utf-8?B?aHhQM1BsMHNQcWJHbXd0RlRHQms4TEtlRDJROFBXMlRkanR2UXk0YWoxcnM5?=
 =?utf-8?B?bmViUytiaWw2aW5PVVV3MkNNRlVXaU9oWXdiZmtHdXpnVGMrbWZ4emJJdmZz?=
 =?utf-8?B?NzlvRWtZWDBMWnI4QUhYRGZCKzViR2VUUXNYSUdVUWhQNXpZV1NPL3kyWFow?=
 =?utf-8?B?YTQva3BURmk4aGdJbS9KaHFnOXd4bU4wV25iVHhjOExaQmtrbkhGSDg4bi81?=
 =?utf-8?B?SmlwcEtaTU13Nzl1NjhaRWJmUUdBdUV4UjRhOGl6WkhCUGd6M0xnTjVONStF?=
 =?utf-8?B?bURMb3VDU1JKQ1FCeUdISWZjUk5hcXZCdk5HckVXcjBFSDRiQ0o0V3ZoRURz?=
 =?utf-8?B?bXVQNWgzOEJUTUxPams3a3BIMDNXQ3lrZTlQdEx1UnhlWC83TG5qcmJSRWNj?=
 =?utf-8?B?Y1BKeHA2ZUZRWFIxSVFJUTFLL0lFQkJ2K2dkMmN1YzBIL0ZFS2o3WldDMXIy?=
 =?utf-8?B?OUhhSEQ5OW4vR3FBcFBYL3lZeG5HMjZoVW00Q0lWL2lrN0R3ZlR2R0RSbWJI?=
 =?utf-8?B?Mzk4M0NhR1dXNEFyNU5wTTZOQlN5eE1nbG9JTUhqT1dzdkZhSGdlaGZ4OE9i?=
 =?utf-8?B?VHVMcXZVS2pJOFVtTEtPWTBIbFkwQXF2SGRaS09RNUJtZzR4SGNPWFY5VXBZ?=
 =?utf-8?B?TWtSejRwK2xXVUxIYUxVWjJ5VW9SWHFveSs2a1d5ZHdCSDhIcFpSYWlkUWFY?=
 =?utf-8?B?WEdseDR4OW93NHFuVEFpVElIeHhHaXRsWUF1bXN0VWpPd0tlcDRCQXcvOGlV?=
 =?utf-8?B?K3FuV3dtZlUrY2pBQ1pGbGdpYUJQampJUGQ2Y00zREVGREx5NDZvQTFNd09q?=
 =?utf-8?B?QnpOUGYwUzFrdmhHZjZVWmMvUUpMblUvMk9aajJNZGh0cDI2ZlVLbURGN3NP?=
 =?utf-8?B?WkNMZlhrVmhOamF2ZDZSM2txUWo2RWxRMjkySmc5SXNMek52YXA1WFVJcURx?=
 =?utf-8?B?aTRualVRbGxtdTJmWUZYcVdrSHc1aktXYmFhVStkSlcwYjF1RXZ4MjdrSDE4?=
 =?utf-8?B?N204VFBlL0xQR3JERUU5M0xaTGJ3TTZhNnZIVUFtbzE4ZjAvS3NiSU5Md1pU?=
 =?utf-8?B?LzR2RDRGWGxJRmRuTGRId2NLU1pjS2tyQzZYQld2RjZpKzRLejk0RndaVU1Q?=
 =?utf-8?B?VnFXNzVDd1h0a0VrNjdPUHE4ZENqSUE5YWxVakNSNXgzQ2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 11:53:12.3869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e850e6-c97a-45f7-5e9c-08dd056c1515
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8021

On 11/15/24 02:55, Jan Beulich wrote:
> On 14.11.2024 19:50, Stewart Hildebrand wrote:
>> On 11/14/24 05:34, Jan Beulich wrote:
>>> On 12.11.2024 21:53, Stewart Hildebrand wrote:
>>>> +            pdev->pf_pdev = pf_pdev;
>>>> +            list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
>>>> +            {
>>>> +                if ( vf_pdev == pdev )
>>>> +                {
>>>> +                    already_added = true;
>>>> +                    break;
>>>> +                }
>>>> +            }
>>>> +            if ( !already_added )
>>>> +                list_add(&pdev->vf_list, &pf_pdev->vf_list);
>>>> +        }
>>>>      }
>>>
>>> Personally, as I have a dislike for excess variables, I'd have gotten away
>>> without "already_added". Instead of setting it to true, vf_pdev could be
>>> set to NULL. Others may, however, consider this "obfuscation" or alike.
>>
>> This relies on vf_pdev being set to non-NULL when the list is empty and
>> after the last iteration if the list doesn't contain the element. I had
>> to look up the definitions of list_for_each_entry, INIT_LIST_HEAD, and
>> list_{add,del,entry} to verify that vf_pdev would be non-NULL in those
>> cases.
>>
>> Perhaps a better approach would be to introduce list_add_unique() in
>> Xen's list library? Then we can also get rid of the vf_pdev variable.
>>
>> static inline bool list_contains(struct list_head *entry,
>>                                  struct list_head *head)
>> {
>>    struct list_head *ptr;
>>
>>    list_for_each(ptr, head)
>>    {
>>        if ( ptr == entry )
>>            return true;
>>    }
>>
>>    return false;
>> }
>>
>> static inline void list_add_unique(struct list_head *new,
>>                                    struct list_head *head)
>> {
>>     if ( !list_contains(new, head) )
>>         list_add(new, head);
>> }
> 
> I'm uncertain of this kind of an addition. For long lists one would need to
> be careful with whether to actually use list_contains(). It being a simple
> library function would make this easy to overlook.

It occurs to me I could simply check if pdev->pf_pdev has been initialized:

            if ( !pdev->pf_pdev )
                list_add(&pdev->vf_list, &pf_pdev->vf_list);
            pdev->pf_pdev = pf_pdev;

