Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBwAJBhkxWkn+AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:51:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E002D338B6C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264536.1556040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5nv6-00070c-Hj; Thu, 26 Mar 2026 16:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264536.1556040; Thu, 26 Mar 2026 16:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5nv6-0006xh-Ec; Thu, 26 Mar 2026 16:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1264536;
 Thu, 26 Mar 2026 16:50:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w5nv4-0006xb-8Z
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:50:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5nv3-00EW6h-Kq
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 17:50:53 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69c563d9-e002-0a2a0a5209dd-0a2a450cd02c-36
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:50:53 +0100
Received: from [40.93.201.8]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69c563eb-f93d-0a2a450c0019-285dc908f9fe-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:50:52 +0100
Received: from BN9PR03CA0333.namprd03.prod.outlook.com (2603:10b6:408:f6::8)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 16:50:47 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::6) by BN9PR03CA0333.outlook.office365.com
 (2603:10b6:408:f6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Thu,
 26 Mar 2026 16:50:46 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Thu, 26 Mar 2026 16:50:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 11:50:46 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Mar 2026 11:50:45 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAc/kr4qwdEjbV3wXfcQ8qeaDIAWmzLMK4LxON1pEceXilUQtffRbrC0647lOHag+1/Qb7vdzNv84hdYSqwXRoJf/bDCqdbA9IcLvu8lTOA0l8MpKewHULJHan1XVsRaE4bsFZZHfxuLDNL4rNuhOL2vqlEImAgEyXUf4i5SIqxoHPTe4JTnZk+EOwLyBLMudr3yC2n6zphQlh9NfxAvlh5eRbJBtLVLvfRUv5deVAVm/MWbULhvLzkTs2M9DeL5gSzwuHOsDrpdeHHUA8aAX9aiWjqVbqQg/huv0RJbC8Qf9mzC38RLXXinkT196dVoI+DdhwILher1lO90bzkiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZO+WnJWMa9OZKHa76ca+JXDuhCjqEGivfnwkU/mccA=;
 b=s9K25J2it3L2DEc+NZ9lVeTyjrKAHKdUYwPwsOPeSnI1oHbem4LekBVXIgcPSWLSKEydvty0r8456rdGoWxOsYa0XM9GpLkGES1ceJ1tcV0kmZY2j/G72JWtlWuQt6W7yrrBZKnIFYe/YQ2/msAO2KKxNTfzL63IQHp6CTqJhxOJN822GvhA8zCSPdVAsbnPpOmhidh46Ng8vNfm16yiSlgN+AFGfHRjYKXWyLJn4fc8PNWoX0ApQOJ5fqZTGF4pSdJ11Y10xMzyJws4Uulypgek0UAdrn7PB6Ohy34Nuf9Sk78FMjwC3UIoo2jGH5nKHBMHrqC8kUPyA7xssrp4oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZO+WnJWMa9OZKHa76ca+JXDuhCjqEGivfnwkU/mccA=;
 b=kjtM8ssnyRfNztHvD6xCv/oBfUvW19qos9jurW3N8yg1X9NS8EZDq3s11guAwGyMTTxn08XYq3pP68W0lov1k9MN1iekVXvZF8D6jrtRKVYJZDnuvresSw67muc4ZwuZDg31VmkdaiaE8y4WlKZKTG9WLf/w8RDCRziaHiJ1x5A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <29769bd9-8410-417b-9ad8-84131956db57@amd.com>
Date: Thu, 26 Mar 2026 17:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Increase DOM0_FDT_EXTRA_SIZE to support max
 reserved memory banks
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260326131535.662466-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|SJ2PR12MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: ded06974-0574-4e7b-80cd-08de8b57d3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Drt3JhUrl3Qg9M6ZvGqCEliEb3tJboj85X0YmQgDpCoNJkL6LJvUbAcSnty8FbT1A96PFKeFHsNCdzO59m7eyRZI6KPnpSP8XMQ+kamEpscv7lFD3oZXBBqGzNVShBo/eCB78mTTVsYTBVx2rkp+4ZzzdahSUk+Y3p5dtJnBPs6lJ7ye0vepnRXaTu4AvGcGBdYwWoC6lujwdtoP5ITfzEfsEjv9OETkf/pXLDXmTr05Wow9tck55M5xUGDZ4dORCzanjY2b/QUEw4AupfCN1W7sBcnQhxbnriaTuPCgXa62N+d3ytXy8+B4y0T/BLr/Ku1iMf0SgMDX6eU3y3WHVfwUJpr9CMdkIQPaaq8jmEX2rVYm0JEqn9RII4+hS28xyc/jTbLxvUkkVM3mM37BrKNGXAnK7Zq1k68zCb8cezBXv8ZuxrqPsg9QZq/rhrLoMkzS1dCSIRTl0GhUG7pZegB+lVV9kgHu2935lKgS9Pni+HAV3zPb2cWFALAEaY4RqU7+5mO1pRKDHGLaNlnc5Xu2c9lnVGMknVQ3P2E+tCMXcUufpMyTojqB9lfKv92lAEs3pexyo3XTX1NeUQt3XDYmyazVmKnbFpv9CgLVoy9sAlzZ0wY+g4svNq+UxZxBW3p7kc818pAvqPFLt9R+9mWsVAjY0i5YF+7df5DRaAlQVx6yE/XAz7Wi1//RknNfVFbOa4UXdCTWJxNllBqA5OGhVOQf/JecqUpQ1QSA5MCBXZp0+MkUs6kd/HYFIvjKxhmyuOuBPEFwT1Gav1hooA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eChNL+rKJdbRPJwZfHliIqkWFh4nG/Zjx9F9ilqZyo3G6O1eZ9/POtsRM7qn5mqgb3PWNAqFx7DJzKe3aoMHmPodlqzpsBxTbGT5j1kus/5prSQjr7Hi4UDoH0oqK5vIM82j0+XpOJ4uqltL18UjA9VMMve9ph3dLv73Lj4Nv0X1QPMd2M4eEZosnrL1NV+Tqw5h6WFvlwwhstN13oBfqCq5sc/TuZ48BOftacIGmCwG2Gdwqv2CuSeLDraKHZoPKm0985Vv/U65eG090NIfCBTruKM84u/IaOgglGpfO6ZWCofBAIbUFhsGD2JDIbEs4FLCle2d2BGFsxNdU2bhEqIvMB4oxWVMiXMD7cnuIiIetBnO07y8XT7RF+J8wuwzTwIpdirdhaUOWSESDO3vP5bo5nZRhBuPSxHOnLRfFvvNXuYp2RQ4kZ5hVzAx0qtg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 16:50:46.5501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded06974-0574-4e7b-80cd-08de8b57d3db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
X-purgate-ID: tlsNG-d25034/1774543853-6FCA2734-797ED25C/0/0
X-purgate-type: clean
X-purgate-size: 2500
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksandr_Tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,epam.com:email]
X-Rspamd-Queue-Id: E002D338B6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 26/03/2026 14:15, Oleksandr Tyshchenko wrote:
> Xen fails to construct the hardware domain's device tree with
> FDT_ERR_NOSPACE (-3) when the host memory map is highly fragmented
> (e.g., numerous reserved memory regions).
> 
> This occurs because DOM0_FDT_EXTRA_SIZE underestimates the space
> required for the generated extra /memory node. make_memory_node()
Where does this extra /memory node come from? If this is for normal reserved
memory regions, they should be present in the host dtb and therefore accounted
by fdt_totalsize (the host dtb should have reserved regions described in /memory
and /reserved-memory. Are you trying to account for static shm regions?

> aggregates all reserved regions into a single reg property. With
> NR_MEM_BANKS (256) and 64-bit address/size cells, this property
> can grow up to 4KB (256 * 16), easily overflowing the allocated
> buffer.
> 
> Fix this by increasing DOM0_FDT_EXTRA_SIZE to account for
> the worst-case size: NR_MEM_BANKS * 16 bytes.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Just to be clear, I have not seen a real-world issue with this.
> The issue was observed during testing of limit conditions.
> With this patch applied, Xen successfully boots the hardware domain,
> exposing 256 reserved memory regions to it (using a synthetically
> generated configuration).
> ---
> ---
>  xen/arch/arm/domain_build.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index e8795745dd..7f9f0f5510 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -100,9 +100,11 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>  /*
>   * Amount of extra space required to dom0's device tree.  No new nodes
This comment would want to be updated because since its introduction things have
changed. Even the 128 came up as a result of adding /hypervisor node.

>   * are added (yet) but one terminating reserve map entry (16 bytes) is
> - * added.
> + * added. Plus space for an extra memory node to cover all possible reserved
> + * memory regions (2 addr cells + 2 size cells).
>   */
> -#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
> +#define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry) + \
> +    (NR_MEM_BANKS * 16))
>  
>  unsigned int __init dom0_max_vcpus(void)
>  {

~Michal


