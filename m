Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF5A846DB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945825.1343933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tEv-0004LV-L8; Thu, 10 Apr 2025 14:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945825.1343933; Thu, 10 Apr 2025 14:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2tEv-0004JS-IJ; Thu, 10 Apr 2025 14:50:49 +0000
Received: by outflank-mailman (input) for mailman id 945825;
 Thu, 10 Apr 2025 14:50:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ged3=W4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2tEu-0004JM-9j
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:50:48 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f403:200a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e6081b3-161b-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 16:50:46 +0200 (CEST)
Received: from BL1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:208:256::31)
 by IA1PR12MB8585.namprd12.prod.outlook.com (2603:10b6:208:451::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 14:50:39 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::37) by BL1PR13CA0026.outlook.office365.com
 (2603:10b6:208:256::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.11 via Frontend Transport; Thu,
 10 Apr 2025 14:50:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 14:50:39 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 09:50:35 -0500
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
X-Inumbo-ID: 2e6081b3-161b-11f0-9eac-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5HWmD8eDZCrG2dVHdu+OM+LLe19TzzXomynDtsfUX1gWtYg4BjQe1DvoTmMNnspTzmZUg/IsFooWE+ZMlTzjMZseYjVUIplyusQrpwnxTtQHfnlOQBbNinESQqAH34CPMC4i8ZPo7RENgHTfUJayA9inlOjJ0t+zrsSyZp7+BBkhM3J3KwJ21ED5CczfxOrBuSWORuPFku/YMDJX2248QwqEXHo7hdmLrw2gmsWj4xBCglxx2i2TdZZhc29UC1XvwWzhR2f931iPzpv4t8DZ4mjQIEJWW+P/2qrH/D9FoQaJFZcM5SyAtwLd4Hfuley1fY98DDAfr1oxm+1BecoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsZCMLM8fuXEze6eAp5yW+8gSJPL3qLdf1XtYTjFS8Q=;
 b=seHar2if7gGGnNWAUiE2BLIJ64LzsWoHSjTtS9+lPQHqQe3jt8YD983Rg4rvtvisoCP15rwTG7OWxvzWMdzjayNaT+akwOfcbkfiY2UK0pTkMn0Ilowu7qzoXuIdFVlwoRTUua8wIHHcTk5h0nwHWfAy5KgxLcUlnhC7LMR+w+0PXdzyRMLJ8Pfwfk63L4+t8Vvw5mmGFoS8moQqBfLIogHDkptV7+bRTmrm6ig9BYVWKtpE/CUFHp/TaMTZrENoI6AOPCUAi8lNY2kaJFczKiCF5LgIlFJZRfDXxTfdvHaBpIF1HAhk7DxwMq+UX/DzreOZQHen6oVKmDgbRXebJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsZCMLM8fuXEze6eAp5yW+8gSJPL3qLdf1XtYTjFS8Q=;
 b=iPDJ54jEfJPOwyAq6UNuzETW2e3t8rA2V+B5uRBCczJdSJXFTURBVvBKeCsKYJojgaW9oyENmp/kW1Mn9+2CKoJQ9TBfLvU7NhnL6FMJFBM80ZgWMBG9RaSYYaxqSWx4MPSX9KWF7dY+C1ht+chKmbWr+8lKBUw9lDrHtVZQbjE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Apr 2025 15:50:31 +0100
Message-ID: <D931JU067Z8D.318WN4K98QS8Z@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 07/16] x86/hyperlaunch: initial support for
 hyperlaunch device tree
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-8-agarciav@amd.com>
 <04fcb576-7a6f-48d9-abb5-72f5fd728013@suse.com>
In-Reply-To: <04fcb576-7a6f-48d9-abb5-72f5fd728013@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|IA1PR12MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 89246d51-4dad-410e-1dc1-08dd783f0f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0RGN0V1NmNDUGlmMk9DaC8yQnh0QzFOYmdDN0tNT0hhSGhHWGl2Yk9iRzRC?=
 =?utf-8?B?d1BKeFh5NlJ5bEpjbVpXVVJuV3pycDNCY0ZxTVdYUzRSSzJyOXcvVGNsQ0Fs?=
 =?utf-8?B?V1MvQXE1SXkvTXNRNjJrSnQyaXZDRXQyUFIrejVDejh4YzBJdnExT3ZkUkh6?=
 =?utf-8?B?WjJRYU11cFY5MEFnM1E2aS96b3NSZGpDTVJkZHNmaEpETjk0YkFITUhmY2ly?=
 =?utf-8?B?NXVpNnRuRHJrZGc5eXBuS0E1N29qZnR3TngwcE1RQm8wMER5d1kvOHdvVjR0?=
 =?utf-8?B?ODIreUpmQ2FPUXJtSFlJa3JiWXZ1Q0VYY2hKWEdQNWowMHYwTGdTRTFhWWJo?=
 =?utf-8?B?TmNBb293WVZGdDF0ZzdmSExVWld5ZnNabGRCTVdWVkpwRnZHQjEvcWJIYkZ0?=
 =?utf-8?B?ODA3SFVxS0tVcm9WVFhVQzI1ZEtENU42a3V1TGJ2Z2l2dThZdmkvQ1g0NzND?=
 =?utf-8?B?eWtiYytYc0JncStIdi9RV0h6a3RjODduRG1LdEx3b1lPMUdSYlBtR1lSTXlM?=
 =?utf-8?B?TFR5NkI3N2lsd2ZPNUpLbmMyUUhHWWJTeGludGNGMGU0MFFwcXRhVjdhZ1d5?=
 =?utf-8?B?d3RZS08yMDE2bGpIN21NbGljRUFEK0R0c0ovM3pzWS9LRU5HM2trVGZFVWY0?=
 =?utf-8?B?UHNidTR2cVFlc0F5ZkZjWi92SERzeHhXMmJ0d0tLVngzT21NdWcvd2MrbW9m?=
 =?utf-8?B?cG1HTDRSdVAybDhiYTBGeWlteHhlS0xvVEFWRGEvNTZjZEx6NDFJTnhKcDBB?=
 =?utf-8?B?TSt6ckdjZjd2WmRKYjZiaVBlVHpIZ1ZVZG9vNk9aaXNaY0dZaGFXRklkOFRL?=
 =?utf-8?B?akVkamdHZ1dTeXAzcVBtaldMdEdwekhwSHBUNkdtT2ZMZzdaenE2endZTVFy?=
 =?utf-8?B?Yk53RGw2L2E0U3RZWXk3aVF0eVNEQzA1TG9jaEtTV0JzUmFJSGpIQ0t5OHcy?=
 =?utf-8?B?UTk1YjYvaVVUbjhJR1N6UXp2ajVtM282VlZ6NWhKcEcwMVpzMUdoRFJ0bTlP?=
 =?utf-8?B?VWxWYnM5K25pRitBbUw3d1lBUTB4YnZvdURWUS9nZVQzaEJPRDIwbUpFUXc3?=
 =?utf-8?B?NURvUE5QUFJaYU90N0NEc2x4aU5OTnV2TTJENjRHUVNOS2pwZWhNMDA5UzVG?=
 =?utf-8?B?aEoyUTVqLzJFYjg1SVhuc1pDckM3UmJpOUtqK2VtTGtBNUdYTEF3RkZqLzRG?=
 =?utf-8?B?L1lKd2p4VjNyNEppS2d0S2ExRUlWYXpHSXBjM1BCMFB2cGRzajdPWHMxcWVJ?=
 =?utf-8?B?MkRyQ2FkSktkWlVyaXJPamF2ZnBTb3RnOXZENWFYQ0h4Y0w5bzBIcURwRElp?=
 =?utf-8?B?Y3JwRENIbXhORGlHdXU1UUR1bmpCeHBSNGpMZ3VOcGx0ZHg2WUQ3cENMazdi?=
 =?utf-8?B?YmxpbkgzdU1uZ2NpcUdpUmNPNVJEQkJzelNUM1VudkQzQVQ5eGViTHFWM1dv?=
 =?utf-8?B?TU9POWVOd0NiV3lmV1Z0UndycFBkRzNZeWxQakR0Z3BqMlBTMXM1aUtraG4x?=
 =?utf-8?B?dFNlMjJqK2tMU1IwSGZ4dVBRT2JyN05MZklZRzY0VFNCQkwwV1Ezd0ZuT21p?=
 =?utf-8?B?VnhrTCtYSVBVSTIzOXppV2NWOHYxY2FJcjVFeEdpRU1zblRQRUZwZFc3YVdZ?=
 =?utf-8?B?cVlBYThXWDB5cDVVNmFia01pQlRPdWZud25CU1A4U0YvdjBnZldtU2hWazRv?=
 =?utf-8?B?ejdpc0NOQmhMRUZDQmorWWJaTEp6OU42NFcrNENCMW5KNG4wV2FVS0s5TWti?=
 =?utf-8?B?TTlkUnRmVmNXdmZOWmMyQlNHeGlMUklpUXJCZEo3T0lWa2Jlc3pnNDZEUkhV?=
 =?utf-8?B?NUNFUzMyUXR4eXcvSFowcWpVOVFsZ3NSVWxuTzFvVk5pTmUvMzFESjY2OTdm?=
 =?utf-8?B?YnlLU3plQ3JQbzB4dDBNZWhmL2xoOTNFUXZJdkdkazRHRDRCUlhNdFo0Uk1y?=
 =?utf-8?B?Y2JzYm9HK3I0SmlZaXRmV21DeEdrNC9tTkZQU25QeGpZMUtPNTVCQjRLK1dy?=
 =?utf-8?Q?Aksmn0uDROVsLrxqaA3rsZehyiiwFg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 14:50:39.2043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89246d51-4dad-410e-1dc1-08dd783f0f5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8585

On Thu Apr 10, 2025 at 11:10 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/domain-builder/core.c
>> +++ b/xen/arch/x86/domain-builder/core.c
>> @@ -44,6 +44,21 @@ void __init builder_init(struct boot_info *bi)
>>              break;
>>          }
>>      }
>> +
>> +    if ( bi->hyperlaunch_enabled )
>> +    {
>
> Not knowing what else if going to appear here and in what shape, could th=
e
> if() here be avoided by making case blocks in the earlier switch setting
> the field to false (which is kind of redundant anyway with it starting ou=
t
> false) use "return" instead of "break"? The the setting of the field to
> true could also be centralized below the switch().

Looking ahead in the patchlist, not much. There's an else clause for
non-hyperlaunch with code picked from setup.c . It could very well stay
there and prevent core.c from being included at all, removing the if
guards here as well when the file is no longer included.

>
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -13,6 +13,36 @@
>> =20
>>  #include "fdt.h"
>> =20
>> +static int __init find_hyperlaunch_node(const void *fdt)
>> +{
>> +    int hv_node =3D fdt_path_offset(fdt, "/chosen/hypervisor");
>> +
>> +    if ( hv_node >=3D 0 )
>> +    {
>> +        /* Anything other than zero indicates no match */
>> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") =
)
>> +            return -ENODATA;
>> +        else
>> +            return hv_node;
>
> Could I talk you into omitting such unnecessary "else"?

Yes, sure.

>
>> @@ -20,7 +50,41 @@ int __init has_hyperlaunch_fdt(const struct boot_info=
 *bi)
>> =20
>>      if ( !fdt || fdt_check_header(fdt) < 0 )
>>          ret =3D -EINVAL;
>> +    else
>> +        ret =3D find_hyperlaunch_node(fdt);
>> +
>> +    bootstrap_unmap();
>> +
>> +    return ret < 0 ? ret : 0;
>> +}
>> +
>> +int __init walk_hyperlaunch_fdt(struct boot_info *bi)
>> +{
>> +    int ret =3D 0, hv_node, node;
>> +    const void *fdt =3D bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_I=
DX]);
>> +
>> +    if ( unlikely(!fdt) )
>> +        return -EINVAL;
>> +
>> +    hv_node =3D find_hyperlaunch_node(fdt);
>> +    if ( hv_node < 0 )
>> +    {
>> +        ret =3D hv_node;
>> +        goto err_out;
>> +    }
>> +
>> +    fdt_for_each_subnode(node, fdt, hv_node)
>> +    {
>> +        ret =3D fdt_node_check_compatible(fdt, node, "xen,domain");
>> +        if ( ret =3D=3D 0 )
>> +            bi->nr_domains++;
>> +    }
>> +
>> +    /* Until multi-domain construction is added, throw an error */
>> +    if ( !bi->nr_domains || bi->nr_domains > 1 )
>
> Simply "!=3D 1"?

That would be simpler, yes :)

It's all temporary until the restriction is lifted later on, but will do.

>
>> --- a/xen/arch/x86/domain-builder/fdt.h
>> +++ b/xen/arch/x86/domain-builder/fdt.h
>> @@ -11,11 +11,16 @@ struct boot_info;
>> =20
>>  #ifdef CONFIG_DOMAIN_BUILDER
>>  int has_hyperlaunch_fdt(const struct boot_info *bi);
>> +int walk_hyperlaunch_fdt(struct boot_info *bi);
>>  #else
>>  static inline int __init has_hyperlaunch_fdt(const struct boot_info *bi=
)
>>  {
>>      return -EINVAL;
>>  }
>> +static inline int __init walk_hyperlaunch_fdt(struct boot_info *bi)
>> +{
>> +    return -EINVAL;
>> +}
>
> There's no need for this stub (nor the has_hyperlaunch_fdt() one, as I
> notice only now) - even with present arrangements calling code is guarded
> such that DCE will take care of eliminating the call, and hence having a
> declaration suffices.
>
> Jan

There's some refactoring to do for other helpers later on, but sure. It
should be fine.

Cheers,
Alejandro

