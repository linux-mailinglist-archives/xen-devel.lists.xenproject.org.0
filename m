Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B436B9BB18B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 11:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829934.1244862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7uen-0000rb-OJ; Mon, 04 Nov 2024 10:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829934.1244862; Mon, 04 Nov 2024 10:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7uen-0000nl-KL; Mon, 04 Nov 2024 10:50:01 +0000
Received: by outflank-mailman (input) for mailman id 829934;
 Mon, 04 Nov 2024 10:50:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSQ4=R7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1t7uen-0000ld-0d
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 10:50:01 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2412::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84d66f75-9a9a-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 11:49:53 +0100 (CET)
Received: from PH8PR22CA0013.namprd22.prod.outlook.com (2603:10b6:510:2d1::11)
 by IA1PR12MB8517.namprd12.prod.outlook.com (2603:10b6:208:449::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Mon, 4 Nov
 2024 10:49:48 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::82) by PH8PR22CA0013.outlook.office365.com
 (2603:10b6:510:2d1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 10:49:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 10:49:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 04:49:46 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Nov 2024 04:49:45 -0600
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
X-Inumbo-ID: 84d66f75-9a9a-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjJiIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijg0ZDY2Zjc1LTlhOWEtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzE3MzkzLjMyNzE3Mywic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snx5Hi9HEr6Ytosaefn73PK1/KxY2wCV2mtUR8qm2wKrG6v+R8QLfDLstd2Uu7nTr+lugZuNB2d8ZEgJATgnbDUNmBYBH4O6mi8lNbL0JXYccdkwrSX0Kj7iwt7yCyGTVgKTS6Jy4yiU1ai+Rvhn8+bSCcBA2y97JRbwwGKhtIgaztDY14mnL2wP9T3h6X5P2dpGnc4b6dV157N+P3xQStcPlC+diYodmrJ/WLa4RQr12UzjZsrLvS9oSW4Jx3dxo8+Zm+qjtIt1/runnCav6hn/ZB7d4y0uRqoFNmZyLTPtaL4FGukjy6a6ZEjw4OiARf12nqHebL3qHr3i4qD2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIfRaUY5EJyTddYIo+WOIA4bm03Ox6iDG39+dv3ABew=;
 b=qOeT+JYGJvMybVT5p33WIMKeQPdjWKG1n/kQxCkRGTXisjyYlmoOMg0MstKDS6pwhHnPJ+FCU3wdNnf0+vw6jXJ/SUL9x0flOgjf+lVf9NcnniL988cQ48kOh9G7aiJPhxOc6M26APGYhT+/8bZ46TGf4ysJmjva1tRVR50RoKayTV1niHIYum2Duz9vKCSReCbaTg0aByTp/XlBYrs7Q88LT/3IIv3IiSiI/BXltXsG6l1peKA2tYW1v0hc4pl2bL2Ga6MkRFJCj1bGEd7Pwf9OuGARRs9QtBbit9o2lzk+O7W+FXf9e1hr1SOF2+Gia42DrhR6XWKn4PCWnNR/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=raptorengineering.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIfRaUY5EJyTddYIo+WOIA4bm03Ox6iDG39+dv3ABew=;
 b=HmjZGan1SGfI92wypAvCSBxTwYP8/8mSb/rPYTrTksZVZR2tzCFYl1zKYRKb885+3MCxR2NtJ2FJviJ9147LscQfroObLpUoRdiq2GWA51lsc26qYXzC8g30UkxaGWP00YuCGtHnaz0T9qcPCC5aSshGJXeDhk5jOcFi0kGAyLc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1ae100b3-17f0-4ac5-beb3-fdd2f12adee7@amd.com>
Date: Mon, 4 Nov 2024 11:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/device-tree: Let DT reserve map entries
 overlap reserved-memory
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
	<xen-devel@lists.xenproject.org>
CC: <tpearson@raptorengineering.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
 <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|IA1PR12MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b141383-6c25-47aa-b4dd-08dcfcbe6681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTY4WkRGTyt3UFR1ZzdKVHE0Q21jNXhSaGhCdnc3cWpScW1Rd0hJOEpBMGpU?=
 =?utf-8?B?THNTUVlIYVNTMTB5UTR1RDI4Z0hLOVhrRWZycGU3czdlSERHY2xNZVRnMG1V?=
 =?utf-8?B?eEdNU1ZSbUhhM0RybkgzYlovRDRPQjk2MTNUUkQ5b3hSejcrNnVDelZSN09W?=
 =?utf-8?B?czMxU01NRy9VQ3ZKQnhTOFZEa0dYcHcyS3NNNFpoRHF2TlFway9HTkZoclNE?=
 =?utf-8?B?UmJCTTFZZEpaazNpYXlNblVJK2tBSWFEYnZGdWhPMy9NaG41eS9TYkFlOHFS?=
 =?utf-8?B?dUkxZFFJUEFEQUZheUk3OXdqK2E2cXBqNXRwSnlWN2VhUEx6T1N4MGY5ZXJr?=
 =?utf-8?B?MDczMk1TS2lYVHBrYjV0ODg3eTVadWRpUTJUNkM4bW5tSk1pT0RuVk0zR25O?=
 =?utf-8?B?dDUyc2JCdGl3eHc5NkZGZHR6TTdESk90S2pLTUpYTHZ1VklnK0RNUlo2Z1NS?=
 =?utf-8?B?Y0JsWEF0QnFnNkRaOFRXeXErNnZFWUo3U0VMZ2VkQkIyTXBhaExjbzYralhP?=
 =?utf-8?B?RzZxVEV5bnFyUFZWTzRqRktSZTByM0FPQWY0TzNCTFE5U2R6Mk9iWjM1V2p1?=
 =?utf-8?B?YXd4Z0ptYWtycG9KNU92cEhsbDlGOWdoOUR6Z21YLy9YN1RUczF1ZUZrR0pT?=
 =?utf-8?B?VmFEMVA3aDk4MTIzV1plOWE4MEh0djF6dFhWSDhERyt0UnNVZkhWZWNYbWpF?=
 =?utf-8?B?NUJEMHJGZE5nUE45RGhZQWNVQmJORDgrcHdOWDlUdDJkV1Q1Q1pKK0FqTE8x?=
 =?utf-8?B?ZTFTZWNIbzRyYzRwcTlpTXBzWThnT1dsVUk2Q2dET09xQzNhR29PYjZObDQx?=
 =?utf-8?B?ZDZ2V2QvaU8xa21XemkyZzhqU25PellvczRONXF3QUZINEloYTg0WWNlVFFB?=
 =?utf-8?B?aVpvN3QwSGt5OWRDMXYrZXl1cDBUU3VsdHJqYVBCUG8zUHhKM1V3cVFLUG9G?=
 =?utf-8?B?dW5TZVlDZFAvR25HbmxBdFdnVFVJQTkzZU80dkZMR05hQ05uSWRMRFhwZ2Ja?=
 =?utf-8?B?UGlEaTErRGx0UFZUWlpGYWExVjhwSzVnR3JnWUQ0cHdVS3QxRGhmQVo1TUZJ?=
 =?utf-8?B?WEJjUEtwMDJnbVhnSTRVa3hsSytqQ1YzUlRia3ZSR21RWWNBcDlGRzBCSDky?=
 =?utf-8?B?UTBENHNZL0ROUVdjUTAzVWtxT2FFZldMeXptOXZ4Nm5QU1FZSlJzSHdNUjZu?=
 =?utf-8?B?T2RxVndlQ3BVVHpSMHhkdEw1Y0hWYWhjUjhubW1leWU1WEQzd1d6UnFtaE5x?=
 =?utf-8?B?aUpXSVJacWY4ZHpxd1FOMnZVLy9YRXcwNzhQVlJiNVV2TWJISVdNaU5obzF5?=
 =?utf-8?B?UzczUHBIYUczZzNnUlJWWU9Uejh5ek43STNKRjc3U2thL1JnZytma2xncUdH?=
 =?utf-8?B?bnlNZVVacldEWHFVd3hEOW5KelNpYlJFWGtlcE12TEpVdUxqd1FBWEpFamdV?=
 =?utf-8?B?eGxBVlY5bXgwNkdPa3A4OTkyaG5xZXVzbFVrd0ZabTFMRXRaNTRIY3hicUVU?=
 =?utf-8?B?eVlwL3FFTDhLd3VONzdXSVVFNnRHb3NnVERVVCtxNnZHLzJwdjMvMEVEL0kw?=
 =?utf-8?B?aklyeDE2OXRwaWZpVGxaNm8xbXhVQUp1TE40ekxnZldLZnllSnJrNkhCbzZC?=
 =?utf-8?B?V1luNnRnNWE4Z2l1N3V4OWVpejlZV1p1NGg2N3RscXhOMmJIOW9iUldYd2ZV?=
 =?utf-8?B?VWVicVo3ZEVQS3hLMlV6aWFJWmJxQ2M4N1JUSEpwUDBaNEhQQUxrVisyOEdJ?=
 =?utf-8?B?K0pXV3VOOFpNYTI3RlIvakZxSTBiWWhET2dDNFEyMDFKMmZrUGhKbkpMWmNv?=
 =?utf-8?B?SklSZ2trUmwwbFdRSXRyRjhod1h2aUVweENYOHIyd2hzWE5GWFpLYjh6WDRH?=
 =?utf-8?B?MlU5Rm9XZ05lWkp1TitVbDlRL3ZjUG1Wa29aK0hNNUwwL1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 10:49:47.2748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b141383-6c25-47aa-b4dd-08dcfcbe6681
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8517



On 27/09/2024 00:24, Shawn Anastasio wrote:
> 
> 
> Commit 53dc37829c31 ("xen/arm: Add DT reserve map regions to
> bootinfo.reserved_mem") changes the way reserve map regions are tracked,
> and as a result broke bootfdt's ability to handle device trees in which
> the reserve map and the `reserved-memory` node contain the same entries
> as each other, as is the case on PPC when booted by skiboot.
> 
> Fix this behavior by moving the reserve map check to after the DT has
> been parsed and by explicitly allowing overlap with entries created by
> `reserved-memory` nodes.
> 
> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/common/device-tree/bootfdt.c  | 28 +++++++++++++++++++++++-----
>  xen/common/device-tree/bootinfo.c | 11 +++++++++--
>  xen/include/xen/bootfdt.h         |  3 ++-
>  3 files changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 911a630e7d..2a51ee44a3 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -177,7 +177,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>      {
>          device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
>          if ( mem == bootinfo_get_reserved_mem() &&
> -             check_reserved_regions_overlap(start, size) )
> +             check_reserved_regions_overlap(start, size, NULL) )
>              return -EINVAL;
>          /* Some DT may describe empty bank, ignore them */
>          if ( !size )
> @@ -590,14 +590,36 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>      if ( nr_rsvd < 0 )
>          panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
> 
> +    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
This should be moved before fdt_num_mem_rsv so that the program flow makes sense. In your case nr_rsvd is
not used immediately after.

> +    if ( ret )
> +        panic("Early FDT parsing failed (%d)\n", ret);
> +
>      for ( i = 0; i < nr_rsvd; i++ )
>      {
> +        const struct membanks *overlap = NULL;
>          struct membank *bank;
>          paddr_t s, sz;
> 
>          if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
>              continue;
> 
> +        if ( check_reserved_regions_overlap(s, sz, &overlap) )
> +        {
> +            if ( overlap == bootinfo_get_reserved_mem() )
> +            {
> +                /*
> +                 * Some valid device trees, such as those generated by OpenPOWER
> +                 * skiboot firmware, expose all reserved memory regions in the
> +                 * FDT memory reservation block (here) AND in the
> +                 * reserved-memory node which has already been parsed. Thus, any
> +                 * overlaps in the mem_reserved banks should be ignored.
> +                 */
> +                 continue;
I think this is incorrect. Imagine this scenario:
/memreserve/ 0x40000000 0x40000000;
and /reserved-memory/foo with:
reg = <0x0 0x7FFFF000 0x0 0x1000>;

You would ignore the entire region described with /memreserve/ even though it overlaps just the last page.

The problem you're describing is about regions that match 1:1 in /memreserve/ and /reserved-memory/.
Therefore I think you should check that the overlapped regions match exactly.

~Michal

