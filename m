Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A469D8FEB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 02:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843249.1258888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkMa-00082S-0g; Tue, 26 Nov 2024 01:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843249.1258888; Tue, 26 Nov 2024 01:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFkMZ-00080z-U7; Tue, 26 Nov 2024 01:27:35 +0000
Received: by outflank-mailman (input) for mailman id 843249;
 Tue, 26 Nov 2024 01:27:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFkMY-00080t-DZ
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 01:27:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f403:2413::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 983f7330-ab95-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 02:27:26 +0100 (CET)
Received: from SJ2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:a03:505::21)
 by SN7PR12MB7853.namprd12.prod.outlook.com (2603:10b6:806:348::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 01:27:18 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::34) by SJ2PR07CA0019.outlook.office365.com
 (2603:10b6:a03:505::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Tue,
 26 Nov 2024 01:27:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 01:27:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 19:27:12 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 19:27:11 -0600
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
X-Inumbo-ID: 983f7330-ab95-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjI0IiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijk4M2Y3MzMwLWFiOTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTg0NDQ2LjY5NTI4MSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mflgj/4bhxfbRK3T0yzqGQHW04tLRvFcBuPP+ZxFqWkQ1IqgP4ZwnrnFzuUfTSaQ3PRenIVysNHKFOcGoOy8g/Fgy8It0AaZ4fmDlIqRZodaFSara0yuLGT2kVlWdxvT9FTAhaAwEdlQknSkVSWWo2EaIKcb3nAf7t/v1P4dkIxummoIJZdPYuNnq5XkeB+g9+k2xN3AsuCR5ISAiUZKZu+mlmmtsD66dJ1BUIi0EXHjMnGO/fjDwd6heVIQy2jJUgYHd1Tp6FuTiPlqlKvhE9UF+uOmTPc8CS7tPR/afoROcHOVRumLZ8dfYg/Q/esjUxtf1IY6IZVo+RAWZ5JWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpJEO/kqySekkuAb32eDC+Q2VCSsTjdSnNpcQPvQmf4=;
 b=MWYau4hPrLe1KLuhFpYPXKrbA9LOyHLCAYz2OItvK3XBPDzbLm7BCEaXTf8VwLaQ7wPJro2+crcQmzk/QA7TvekBiYkKwkkqKU2Fz9dtvGUpmHk76QPDYG29HrUgBDR0noyp32EZCpjDWdm5ioq253G0qxf9G96B6VppAuv6eZ5rd2YJnllG+Px5xTWMEj87qINFSeU2W5Us+H6ZYBkcGNvJ4os/jtYtSor5LUqLehYm4A5GaCCDRvWcTkSZ7s74bdDVs+ui5CpLsDcFb5mUtjLSdxnK3ETkf6Mbymxe6bxdctY7z5vu1bbWceLaV2O6JURnDDtr22fw+7mrngbfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpJEO/kqySekkuAb32eDC+Q2VCSsTjdSnNpcQPvQmf4=;
 b=qxN20YKxmZMZ5a0Air8xI9DsyPO9dWNj5MdKBVoMZdX0ctW873K8YztDGpoz460yGT1kT1j5EwaOF58sIijwxN/dRyJnQhSvuwuJP/ksM+9Ek1XPhtkwZu3EEjZO5VKeT1QuzFo4kwyC0vPVjGBwZnMbeJUNl91tmdPYv9rx76I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <99177823-38d9-4aca-af84-150ae6f37a25@amd.com>
Date: Mon, 25 Nov 2024 18:45:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/hyperlaunch: add domain id parsing to domain
 config
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-12-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-12-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|SN7PR12MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: d07cd58c-6214-48a0-2b8d-08dd0db97737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2Q3dzNjQWRmeThVVkhRRzVINDNTWWpXY0w3cEI3Mm9EWGJCWDg5OWFiYW0y?=
 =?utf-8?B?YVAreGdUNEZneVkrVnJTbXJjWmVYZ2NpeWlDc2I3aC82OWVZcm9IYzEwbHV6?=
 =?utf-8?B?Rm40Mjd5RVFaRzlMNzlwc0c3S0xOQlIyS2h5cHlnMVB3NXRXZ01sSk9yL0Qw?=
 =?utf-8?B?dVpLaE1CSlpDVHVPM0s0ejg0NytPaDdpY2tHS1pFaVV4aENveWUzMm15SFhp?=
 =?utf-8?B?d1FDdzB0cVpLc0kvcGdCc2ZGdWFHdEs3VW9WQU9XaGFQQUo1UWdVSHJtNVRk?=
 =?utf-8?B?Sld5d01VRlpDUzlBK2lXVjNUdjZva25haFpuNi9rNVZtQkFwZms2SDc1cnZl?=
 =?utf-8?B?cnc0MkpCV1BUaE5VTkhJM2kzZGEyTkNycHk1NXcxZStrcDNnQ2d4cEVERWVj?=
 =?utf-8?B?TExHdDYzMk9TbytKOTVXK05MVWdvV1VCVWo5M3hkS1didzAyakFUbys5WU00?=
 =?utf-8?B?ZkdjbmxOeXZ1S0t3SGg5K3dOOGtXTDRDSnQwbE16eWMrc0lNaUJDVmJXRmcz?=
 =?utf-8?B?bXBWWVQxZ3ZrVk9tMU5SaFFTaEhld1BwMm1QcVc2U2RDK0R0UnlwQnU2SEFW?=
 =?utf-8?B?bjJ2RC96dnNtNnA1aGhuUzVwUCsxT0lPYW80WkFYVS94eTdudVFZVVdwM0dl?=
 =?utf-8?B?eXZUK0NhanYrQlBFdGNkU1I4VzF5cVUwdUtyUFVDSk1ieUhSUFVaN0xxZ242?=
 =?utf-8?B?bmZwTGJyTjlFYTk3RmlKTjh6UXJLOTgrTXY5c2d5VTBmb2xJRlEzeVhCY2N5?=
 =?utf-8?B?emU5UHM0dnhIVWZkbnYvUGp2a3YzWFhFVUtlRFlFRXZUemRsYnhrQkVNUWpj?=
 =?utf-8?B?S0hpM3JhTndSZUhTbVAwV3Y0S0JuaFRRSEJaNjhpQUc5TTZUWXNXaXZTU1RX?=
 =?utf-8?B?ZEs4V3Jyd1VpYzljOUl1cjRiSnBnZGNHZ2FhZzlOcDVCNnNOMEVuWXI2VjJy?=
 =?utf-8?B?MEhySjlSeHF5eUVWUEI2NGlBbzNTYTRxYkV2aVhEOHoyS0IrN2xVblg0RkZJ?=
 =?utf-8?B?Y3RzYkFWVWtROE44OE4rZG16dkk0clNQTTY3V3UrQlZkQ1R4Rmx5QnZhRk4z?=
 =?utf-8?B?eTc3ZmlqMFhKYk1KQWNrZmc1NkRSekNxNXJEMmdENnllTXl5M0xod003U1NM?=
 =?utf-8?B?NjlqaFFnLzhaUEtaUXBmMXUrNStIQlBGQTRJM2J3Skg0UDAzNW5WNHMyODc4?=
 =?utf-8?B?cVFnVmlLMEliOWNjWDJBY3RoSERhVXpVc1FRZ3lic1ZqM2VHaE1NMnlFaWpk?=
 =?utf-8?B?OVVYb253M09FSU5zSjgxcWo0VkllOWowUDZPYmVoWnRSSER4aFA3L0owNnZw?=
 =?utf-8?B?czNVTHZlZlNwNk5Rd2EycW5SQ2ZyYWkyU0VnRThGYWczQzhRQmpCUncxQll2?=
 =?utf-8?B?cUZwVFZCVlFMSXROTnNYa0ZyRDlLTy9PV0l2WVR4a1RkU0E1Rm0xRUxHWG9n?=
 =?utf-8?B?R1lwM1A0Q21FYVBwcXRFUERoc1dSbE9iYWNyam4rT0RyWi9GT2hTdEpKcVhi?=
 =?utf-8?B?MlJkRlFZVzFBdUg1NE5iUWlrejd4ZGhTQXdNc3EyejBDcCtMSkFrWVEzR2Mx?=
 =?utf-8?B?WXBZcTFYbU51VXFNNFJsNHB5K1BLa0dvWnZoVXRURzVvQXJFK0tCb3h0RzlW?=
 =?utf-8?B?emROUDBtMGRvNE84aVRvYzhlR0VER1A4RnN5SjVrbk93WG5vRGdka0lGZno5?=
 =?utf-8?B?ZTR3ZWpHS2FWQlVnTXlwSTQ0RTEzUmdHUUhLanRKck1hdXhQWnhETGJNZzVh?=
 =?utf-8?B?eVU5R0JscFVQRmJ6Ni9LYVFuMXFMb0NMeEk5Q3NPNzBad04rcDZRUXg3dTJC?=
 =?utf-8?B?T3RjTnRSNVpLdTRQcC8yTWtJRjhqNmN5WC9ObHp5M2pwUmxXVnp2a3gzRzJt?=
 =?utf-8?B?NStnNTFmVkJONDBQTWl4bFNTVHlSUTJRTGRWN3dsWjFhU1NGOGVmdEJqVDVz?=
 =?utf-8?Q?MNzBbadIK1tUmP3FDnPlvCULZvI/zHFX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 01:27:17.4974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d07cd58c-6214-48a0-2b8d-08dd0db97737
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7853

On 2024-11-23 13:20, Daniel P. Smith wrote:
> Introduce the ability to specify the desired domain id for the domain
> definition. The domain id will be populated in the domid property of the domain
> node in the device tree configuration.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/domain_builder/fdt.c | 31 ++++++++++++++++++++++++++++++-
>   xen/arch/x86/domain_builder/fdt.h | 18 ++++++++++++++++++
>   xen/arch/x86/setup.c              |  3 ++-
>   3 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_builder/fdt.c b/xen/arch/x86/domain_builder/fdt.c
> index bc8054a80ec1..3a6b4fbc09a9 100644
> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c

> @@ -120,6 +121,28 @@ static int __init process_domain_node(
>           return -EINVAL;
>       }
>   
> +    fdt_for_each_property_offset(property, fdt, dom_node)
> +    {
> +        const struct fdt_property *prop;
> +
> +        prop = fdt_get_property_by_offset(fdt, property, NULL);
> +        if ( !prop )
> +            continue; /* silently skip */
> +
> +        if ( match_fdt_property(fdt, prop, "domid" ) )
> +        {
> +            uint32_t val = DOMID_INVALID;
> +            if ( fdt_prop_as_u32(prop, &val) != 0 )
> +            {
> +                printk("  failed processing domain id for domain %s\n",
> +                       name == NULL ? "unknown" : name);
> +                return -EINVAL;
> +            }

Bounds check against DOMID_FIRST_RESERVED?

> +            bd->domid = (domid_t)val;
> +            printk("  domid: %d\n", bd->domid);
> +        }
> +    }
> +
>       fdt_for_each_subnode(node, fdt, dom_node)
>       {
>           if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
> @@ -186,6 +209,12 @@ static int __init process_domain_node(
>           return -EFAULT;
>       }
>   
> +    if ( bd->domid == DOMID_INVALID )
> +        bd->domid = get_initial_domain_id();
> +    else
> +        if ( bd->domid != get_initial_domain_id() )

single line "else if"?

> +            printk(XENLOG_WARNING "WARN: unsuported booting not using initial domid\n");

"unsupported"

Maybe "Booting without initial domid not supported"?

> +
>       return 0;
>   }
>   
> diff --git a/xen/arch/x86/domain_builder/fdt.h b/xen/arch/x86/domain_builder/fdt.h
> index ab2b43872e25..06ead05a2583 100644
> --- a/xen/arch/x86/domain_builder/fdt.h
> +++ b/xen/arch/x86/domain_builder/fdt.h
> @@ -27,6 +27,24 @@ static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)

> +static inline bool __init match_fdt_property(
> +    const void *fdt, const struct fdt_property *prop, const char *s)
> +{
> +    int slen, len = strlen(s);
> +    const char *p = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &slen);
> +
> +    return p && (slen == len) && (memcmp(p, s, len) == 0);

match_fdt_property() gets called more in later patches.  I wonder if

     const char *p = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), 
&slen);

should move into process_domain_node, and then the string is just 
compared?  Maybe it already gets optimized?

(Is there a way to disassemble .init.text with symbols?)

> +}
> +
>   static inline int __init fdt_cmdline_prop_size(const void *fdt, int offset)
>   {
>       int ret;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index eaac87b02f78..317349b80ac6 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1020,7 +1020,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   
>       /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid = get_initial_domain_id();
> +    if ( bd->domid == DOMID_INVALID )
> +        bd->domid = get_initial_domain_id();

This seems redundant with the earlier DOMID_INVALID check & setting.  Or 
does this handle the non-hyperlaunch case?  Maybe it should move to 
builder_init() for other non-hyperlaunch configuration?

>       d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>       if ( IS_ERR(d) )
>           panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));


