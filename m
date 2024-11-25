Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F679D8973
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:37:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842850.1258518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFb8p-0006vz-Ad; Mon, 25 Nov 2024 15:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842850.1258518; Mon, 25 Nov 2024 15:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFb8p-0006tt-81; Mon, 25 Nov 2024 15:36:47 +0000
Received: by outflank-mailman (input) for mailman id 842850;
 Mon, 25 Nov 2024 15:36:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=caTh=SU=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFb8n-0006tn-Eq
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:36:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2412::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e24abc7-ab43-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 16:36:37 +0100 (CET)
Received: from BN1PR10CA0026.namprd10.prod.outlook.com (2603:10b6:408:e0::31)
 by SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 25 Nov
 2024 15:36:29 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::b2) by BN1PR10CA0026.outlook.office365.com
 (2603:10b6:408:e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Mon,
 25 Nov 2024 15:36:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Mon, 25 Nov 2024 15:36:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 09:36:28 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 09:36:27 -0600
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
X-Inumbo-ID: 0e24abc7-ab43-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjEwIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjBlMjRhYmM3LWFiNDMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTQ4OTk3LjgxNzM0NSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nt9RxlGt5khm3daM8Ebmq0v8WdjL6LkronvbXqlI+GIoQ3GlkIdHa61DeWCk7HiEvWV1XTddRdaxHmULooKBsOs7x3OpkWHTDyTzBrlI18GnG+OdYumpXMRTfeY0SYpoO34MwXvhGd7Rn/dn7UqyTMVuMFKQgCbiiayUwOJeqN22VS3Tug47CFtpZ4fxGtssnK1sSloE0YFKVkqryc/M2BpdmZzBMcyNl5EeHdnAlmisjuPXOyWXKMPWfHgAUkXOWti3mE6NVF45TgeB9AJLwgvN8JyRxClbCg3Md6aGdexFbSXwDyi/cpqCN3AswsNS3/qCNE3tMA116GyiLkrgYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J51+lDHhNwh6NrcVtc/YQ0yJh+FbGCdIjYLSuiOjXc=;
 b=qQ3juLHeirTNHex3FtWxMW8Sl74U6vSOqDZnKCVHzLVBqgqObbGS+tyP8M+bEmMrDbkUsgNOlhhwVBhsi1OUSrTOg5seHUTNUD6wyWWCBbblSEcNXAipMbeLAGN6ZEa9gK9oTc2BZ3MkjmsgnRdjvQk/HxBlsY9ebyr2rcKrc+unuJXJ4XEeNBpMAHZD+kNKfd0eTskCEjhaCTgBDBwfsNHwgnuRe2Ki2hueIjOw7ktLutbt45T7WNz2PqRJm9QJiKdYnJeipES0qT2Tu70sRm1fbGrMQY4YquOmIbBdiRBsUE1J+DocZF9x1wqOH4XrtKi8h2stbFEMbOBG1Olhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4J51+lDHhNwh6NrcVtc/YQ0yJh+FbGCdIjYLSuiOjXc=;
 b=ccLPmBtk8ooL4nPdzLEzSJnjAZCHTT4d21mqJCKdBx4d/mcIeDuq0YlQYIt/CXK1Jkfck64a7kD3o2yboUF9MdfYjT4zLUjp4ummKmF51xxcOW7LTjxeGiGppKNUzsHUCzxWMeIRtzKEEJffgH5GN7I+iLi3pzExdluf8xHNOb4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bc643da9-fba5-42f1-8e25-0d197fe25cae@amd.com>
Date: Mon, 25 Nov 2024 10:36:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-4-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c1dd2f-2843-48eb-f89b-08dd0d66ee01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDdkcElnMGFjTjg4YTdydHplSmtlNXJtMW92YUVZak5KbCtzc01OeFRxOXNy?=
 =?utf-8?B?QlRsMklRelJQNzRqZ1VUU1ZxTnAzcTNtVDEyYUpaZDRuTUdKZDhGcW15VHBn?=
 =?utf-8?B?RGhxSWs2d3I3emNyT0dLckVTRjlnVVRKaWptSEpJaXdIaE1GYVA0bkgvU3R0?=
 =?utf-8?B?T3JaRmVMVmpvZ3lOcWpiSnptK2ppRk1ZSjg0Yzl5MXhSb3JGemhFaVlQdmsr?=
 =?utf-8?B?Y21GKzFwQTlPZGZnZHFEQ3hHQkdBaTNPRG9JSlJEMTB0a3lhL01rTDJUdG1S?=
 =?utf-8?B?ZFY3RjlsSEpjcFZJTTEvZ3UzaU9NbzJYUDZCWWxhZ0hMQmdETC9xNk5SNUlG?=
 =?utf-8?B?QTNzc1RzK3J5ZGFsd0J6OVdCQzlvNFVHdFc5ZE5LYituQzBNYUdrR0diWlFV?=
 =?utf-8?B?c3gwblk5aUdkUFllem9BLzVycjI4dUdqbWV3eXF6UlN6dk9mcm56eDFiMHBl?=
 =?utf-8?B?Wis2U0lpK045Y25MUjd6L2pXWUVtR2w3TUZIV2Y4TWo3UWNUWTRYbzRMdWZZ?=
 =?utf-8?B?ZkZpM09RWjVJaWlGaGQ5bXRCN1lqTXZ1V0xRRE8wVW1IWnZTRzFzSGhhNFJI?=
 =?utf-8?B?bmRpeDcrZzNDTXkrTk9yTEs4ZURBZkJZVFNYRFl1TUswLzZGcWs5c2NOZUVk?=
 =?utf-8?B?czZxdmUzVFVoeG1sdlZJWE93alVpOUNvdzNnUmREcDVsS3lXUnlONmdyTHB3?=
 =?utf-8?B?RStzTm95UFlRQkhCV1pBazB3K0VjRDVvZkd2RmJqM2pvQWxVdlZ3SmhUWmt3?=
 =?utf-8?B?QjJnR2pNaGIzamJnTndqdWVXdTF6S0tNUDJYcFVZVDhwQWRYUFM2QVVGVDNu?=
 =?utf-8?B?YzlsdW0xcW56TmhMRThYWWlrbVZTdUhGZDg0cDVKMDk4Um1va0ZxU3FSVFFW?=
 =?utf-8?B?QWg5dmM5L2pZNytpcG8wcHlVcWgzSi9sQ1pJOTRUZ2lYZ1lheVpUTTJ0Qmtu?=
 =?utf-8?B?MEc1Y2lWc0daRWF5NGwvZzF5V1d0c09hYmRBdVlmcjNIemw1YXhCMW9pL2Zq?=
 =?utf-8?B?WDFHV2N2WnhPR1VwMjFBdE5YSFMrMjFJQjZrajNGUXBJZlRIVmNXdk5zekFI?=
 =?utf-8?B?Z1NwUDN5UVJMMFhEZGJnaUFGQlg2blhtNEJwM1kvdnp1ZG1GYWZrR1BVRG9x?=
 =?utf-8?B?bTFsMUNRNXhBc3lkdWZ0eEo2OTA2NnpNOVdIQWhPQ3pldHh3ZFdoS20yTFd1?=
 =?utf-8?B?c0hIL1ovM0RnNHNvUVhNUVNWMnZWeVI2UDBFVjJxUjlkN0FIOGQrUjBzcEEr?=
 =?utf-8?B?Q1BRSjNMYXlnZ21qR0xVekt4Wm1wRnBiTkF5Z2RyRWFCcytQMGwxT0VlMUx4?=
 =?utf-8?B?bFpIRERhVVFMS3Q1Q3N4MkZWUWxheEcyUjBuWnpSWXBKNXJXa3o2ZU9hRExh?=
 =?utf-8?B?eStqeTFKSDlYSVk5TXpjTEtLeGp4UVVnbW9rMjY3bCtCSHRWdVhTYUN6Rlcx?=
 =?utf-8?B?MWxUTmVDcHFXYUFza2drS0ptZXltbHVtMHRubzA3bTlSaFdiKzJpdWZmVGhz?=
 =?utf-8?B?VllLeGp2KzN1WExReEJXMUN0QUw0QW5KWHc4K1ZETU5DNkRFUVRWNXRKRit1?=
 =?utf-8?B?b0l3Ri9TOUU2K1J2TStjcXpLZ25KQkV0cEV4THZuTjBrWGlkcHF4VTlpNVRr?=
 =?utf-8?B?YTU3RjMwbWM5b0RQNk1hRGRVMUlUNHZiVC9WTG1GN25QaDhGcHBEbzI4ektQ?=
 =?utf-8?B?bnQ0OXdSRFdBanlEdEc3S2NRVlF3Tnp1V1F2MXFMWjEvNzJNNEhsUDZTUzRX?=
 =?utf-8?B?MWo4RVpTSWFlVk8vbWcrNkdjbmplV25RL0xobGNwcUx2aEZTUk90dnJrNGxU?=
 =?utf-8?B?bEc5MEZiWDVYMGs0TmxzUzlMVkdrcnZ2RW41RVFPdDYwOTFCd21lSXE3V0xv?=
 =?utf-8?B?cnNtOGVBL0RHR20vYi90d01kSzN1bWk3bVR1OUFpb2M4WTg4YkUzUGZ1dTZL?=
 =?utf-8?Q?OO/T6G643USayUpAJ0mwGXZLBlsQl2mm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 15:36:28.6785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c1dd2f-2843-48eb-f89b-08dd0d66ee01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Add a container for the "cooked" command line for a domain. This provides for
> the backing memory to be directly associated with the domain being constructed.
> This is done in anticipation that the domain construction path may need to be
> invoked multiple times, thus ensuring each instance had a distinct memory
> allocation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v9 boot modules:
> - convert pvh_load_kernel to boot domain to directly use cmdline
> - adjustments to domain_cmdline_size
>    - remove ASSERT and return 0 instead
>    - use strlen() of values instead of hardcoded sizes
> - update cmdline parsing check to inspect multiboot string and not just pointer
> - add goto to skip cmdline processing if domain_cmdline_size returns 0
> - drop updating cmdline_pa with dynamic buffer with change of its last consumer
>    pvh_load_kernel
> 
> Changes since v8:
> - switch to a dynamically allocated buffer
> - dropped local cmdline var in pv dom0_construct()
> 
> Changes since v7:
> - updated commit message to expand on intent and purpose
> ---
>   xen/arch/x86/hvm/dom0_build.c         | 12 +++---
>   xen/arch/x86/include/asm/bootdomain.h |  2 +
>   xen/arch/x86/pv/dom0_build.c          |  4 +-
>   xen/arch/x86/setup.c                  | 54 ++++++++++++++++++++++-----
>   4 files changed, 54 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index a9384af14304..cbc365d678d2 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -644,9 +644,11 @@ static bool __init check_and_adjust_load_address(
>   }
>   
>   static int __init pvh_load_kernel(
> -    struct domain *d, struct boot_module *image, struct boot_module *initrd,
> -    paddr_t *entry, paddr_t *start_info_addr)
> +    struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_addr)
>   {
> +    struct domain *d = bd->d;
> +    struct boot_module *image = bd->kernel;
> +    struct boot_module *initrd = bd->ramdisk;
>       void *image_base = bootstrap_map_bm(image);
>       void *image_start = image_base + image->headroom;
>       unsigned long image_len = image->size;

cmdline_pa is used just outside of view below here.

const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index a2178d5e8cc5..e6580382d247 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -965,10 +965,29 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>       return n;
>   }
>   
> -static struct domain *__init create_dom0(struct boot_info *bi)
> +static size_t __init domain_cmdline_size(
> +    struct boot_info *bi, struct boot_domain *bd)
>   {
> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
> +    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
> +
> +    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
> +	
> +    if ( s == 0 )
> +        return s;
> +
> +    /*
> +     * Certain parameters from the Xen command line may be added to the dom0
> +     * command line. Add additional space for the possible cases along with one
> +     * extra char to hold \0.
> +     */
> +    s += strlen(" noapic") + strlen(" acpi=") + sizeof(acpi_param) + 1;
> +
> +    return s;
> +}
>   
> +static struct domain *__init create_dom0(struct boot_info *bi)
> +{
> +    char *cmdline = NULL;
>       struct xen_domctl_createdomain dom0_cfg = {
>           .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>           .max_evtchn_port = -1,
> @@ -1008,19 +1027,30 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>           panic("Error creating d%uv0\n", bd->domid);
>   
>       /* Grab the DOM0 command line. */
> -    if ( bd->kernel->cmdline_pa || bi->kextra )
> +    if ( (bd->kernel->cmdline_pa &&
> +          ((char *)__va(bd->kernel->cmdline_pa))[0]) ||
> +         bi->kextra )

Here you are checking pointers.

>       {
> +        size_t cmdline_size = domain_cmdline_size(bi, bd);

Internally, domain_cmdline_size() checks the pointers.

> +
> +        if ( cmdline_size == 0 )
> +            goto skip_cmdline;
> +

Maybe just use:

cmdline_size = domain_cmdline_size(bi, bd);
if ( cmdline_size )
{

and eliminate the goto?

> +        if ( !(cmdline = xzalloc_array(char, cmdline_size)) )
> +            panic("Error allocating cmdline buffer for %pd\n", d);
> +
>           if ( bd->kernel->cmdline_pa )
> -            safe_strcpy(cmdline,
> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), bi->loader));
> +            strlcpy(cmdline,
> +                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi->loader),
> +                    cmdline_size);
>   
>           if ( bi->kextra )
>               /* kextra always includes exactly one leading space. */
> -            safe_strcat(cmdline, bi->kextra);
> +            strlcat(cmdline, bi->kextra, cmdline_size);
>   
>           /* Append any extra parameters. */
>           if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
> -            safe_strcat(cmdline, " noapic");
> +            strlcat(cmdline, " noapic", cmdline_size);
>   
>           if ( (strlen(acpi_param) == 0) && acpi_disabled )
>           {
> @@ -1030,17 +1060,21 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>   
>           if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
>           {
> -            safe_strcat(cmdline, " acpi=");
> -            safe_strcat(cmdline, acpi_param);
> +            strlcat(cmdline, " acpi=", cmdline_size);
> +            strlcat(cmdline, acpi_param, cmdline_size);
>           }
>   
> -        bd->kernel->cmdline_pa = __pa(cmdline);
> +        bd->cmdline = cmdline;

As mentioned above, it looks like you still inadvertently use 
bd->kernel->cmdline_pa and not the new bd->cmdline.  I think clearing 
bd->kernel->cmdline_pa would have helped identify that.  Or do you want 
to retain cmdline_pa for some reason?  It's less error prone if only one 
is usable at a time.

>       }
>   
> + skip_cmdline:
>       bd->d = d;
>       if ( construct_dom0(bd) != 0 )
>           panic("Could not construct domain 0\n");
>   
> +    if ( cmdline )
> +        xfree(cmdline);

You can drop the if - xfree() handles NULL.

Regards,
Jason

> +
>       return d;
>   }
>   


