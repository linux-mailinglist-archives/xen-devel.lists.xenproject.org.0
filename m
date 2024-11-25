Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B69D8F93
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 01:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843216.1258858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFjYo-0001JR-V6; Tue, 26 Nov 2024 00:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843216.1258858; Tue, 26 Nov 2024 00:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFjYo-0001GL-S8; Tue, 26 Nov 2024 00:36:10 +0000
Received: by outflank-mailman (input) for mailman id 843216;
 Tue, 26 Nov 2024 00:36:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFjYn-0001Ft-9O
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 00:36:09 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:200a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67e385b3-ab8e-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 01:36:00 +0100 (CET)
Received: from BN1PR12CA0013.namprd12.prod.outlook.com (2603:10b6:408:e1::18)
 by DS7PR12MB5717.namprd12.prod.outlook.com (2603:10b6:8:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 00:35:51 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:e1:cafe::a7) by BN1PR12CA0013.outlook.office365.com
 (2603:10b6:408:e1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 00:35:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 00:35:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 18:35:50 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 18:35:50 -0600
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
X-Inumbo-ID: 67e385b3-ab8e-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjFhIiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjY3ZTM4NWIzLWFiOGUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTgxMzYwLjQ2OTE0LCJzZW5kZXIiOiJqYXNvbi5hbmRyeXVrQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/RgejOrOcO7a6JoRx6mnkFbvNyUvndsxiBJfL32ApAi/3RmqWLFdOdaxbRXczj6ALk4EtVgsSVBBJLyeDYkbHiV3bUE4MRxTLAVHBeKzKpLffjJMS2F0MRtHNuEsKDvVmDPF4jH9GbtLOe10knZ5WJ4Nemr8srUBcRrYUyn7Qqogs/pOD4WjYwycmnqLEacvnhZJ3HUCkSQ6Se61JLtNW82BfwbAN3x4/NJ7f/KKI2KKVEiLxhNp2uAb1SKw95m3pTjh/JXBV8u6mtdJtGBUaiaiiSxEBkOpRdqhjvJcRG8W/Pt/oPXH/eMrmpXUF4WPzHh4uyQjvKqo77Eh7xTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIKEUq1ELeWIZJcSQKrc2rPPYKcO9OvXXkFaJHCJ0ZQ=;
 b=MTSnv7mblCKKle5ANa2T4QB+BbpFglbDpDApZF9wD8PXTJ1slT1odnC/YjWke4GYQQkNiaa7rdqcBHMzDsBdJKOIJi7mrof+u2khCM4iVQFhkU7EW7kKKWVEfalK8VG+8E3owxBL7gjxFJz3vYpQgzbutwS5Rr1tVdgBK3Fs68byd00O+GakgtUfpROg1Bw2+pLI6O631M42pWhvuiaw1azkYcB6ECx5o0Qp2Czs082d6X1tLGNfa/fKQanZopn0vJ5fbKCbF5NExz7gD/DV+gn0LUlZfIKyyLX3EdYWHrTKiXqM8hhxS0GeMElnw3/m25M11X7670JisPU2fXTJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIKEUq1ELeWIZJcSQKrc2rPPYKcO9OvXXkFaJHCJ0ZQ=;
 b=X/6aUlSL1rQkxMPI6khjTLO3ggTesW4nKxB/gbIwCmSE4nuXPWoxA009SejYpAbI+Qe0Trgh9lZvZqdPQgORs2aCp3bVdBXBwfjlQwSgJBhUzCaWEspfkgFxp9r/QjC1dG9EicJ03eJD0tIZDdSxHBIi57p+HSL5udgQ/aEJzIs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eb6812c4-fde1-408c-87eb-138a6d5f981c@amd.com>
Date: Mon, 25 Nov 2024 17:54:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-9-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DS7PR12MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b8667f-2fa7-4602-84d7-08dd0db247a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUlvRzVDTUJoZ09EaHJQVmlxZ2traldmcUxYM0Q3Wm5ieU5YcmZwUFlXUWNN?=
 =?utf-8?B?TzlSSkhkMVhOOWZkVG1CV2UyOHBTU1BkZkpiUTVoYUlnSDNxcUVvejJ2TzFM?=
 =?utf-8?B?VkZldEdPZE02eXRQVmhnR1dvMlJtSld4M3UvcjM1VnBkcG80MTFHcVo4OW8x?=
 =?utf-8?B?SmRzSkMrTGdoNG5lM2JDM0ZORzZkZzYrVXFXOW1ucWY3QVJ6YzE3YnkrUERV?=
 =?utf-8?B?M09vbm1HL0V1bmxYOUwrSXRNbUxXYlVrOEJwMkNUSXI0SSsxbGJYYUR1cEZR?=
 =?utf-8?B?cEJ3Y3RUWmFwL0kwWWF2RkxrNWcvV29TdittNXNuQmpmMDd1cmZlckRIUkRK?=
 =?utf-8?B?RlFaUUlMM1FTVndJWUNkSDF1ck5QRnpTeWFRS3RqNW9ob3dPcmNRdDBDNG51?=
 =?utf-8?B?dmFFVVB6NUVrNFhLdThBTHdXYzh1bjBlS0hlbXplYzB1ZHEySjFsTExFMFlR?=
 =?utf-8?B?UTJvcjc0WXgwSG1mSDBUUjVGNExxcStTemora3ZueEhFeEsvNStxM0c4Z1cw?=
 =?utf-8?B?QU8yY29NSmk3Q0NuQkROeDNwN0JkMURhajlVbmtUUDFUODFCWnhBTm9yQWVi?=
 =?utf-8?B?T2ZKSm0zT2lXazVVWHRxZGl6K1pBSGF6d0pEamdDNGpJM1hZNjhhVnNTY2Iz?=
 =?utf-8?B?Z204WHFySzArQktLZU8wSFJkR3R0Z29oRHRBbFJpOTFXMG1RTDc4K2NVUktB?=
 =?utf-8?B?SXNjNnM3YTRiVmNhZ05QSUFwYTM4S0tpM3hmd25sU3Ric1h0MUpBV21RTklE?=
 =?utf-8?B?aTNQSHlPRUwwN0hta2FzWVRjNm1FQ0pUeUk0dER5MHlZWlNoU2FiVzFVZzAr?=
 =?utf-8?B?eXd6STFoODVkYkhsK1ZwZm5lMVB4dmpTYjNrTDhFOFB5M3k5dzZvY1laeFNQ?=
 =?utf-8?B?dlhQbjg5OVNUUnZsUCsvWmlLUXBTeDNNZTZCcUU4ak1WcVFCdzVwakpCZk4x?=
 =?utf-8?B?VHVjSE92cHJQTWNqUmdmSGxia3A1b1hEcTVvSVlSMStVYWIwcEtIY0lUbmdE?=
 =?utf-8?B?VzV0UlV6cWJCVFlrTk1MdWNIbnVWcForZWVlSTZsanNzU2ZmUHFJcVkyRFNm?=
 =?utf-8?B?VzJXY0RCNGNDbmxTalcvNVZNb0s2Q0plNm5EQzdhUnBCNjg1VC9GNmszaWlv?=
 =?utf-8?B?aE5YTy9nN1NUSUI0ekJRbkxLS3grMlVmTzJyUEkxSWkrVHBGYjU5NU1lR3JM?=
 =?utf-8?B?WmN2bktKd05vcDBjUmRCRXpMTVdVMmFQOGlwdFhJRTM2YUhLMEVHUHAzUHQ2?=
 =?utf-8?B?dStJOTh1M2ZNS3ZjWFJvL1pXOERPcVVPaHBhWVdld1Vmb0psYVNwTUxSM0VK?=
 =?utf-8?B?N01Ca3lFZENPOUlRbHo2QWtBQUdreGRubC9oeHNqWTF6RWJFeTR4b3cxVjQ4?=
 =?utf-8?B?RWRDODExUDNzTnF4WlBpcGl6cWdGSVE2cEEwaldzV3JhdVRnZ2dzeWZrRlJz?=
 =?utf-8?B?QUhTZ1pJMmZTRERKUCs4dldzWXFtcUZHbE4yc094MnJ5cU1qMzN5MitsVXJk?=
 =?utf-8?B?dG1PY3B3alJaT1ByRW9vNUdQM29sQm0zMVowRGdHY3g5cTMwZGM0V00xUnYw?=
 =?utf-8?B?c0ZZZXA4eE9CQzA3NVo2RHRGOFB0OEUyRFczR0g1b0g4WDdmNGJqSjJ0UUpS?=
 =?utf-8?B?RFRPV2g3aFpIUTFncnJEL01QRE5ndVZBZStsUWhHSDVTN2czdWsrNnZzWjAy?=
 =?utf-8?B?SWliT3ZKRm5MWmpxcHh4eTIyM2dTQ2ZISFIzUlJwMnFPeUYxU0hwQ1ZtWFpE?=
 =?utf-8?B?K3ZXaTFjRURwdndtL2NLcDVDRXRnVkdsZmFDVThxaHNKK21LN2pHVnF5eXpn?=
 =?utf-8?B?Vm9PSVhkM0pEWDJ3aTFSTmZwSFJqN21CcDk4QmtTRXJKK09ZMUtVWkhWQlJi?=
 =?utf-8?B?Z1UyV1JoQklZbE5IbVd6WVJrVUxRdHkyZTRGZ0d0bXl3bGNkdzZDL3hrM3Vx?=
 =?utf-8?Q?22USaed9QGH8yCjivi5115aSGuieQWes?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 00:35:51.3157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b8667f-2fa7-4602-84d7-08dd0db247a4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5717

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Look for a subnode of type `multiboot,kernel` within a domain node. If found,
> process the reg property for the MB1 module index. If the bootargs property is
> present and there was not an MB1 string, then use the command line from the
> device tree definition.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
> index a80f3711c306..9335f3a9ebef 100644
> --- a/xen/arch/x86/domain_builder/core.c
> +++ b/xen/arch/x86/domain_builder/core.c
> @@ -56,6 +56,18 @@ void __init builder_init(struct boot_info *bi)
>   
>           printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
>       }
> +    else
> +    {
> +        int i;
> +
> +        /* Find first unknown boot module to use as Dom0 kernel */
> +        printk("Falling back to using first boot module as dom0\n");
> +        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> +        bi->mods[i].type = BOOTMOD_KERNEL;
> +        bi->domains[0].kernel = &bi->mods[i];
> +        bi->nr_domains = 1;
> +    }
> +

extra newline.

>   }
>   
>   /*
> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
> index ff1ba58b6907..6bf1c4a297fe 100644
> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c

> +static int __init process_domain_node(
> +    struct boot_info *bi, void *fdt, int dom_node)
> +{
> +    int node;
> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
> +    const char *name = fdt_get_name(fdt, dom_node, NULL);

const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";

to avoid...

> +    int address_size = fdt_address_cells(fdt, dom_node);
> +    int size_size = fdt_size_cells(fdt, dom_node);
> +
> +    if ( address_size < 0 || size_size < 0 )
> +    {
> +        printk("  failed processing #address or #size for domain %s)\n",
> +               name == NULL ? "unknown" : name);

...all this duplication in the following patches.

> +        return -EINVAL;
> +    }
> +
> +    fdt_for_each_subnode(node, fdt, dom_node)
> +    {
> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )

I thought you were going to use "module,kernel" and "module,index" as 
u32s for multiboot2?

Regards,
Jason

> +        {
> +            int idx = dom0less_module_node(fdt, node, size_size, address_size);
> +            if ( idx < 0 )
> +            {
> +                printk("  failed processing kernel module for domain %s)\n",
> +                       name == NULL ? "unknown" : name);
> +                return idx;
> +            }
> +
> +            if ( idx > bi->nr_modules )
> +            {
> +                printk("  invalid kernel module index for domain node (%d)\n",
> +                       bi->nr_domains);
> +                return -EINVAL;
> +            }
> +
> +            printk("  kernel: boot module %d\n", idx);
> +            bi->mods[idx].type = BOOTMOD_KERNEL;
> +            bd->kernel = &bi->mods[idx];
> +        }
> +    }
> +
> +    if ( !bd->kernel )
> +    {
> +        printk(XENLOG_ERR "ERR: no kernel assigned to domain\n");
> +        return -EFAULT;
> +    }
> +
> +    return 0;
> +}
> +
>   static int __init find_hyperlaunch_node(void *fdt)
>   {
>       int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");


