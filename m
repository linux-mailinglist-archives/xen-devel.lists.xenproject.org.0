Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CA79DB681
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 12:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845359.1260788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcgG-0002tY-TG; Thu, 28 Nov 2024 11:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845359.1260788; Thu, 28 Nov 2024 11:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGcgG-0002qg-QR; Thu, 28 Nov 2024 11:27:32 +0000
Received: by outflank-mailman (input) for mailman id 845359;
 Thu, 28 Nov 2024 11:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t80U=SX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tGcgF-0002qJ-8U
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 11:27:31 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2407::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb8bd317-ad7b-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 12:27:22 +0100 (CET)
Received: from PH8PR05CA0016.namprd05.prod.outlook.com (2603:10b6:510:2cc::17)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 11:27:12 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::ac) by PH8PR05CA0016.outlook.office365.com
 (2603:10b6:510:2cc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Thu,
 28 Nov 2024 11:27:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Thu, 28 Nov 2024 11:27:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Nov
 2024 05:27:10 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Nov 2024 05:27:09 -0600
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
X-Inumbo-ID: bb8bd317-ad7b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNzo6NjFkIiwiaGVsbyI6Ik5BTTAyLUJOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImJiOGJkMzE3LWFkN2ItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzkzMjQyLjI1MTEzMiwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhmj9y8FIfZu7WMhm2/8iHCb4C8LrFBMLeF7JpP3BUQWRuXakGoLtwhV5Yjy/bXzzBQBUG70B4y5FgEkv+c0E1W7LOHkl7EGTlSMmui11or6WBMD+gYFkyueu+7p4XZ128x9HDzUiBiP+qOTsT22+CKvxQJfC4nuYOA3V9QiqbITe7pqW/wTd6oXYa1lcHknV02TZT9gREad4u64uIb0mpB+SW7txMMyPw0W1S3GBBgi6M9VCNWb/FntppYCUm0Kp3AsCvmy4P3bsrTb/zwdPbnSfSyBwehGInG4MPIZzXmvhYgDTqjHHAB/tB8txmQB3GNb+wNLrbCot8JGY1T3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRR+vA9X5NgwptOMCfAUnUvMOlkqjmd2Z0yb+fBYOpA=;
 b=AOw8iAeZ3zyqvyDjfdBaVV96fBkVk7oglhF4AV4JGQzzrkqeYwyw6lrbVP4pu6mGgiqG4GBeI08fZ2+reYlIrVe9zYZiko4KMHmoIsa1nycw1UvW7ELORGsn42g70L8b5pUFfk/JFtr8uKvgumKL4W7Bm62QQ2xBedaoL/OT++reeY5ZS2IHsyKizidGt00pUzG7LHaJlhCuDdX7bbjezQLZb+HBqyuFhOsdHEcVA4O05999u8rhOkecndQDGTWQUqgbDcFxAxD6q0whBijMNuNU6Bfm8RTObWikHFCi4N3nRRWd+Vb0gnfnFFJzBwR0Rn4KIokrK+wwsZWMeCi74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRR+vA9X5NgwptOMCfAUnUvMOlkqjmd2Z0yb+fBYOpA=;
 b=OxUz54MukjWQzGMvkBRnVd6MtD3TGjZbQO+fZL2OjhfVF6v1kIu0g94KiKLqJhf/iaedRFjUMC46FipiTVTthAyB/FiW1UwGyix5777ZEb8+OXXrVHrM59aH/nMl/sF1UVXNmdxqrm/D0tOvXMFA42FM5/tgy5NLkFAJSHpHZV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8bf09c24-4226-4a67-aa16-89fb43790237@amd.com>
Date: Thu, 28 Nov 2024 12:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/12] xen/arm: add Dom0 cache coloring support
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-5-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241119141329.44221-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dfd3f61-fadb-41ae-8b40-08dd0f9f9a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0kxb0EzZFVvUmc1Y1hTL255cnZ0OHB2OWVWVzJwVzNWaVVZTjFIa0hUT0FE?=
 =?utf-8?B?REcyeFpIaVZFZXNrWXJIOVhFOG5ieUdnZjVBcitBRHdORFpTbHRveWljU09O?=
 =?utf-8?B?UTlzNnZVUXZxZmJJZzZuNXJZaEZGT1J6dUNtd2wyekdqWE1RWDZ5ZTM5cWoy?=
 =?utf-8?B?V094Umt6c0NuRzFmaVdUSjlieVRLUDlRZlkxaXZwK08ybzZaRXFlbS9QMXU4?=
 =?utf-8?B?WG1vSUZqTTNFVmVYVEpnYnlxRGptSnprSitaLzdGYjdXS1NzSUJDNFh6dkNP?=
 =?utf-8?B?ejBMV2dJVlpKaTcrdENSZm85WE1mK2pNQnRQSmQzaERYZU9wbDJvelYrRTYr?=
 =?utf-8?B?ZVJtQnpqc05nQysyaGo1b2tkbUppWU9CMU5SbVhpTllhbGRLbktlQitOS3VX?=
 =?utf-8?B?VldIVG9IZGlUZXNabUVDMHhuY0dtZlVBNVBUQjA5SkxBT1VwTEFpZFc2NTgx?=
 =?utf-8?B?Vmk5WWVpSVZmQStLWFRlcTRlMkRuSDBaQ3N4dWpNWmdMU0IveGtKeGhsUFpO?=
 =?utf-8?B?YVVPMHdPRjVnZjVnblhGWTF5STFSNVltenR5MFkvRm9vZXliaGFDTjdjNGNo?=
 =?utf-8?B?dkpMcm5yOU0rSXpFUDhWenFMOWdyU2VjbmkvdGRYT3kyK2tFWEQ0b21SSndo?=
 =?utf-8?B?c0Z1NEFTdDd3clY4cGZWWGlkOXFkblBRTXhOaGt2NWpINXYxaW5rbzdOUWxQ?=
 =?utf-8?B?cm10VFRrdXIvMFhCbUYza01qWXJ2bnRINzhLMExlOWtCUUplSFRmUE1Sclo5?=
 =?utf-8?B?ZGM1dnR2SFR0dndHYmNpVVE4ZlNZUjVvaVRDUGtDS3A0aFdlQk9CMGhsRFh5?=
 =?utf-8?B?ZWdSYlZFcjcvTGdsdEY2QjZjQ0N3S2s3MGZISmliOGtlcGZjVTgrTTRDOFEz?=
 =?utf-8?B?TmRranhUa0xGdTVDWUh0QXBoMzhWckdiNlV3WlRQR0laWjlGeGY1K2xGQjJV?=
 =?utf-8?B?TEVCbm04ZmY5UFpJZkU3YUdqd0NmakxYY1A1RlRiaDZnSWhieUJDOFFpaWRt?=
 =?utf-8?B?Um5hbnJuczRjYkxWSkFyRGwvYUROZG5VSHpEWUVqR3VvdnVNVElwSDByOGVw?=
 =?utf-8?B?STRKYjZlbGdaSFVydDBHMi82b0gxMGpESEExd2JQbUJwekorbjZIQzRab2ox?=
 =?utf-8?B?M1RiZFhtamZnc1k3UEhaS2FzZkZhRGRXUU9xUWRndU13TktidXUzYTNBYUFu?=
 =?utf-8?B?Q2tod0lITzlvUElqMWpwRm1FMkJaTDkreHlObDBvVmo4dklkcWpyeER1WmZX?=
 =?utf-8?B?TWFCUUxiZ1BuMnB2WklHWE02eGVyZGp2alRsWTR6RHFRaW91cm8yNSsyN1VG?=
 =?utf-8?B?cHVTQm9vUzE0K2hIbXFycHRsa0hUeUJ4RFlmRG9nRU0xK3JERXlLY2lDNXNl?=
 =?utf-8?B?T1UrOVczalY0QjdlK2thMTg5eTh1U21LdDQ0eDd0M0Jhcm95R0g3ajZzVGcz?=
 =?utf-8?B?citweDE3aTlva29rSUEvVmh3dHNrdjdBZEptcFpwTHdjcEhxdjlXZjNobjQ0?=
 =?utf-8?B?L0Fta0F5Rkt0cWt0MGZKNXlsWEJNNmNNakxxY3BqMVdqYUgrRDFVdEtsd29Z?=
 =?utf-8?B?OWRiZzdXK3EwQUIrTHJOdGI3bFhUR25JZ09TMG1YUGd1bUZncENSbklmWEFW?=
 =?utf-8?B?c0dlQjBkd0VHZzc0MDRmYXE1K1I2YkFCWEVCQ3FKaTI4MWg5MUtVOFl3dlNy?=
 =?utf-8?B?QXAyR3g4dnYyNCt4ZnhsbTVuajd3M0ZYQU5PN1plcUJhSWplNXhNSUdITzBL?=
 =?utf-8?B?R2VjYTMvOFNQbDVjSmxjbWR1Qyt3S3JXaFI5b0xoTmp4L3pQeFBCVGh1b0Rx?=
 =?utf-8?B?UFdIWmhUNTlmKzBvd05JYStVNG1uR3gwM1hXNXhjcmtkZmpmeCtnTWRSZVJX?=
 =?utf-8?B?OGhvZHBXSmFuSDZ2eS92Wmo3Q0FQNG15Q1orOGRET0JLeEQvZmFlc2ZGcGlR?=
 =?utf-8?Q?o77b4+wLBrIpqOKsNdQXHo6sFLJsm3jb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 11:27:12.1611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfd3f61-fadb-41ae-8b40-08dd0f9f9a7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306



On 19/11/2024 15:13, Carlo Nonato wrote:
> 
> 
> Add a command line parameter to allow the user to set the coloring
> configuration for Dom0.
> A common configuration syntax for cache colors is introduced and
> documented.
> Take the opportunity to also add:
>  - default configuration notion.
>  - function to check well-formed configurations.
> 
> Direct mapping Dom0 isn't possible when coloring is enabled, so
> CDF_directmap flag is removed when creating it.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> v10:
> - fixed array type for colors parameter in check_colors()
> v9:
> - moved domain_llc_coloring_free() in next patch cause it's never used for dom0
> v8:
> - added bound check on dom0_num_colors
> - default colors array set just once
> v7:
> - parse_color_config() doesn't accept leading/trailing commas anymore
> - removed alloc_colors() helper
> v6:
> - moved domain_llc_coloring_free() in this patch
> - removed domain_alloc_colors() in favor of a more explicit allocation
> - parse_color_config() now accepts the size of the array to be filled
> - allocate_memory() moved in another patch
> v5:
> - Carlo Nonato as the new author
> - moved dom0 colors parsing (parse_colors()) in this patch
> - added dom0_set_llc_colors() to set dom0 colors after creation
> - moved color allocation and checking in this patch
> - error handling when allocating color arrays
> - FIXME: copy pasted allocate_memory() cause it got moved
> v4:
> - dom0 colors are dynamically allocated as for any other domain
>   (colors are duplicated in dom0_colors and in the new array, but logic
>   is simpler)
> ---
>  docs/misc/cache-coloring.rst      |  29 ++++++++
>  docs/misc/xen-command-line.pandoc |   9 +++
>  xen/arch/arm/domain_build.c       |  10 ++-
>  xen/common/llc-coloring.c         | 119 +++++++++++++++++++++++++++++-
>  xen/include/xen/llc-coloring.h    |   1 +
>  5 files changed, 166 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> index b608284e9b..c5fb33996c 100644
> --- a/docs/misc/cache-coloring.rst
> +++ b/docs/misc/cache-coloring.rst
> @@ -105,6 +105,35 @@ Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
>  +----------------------+-------------------------------+
>  | ``llc-nr-ways``      | Set the LLC number of ways    |
>  +----------------------+-------------------------------+
> +| ``dom0-llc-colors``  | Dom0 color configuration      |
> ++----------------------+-------------------------------+
> +
> +Colors selection format
> +***********************
> +
> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
> +the color selection can be expressed using the same syntax. In particular a
> +comma-separated list of colors or ranges of colors is used.
> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
> +sides.
> +
> +Note that:
> +
> +- no spaces are allowed between values.
> +- no overlapping ranges or duplicated colors are allowed.
> +- values must be written in ascending order.
> +
> +Examples:
> +
> ++-------------------+-----------------------------+
> +| **Configuration** | **Actual selection**        |
> ++-------------------+-----------------------------+
> +| 1-2,5-8           | [1, 2, 5, 6, 7, 8]          |
> ++-------------------+-----------------------------+
> +| 4-8,10,11,12      | [4, 5, 6, 7, 8, 10, 11, 12] |
> ++-------------------+-----------------------------+
> +| 0                 | [0]                         |
> ++-------------------+-----------------------------+
> 
>  Auto-probing of LLC specs
>  #########################
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index abd8dae96f..bfdc8b0002 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
> 
>  Specify a list of IO ports to be excluded from dom0 access.
> 
> +### dom0-llc-colors (arm64)
> +> `= List of [ <integer> | <integer>-<integer> ]`
> +
> +> Default: `All available LLC colors`
> +
> +Specify dom0 LLC color configuration. This option is available only when
> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
> +colors are used.
> +
>  ### dom0_max_vcpus
> 
>  Either:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index a95376dcdc..01aa9016f5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2,6 +2,7 @@
>  #include <xen/init.h>
>  #include <xen/compile.h>
>  #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/mm.h>
>  #include <xen/param.h>
>  #include <xen/domain_page.h>
> @@ -2284,6 +2285,7 @@ void __init create_dom0(void)
>          .max_maptrack_frames = -1,
>          .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>      };
> +    unsigned int flags = CDF_privileged;
>      int rc;
> 
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2311,10 +2313,16 @@ void __init create_dom0(void)
>              panic("SVE vector length error\n");
>      }
> 
> -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
> +    if ( !llc_coloring_enabled )
> +        flags |= CDF_directmap;
> +
> +    dom0 = domain_create(0, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
>          panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
> 
> +    if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
> +        panic("Error initializing LLC coloring for domain 0 (rc = %d)", rc);
Missing newline \n

> +
>      if ( alloc_dom0_vcpu0(dom0) == NULL )
>          panic("Error creating domain 0 vcpu0\n");
> 
> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
> index 45b001b105..740b5b9e4f 100644
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -20,6 +20,66 @@ static unsigned int __initdata llc_nr_ways;
>  integer_param("llc-nr-ways", llc_nr_ways);
>  /* Number of colors available in the LLC */
>  static unsigned int __ro_after_init max_nr_colors;
> +/* Default coloring configuration */
> +static unsigned int __ro_after_init default_colors[NR_LLC_COLORS];
> +
> +static unsigned int __initdata dom0_colors[NR_LLC_COLORS];
> +static unsigned int __initdata dom0_num_colors;
> +
> +/*
> + * Parse the coloring configuration given in the buf string, following the
> + * syntax below.
> + *
> + * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
> + * RANGE               ::= COLOR-COLOR
> + *
> + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
> + */
> +static int __init parse_color_config(const char *buf, unsigned int colors[],
> +                                     unsigned int max_num_colors,
> +                                     unsigned int *num_colors)
> +{
> +    const char *s = buf;
> +
> +    *num_colors = 0;
> +
> +    while ( *s != '\0' )
> +    {
> +        unsigned int color, start, end;
> +
> +        start = simple_strtoul(s, &s, 0);
> +
> +        if ( *s == '-' )    /* Range */
> +        {
> +            s++;
> +            end = simple_strtoul(s, &s, 0);
> +        }
> +        else                /* Single value */
> +            end = start;
> +
> +        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
> +             (*num_colors + (end - start)) >= max_num_colors )
> +            return -EINVAL;
> +
> +        /* Colors are range checked in check_colors() */
> +        for ( color = start; color <= end; color++ )
> +            colors[(*num_colors)++] = color;
> +
> +        if ( *s == ',' )
> +            s++;
> +        else if ( *s != '\0' )
> +            break;
> +    }
> +
> +    return *s ? -EINVAL : 0;
> +}
> +
> +static int __init parse_dom0_colors(const char *s)
> +{
> +    return parse_color_config(s, dom0_colors, ARRAY_SIZE(dom0_colors),
> +                              &dom0_num_colors);
> +}
> +custom_param("dom0-llc-colors", parse_dom0_colors);
> 
>  static void print_colors(const unsigned int colors[], unsigned int num_colors)
>  {
> @@ -44,9 +104,26 @@ static void print_colors(const unsigned int colors[], unsigned int num_colors)
>      printk(" }\n");
>  }
> 
> +static bool __init check_colors(const unsigned int colors[],
> +                                unsigned int num_colors)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        if ( colors[i] >= max_nr_colors )
> +        {
> +            printk(XENLOG_ERR "LLC color %u >= %u\n", colors[i], max_nr_colors);
The information about max colors is not printed at the start of day, so a message like:
LLC color 20 >= 10
is not that meaningful. Could we perhaps append (max allowable) or similar to the message?

> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
>  void __init llc_coloring_init(void)
>  {
> -    unsigned int way_size;
> +    unsigned int way_size, i;
> 
>      if ( llc_size && llc_nr_ways )
>      {
> @@ -83,6 +160,9 @@ void __init llc_coloring_init(void)
>      } else if ( max_nr_colors < 2 )
>          panic("Number of LLC colors %u < 2\n", max_nr_colors);
> 
> +    for ( i = 0; i < max_nr_colors; i++ )
> +        default_colors[i] = i;
> +
>      arch_llc_coloring_init();
>  }
> 
> @@ -104,6 +184,43 @@ void domain_dump_llc_colors(const struct domain *d)
>      print_colors(d->llc_colors, d->num_llc_colors);
>  }
> 
> +static void __init domain_set_default_colors(struct domain *d)
> +{
> +    printk(XENLOG_WARNING
> +           "LLC color config not found for %pd, using all colors\n", d);
> +
> +    d->llc_colors = default_colors;
> +    d->num_llc_colors = max_nr_colors;
> +}
> +
> +int __init dom0_set_llc_colors(struct domain *d)
> +{
> +    typeof(*dom0_colors) *colors;
> +
> +    if ( !dom0_num_colors )
> +    {
> +        domain_set_default_colors(d);
> +        return 0;
> +    }
> +
> +    if ( dom0_num_colors > max_nr_colors ||
NIT: Can we surround dom0_num_colors > max_nr_colors with brackets?

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


