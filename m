Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6A9DA627
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 11:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844649.1260144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFbU-0001W1-6G; Wed, 27 Nov 2024 10:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844649.1260144; Wed, 27 Nov 2024 10:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFbU-0001Th-35; Wed, 27 Nov 2024 10:49:04 +0000
Received: by outflank-mailman (input) for mailman id 844649;
 Wed, 27 Nov 2024 10:49:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjDT=SW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tGFbS-0001TW-8F
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 10:49:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2415::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32137867-acad-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 11:48:54 +0100 (CET)
Received: from MN2PR06CA0010.namprd06.prod.outlook.com (2603:10b6:208:23d::15)
 by PH0PR12MB7959.namprd12.prod.outlook.com (2603:10b6:510:282::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 10:48:44 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:23d:cafe::81) by MN2PR06CA0010.outlook.office365.com
 (2603:10b6:208:23d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 27 Nov 2024 10:48:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Wed, 27 Nov 2024 10:48:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 04:48:43 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Nov 2024 04:48:41 -0600
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
X-Inumbo-ID: 32137867-acad-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjEzIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjMyMTM3ODY3LWFjYWQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzA0NTM0LjUyMjY1Mywic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0JYdSTLvqfPlM1y8MlyisXaS61dXsnjMs324ZIY2ncn22ZzFKdXMuZ/W+hlA43TiynDIIShiv3du3Kogo70b07fX56u+UxPwHc+WsQ0A4ubuf2gDJjf8ZZbd0ujUBO3iVAtYxQgnvI/oJGt1+mIhnRijG1cSP+2lL4/k05ScdZG0QL/YeQEQ0OPRxooFZq3N5/jLPI0FfyV6fZhzJ5+JAj3tocY6vhJ2QIroODncaONm18Jpthtji5or3tWNY3bCY7vp3SB0iyz535apNsQvwLuSPRLlJlfm0dV0Ksnq+ha0lHlKC4qvrCZY5o92YUlIgPDPWa8GkXo/XdpjyXS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qajI1uuyRj1jy107yPDQIAaNNMmReIq54wJEnC7Azp8=;
 b=QP4DlZdndNbadwFu/M6XvrIdj+0KX7ffhnsXW6fkuLsy6rO68N2vCp5ogEEGmdpuSkj1EcPltwKsIgmsLqJkYyqVuzgVAla+WdSPp3/oRjCpHFIMWE5hJP6nO7tJCekJktbZ86c76iqCB7UAb0F6JLQDiEpyaI1nNEg5Hea/xpgOv+WYbdLj8/HoQ5WEACJIsKQcKEYCjglc+4AX1LQpdyOxS69gwe8ANUy35BINtGVZMypS16mMS8WS38MZ3k9TNHDBnz5Bq9EmmZCadzuC8BOVLUUOeQYIcsPNW4OnXKFEI/A1kcNizX72PNKCzLz4vUgtVMOf9RiBJEjPcFvGxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qajI1uuyRj1jy107yPDQIAaNNMmReIq54wJEnC7Azp8=;
 b=J4mbyzUt8Eqbm76a5ZZqicb46zFL7T7S1IrxXjKvS4bFKmH6blNINMn0fXv5wkaNtq0Kk+7xKHKQA3opKw3X+MMGhTbnRxJzuKiMVRUm/7iG5gCD1u0qbp5Bywuc9DuJjCsWm+AawGvHvUSkCPCpsTFe9RFE7TmojStnL+H/yes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <93c0a25f-4edc-4d21-8767-48d496cc3575@amd.com>
Date: Wed, 27 Nov 2024 11:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/12] xen/common: add cache coloring common code
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-2-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241119141329.44221-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|PH0PR12MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5ba573-5991-4761-93d3-08dd0ed11024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmMrOXZxM1BvZkhkbzNvMmliZ21jazJQb3VsTmZLeGM4OWc4VEV5VDBFTzBw?=
 =?utf-8?B?SGFUbXJpTmVlQVdXdjZUaHZ0T3JXNEZkS1VtVHM2NUo2YWw2eHo5em9ZeGJv?=
 =?utf-8?B?TUROanFlTmdVK24xUnowWW85dytvK0xaMG5ENTZLTFNPS0FzdGVtY25pdHBJ?=
 =?utf-8?B?NHNrNXIxUWRkVHRFaVlBUitST0l3aUlsYW96QWh4ODFJLzhxTnBzeXo1bi9J?=
 =?utf-8?B?R2wxQURlNVE5UWEvUFBpb3lOZHVETHZTd1JxaWtmZTFlbEJ0eDd5Z2h4RG5E?=
 =?utf-8?B?UTJhdlB5cXlROGs3bngwSkh6bEhDUVFHdzF0cy93bkl2a3ExYmNVbm4wMU82?=
 =?utf-8?B?SGVJSEFrWGloMkYxeEc4OTYvT1dhRlQwdGJqN1hNMTMyL3c0MlYwZElOSWtX?=
 =?utf-8?B?alJ5NlBRVTgvNXF1a2wvMVBraWV2WWkwY1RGT0RPYlBDNmNiN1JzZzcwRXhJ?=
 =?utf-8?B?Z1RWajlyWmpuTFNsMHZjUHJxZEIvSjM2cFd0d0M3eU1xZ1FuaGUrbnE0SmdF?=
 =?utf-8?B?UERYK005eXRvb2U0NGJqWU1tbEdjWW94KzJLYWhObXoxUVNybUQxa1U1bmpj?=
 =?utf-8?B?aEFzYWo1YmhCa3dZaVVUanliRVhRbERjZUQ1WGVMRGxXSXVXMEV6a2M5QkdL?=
 =?utf-8?B?dEdYbHNkRGxmbjM3b253Yjk4TmQ3S1cwTGcwdzJtUS84RWhUS25ZejRRMXRF?=
 =?utf-8?B?YjkrVmFkcm9RNVdDeUZ4RGhsZXJudjdjWWVPVDhkNDNmV0puQXdqbGJiY0FK?=
 =?utf-8?B?RXZpb0lVbkRTdi9MUERQMllSS0JOeFhpTGJIR2pZbWZrMldLQUt1dTN5Szhk?=
 =?utf-8?B?bG5sQTRtaGg3QTkvUGtvTHJLY1MrVWFPcnJFaGVvaFFGb3BMRzZBVEtYTmRB?=
 =?utf-8?B?VnA1bTAxYnVxUFl6WjYycit0MkNYbldpeWV1V2JyZDBKejlSZ2E5NStNcEI2?=
 =?utf-8?B?NTJubm9xT3ZuNVZqUllmQ0I4dThtVUlHQThzK1F5bWE0VVh2MHFnTnhGUWJU?=
 =?utf-8?B?aFplMGl0MDI0U28rS0t1Q3IrUlRDNTdXLzFvaHF6OUlMWDBSU2VoZk9wRjdC?=
 =?utf-8?B?bmdRTzdaMWN4clc1OUNFbnI5OTV4d2IzdzdIOVNkVXlhcEgwY1UzTHBnZnJt?=
 =?utf-8?B?S0Z0c3RkbnRDQlRQd2xZSTBWdmV5ZmVibDV3N2I5eVVOTEtXOXF1Q0VQNmdn?=
 =?utf-8?B?Mnh1bzV6bXJzZTRwOE53ckp5MWlSWUg4QTVOQjkxQ3NNZzNTK2xQTVdvWnZ3?=
 =?utf-8?B?Nnh1anFaSU1RVnpHdWY1aitUNWFKMFVNb09jcWJCSGlOUmFNNHVtYitqdjVh?=
 =?utf-8?B?WmF4STNHaUdtRGd0RGo2eTdXSGNzZUdkQWJGVHVMVmxYVDV4Q0JKUGQ2TnBQ?=
 =?utf-8?B?YmxWWmNLcElhQ0dGUVg0RU85ZUE1Wi92eDRrVUxSaXg0RGk3bElSNmxBOTdF?=
 =?utf-8?B?MGxoNllma081dmtsMVBsTmJ3RnZxMTVjaDdoL2F1eFVQZVRGZW8zMUtNcFRE?=
 =?utf-8?B?Vm5BU2Y0WFVNN3hJMitpYmZVeEttQzgvRzM2Yk45T0VnQTdDalR3RE5SbzZ0?=
 =?utf-8?B?Qk5LdHZLMllkNXVlWjY0cytTV21EamhxTGYvUU9wMVpzQWRPS3NNL1NwVWFn?=
 =?utf-8?B?cm8wNTlvZS9uOWdNUThuN2d3U3lFNjEyZzBxbkhnbkgwakltQW93TE9OdUla?=
 =?utf-8?B?a3o5UnUyazJxTzJITk05TlpudmgwU2NlTmlQSGhxcjl5SVJIbFVCREREYTB0?=
 =?utf-8?B?SW9qOTA4L1lFMnNHZENKRE9aWEl0ZFZzWUUvZm5Zai9sT2VDTUgvSUpYQ1hz?=
 =?utf-8?B?NDVyUitScVozaEU1dWU0eUhRb05uODFBTHkwNTJqZCt1dEt0cXFHSkNPb0ZP?=
 =?utf-8?B?NERjR2E4Sm9kZjdQamZoQ0NqdGpqRTRuZXAxZXlNandmUFRiSkhuNkI1YmRl?=
 =?utf-8?Q?wT+DxjBSOBkHls2e2Vr0MnsJx4lchD0S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 10:48:43.7639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5ba573-5991-4761-93d3-08dd0ed11024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7959



On 19/11/2024 15:13, Carlo Nonato wrote:
> 
> 
> Last Level Cache (LLC) coloring allows to partition the cache in smaller
> chunks called cache colors.
> 
> Since not all architectures can actually implement it, add a HAS_LLC_COLORING
> Kconfig option.
> LLC_COLORS_ORDER Kconfig option has a range maximum of 10 (2^10 = 1024)
> because that's the number of colors that fit in a 4 KiB page when integers
> are 4 bytes long.
> 
> LLC colors are a property of the domain, so struct domain has to be extended.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v10:
> - fixed commit message to use LLC_COLORS_ORDER
> - added documentation to index.rst
> - moved check on CONFIG_NUMA in arch/arm/Kconfig (next patch)
> - fixed copyright line
> - fixed array type for colors parameter in print_colors()
> - added check on (way_size & ~PAGE_MASK)
> v9:
> - dropped _MAX_ from CONFIG_MAX_LLC_COLORS_ORDER
> v8:
> - minor documentation fixes
> - "llc-coloring=on" is inferred from "llc-nr-ways" and "llc-size" usage
> - turned CONFIG_NR_LLC_COLORS to CONFIG_MAX_LLC_COLORS_ORDER, base-2 exponent
> - moved Kconfig options to common/Kconfig
> - don't crash if computed max_nr_colors is too large
> v7:
> - SUPPORT.md changes added to this patch
> - extended documentation to better address applicability of cache coloring
> - "llc-nr-ways" and "llc-size" params introduced in favor of "llc-way-size"
> - moved dump_llc_coloring_info() call in 'm' keyhandler (pagealloc_info())
> v6:
> - moved almost all code in common
> - moved documentation in this patch
> - reintroduced range for CONFIG_NR_LLC_COLORS
> - reintroduced some stub functions to reduce the number of checks on
>   llc_coloring_enabled
> - moved domain_llc_coloring_free() in same patch where allocation happens
> - turned "d->llc_colors" to pointer-to-const
> - llc_coloring_init() now returns void and panics if errors are found
> v5:
> - used - instead of _ for filenames
> - removed domain_create_llc_colored()
> - removed stub functions
> - coloring domain fields are now #ifdef protected
> v4:
> - Kconfig options moved to xen/arch
> - removed range for CONFIG_NR_LLC_COLORS
> - added "llc_coloring_enabled" global to later implement the boot-time
>   switch
> - added domain_create_llc_colored() to be able to pass colors
> - added is_domain_llc_colored() macro
> ---
>  SUPPORT.md                        |   7 ++
>  docs/index.rst                    |   1 +
>  docs/misc/cache-coloring.rst      | 116 ++++++++++++++++++++++++++++++
>  docs/misc/xen-command-line.pandoc |  37 ++++++++++
>  xen/common/Kconfig                |  21 ++++++
>  xen/common/Makefile               |   1 +
>  xen/common/keyhandler.c           |   3 +
>  xen/common/llc-coloring.c         | 115 +++++++++++++++++++++++++++++
>  xen/common/page_alloc.c           |   3 +
>  xen/include/xen/llc-coloring.h    |  37 ++++++++++
>  xen/include/xen/sched.h           |   5 ++
>  11 files changed, 346 insertions(+)
>  create mode 100644 docs/misc/cache-coloring.rst
>  create mode 100644 xen/common/llc-coloring.c
>  create mode 100644 xen/include/xen/llc-coloring.h
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 82239d0294..998faf5635 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -401,6 +401,13 @@ by maintaining multiple physical to machine (p2m) memory mappings.
>      Status, x86 HVM: Tech Preview
>      Status, ARM: Tech Preview
> 
> +### Cache coloring
> +
> +Allows to reserve Last Level Cache (LLC) partitions for Dom0, DomUs and Xen
> +itself.
> +
> +    Status, Arm64: Experimental
> +
>  ## Resource Management
> 
>  ### CPU Pools
> diff --git a/docs/index.rst b/docs/index.rst
> index ab051a0f38..fad4462bbb 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -65,6 +65,7 @@ Documents in need of some rearranging.
>     designs/launch/hyperlaunch-devicetree
>     misc/xen-makefiles/makefiles
>     misra/index
> +   misc/cache-coloring
> 
> 
>  Miscellanea
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> new file mode 100644
> index 0000000000..0fe3830c40
> --- /dev/null
> +++ b/docs/misc/cache-coloring.rst
> @@ -0,0 +1,116 @@
You're missing SPDX tag at the top of the RST file:
.. SPDX-License-Identifier: CC-BY-4.0

> +Xen cache coloring user guide
> +=============================
> +
> +The cache coloring support in Xen allows to reserve Last Level Cache (LLC)
> +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is supported.
> +Cache coloring realizes per-set cache partitioning in software and is applicable
> +to shared LLCs as implemented in Cortex-A53, Cortex-A72 and similar CPUs.
> +
> +To compile LLC coloring support set ``CONFIG_LLC_COLORING=y``.
> +
> +If needed, change the maximum number of colors with
> +``CONFIG_LLC_COLORS_ORDER=<n>``.
> +
> +Runtime configuration is done via `Command line parameters`_.
> +
> +Background
> +**********
> +
> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
> +to each core (hence using multiple cache units), while the last level is shared
> +among all of them. Such configuration implies that memory operations on one
> +core (e.g. running a DomU) are able to generate interference on another core
> +(e.g. hosting another DomU). Cache coloring realizes per-set cache-partitioning
> +in software and mitigates this, guaranteeing more predictable performances for
> +memory accesses.
> +Software-based cache coloring is particularly useful in those situations where
> +no hardware mechanisms (e.g., DSU-based way partitioning) are available to
> +partition caches. This is the case for e.g., Cortex-A53, A57 and A72 CPUs that
> +feature a L2 LLC cache shared among all cores.
> +
> +The key concept underlying cache coloring is a fragmentation of the memory
> +space into a set of sub-spaces called colors that are mapped to disjoint cache
> +partitions. Technically, the whole memory space is first divided into a number
> +of subsequent regions. Then each region is in turn divided into a number of
> +subsequent sub-colors. The generic i-th color is then obtained by all the
> +i-th sub-colors in each region.
> +
> +::
> +
> +                            Region j            Region j+1
> +                .....................   ............
> +                .                     . .
> +                .                       .
> +            _ _ _______________ _ _____________________ _ _
> +                |     |     |     |     |     |     |
> +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
> +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
> +                    :                       :
> +                    :                       :...         ... .
> +                    :                            color 0
> +                    :...........................         ... .
> +                                                :
> +          . . ..................................:
> +
> +How colors are actually defined depends on the function that maps memory to
> +cache lines. In case of physically-indexed, physically-tagged caches with linear
> +mapping, the set index is found by extracting some contiguous bits from the
> +physical address. This allows colors to be defined as shown in figure: they
> +appear in memory as subsequent blocks of equal size and repeats themselves after
> +``n`` different colors, where ``n`` is the total number of colors.
> +
> +If some kind of bit shuffling appears in the mapping function, then colors
> +assume a different layout in memory. Those kind of caches aren't supported by
> +the current implementation.
> +
> +**Note**: Finding the exact cache mapping function can be a really difficult
> +task since it's not always documented in the CPU manual. As said Cortex-A53, A57
> +and A72 are known to work with the current implementation.
> +
> +How to compute the number of colors
> +###################################
> +
> +Given the linear mapping from physical memory to cache lines for granted, the
> +number of available colors for a specific platform is computed using three
> +parameters:
> +
> +- the size of the LLC.
> +- the number of the LLC ways.
> +- the page size used by Xen.
> +
> +The first two parameters can be found in the processor manual, while the third
> +one is the minimum mapping granularity. Dividing the cache size by the number of
> +its ways we obtain the size of a way. Dividing this number by the page size,
> +the number of total cache colors is found. So for example an Arm Cortex-A53
> +with a 16-ways associative 1 MiB LLC can isolate up to 16 colors when pages are
> +4 KiB in size.
> +
> +Effective colors assignment
> +###########################
> +
> +When assigning colors, if one wants to avoid cache interference between two
> +domains, different colors needs to be used for their memory.
> +
> +Command line parameters
> +***********************
> +
> +Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
> +
> ++----------------------+-------------------------------+
> +| **Parameter**        | **Description**               |
> ++----------------------+-------------------------------+
> +| ``llc-coloring``     | Enable coloring at runtime    |
> ++----------------------+-------------------------------+
> +| ``llc-size``         | Set the LLC size              |
> ++----------------------+-------------------------------+
> +| ``llc-nr-ways``      | Set the LLC number of ways    |
> ++----------------------+-------------------------------+
> +
> +Auto-probing of LLC specs
> +#########################
> +
> +LLC size and number of ways are probed automatically by default.
> +
> +LLC specs can be manually set via the above command line parameters. This
> +bypasses any auto-probing and it's used to overcome failing situations, such as
> +flawed probing logic, or for debugging/testing purposes.
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 293dbc1a95..abd8dae96f 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1708,6 +1708,43 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>  in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>  record with other registers.
> 
> +### llc-coloring (arm64)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable LLC coloring support at runtime. This option is
> +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> +cache coloring documentation for more info.
> +
> +### llc-nr-ways (arm64)
> +> `= <integer>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the number of ways of the Last Level Cache. This option is available
> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used
> +to find the number of supported cache colors. By default the value is
> +automatically computed by probing the hardware, but in case of specific needs,
> +it can be manually set. Those include failing probing and debugging/testing
> +purposes so that it's possible to emulate platforms with different number of
> +supported colors. If set, also "llc-size" must be set, otherwise the default
> +will be used. Note that using both options implies "llc-coloring=on".
I can understand this decision, but ...

[...]

> +    if ( llc_size && llc_nr_ways )
> +    {
> +        llc_coloring_enabled = true;
> +        way_size = llc_size / llc_nr_ways;
> +    }
> +    else if ( !llc_coloring_enabled )
> +        return;
the above code does not seem to be right. When debugging or in general it is useful to have on the cmdline:
llc-size=1M llc-nr-ways=16 llc-coloring=on
and be able to disable it by just switching between on/off in llc-coloring=. However, with your solution,
even if I specify llc-coloring=off, it will be enabled because I specified both llc-size and llc-nr-ways.
I think llc-coloring= should have a precedence.

> +    else
> +    {
> +        way_size = get_llc_way_size();
> +        if ( !way_size )
> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' missing\n");
> +    }
> +
> +    if ( way_size & ~PAGE_MASK )
> +        panic("LLC way size must be a multiple of PAGE_SIZE\n");
> +
> +    /*
> +     * The maximum number of colors must be a power of 2 in order to correctly
> +     * map them to bits of an address.
> +     */
> +    max_nr_colors = way_size >> PAGE_SHIFT;
> +
> +    if ( max_nr_colors & (max_nr_colors - 1) )
> +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr_colors);
> +
> +    if ( max_nr_colors > NR_LLC_COLORS )
> +    {
> +        printk(XENLOG_WARNING
> +               "Number of LLC colors (%u) too big. Using configured max %u\n",
> +               max_nr_colors, NR_LLC_COLORS);
> +        max_nr_colors = NR_LLC_COLORS;
> +    } else if ( max_nr_colors < 2 )
CODING STYLE

> +        panic("Number of LLC colors %u < 2\n", max_nr_colors);
> +
> +    arch_llc_coloring_init();
> +}
> +
> +void dump_llc_coloring_info(void)
> +{
> +    if ( !llc_coloring_enabled )
> +        return;
> +
> +    printk("LLC coloring info:\n");
> +    printk("    Number of LLC colors supported: %u\n", max_nr_colors);
> +}
> +
> +void domain_dump_llc_colors(const struct domain *d)
> +{
> +    if ( !llc_coloring_enabled )
> +        return;
> +
> +    printk("%u LLC colors: ", d->num_llc_colors);
> +    print_colors(d->llc_colors, d->num_llc_colors);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 33c8c917d9..7b911b5ed9 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -126,6 +126,7 @@
>  #include <xen/irq.h>
>  #include <xen/keyhandler.h>
>  #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/mm.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
> @@ -2626,6 +2627,8 @@ static void cf_check pagealloc_info(unsigned char key)
>      }
> 
>      printk("    Dom heap: %lukB free\n", total << (PAGE_SHIFT-10));
> +
> +    dump_llc_coloring_info();
>  }
> 
>  static __init int cf_check pagealloc_keyhandler_init(void)
> diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
> new file mode 100644
> index 0000000000..6ccf4613c2
> --- /dev/null
> +++ b/xen/include/xen/llc-coloring.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common header
> + *
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + * Copyright (C) 2024, Minerva Systems SRL
> + */
> +#ifndef __COLORING_H__
> +#define __COLORING_H__
> +
> +#include <xen/sched.h>
You could just forward declare struct domain unless you know you need sched.h for other things too in other patches.

> +#include <public/domctl.h>
Why is this here? It's not needed yet at this point.

> +
> +#ifdef CONFIG_LLC_COLORING
> +void llc_coloring_init(void);
> +void dump_llc_coloring_info(void);
> +void domain_dump_llc_colors(const struct domain *d);
> +#else
> +static inline void llc_coloring_init(void) {}
> +static inline void dump_llc_coloring_info(void) {}
> +static inline void domain_dump_llc_colors(const struct domain *d) {}
> +#endif
> +
> +unsigned int get_llc_way_size(void);
> +void arch_llc_coloring_init(void);
> +
> +#endif /* __COLORING_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 90666576c2..c0e49cd1e7 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -637,6 +637,11 @@ struct domain
> 
>      /* Holding CDF_* constant. Internal flags for domain creation. */
>      unsigned int cdf;
> +
> +#ifdef CONFIG_LLC_COLORING
> +    unsigned int num_llc_colors;
> +    const unsigned int *llc_colors;
> +#endif
>  };
> 
>  static inline struct page_list_head *page_to_list(
> --
> 2.43.0
> 

Otherwise, with the remarks addressed:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal



