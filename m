Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E59A88370
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 15:57:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950314.1346678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KJD-0002YJ-28; Mon, 14 Apr 2025 13:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950314.1346678; Mon, 14 Apr 2025 13:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4KJC-0002Wr-V6; Mon, 14 Apr 2025 13:57:10 +0000
Received: by outflank-mailman (input) for mailman id 950314;
 Mon, 14 Apr 2025 13:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4KJB-0002Wl-D7
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 13:57:09 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2414::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d8b5d9-1938-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 15:57:07 +0200 (CEST)
Received: from CH0PR04CA0066.namprd04.prod.outlook.com (2603:10b6:610:74::11)
 by IA1PR12MB7566.namprd12.prod.outlook.com (2603:10b6:208:42e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 13:57:02 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::98) by CH0PR04CA0066.outlook.office365.com
 (2603:10b6:610:74::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 13:57:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 13:57:01 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 08:57:00 -0500
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
X-Inumbo-ID: 59d8b5d9-1938-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJqIgcnrLhemk/hpqOaittUiRxnKO8ly25oS21JTl/k9ggJnQbAseX9AGhYd2GNUjsrTlub0o367a+hOcX5mruo36d10ElLF+c/YueiIWZzGdEXxBbOEnH0/gJQ1OV83EvtouecK1p861XON6d/Ie33d/ZEN8WRm+QLSfPJ+KDwvaAXK88o1uqsPBe1VDn6AZyxKCxE9MEzdCHZOiudqeBV4gs+Fb+ptco1dvLylp9Owxe5+kwj8NCdwUKpju9g6ICCQus6CwOY2U+vjBJFLV6w8rxoRCXDN9rR1VwkMD8Wbu5IGJuQ1AfUUjb0AApNFEtHOtAjuc32I/Ecmc/JD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbNS90GH77QgcvCP4HBUX642LcmofTaBSVyHvAa3zBY=;
 b=AhOmC8EWxXThyyAQLVAdbAqbyUd37Ht3kh09/c/aptGOT90ruPeUz9CNaWc4bXifUzodkRK4+yTboWEPonVspWRDMV0ldq6pnW2FTipHag9gqVkceTn/BmqkKgEOCbglTkrX6N6kEuEZ48QaMdZjCdXN+lheziMl28Sp0tFWykdldfERKg6AkrzWnFmIaNuq2Kkdkv3JgA3zbb/BBpuFQL3GkYTa44+fvEjmz6msiDgQdMYK0tPXjudxcABdQhpFsCBTLDn8vtEj8fdnLvg0WD5o3bDJs/4gGmZ3CFxiMJHt73g6s6ZEuygmvVNPSV430ss+JEGU89HA+zyFFiVpKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbNS90GH77QgcvCP4HBUX642LcmofTaBSVyHvAa3zBY=;
 b=roh+p+9oYE6GR6zPsSbDZV3/XDMG2ew+2Y8weDnpKHiWSU+TpiGUkvovt+pvBHEMr76gcu4qAszAOhxUdkOGA5datzsXQMxE0nnnorbp/lHx086tH7JtLwAmS6Pfp2+UUZ/qHk7BC+uws0u4yj2H0Pv+rl8Llt2aJifV2fzIDeM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 14:56:58 +0100
Message-ID: <D96EX0QNDA51.1KN145E8H1PCI@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 09/16] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
From: Alejandro Vallejo <agarciav@amd.com>
To: Denis Mukhin <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-10-agarciav@amd.com>
 <DSF977mG3NYzAt3ivBQ4eG8vpcpUtHkruh1kwWNMEpmV4YretAAOz5B3bIdJox_2MxVZvoKvrQ3Xwx8z_MMHHM-lj7JYUx00v79nQcuu6ic=@proton.me>
In-Reply-To: <DSF977mG3NYzAt3ivBQ4eG8vpcpUtHkruh1kwWNMEpmV4YretAAOz5B3bIdJox_2MxVZvoKvrQ3Xwx8z_MMHHM-lj7JYUx00v79nQcuu6ic=@proton.me>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|IA1PR12MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d919d5-6626-4462-41ea-08dd7b5c3b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0xJRmJIMjJxdjhrVFBxTU1WWjNqcDFKQTJiWmNoWmNadER2Z01lQmZUWUxZ?=
 =?utf-8?B?TU8rZzlkcDduZmpiRi9EK2lOcy9BZGR5UTNxSzlldTJ4VkpacC9OTzlUcVph?=
 =?utf-8?B?MDhtOStyZWQzdyt5TFNuN21TZ1A0ZFlXaFg2T0xXSFMvQ1BlNlFLR0hRYUpD?=
 =?utf-8?B?aTJYOWlkeEJmcmFXaXlVU0syNTVBMC8zTkh2SmFnSndmQWFZQml1a1FWQ2JF?=
 =?utf-8?B?UG1TamhMMW5nci9mY1NjTDQwZjV2UW03c24rRC9GbDJqdDNLTDVuSHcvZjZI?=
 =?utf-8?B?dnhXSDhFQUt5SXVzalpXZkpLT2U3V2g1N2hucWQxMzJuT2dENEd2N2dMcW9V?=
 =?utf-8?B?UjhYUG5GZFhnSmsxaUVHa0NmblpJZ01aMlk5Y1JkcncyUldoSmNyRkFHSmtY?=
 =?utf-8?B?SjZjY2c3QndYSVFDVDBQV1MzcXZTMWd5cDA0VUhTcW5pTHcxajZNcEFlQzZ4?=
 =?utf-8?B?eElINmlvajFZWkEzSy9TTldYaSt4ZDZHTWs2RmVBd0dZYm00OGk3a3RKd3oy?=
 =?utf-8?B?cWkzSmRaZ3ZlME9mQm0vbTBPRks4Qi9DdG5iaEhEcGRYdjB3bXN4ZXR2MkZ0?=
 =?utf-8?B?YWJIQitWQ3lnVUVxRG9NeldOREQvLzhlS2pydGFKWkYxVE9DS1lnay9ONlR5?=
 =?utf-8?B?Um1PMVlzRzhQNjdqenNBUGFaeDMrL3ZCaFVXRmVGVE96MGFMc1JQQVA2Yndu?=
 =?utf-8?B?ckZubXBGWE1jV1Q5VlE3UERqOTRLaU5oWjJJTmRtc1pnN2xML2hidWk4Q3dw?=
 =?utf-8?B?ZmNUcG0vdlE4bk1UU2c3VFBoMUtSK2VWbk9tSmhQWHNNNnpwK3FiM1VVbnFP?=
 =?utf-8?B?RjRKWGdQUHdSSDRBSUlFNWtqTFJJL29LSXJBNFk3amU4YVgyNVVSYzFMbTlW?=
 =?utf-8?B?QnRRcmgvNzAxVHQyVnRDeUdVOHI3YW05SEdHb1M3cmJvZzNHRFZIQjNLR0FD?=
 =?utf-8?B?akcyM3NkUjRwUFNPUTYxRGlHanZnU1pVTGowUTI0V1lMVkhJbUZvaWNMYUJs?=
 =?utf-8?B?VmVGSXRwWmxKbmdJcGR5UHJSeXAwb2pxVjZaa3lnZjFoOWx5SS9oN3RLSEFV?=
 =?utf-8?B?WmgzOHRHRVBlaWJ5QWpocm5ZWHk0Y1hOU2JZZDU5QkxWR3ZSdjI4MlY4Sld1?=
 =?utf-8?B?VHprVExQZEVhQkxxMWJZaGNpNnRPUktvS3BiT1BqaDloZ2JlWUtCT1VnL0t0?=
 =?utf-8?B?NmlXOEJjUjBaWXdFeUs1aUQ0QVRjMklQZWJ4dENLTE1EVXRoMlF6Z3JTcml3?=
 =?utf-8?B?ZFpTMXB3dnQ0Nk5sUjVmbFNsTlplWkEyUWZRbWU2TWp5L244ekVrN05BNzJY?=
 =?utf-8?B?enRGcGVyenZGTVltQlJnZ2FlQUt5WEhTKzJCUjAyOStqUjgrcllIS05rZnVl?=
 =?utf-8?B?bGFEamJuSC96YzJUcEhham5zR092NXJ0QjBseVl4V2JPSnBCdS85TmZ1NWNr?=
 =?utf-8?B?c3ZJa3VMOXNTYytSeWZpZ3o1RjlqZUR4U1JmMVlwV0FYZzlicEFoelhYSmI4?=
 =?utf-8?B?OFovUkhxWTRtNWR0dzZkcWI5UHhVcE9NTjJxRTJZbEsxN3VRYUNDOVlseDhu?=
 =?utf-8?B?REhRTVRuQ1FkZmRRdkFPd2lmeUJSTHhnYzFMdHVWYTNmSXNuRGFqZGlXR0pQ?=
 =?utf-8?B?d3QxTGk1bHFYZUFaZk52UDdHU0lkZ3BwWmJMUW5tdHc2OFlxSmsxUkQ1T1hG?=
 =?utf-8?B?S2hMcVZienk2OVltdjFtR2RPWENsRFFBVXdXVmRoa3RFMXdjVk11WEtVVFho?=
 =?utf-8?B?SHU1bHRNLzRobFJ2ZWFQN0hNcDVqdkJ4RUhwSVptVlZ4SDY2T21Jczh1RURy?=
 =?utf-8?B?S1h3dld5OVJpOTN6TGFpd20xSmw5Q25lK2UzakRKWXpibVNuNnVPK3Y2T0dM?=
 =?utf-8?B?YjhRbXVyUUNUSVE3bmxnRVFiWUxUdURacHErK3QwUkV2Y3BjZWhza21iWnVN?=
 =?utf-8?B?dVVleEZsUmptTGg0WEtiTUVoR3V4TklBU1NhbjJTdlo4bUZ6N09BU3lFSVE4?=
 =?utf-8?B?OCtCSjVBbkVzdGwxUERNTUdjMEQxbkVXSmlQTVovYkNqY1U3bVhBN2NNWUtQ?=
 =?utf-8?Q?0Sgvbn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 13:57:01.9946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d919d5-6626-4462-41ea-08dd7b5c3b6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7566

On Wed Apr 9, 2025 at 10:24 PM BST, Denis Mukhin wrote:
> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.c=
om> wrote:
>
>>=20
>>=20
>> From: "Daniel P. Smith" dpsmith@apertussolutions.com
>>=20
>>=20
>> Look for a subnode of type `multiboot,kernel` within a domain node. If
>> found, locate it using the multiboot module helper to generically ensure
>> it lives in the module list. If the bootargs property is present and
>> there was not an MB1 string, then use the command line from the device
>> tree definition.
>>=20
>> Signed-off-by: Daniel P. Smith dpsmith@apertussolutions.com
>>=20
>> Signed-off-by: Jason Andryuk jason.andryuk@amd.com
>>=20
>> Signed-off-by: Alejandro Vallejo agarciav@amd.com
>>=20
>> ---
>> v3:
>> * Add const to fdt
>> * Remove idx =3D=3D NULL checks
>> * Add BUILD_BUG_ON for MAX_NR_BOOTMODS fitting in a uint32_t
>> * Remove trailing ) from printks
>> * Return ENODATA for missing kernel
>> * Re-work "max domains" warning and print limit
>> * fdt_cell_as_u32/directly return values
>> * Remove "pairs" looping from fdt_get_reg_prop() and only grab 1.
>> * Use addr_cells and size_cells
>> ---
>> xen/arch/x86/domain-builder/core.c | 11 ++++++
>> xen/arch/x86/domain-builder/fdt.c | 57 ++++++++++++++++++++++++++++++
>> xen/arch/x86/setup.c | 5 ---
>> 3 files changed, 68 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-bu=
ilder/core.c
>> index c50eff34fb..eda7fa7a8f 100644
>> --- a/xen/arch/x86/domain-builder/core.c
>> +++ b/xen/arch/x86/domain-builder/core.c
>> @@ -59,6 +59,17 @@ void __init builder_init(struct boot_info *bi)
>>=20
>> printk(XENLOG_INFO " Number of domains: %d\n", bi->nr_domains);
>>=20
>> }
>> + else
>> + {
>> + unsigned int i;
>> +
>> + /* Find first unknown boot module to use as Dom0 kernel */
>> + printk("Falling back to using first boot module as dom0\n");
>> + i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> + bi->mods[i].type =3D BOOTMOD_KERNEL;
>>=20
>> + bi->domains[0].kernel =3D &bi->mods[i];
>>=20
>> + bi->nr_domains =3D 1;
>>=20
>> + }
>> }
>>=20
>> /*
>> diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-bui=
lder/fdt.c
>> index 9ebc8fd0e4..a037c8b6cb 100644
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -155,6 +155,52 @@ int __init fdt_read_multiboot_module(const void *fd=
t, int node,
>> return idx;
>> }
>>=20
>> +static int __init process_domain_node(
>> + struct boot_info *bi, const void *fdt, int dom_node)
>> +{
>> + int node;
>> + struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>>=20
>> + const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
>> + int address_cells =3D fdt_address_cells(fdt, dom_node);
>> + int size_cells =3D fdt_size_cells(fdt, dom_node);
>> +
>> + fdt_for_each_subnode(node, fdt, dom_node)
>> + {
>> + if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") =3D=3D 0=
 )
>> + {
>> + int idx;
>> +
>> + if ( bd->kernel )
>>=20
>> + {
>> + printk(XENLOG_ERR "Duplicate kernel module for domain %s\n",
>
> Looks like it should be XENLOG_WARNING since the loop continues.

Fair point.

>
> Also, I would use either Capitalized or lower case messages everywhere
> for consistency.

That's related to those leading spaces. The lowercases end up
immediately under the configuration message so it's easier to bind them
visually as "hyperlaunch-related".

    (XEN) Hyperlaunch configuration:
    (XEN)   something
    (XEN)   failed processing kernel module for domain %s

>
>> + name);
>> + continue;
>> + }
>> +
>> + idx =3D fdt_read_multiboot_module(fdt, node, address_cells,
>> + size_cells, bi);
>> + if ( idx < 0 )
>> + {
>> + printk(" failed processing kernel module for domain %s\n",
>
> I think this printout should have XENLOG_ERR in it since it's on the
> error code path.

All of these should have a XENLOG_X so they can be skipped when _INFO
is itself filtered out.

>
>> + name);
>> + return idx;
>> + }
>> +
>> + printk(" kernel: boot module %d\n", idx);
>> + bi->mods[idx].type =3D BOOTMOD_KERNEL;
>>=20
>> + bd->kernel =3D &bi->mods[idx];
>>=20
>> + }
>> + }
>> +
>> + if ( !bd->kernel )
>>=20
>> + {
>> + printk(XENLOG_ERR "ERR: no kernel assigned to domain\n");
>
> Drop "ERR" since it is already XENLOG_ERR level?

ERR: is printed though, whereas XENLOG_ERR is not. That's meant to make
it visually clear that's _really_ not meant to happen.

>
>> + return -ENODATA;
>> + }
>> +
>> + return 0;
>> +}
>> +
>> static int __init find_hyperlaunch_node(const void *fdt)
>> {
>> int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
>> @@ -217,9 +263,20 @@ int __init walk_hyperlaunch_fdt(struct boot_info *b=
i)
>>=20
>> fdt_for_each_subnode(node, fdt, hv_node)
>> {
>> + if ( bi->nr_domains >=3D MAX_NR_BOOTDOMS )
>>=20
>> + {
>> + printk(XENLOG_WARNING
>> + "WARN: only creating first %u domains\n", MAX_NR_BOOTDOMS);
>
> Drop "WARN" since it is already XENLOG_WARNING level?

Same rationale as above.

>
>> + break;
>> + }
>> +
>> ret =3D fdt_node_check_compatible(fdt, node, "xen,domain");
>> if ( ret =3D=3D 0 )
>> + {
>> + if ( (ret =3D process_domain_node(bi, fdt, node)) < 0 )
>> + break;
>> bi->nr_domains++;
>>=20
>> + }
>> }
>>=20
>> /* Until multi-domain construction is added, throw an error /
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index e5d78bcb48..00e8c8a2a3 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1284,11 +1284,6 @@ void asmlinkage __init noreturn __start_xen(void)
>>=20
>> builder_init(bi);
>>=20
>> - / Find first unknown boot module to use as Dom0 kernel */
>> - i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> - bi->mods[i].type =3D BOOTMOD_KERNEL;
>>=20
>> - bi->domains[0].kernel =3D &bi->mods[i];
>>=20
>> -
>> if ( pvh_boot )
>> {
>> /* pvh_init() already filled in e820_raw */
>> --
>> 2.43.0

Cheers,
Alejandro

