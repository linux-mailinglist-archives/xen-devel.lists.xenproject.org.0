Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297779CF1F5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 17:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837835.1253732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzR6-0002UY-5E; Fri, 15 Nov 2024 16:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837835.1253732; Fri, 15 Nov 2024 16:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzR6-0002Sp-2N; Fri, 15 Nov 2024 16:44:44 +0000
Received: by outflank-mailman (input) for mailman id 837835;
 Fri, 15 Nov 2024 16:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuMk=SK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tBzR4-0002Sj-4Z
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 16:44:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2415::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e445715d-a370-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 17:44:34 +0100 (CET)
Received: from BN9PR03CA0070.namprd03.prod.outlook.com (2603:10b6:408:fc::15)
 by PH0PR12MB7885.namprd12.prod.outlook.com (2603:10b6:510:28f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 16:44:30 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::40) by BN9PR03CA0070.outlook.office365.com
 (2603:10b6:408:fc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend Transport; Fri,
 15 Nov 2024 16:44:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.0 via Frontend Transport; Fri, 15 Nov 2024 16:44:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 10:44:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 10:44:29 -0600
Received: from [172.17.143.135] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 10:44:28 -0600
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
X-Inumbo-ID: e445715d-a370-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjI1IiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImU0NDU3MTVkLWEzNzAtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjg5MDc0LjcwMDQxNCwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pttk8Bb4g1QFYjukO9Mh/elN6GvQr69wxEQJqb1QpSXks5NiEx+mKSGB+X/tsEonQJYnwxUWKNBJpZlxyaRxIPHTBR/XfUsTpvzDYrnjZszGloJx/eufR6dXVHYaMJW6yfqyheS60+afgxjJ0O8hnta2tiF9eCrM+7GxGk7A84SytS7ar+Zbb3S5EAiAIcyEQ15iyafUCxnPU40oNUThg1VJxc59kYAqKoRrneLwgdpTaOaIMusuS00qxnErcThrMYuELdmfArdSdXUil3KsiYmP5eGJYpKbYPjHVUMdNJ6AoldGZf3suSdgoMUCNI5RgnnTCRsmCc5dOh9Mkss9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONAGz/W+1qt6C1LrcZqoUGtnIeN0P7yMND5DykLyQmk=;
 b=q/T5OAVAK+ONFT++RtnUV1X9HpZb+XefzErJtMCu8bE2TqNQxgwpZsuIM1ozfFCLc/+JZ8a9ZJIbrGaDW1mjnVWm49OvoZCQwSPOF24bVtCrPNeRU9uZPz848JicDEfni8i8lKbvdlEOI+c5rck5xVqAa1NIWsyOCYwArFV19J0aJaS3GMLag2/3RDlRB8Z7MM9u9IqX1x9HL6AZ5VgN7JuSP+G3eFqloWhxbe2ugWoxWxs9mzRcf5CWoperLhXlnU2qDuWzOXmDxrqhmJ6/IfRGNn4JcV11bPrpKDf4MVY70R/RqtUqAJ3g8Hs2Mi2tvQfzxACGM/O1BJdGaFa4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONAGz/W+1qt6C1LrcZqoUGtnIeN0P7yMND5DykLyQmk=;
 b=Dqxj+Ud0CiVrteTOpB4zmSJqU4yRqMg5qWB2Wr/NKzUp+R/Q8hUHf5lJlmBjNzI+Yi7cQrdOUaL2P52/CDsqjp5O6BE/TCksoEVY+JAF+bTG4XVDaheZa1A1QN/gZdw4YztQlp7ATFfi+vbhE6GZbA6k1TzfR4NHXnTNUlkhcTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <24e23ea2-e359-41f3-be62-6b7bdff4e074@amd.com>
Date: Fri, 15 Nov 2024 11:33:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] x86/boot: convert domain construction to use boot
 info
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-2-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241115131204.32135-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|PH0PR12MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fc53b0-1839-4a3a-640d-08dd0594c68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzNqRzFiVG9aV1hwRzNWa1Q0anpzNHhEcW91NHByMWNWQnpIeWZoZXA3K05D?=
 =?utf-8?B?bXpTT2J2TkpYZmpBN21TSHpUL0VUQVNtdEVDUXlIdEtvcGx2aDVpRVFFcWg4?=
 =?utf-8?B?ejJMRWs2OW9Xa29QUzgvdkl1RGRtaS9SbVhTTlhCVkFZNisvaTNYbFVPdmdT?=
 =?utf-8?B?dTV4NktDbEt2djdJYmFJUTRsV1ZyV3d1QUdvZmNoQjJ5UjVGNDI2MWJlZG9Z?=
 =?utf-8?B?UVArZjJwQlJRbmF1TUxCYXE1N2NPcThBcFJMRkdUb2Zpci9GdTlSS2NvQWI3?=
 =?utf-8?B?V1pDS2JUQlhxN3B2TzRZWVduT2NQcFhmUm9MSnVnTnBreUZVMTZFK2grdVUz?=
 =?utf-8?B?dWlORVRvSmM2M0hyZkhRNFcrQkxtR3RKTG9CODR1dzUxV3Z1cDB1aWgyWGlr?=
 =?utf-8?B?MnlOajlZN1BuQXE2T20rSVBUdDdwYkZwK0J2V3FqRVZXckc3WDk2bDVjR0Ur?=
 =?utf-8?B?dzV2QlJOb3Mzc2N1T3IyY0wvVUZzTllOaTNTS3FScENwTHlHTEhlRWFRMHMz?=
 =?utf-8?B?Ylc5YzJQQ1Z5U3ZhVlBpUHovdUs1emFtWHMrMkZReGJpWE4rRzk1NXBMZGsw?=
 =?utf-8?B?RlNhTHV0VmVlWVJxdklkRXAzU3FWYVlpbXRlVHJuOC9rejZxQVgvUW13T25V?=
 =?utf-8?B?NER3bWhBVUlwZDNGVE9jNGhrM2ZibWZ4VnhnbGltZy9BOWZUZVpScy8yeWda?=
 =?utf-8?B?NnVDU1d5MGtyWVlSY09qdmpybExqM3IyVlNuc2dEUGJiWXJmV3BWaHZVSzRH?=
 =?utf-8?B?ZzFBSlYyTE1RbFRCbnR4ZW9ZamZCUGtKKzNvby9EU2dZK1dncDdLYmNqNCtF?=
 =?utf-8?B?RG40a3RzTU96QWx1YStjTHNyaEczVXhTVXZ5eTJkUTJLTGpzTnZnSDJ5S0pS?=
 =?utf-8?B?S3l5ZVVwWGV5cStjODlFUnlkS0VkNFFCWGhaMnpTYzVGT0NMcWFMdjR0R0xv?=
 =?utf-8?B?VFNueDdpTGdZNjU3MzNwL0pGelhrd2xBZnhkd1dkQk9XNmJFSVloQ0dWblNN?=
 =?utf-8?B?N3YwUWZOMDU0SUdOL1ZYU1ptUm16cFQzQ2pIS2w5WmlUcjg2M0NMSlhiUUlo?=
 =?utf-8?B?dUJFc25iRy9nUnZhWm5PdXFqL1FuWUdFZmlXVjZsUHJ3cFJ2VklvcHoyelBk?=
 =?utf-8?B?bWJPUzM2T25kNHdvVVNSazBKOWE3VFNNb1MvN2x1cmlLaEtKQldHY09FaEt0?=
 =?utf-8?B?QmRvZzByaWVYcE9zaVNkS1g2NkFkTVRLVUJweHFrbUNvWW5WMklISWh6SEJh?=
 =?utf-8?B?ckhzZk1zSWtGSlpVQnc2a1RWWEdLQ2ZRV2JmWXk3cm1vVVY2WDN4Y1lxazJS?=
 =?utf-8?B?NCtWdVJsVzMwTFZDZm4ybmVyYWRwWS9SNUdGYi9zamRZTEV3dTduTFU2M0NS?=
 =?utf-8?B?WENmYlhIVXNONlY2N0JnMjd5REVRN2c2ZGFGZUR1K05TUjZhRFdqdkFLdVhC?=
 =?utf-8?B?SzRxNHBRZ2o2VlVTa21lblhSck9obHl2SGo4YWF4ek9iMmtyV3FXNDIzVGpJ?=
 =?utf-8?B?ZFB5UHVPbS9KVDZVZ0F2ZFNkQnNNOHV5L1NmQkVMRmFEVU1jZ0dTN2NSQU1Z?=
 =?utf-8?B?SVpYYkxwNU01MTUweU5xdEVoek9JbjJkQTZSdFNYN3Z4Y1N4VUFiQS9NaDBn?=
 =?utf-8?B?SDg3cjFIenA4MXJMMTZISUxvK2pVQ0FyV2Yya09MV3FuNW1ENWFpc1Z4cDd0?=
 =?utf-8?B?OVBHYjFUMDNGc21UL2JxT29tcHBET3VjUnhQZlJlbWlHRUVlMDdFV0JhdmRX?=
 =?utf-8?B?VVZjVlpieFNXSURDaWhCeTBvMktMallqMVFKRE45WVNaWVJHeXlHVFN6V1R1?=
 =?utf-8?B?ekl2Z1RObk52RFpBWmhsR1BkV2dGdFRPT0tWaUZ6YTc1ckpMUGVJc0dmdFI5?=
 =?utf-8?B?dktJU1duTVp4aVFmektYdmdWWmdua1ZDU0V1WHhSWTRCWVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 16:44:29.9882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fc53b0-1839-4a3a-640d-08dd0594c68c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7885

On 2024-11-15 08:11, Daniel P. Smith wrote:
> With all the components used to construct dom0 encapsulated in struct boot_info
> and struct boot_module, it is no longer necessary to pass all them as
> parameters down the domain construction call chain. Change the parameter list
> to pass the struct boot_info instance and the struct domain reference.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 3dd913bdb029..d1bdf1b14601 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -1300,16 +1301,26 @@ static void __hwdom_init pvh_setup_mmcfg(struct domain *d)
>       }
>   }
>   
> -int __init dom0_construct_pvh(struct domain *d, const module_t *image,
> -                              unsigned long image_headroom,
> -                              module_t *initrd,
> -                              const char *cmdline)
> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>   {
>       paddr_t entry, start_info;
> +    struct boot_module *image;
> +    struct boot_module *initrd = NULL;
> +    unsigned int idx;
>       int rc;
>   
>       printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
>   
> +    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
> +    if ( idx >= bi->nr_modules )

What do you think about introducing a new define:

     #define BOOTMOD_NOT_FOUND (MAX_NR_BOOTMODS + 1)

For first_boot_module_index() to return.  And then:

     if ( idx == BOOTMOD_NOT_FOUND )

?

Otherwise it looks good to me, and Andrew's suggestions are good as well.

Regards,
Jason

> +        panic("Missing kernel boot module for %pd construction\n", d);
> +
> +    image = &bi->mods[idx];
> +
> +    idx = first_boot_module_index(bi, BOOTMOD_RAMDISK);
> +    if ( idx < bi->nr_modules )
> +        initrd = &bi->mods[idx];
> +
>       if ( is_hardware_domain(d) )
>       {
>           /*
> @@ -1347,8 +1358,7 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,

