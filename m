Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62869D9025
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 02:47:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843280.1258918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkfp-0003jK-0c; Tue, 26 Nov 2024 01:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843280.1258918; Tue, 26 Nov 2024 01:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkfo-0003hi-Ty; Tue, 26 Nov 2024 01:47:28 +0000
Received: by outflank-mailman (input) for mailman id 843280;
 Tue, 26 Nov 2024 01:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFkfn-0003ha-GC
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 01:47:27 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2412::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60b9a0bd-ab98-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 02:47:23 +0100 (CET)
Received: from CH0PR04CA0097.namprd04.prod.outlook.com (2603:10b6:610:75::12)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 01:47:17 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::be) by CH0PR04CA0097.outlook.office365.com
 (2603:10b6:610:75::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend Transport; Tue,
 26 Nov 2024 01:47:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 01:47:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:47:16 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 19:47:16 -0600
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
X-Inumbo-ID: 60b9a0bd-ab98-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjE4IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjYwYjlhMGJkLWFiOTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTg1NjQzLjU3MjAwMywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oh86FwKKJqDdx230f21TiH5+Grpw/jHx0/UTd7/VgaG9u8JpHv0mrnETRV1Dtk9N6Ycl1dheQApnvyh45CQhucJg8j+RlC2vw0ofyXvLmMlo0Qti+iGG1DuFMpNoCaGRvIgcidOuyvDEMmHpdCbAPycLf+Uk0hUTguJWwvwFd+0KkHXZMI0ZUKHkUhzy8cUc51JLojW/Ct/XO6YZb6S5l6LVtN/AL6KUbYaZZ4DmJZXbq/JgVqcAX53YfU1K+IJFmuM2TEyyh/QXKpOfxU/8YiLbxEa7RIJ+e7uwA98RgRRYhkmvZjB7Qw/2Ic/tuAbG5SLeM0tXA4X7nGCLQIHulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHUzhEc7ag4FYbCYpJ/G5wIKonovNV4qSMljZEScPNk=;
 b=GEkMGSijt7JE13gjyT0w6ICSaVHwv1oHLN9AdhhAKmd8kTm5oGHMTiBxbbLQvjoDicTfmTOeJoZ7VFfgyo4NssP4VEw/hAhe4Q+q+BalyzV7KVu3A+3LCaR/UBpMC3s2O9zbB0Mpw2xr1SnnUjB1QMQIOLD7Pz1kSjuhAL/9i0uJjcBN2KfKwpu5h09pYQ6uQaXpK+vND1b/HOCML3KKhRlUogq6Wbgf12xfw9iQltcwFiNRVc4bx9Dp2zAhrO3tTnyfJwxM46wFNz7S9H/JeaxGHtIaSKI2kVhWqsYn1UkpS7bbcD5M9wyz7qAgnzg9PlV59V98sC9kPzOWSCNxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHUzhEc7ag4FYbCYpJ/G5wIKonovNV4qSMljZEScPNk=;
 b=ve6LJ/DfidwZk2y3NGdcLyUV0PeFXrjgKQRiG/nvYOY4K8fUhAp1yVji15X049rsx0dJEMMmom6+Ss/8BNX6Rd2fb2KGwqjiafZ9pFKp0lGUJYPJ1hwRhvvRhcShXDijV1wpzpOYOw9JfooVooeKGDoge1DU3x1g3YG7Op/UYj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <0dc5d92f-5405-4eaa-ae77-bfa6a347d9d8@amd.com>
Date: Mon, 25 Nov 2024 19:05:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] x86/hyperlaunch: add max vcpu parsing of
 hyperlaunch device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-15-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-15-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|MN2PR12MB4343:EE_
X-MS-Office365-Filtering-Correlation-Id: a75d43ea-d951-4b8e-63a9-08dd0dbc426d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTgzcWUrNnRUaE9yVkU1UXlETXBQbmZtN1hMVjVDYktIVXM1THJjeTZyd1Zq?=
 =?utf-8?B?N1FzMjlrK01PK3BkaUhZM25TbkxBaUI0K2ZyZWJzY2U5OXNhbnpON3pCaDlo?=
 =?utf-8?B?bEsxaTZpcDFsdDJHbUo3MjBUV29XU29MOE1uMTVBcmVSWnpIcWZJcnBTQUZr?=
 =?utf-8?B?dWxWOEpJcHBYM1FoNjVvVFNXYnVLNWlPMCtyT05OMWtNRGNac1JQdjBrUUJD?=
 =?utf-8?B?bnl5ZU85L2NKbDVrbVk3S0piSUhvSGpDT0F1c3Y1SlJMTUpPd29rSDNMbHZH?=
 =?utf-8?B?QWZkRWFVSVhMOGlCbEo4ckszQ01MZ1lOWFpicnNpd1hRaWlzQlBhZURPWkNt?=
 =?utf-8?B?NUZhYVpvdXNvUUc0ckx0WkRiRy9xWENCdHl2aEZwNEVSbWR0eXFxTVFnSnZy?=
 =?utf-8?B?dVZVd0ErRHE5a2dkdU04VnppTFdraGNQQnViNjhaR05UWkN5VDhleFZVUFNH?=
 =?utf-8?B?VW9LRU45RE1mS2JYRCswTm1vaFdsSEV2UVJBeTF2T2pRRnNCR1l2YVFrTDZ1?=
 =?utf-8?B?aitCc0hSL0dLN2JnOTJIMzJtL25TaXF1bDFMcS85eEkrSzdTeVR0WWRGUC9l?=
 =?utf-8?B?eHY0SVZqdzQ3VzUvN3hCVzBkWWxoRzBXak9LN2Vqd3Vqa0VqelJVU0xkS1lK?=
 =?utf-8?B?MG16Q2p5Z3kxRzNQajBLalJCbmYzL1paT1R5YVA5RExBZjB3ZmJ2ZUlvd09U?=
 =?utf-8?B?ZXZWTERDb1g5Q1BaWno4QzBjVmEwRXN6MTNZMHNPai9iSiszTGgxd25ZZkw1?=
 =?utf-8?B?SFZBY2NkWk85dkdiNXFubVl6QUJudENrelNaK1NsTjRwdlo2SU4yYmhzUE9K?=
 =?utf-8?B?eGFpR293RWdUS0w3dlNYdXlDNllJak9xenhtZFRoZEZTTGdTaG5kcnFNOUls?=
 =?utf-8?B?L1R2NmtBNStjdDgxVzRmbElrZDgvcXNPZnZjNXRSM2UyMUJyYlh6cTVIaGhY?=
 =?utf-8?B?T05ub2Nma25TQVVMbmFSbHcvUVZZVUNvbmVKeDBIbGh5TVFSK2NuektFQklx?=
 =?utf-8?B?SGViaW1FcHdLT2NtSVJVYU5EZ2d4czFtOWNuaktJNTlFdUg3MkRUYUZnZGx1?=
 =?utf-8?B?cHJqKzNQMzJESTB0T2VZSUVxTENpVnRNUHVISS9HWCthSUY2QTNQUUJObVBs?=
 =?utf-8?B?Zk8vWC9BMTZRVzFJQUdPUW1DUG0xQ2EzNGFHU2VUc2ZUYUlaMm9wNzV6alQ1?=
 =?utf-8?B?NWY4ZkFiUjZVT25yaEc0RFVTK1hvTE9lU2Z1VS8yUDBhZHFzU0k4eDg1d3dI?=
 =?utf-8?B?bmZudGNaaGJjWjdlWm5HK2xWWHdnYklBM0VKekNhUWtaS05NM005TElaL3Jz?=
 =?utf-8?B?UCt6T2E3dW9na2t4TFpwbElWeVdRbEFjZE9MbGhoYmRMT3RRcm9vUTNRMXpp?=
 =?utf-8?B?RWlPcGwrZU1PSjVPRzc2ZDRjaXJHeGxndFA1MDBNaGo2eEoxcWVxdnY2WWw4?=
 =?utf-8?B?bG1xVzJxSThydHErMERXWlpOSmJFb002bGJZMWVtdWd1RWljNjlxNTkxTUI5?=
 =?utf-8?B?SDhKcXhJb0JseEpNSzQ3aFlsUWFJdDRHejJFOWM0K2JEdWp2dE5GM2V2a2cy?=
 =?utf-8?B?ZzFVMkNxU2NoN1VicjdKcm5MYytWYzk4Z29VVGpIZlJtVGt1MGJZcXJxcmtD?=
 =?utf-8?B?a3NjbVcvTDNUVTc0OTk5UjJtWWlReFB4bTFlRzdnbjEwc1hxTDMyMzJNbUdq?=
 =?utf-8?B?RjV2bDM5NWFNa3FZSVdtb2tDa0pXUU5oWmNkOXhmLzlPSncySWhZMWdKcmRq?=
 =?utf-8?B?VFFQQmxrQloyeVZUcWk1QWtkSm1SVWRHci9teSs3Vis2NGZHSUJEMGQwTDJQ?=
 =?utf-8?B?OFlBZjlnY2I0OUJCN1hLdDJHYUFDUU5WWUZWVFhzbWhnbFJ6QXlQdmwva2Mx?=
 =?utf-8?B?ZS9xdzQxZm9UZGFVRlBxSnYzbDRHVFJOVW56ZHlxMGwveFNYVVNPUm9sL01H?=
 =?utf-8?Q?2HDOLiDnlcpsa2kLn1ztespuWsD4chy7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 01:47:17.4862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75d43ea-d951-4b8e-63a9-08dd0dbc426d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Introduce the `cpus` property, named as such for dom0less compatibility, that
> represents the maximum number of vpcus to allocate for a domain. In the device
> tree, it will be encoded as a u32 value.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---

> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
> index b8ace5c18c6a..d24e265f2378 100644
> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -197,6 +197,18 @@ static int __init process_domain_node(
>               bd->max_pages = PFN_DOWN(kb * SZ_1K);
>               printk("  max memory: %ld\n", bd->max_pages << PAGE_SHIFT);
>           }
> +        if ( match_fdt_property(fdt, prop, "cpus" ) )

I think I forgot to mention it on earlier ones, but I think all these 
match_fdt_property() should be chained together with "else if".

With that

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

> +        {
> +            uint32_t val = UINT_MAX;
> +            if ( fdt_prop_as_u32(prop, &val) != 0 )
> +            {
> +                printk("  failed processing max_vcpus for domain %s\n",
> +                       name == NULL ? "unknown" : name);
> +                return -EINVAL;
> +            }
> +            bd->max_vcpus = val;
> +            printk("  max vcpus: %d\n", bd->max_vcpus);
> +        }
>       }
>   
>       fdt_for_each_subnode(node, fdt, dom_node)

