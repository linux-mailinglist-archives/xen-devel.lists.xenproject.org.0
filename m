Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9739D8FA2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 01:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843226.1258868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFjqU-00046Z-AM; Tue, 26 Nov 2024 00:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843226.1258868; Tue, 26 Nov 2024 00:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFjqU-00043m-6y; Tue, 26 Nov 2024 00:54:26 +0000
Received: by outflank-mailman (input) for mailman id 843226;
 Tue, 26 Nov 2024 00:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzfN=SV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tFjqS-00043g-GY
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 00:54:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:200a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5f01b65-ab90-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 01:54:16 +0100 (CET)
Received: from CH0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:610:77::13)
 by DS0PR12MB6439.namprd12.prod.outlook.com (2603:10b6:8:c9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.19; Tue, 26 Nov 2024 00:54:08 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::3a) by CH0PR04CA0038.outlook.office365.com
 (2603:10b6:610:77::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 00:54:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 00:54:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 18:54:08 -0600
Received: from [172.23.96.146] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Nov 2024 18:54:07 -0600
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
X-Inumbo-ID: f5f01b65-ab90-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwYTo6NjI5IiwiaGVsbyI6Ik5BTTEyLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImY1ZjAxYjY1LWFiOTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTgyNDU2LjQzOTE0OSwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S98IAb8s77rrsU69amP2A1Qumla6FbP7/yDbywqSlFbVHuDnz/LYmkNoCNaDpBcjYmBLrw6yHGWtLsTM2E0+dYfEZ3egCNdKHWXBUID2FW/GrcoYfFi2COY0iaz3eu/EwhTpmtMgKrhHQ+deoiGvdPDy7HYPyeVa9d/1PidGR/bRc1Gu9B2BYNzhEbWrdke15/HsgVMorWP+QJKHhb9YdgQiXYVnH5qdkWkx8ONZqKz4IJQ+x59WEXRlYh2+dB2PyR1qW8N0+3O369uqN5Ktkc0rzqqCeaeEDtnTxsCQoNh75xPuOhy0FXiOcepG7qGuUiieL1RyZ79tzA3BUNYEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHRqSmZ63PNFzToCaS6V3geseK8g2UrZqo9L4RjURac=;
 b=ixQs6TARl5aqLuvVwG4A4MBGV+iYM+zaztyCwoH1XFfeMJNDwi9Q9w+/R4mWEQkKJltbmBrVn+daSS5+C2UFfQcuOJf6jgInO8dd8QsTe9DShmvzjYUeTDRw/53FpxBWoPLAQUVb6NDc1+gjy56wrtuHDl3bKciYyJc2tgHDqidrUZZc0IpqlXkqqMvei+xMCnTpyOvYAQNREaO7KsepbPdUPeNKESFhqVFmVYUDTSUOL8Pyi4i3BfEENLErsvJfNl/uGilnEalYV8l8ZF5oScLtwcKINXMlxJk4ajvByMfqt+oHNHXVIxd4Zt1CCVBy6mUK2W4b87esXbikn4GYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHRqSmZ63PNFzToCaS6V3geseK8g2UrZqo9L4RjURac=;
 b=nQw7tbNLQXRSbeVyF70xUvqIFi/5TbqVI0mRcRJ9sBokpB7cfWLk9TDJJEqPX/P2ooVdYY2vgAKjgBlcbp0AeblmC5KVgyGhwMw+vRm47uZZYwBE3yNbylLmAPOMEcShkWBpV61gSrUYPYYvxngMjQA2B4lSFP60XugntSDqil0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b5799558-c9fd-4e45-819e-15157e4451fe@amd.com>
Date: Mon, 25 Nov 2024 18:12:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] x86/hyperlaunch: obtain cmdline from device tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-10-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241123182044.30687-10-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DS0PR12MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e3a2f5-333c-4444-9aa4-08dd0db4d5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWgzTG4vbXN4alFHek0zOUFuRFZ3L2FtdDU3SW1naGJtNi9jL2pGVXlaMmha?=
 =?utf-8?B?SnUzUkFPRzJWRW82NmZvVlc4WUkyek5VbmtCU09wMXhiZTBxZVo0bENQVFhT?=
 =?utf-8?B?UWtVamdpeDJ1OTJYb3VDdXZoTUp3aW9xbzRheWpLcHhOQ2tOamZBTVNRanpn?=
 =?utf-8?B?RFA1aTY4cWw1azBRdnJWcGs2czVONEtmYzNxcGVlYmdBZzhTNmhORFV3cjJK?=
 =?utf-8?B?VTNMMzBQU2VBbk1YQkVGbitFTDh3ZnN4RG90K0IxcnlyQXFoMmdTNHNnZ2Rt?=
 =?utf-8?B?aHlHLzdiVHIwSE9wYWYxYU5XM1VMbDg3Tzc1QnNEaUFRTEZXT005NmpWd0xZ?=
 =?utf-8?B?Mll2blVjUHp2cGNoZlZwNG5KbWpmQlZEUG4xakZFNzRtRVpzWDhQMWE5M0lH?=
 =?utf-8?B?d09IRDBIVW1VWGthM2owV1ZvRGUxV3M5Wi80eXJ5L3JKSGRiQkVEaWEzZHlP?=
 =?utf-8?B?WG5MWjZxR1E4ZEl1VTYvdkYxLzJScG5CS3pQNlBiRDJQaGRjUEhwandQQmEw?=
 =?utf-8?B?TFZOc2RWc0p6YVdPRWZqd2lTeDF0amNHYlFFWHFhamJWZUplMmFmcTFva2k4?=
 =?utf-8?B?VGxGZW1iVEhER3Z1TUUwNUNIcTRDdmVCU0ZZRGg4MlhPcE5rcjgwUzFXb3Na?=
 =?utf-8?B?eVJVc2NJSmRrTUFmbDhFdE1PUGtza2lWMFBVUm1OcDk2WVBiT1pMSHhGYVRx?=
 =?utf-8?B?Wkx2SURCT1VHTFAvZ2hzM05oUDZ6Vy82YTlUa1dWeG5sOEZvRXgvOGNWaCtp?=
 =?utf-8?B?OStRSjVhM2t1bStqTVUxbzNiRllhaFFMdFhSY1I1b2N3cnNmK2ZFR0ovblJl?=
 =?utf-8?B?OTJ4cENZU25LR1RDcDVGK0pUOVlYeDhjSm5neHFFYk9ldkRtSzJjSVBTM0pi?=
 =?utf-8?B?dkZiNTZjQTYrc2dVeW02Rjg5ZDcrdXo0NVozMnpJQmFtZVJhMnJQZEpnSGdi?=
 =?utf-8?B?d21nWWNhY1NQNGMydzBuRUdsdkMvc0RvWWRVVkIzTGhPTGtvZUlmZWMrNEFD?=
 =?utf-8?B?MjVhMzVGbjRZUE12NE9GTWVYNkdZelpQT3k5TFJQbUlpVllMSWZSSFdsYW5W?=
 =?utf-8?B?UXV6UDVvZ1MxZ09qZDQ4Z21ydFZwbFlsdkNNemx4YVpTZk5xYUluOFBqZlpq?=
 =?utf-8?B?MjVyaVloUENKbjdlK3FXb1ppNEJvMFFqbEM5aE94a0EyYTB4Y20yTXNtS1U5?=
 =?utf-8?B?NDF1ajRmTGVSSW1vQk1SVVZXSENGU0hZU0dWOW4zNmlldEo2NWZJWnNMenll?=
 =?utf-8?B?bmF4T1I4WERubzdodDlVUXZPaTJINHg2QmtqZk11VFBoM002WktjTTA1bnRL?=
 =?utf-8?B?ckFrQ1dERUJua3VnSEg3anJiSVZ6K1IvbHVNajVROEpiSEpHS01abXFZRncv?=
 =?utf-8?B?YSsvdSs4ZHVOUzlQdnpsWGVVVDJDejRvS2E1U01Od2NSVW9rUGhSMzF5SFRv?=
 =?utf-8?B?czdMZTdOaTN4RWxzNnlneTFIVndacU8wVklKVmRJcitvZGNkOFFIY2E3a2ZR?=
 =?utf-8?B?dnpnWWJoQ3ZaejN6bTdXcFhVWjEyc204d3gyTk05TzhHYVVmYkVrV0hCbTYz?=
 =?utf-8?B?NEtuMHp2c2w2aVJEUWNvNzBUSFh0d2VyNXh3aEZqQStUVksySSt0azhsQU4z?=
 =?utf-8?B?WDJtdkc1UDY0WlNRYWF6ekg3R3VyVTlGKytkMFFHd1g0bXBHZktyWjFJNDhz?=
 =?utf-8?B?a1NtV2hheHBVVkppOUpEUU9kejhJalIzVG0rNXRvVnVIWHNWSTlzamNwaHFK?=
 =?utf-8?B?Q1JOQlhVOTduQWg4Rno0VFVMTUJlUFRCU3lvWGZvYzE5VnNzT0Qrdkh1RkJl?=
 =?utf-8?B?dDAydm5HNkFEeE1IVVZuNlNZa3dYN2NBdStXL1hmNjg0NVF3bTlUbzRJbkhz?=
 =?utf-8?B?aUlETEZjalBnZ1FVdmVkZ3Z4Z1BMOG9PdnBaVnJjRUhqenJEVlZ4UFFFS3R3?=
 =?utf-8?Q?7ptMwjaRl40eDwrp+Q+1WLsM9EgElmzK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 00:54:08.5633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e3a2f5-333c-4444-9aa4-08dd0db4d5a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6439

On 2024-11-23 13:20, Daniel P. Smith wrote:
> If a command line is not provided through the bootloader's mechanism, e.g.
> muiltboot module string field, then use one from the device tree if present.
> The device tree command line is located in the bootargs property of the
> `multiboot,kernel` node.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>   xen/arch/x86/domain_builder/core.c       | 28 +++++++++++++++++++
>   xen/arch/x86/domain_builder/fdt.c        | 34 ++++++++++++++++++++++++
>   xen/arch/x86/domain_builder/fdt.h        | 24 +++++++++++++++++
>   xen/arch/x86/include/asm/bootinfo.h      |  6 +++--
>   xen/arch/x86/include/asm/domainbuilder.h |  4 +++
>   xen/arch/x86/setup.c                     | 10 +++++--
>   6 files changed, 102 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_builder/core.c b/xen/arch/x86/domain_builder/core.c
> index 9335f3a9ebef..95cab06e6159 100644
> --- a/xen/arch/x86/domain_builder/core.c
> +++ b/xen/arch/x86/domain_builder/core.c
> @@ -8,9 +8,37 @@
>   #include <xen/lib.h>
>   
>   #include <asm/bootinfo.h>
> +#include <asm/setup.h>
>   
>   #include "fdt.h"
>   
> +size_t __init builder_get_cmdline_size(struct boot_info *bi, int offset)
> +{
> +#ifdef CONFIG_DOMAIN_BUILDER

I wasnted to suggest:

if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
     return 0;

but that fails to compile for a missing fdt_cmdline_prop_size().

> +    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +    int size = fdt_cmdline_prop_size(fdt, offset);
> +
> +    bootstrap_unmap();
> +    return size < 0 ? 0 : (size_t) size;
> +#else
> +    return 0;
> +#endif
> +}
> +
> +int __init builder_get_cmdline(
> +    struct boot_info *bi, int offset, char *cmdline, size_t size)
> +{
> +#ifdef CONFIG_DOMAIN_BUILDER

and here fdt_cmdline_prop_copy().  I'm not sure the addition of more 
stubs offsets these ifdefs, so:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

