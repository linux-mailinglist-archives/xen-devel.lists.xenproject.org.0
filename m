Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E159CF24A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837855.1253752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzhg-0006LW-RM; Fri, 15 Nov 2024 17:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837855.1253752; Fri, 15 Nov 2024 17:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzhg-0006JY-Nv; Fri, 15 Nov 2024 17:01:52 +0000
Received: by outflank-mailman (input) for mailman id 837855;
 Fri, 15 Nov 2024 17:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cuMk=SK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tBzhe-0006JS-S2
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:01:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2009::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4950cdc7-a373-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 18:01:42 +0100 (CET)
Received: from CH2PR19CA0011.namprd19.prod.outlook.com (2603:10b6:610:4d::21)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 17:01:38 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::92) by CH2PR19CA0011.outlook.office365.com
 (2603:10b6:610:4d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 17:01:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 17:01:37 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 11:01:37 -0600
Received: from [172.17.143.135] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Nov 2024 11:01:36 -0600
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
X-Inumbo-ID: 4950cdc7-a373-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjBhIiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ5NTBjZGM3LWEzNzMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjkwMTAyLjk1NDIwNiwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNN44yFi3xHzEMdGqmcotqS1tBJPYoHStkvzqpky60QH2L7S8AFxPy6Utx5KPKjqoEk3rCx4XKQdSp4Kqw55vOnOgOI1XUQb20bGMyWGGK7ltQiKcHwu6BMajxySwdXG8VRUNPAk46cU2HgKt6YAdSCOdFvALEWFytsC27FO5Jg4zzNEnkF8i/wriCnbnGSXKgf8M509Pz0ITkhc4o3uFWcKldQpC1EiSLB10vSbK2Mz/0Hof1TwMCq9XDRKcqXraW1ODi4RlGxX2ttEVM77KKb/FibQUakygp0gp4MIhaFVsNObwiYYZPOl/mcDmu/1dywYZ2mSrRHVg7ECTxxKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK6a7A+Y+2CrGlYIwmmFpnBzYfR/VJR0kFLkqLAHfqE=;
 b=BvhdZBXZzM4DjkN0rBSQ/CpBnHdjzV0CtU/0fzOcYMUkAnqgibW52eByrSHq43mgzNkejm/AHPiL85SVTPcMzJsVmths+8psGpXzL/1ov0Q6oJtmrPa2L+RyBYQEu6zU6ZEsa/O4I/s2zvDu4tkA+iPjhoSezxlhPSKbyjR9L0NOsUUsA5H+7JTyiUhu+z+N5hJxBdhw1qxo/Bo9Z8vgVgdUEtOinwJ646Sfd7oeA+DICHDyEj3edmDS49aXJADrMe3bwGxRzZwzvASXPN5wDTVa9i350cqNy0l1/WpOYc92IX6hCSHlR+j0KLyaITiHuMjUoNoYl+Por9E069njFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IK6a7A+Y+2CrGlYIwmmFpnBzYfR/VJR0kFLkqLAHfqE=;
 b=GjZlfFwp4T+C0DUhkZmhuYDmOr5VZLME8amVCIwdqo1eHTGigLdFgjmtro/Sjp+j0Ko1O+VqxDQr0WG6jsb7ZnjeqYgWg4GvDzdOehKX/JuO1J9i+iGNQkpsaeShtPCngiPCEO8FIhW+oin+OGLEnlK095B5qwn5IrQ8+Ai/B0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <374d2387-6f8c-4a2b-a979-7066675dd247@amd.com>
Date: Fri, 15 Nov 2024 11:50:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] x86/boot: introduce module release
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-3-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241115131204.32135-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: de72cb71-e3e5-417b-64ee-08dd05972b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME1yTzk4eWQ2RXpyQWswVXVCZFM4b3BjdlVpZHhqNVZLQ05EcDJDT2ZncWZX?=
 =?utf-8?B?WW5tSW5JcUk2a3Y1MGJNcmluYlE0WHBmM3NaOW12Y1pOUVNOOHUzWkh2SmtL?=
 =?utf-8?B?ZWFYNS9nbzVFa0NOTmt5K0k1U0w1TFZpYWY4WnpFWnF2SGxoTmEwd3ZkcmFq?=
 =?utf-8?B?emxWTVdWdy8za1hqL0d0c2tZQVJiZk5lMEhDRnE4UFRJeHdXQk9zZ1BRWkVI?=
 =?utf-8?B?OGE4a0JDUkhQeUI0U2pwdGNhSjk3cGpVOGhQWTc3dzR4M1pUaTY5UmZEaU1Y?=
 =?utf-8?B?LzhvSVZkWUc3cW1PV0Q2SWpNbTRzbUxWQlJiSnJXR3pkRmdPV1BFZVhkdy9i?=
 =?utf-8?B?Y3VyNWJLMWxUQTQ2VG5CM1diTzJPUHZNKzU0clR0VEkwTjhZQlFoSTFkd0FW?=
 =?utf-8?B?cG03ODRJSDVYZ01QTEx5cFIvelI2VzREWGN3QVliTmdCTk04dXdHK2s0MFVJ?=
 =?utf-8?B?ODNJVmtVNUpXVFpFV2QwQVVQN1I4amZNdWFGbWswZHhVdENtdFo2TnRsR2xB?=
 =?utf-8?B?b3BvaFFpMFpHcVNLcGJGQi9vVStuQ0lVSEpvNGY2U3diYzhSa0hESmFwWStx?=
 =?utf-8?B?dEF5cUpOK0UzbWU0all4NGtTRmN0Z1F0cVJXWk9Xd2pXK2VmYmhhQXNLckg1?=
 =?utf-8?B?cFRJSkdjLy8zNTR6TW1PMk9lMXYzTVM3QWVJTGo5aXorUVF2aithaG1iLzlM?=
 =?utf-8?B?aU5qTi94eTZiMHZvby9nOERReG8wd2hsNVZHQjk1eFBJUlEzdGxjK3gvRVBr?=
 =?utf-8?B?dDAvNHBwSVM5ZkhqM2Rhc2YrTWZaSi9xLzRIQ1pHcWlwSWdRNUY1dVZ6akN6?=
 =?utf-8?B?K0ptT004MkltTjlJc2hSWERKbDhvTDZkQms2bWtVeG1MUzFiYlZrSUpXUEpv?=
 =?utf-8?B?My8wK0EvTEp0bnNlZGtXYnVrbzgzT1VXQ0JSamhsekJGQTgzM0YxWmVpTXJn?=
 =?utf-8?B?cXkzNVFrQ3R5T3FBSS90Y010NXFlMTMzd0VKU0h3MFN4dnM2Y1ZhOU9OQVAw?=
 =?utf-8?B?NldPZzhFWEZGSzdzMSsxQ1RmM0UyMmtJTnR2clAwZmJocTB4R0hQWVdrdWRN?=
 =?utf-8?B?WXJobVY1OFgwalJzc2tPRGVCYmw1ZGJCZlRBMzZEaGNaSGE3cEQzR2c0M0RR?=
 =?utf-8?B?U3JzWnRyTGpiRkNJVHRlcmEyUGYvb1loaFU3bXljN0lkbHZ1T0JxNTJOcGtZ?=
 =?utf-8?B?czQ3UDFyY3BOL3IwU2l5RHYreC9lTjV1QnZHT2syVE5FK1lCdkNYRFczSHp0?=
 =?utf-8?B?WmVSQWUwYVBWcUVmNnR1b3dYaUcyZGpPZENMMnZyNlk4NXBhNWNENTlZa3pq?=
 =?utf-8?B?ZlJyZndDbFlDajZkWGZVUTYwcWFjNUw5YXZIY0kySGwwT25WeHJMSSs1Njh4?=
 =?utf-8?B?VlBWU2RnUU03NjlScTRHR3Via0tHTEtidEphZE9CZnRjUXp6ZENGMGdmdWVH?=
 =?utf-8?B?SlJ5UWVOVXVUSkVIV0JzREZVeEtLWkdyeUl2emtaWmFiMFpLTWxndUU5VlFh?=
 =?utf-8?B?WUZYbTlXNHVqOUthNS9FZEdDc3BMcjRZTjk3RlB2WGxpSUZkU1E0azVSckly?=
 =?utf-8?B?MExLNVlNYUdSejlpaklYRFRuY3JjL1pCOVVtK0MwQjd4RGExeVZmUDh5TXBm?=
 =?utf-8?B?Y3F2Q2E5VGZ2Z1lmUEgrME9NNmV3eTlxdjlFVk9kRDd1aGVIZnlVL3FCNGpJ?=
 =?utf-8?B?RFNRdm5zTld3RXozYjkxdmlNZi9lMm96N3FQaWpLZGJkTGpDcmRmSTBRUy9z?=
 =?utf-8?B?VUtmVy9wejlOa3BGZ0ZVOXhSYXlBSW5Wbk1BS2FQOWpDQkpnQ3huUEpPYjlV?=
 =?utf-8?B?SXpab0hJTFBqL0phc2IweENBMEkyL2dQSjFvWThSS2ZWV250ZzZPd3pPdVRB?=
 =?utf-8?B?eWZRazZuVHlyOFZOdjU2THVCd0tBSU0yaTEzc0xGaXpCQmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 17:01:37.9382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de72cb71-e3e5-417b-64ee-08dd05972b40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193

On 2024-11-15 08:12, Daniel P. Smith wrote:
> A precarious approach was used to release the pages used to hold a boot module.
> The precariousness stemmed from the fact that in the case of PV dom0, the
> initrd module pages may be either mapped or copied into the dom0 address space.
> In the former case, the PV dom0 construction code will set the size of the
> module to zero, relying on discard_initial_images() to skip any modules with a
> size of zero. In the latter case, the pages are freed by the PV dom0
> construction code. This freeing of pages is done so that in either case, the
> initrd variable can be reused for tracking the initrd location in dom0 memory
> through the remaining dom0 construction code.
> 
> To encapsulate the logical action of releasing a boot module, the function
> release_boot_module() is introduced along with the `released` flag added to
> boot module. The boot module flag `released` allows the tracking of when a boot
> module has been released by release_boot_module().
> 
> As part of adopting release_boot_module() the function discard_initial_images()
> is renamed to free_boot_modules(), a name that better reflects the functions
> actions.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v8:
> - completely reworked the commit
>    - switch backed to a releasing all but pv initrd approach
>    - renamed discard_initial_images to free_boot_modules
> ---
>   xen/arch/x86/hvm/dom0_build.c       |  2 +-
>   xen/arch/x86/include/asm/bootinfo.h |  2 ++
>   xen/arch/x86/include/asm/setup.h    |  4 +++-
>   xen/arch/x86/pv/dom0_build.c        | 27 +++++++++++++--------------
>   xen/arch/x86/setup.c                | 27 +++++++++++++++------------
>   5 files changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index d1bdf1b14601..d1410e1a02b0 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -755,7 +755,7 @@ static int __init pvh_load_kernel(
>       }
>   
>       /* Free temporary buffers. */
> -    discard_initial_images();
> +    free_boot_modules();

This...

>       if ( cmdline != NULL )
>       {

> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 6be3d7745fab..2580162f3df4 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c

> @@ -875,7 +874,7 @@ static int __init dom0_construct(struct boot_info *bi, struct domain *d)
>       }
>   
>       /* Free temporary buffers. */
> -    discard_initial_images();
> +    free_boot_modules();

...and this.  I think Andrew requested/suggested moving to a single 
free_boot_modules call:
     They're both right at the end of construction, so it would
     make far more sense for __start_xen() to do this after
     create_dom0().   That also avoids needing to export the function.

>   
>       /* Set up start info area. */
>       si = (start_info_t *)vstartinfo_start;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 495e90a7e132..0bda1326a485 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c

> +void __init free_boot_modules(void)
>   {
>       struct boot_info *bi = &xen_boot_info;
>       unsigned int i;
>   
>       for ( i = 0; i < bi->nr_modules; ++i )
>       {
> -        uint64_t start = pfn_to_paddr(bi->mods[i].mod->mod_start);
> -        uint64_t size  = bi->mods[i].mod->mod_end;
> -
> -        /*
> -         * Sometimes the initrd is mapped, rather than copied, into dom0.
> -         * Size being 0 is how we're instructed to leave the module alone.
> -         */
> -        if ( size == 0 )
> +        if ( bi->mods[i].released )
>               continue;
>   
> -        init_domheap_pages(start, start + PAGE_ALIGN(size));
> +        release_boot_module(&bi->mods[i]);
>       }
> -
> -    bi->nr_modules = 0;

IIUC, zero-ing here was a safety feature to ensure boot modules could 
not be used after this point.  Should it be retained?

Regards,
Jason

>   }
>   
>   static void __init init_idle_domain(void)


