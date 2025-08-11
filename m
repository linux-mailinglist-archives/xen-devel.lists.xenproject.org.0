Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E490DB206B8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077328.1438397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQGT-0000Nb-D3; Mon, 11 Aug 2025 11:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077328.1438397; Mon, 11 Aug 2025 11:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQGT-0000Kb-8d; Mon, 11 Aug 2025 11:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1077328;
 Mon, 11 Aug 2025 11:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJrJ=2X=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ulQGR-0000KQ-B3
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:00:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2417::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ef17a1f-76a2-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:00:20 +0200 (CEST)
Received: from SA0PR11CA0030.namprd11.prod.outlook.com (2603:10b6:806:d3::35)
 by DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 11:00:17 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:d3:cafe::e1) by SA0PR11CA0030.outlook.office365.com
 (2603:10b6:806:d3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Mon,
 11 Aug 2025 11:00:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 11:00:15 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 06:00:01 -0500
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
X-Inumbo-ID: 5ef17a1f-76a2-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lv+PNXNE87bFQRPgsKXCtDuJP/f1WCt9pgVgv2zKveDTe9InEH4ajcy02xwq4mkJ085eVBZ8wSknHkkJO02OeGeGkiqZeinhMZh3N1WB+hPNHBEJYj3sF4fJghnaoAQORDJPRJt1NdEFBJILIJRDKWxeMtQc12t5MqOO8C38r3TN7Br6AdJKLEwJ93JE1WX67FjQmA0f2LFV2EQKbCuc0LqgYDCV1RXQtSnqg96XnS9A3l4UVz1qLMT6orUvy72oKPtJIQPYj8P3G5e+mqDi1bEcVor7Mr3wmLEaGYAmDH9Mr/kc7gP5RkoBQuUPnyloO1HY22D8+lX6lXvCU2VnRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6A+pbogFJrgKXrRlewIh3dkOnPguZ/VwrOay1zAcApQ=;
 b=MkV1m+qCq9XizdwVTtm6NAS9uvTMjQ3o6IQNLtHtZmIRFttdlXzRckBeScpQTeI63AkUKs+22YPP2CA6RtPai1HWaFqQnx/IpN0XvcPtmmsA+zguodXM+I5+L+yl03TZBaEvATEPkL2yNkCO1Bvn9qg7b+wHladoRE1jXvhj7QRYOEm+8VzBjN+5rPsZQun/149lUizIM8QJtndb8u/eZ6b6jUS8gYpYRN++wKg2rz0XyM2MiIpeV6HFRfzL23DALZ1jwVP7fQTVajpC1OQn7A/9rf5mobbCWIx4yBV8U2DEJIVbZYkgmn+CIShN10BmT0dGxWwpax6G4/OhEs/hPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6A+pbogFJrgKXrRlewIh3dkOnPguZ/VwrOay1zAcApQ=;
 b=IGwhulCqTtdCeSPuxDacMElEVLBO68vCQ9SzzZbGZiyW8WggRlYxgyg+lJjM7HprnWJko7ijw9davUEd6Hrq331y+wtEdkd9JtLJawF+OvwVzKVoGxQY8/FVgCwsAZAKJhSyWmKRhMwGyf0infWQb4xuMwl/DHOfDgFYLIucfWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 Aug 2025 13:00:00 +0200
Message-ID: <DBZJOCP6J9OD.UBC62HPF2AJI@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>, "Julien
 Grall" <jgrall@amazon.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v15 1/4] xen/domain: unify domain ID allocation
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250809170747.1836880-1-dmukhin@ford.com>
 <20250809170747.1836880-2-dmukhin@ford.com>
In-Reply-To: <20250809170747.1836880-2-dmukhin@ford.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea1a02a-3f2b-4db3-68a9-08ddd8c640db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzlmMm1HaURoSHBrdCt5cmNOREkwMnVFdGs5dlkwQUxLL2ppU1hsNGdETFpH?=
 =?utf-8?B?R2RERUI3VWNDSTFuVGh1VDNoa3VjVU5FOHl0VUFCdFEya2xCMWRTeEpOU3hm?=
 =?utf-8?B?aWJJQXY5MUNrZFBlekxLVStBdFFKaXdTaElPRlFRMGFKMDNtS3RXYjIrUVg5?=
 =?utf-8?B?emZsQlhiZGozK3NlNVU2THNMcHRRVHcxWmVqeGRlTG1QVjM0NnplSDRCall2?=
 =?utf-8?B?OVdFWmp3WE5sVHpxT0d5eFE5Z1lzRUxLWGxNTHVZUmpkRFRkakVhazNwL1Za?=
 =?utf-8?B?RGl2MXpweFZXcjZEZVdwNkxtWm83RUdYUWRoRDlZcVBMdW5MM3d0NDVOYzRw?=
 =?utf-8?B?cW5KSmNxTGNSZE9lUDBKUGgxMWNwQjZLN24zVzBjSW44Z3l5akFLMTJQdzZk?=
 =?utf-8?B?bWJaakVNaHc4Um5XUU9lbUNMbVk3Q1NWM3RWcjk0WEF2NFNvblBzci9GR3N4?=
 =?utf-8?B?cTR1bTF0QXRSbk8vRHo2cWpndE1RazRrcWs5VmxOc2s0SVovZGpIOWx3MmNv?=
 =?utf-8?B?NktKRTlGS0V4OGpvTFhHeis2U3dMN3ZOaHA1ZUpqTWxvM1lOREU2am10ekpy?=
 =?utf-8?B?cnZXWmNSME5oaTVhM3MzUU85YU1zY1haWE91TXdtVkJpVFUrZFZ2VC9qUjZa?=
 =?utf-8?B?YTR6RE5XZE9XeXpFK0JGTFNLTUwzQkFDczFjVkZyRXVCRnlNbk42TGhCdE54?=
 =?utf-8?B?b0xKdk9WWUlyUk1zUjl2QiszSGVBeDZBb2NUTjVnN0oyZzBxODdYZ2FST2N2?=
 =?utf-8?B?cXVySjJIbWFoSGFzdFFJSVhTa0J6UjlZeVloby9qZGo1bXZNTEdraHRmQ1N6?=
 =?utf-8?B?MkFpaVNkSFpma2I2Wmg5N3dpR2J6R05HNExnVVBTMHBOaml6R0ExQWNYd2Er?=
 =?utf-8?B?R1N6Q0g1WjlEQkFLdzhZa08vWkZneGQxem1yZlh1em1EekRJZFNsNFBpVnJs?=
 =?utf-8?B?cUllYlhDR1h3MlNCbXBEVmYwcmRvWVpLbXRtSHY4QzFUZzRZUHVsVUY0Ny80?=
 =?utf-8?B?YkRTQzF1WlZMdzgreFpqei8wcEQrUkQ3ZEMraE9BQ0NaT2I4Zit0dGhRNTJL?=
 =?utf-8?B?dkFsK2ZZdEJweDVxQ012OGsxYXFvWjBVZjNrYkoyYk14L3lxaXZZQmZpTERr?=
 =?utf-8?B?amdhRjlSQXNVUCtYZTYrOGs0Ymx2MThMeUFuQWgxd0l6RlhlcFRBSU9OdDdL?=
 =?utf-8?B?QU5wSEVYZmt1SDNZLzBpWktxNUR4alNRb1BzcEw5b0NncWpmM1Y2WmZOTUJJ?=
 =?utf-8?B?NFdxaEkyMWF4TEhnNm5uNUJJbG15MFBDS2hEQmR6UExDNE1lMUQxSUV3TTNP?=
 =?utf-8?B?bjFxQjFCWTE0SGRIaGxSMHgvTzJtL2JWalhLMkU1ZjFIa0VGLzJTMWJrUnVm?=
 =?utf-8?B?Y0tZTFZYYlRYNkErOXF1QUxnUko5TUR5MG9Yc0J1aXVWTFIyUXBZZjNXSlpa?=
 =?utf-8?B?a0FhQXBoRm1KSk5rMXplOHJyaTJDeU9UeDV6TGlaaytmQjErS1d0UVFENktM?=
 =?utf-8?B?UXJWTHBmMzJobUVHRnhUQ1h1NXBCQmhWRFM1b0RtVnNkY28xSjZHV0N4RTRJ?=
 =?utf-8?B?aWFGZFQ1RzJtK3hwZlVGeWxNQ2dUZ3VZUFZVQzVHRWhQcUVabXRMUGJweUlp?=
 =?utf-8?B?Mk9IdkFYTWlyMWsvR05oVSticmZwRHVwQkozMURiK3RERTZBMnZzT0ZDeTR6?=
 =?utf-8?B?R2FLUHhIRzJJYXRrYWhibGVZdEdkS0ZoYkNZT0xMeFJrVkdjN2Q2dWxXR0Fl?=
 =?utf-8?B?QVdNVDBhK2NEdFNtOXpHc1lQdTNWcHpmNXVQK1dqMzJFS1BiaXJQNDhaMHZs?=
 =?utf-8?B?eE90NlJaYXJoK0VUTFlQSXFXUUl5WXBqRG8xQjZUbHZyQTdmU3FoQWZDeGNR?=
 =?utf-8?B?YUhnbi9WNG5qVGdZSmw4eEhLQ1U3cjQ3K3dJYy9YSGtWRkdyd2RpRnRzMlpq?=
 =?utf-8?B?NWpNTG5QR0dIQU8xUVoySlZXVk9nTTl1MlhTM0ZCK0tLUitLN3BUaXVSTERC?=
 =?utf-8?B?bjI5ZzJ4ZFVnTVdXMEtQSXBBM0RMbmM0K0hNZkFRM1pnQWV4ZnVDcm1NYmdi?=
 =?utf-8?Q?ptHkTg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 11:00:15.9071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea1a02a-3f2b-4db3-68a9-08ddd8c640db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915

On Sat Aug 9, 2025 at 7:08 PM CEST, dmkhn wrote:
> From: Denis Mukhin <dmukhin@ford.com>=20
>
> Currently, there are two different domain ID allocation implementations:
>
>   1) Sequential IDs allocation in dom0less Arm code based on max_init_dom=
id;
>
>   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>      max_init_domid (both Arm and x86).
>
> The domain ID allocation covers dom0 or late hwdom, predefined domains,
> post-boot domains, excluding Xen system domains (domid >=3D
> DOMID_FIRST_RESERVED).
>
> It makes sense to have a common helper code for such task across architec=
tures
> (Arm and x86) and between dom0less / toolstack domU allocation.
>
> Note, fixing dependency on max_init_domid is out of scope of this patch.
>
> Wrap the domain ID allocation as an arch-independent function domid_alloc=
() in
> new common/domid.c based on the bitmap.
>
> Allocation algorithm:
> - If an explicit domain ID is provided, verify its availability and use i=
t if
>   ID is not used;
> - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERVED=
-1],
>   starting from the last used ID.
>   Implementation guarantees that two consecutive calls will never return =
the
>   same ID. ID#0 is reserved for the first boot domain (currently, dom0) a=
nd
>   excluded from the allocation range.
>
> Remove is_free_domid() helper as it is not needed now.
>
> No functional change intended.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

There's a nit below about a change in v14, but with or without that:

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

> ---
> Changes since v14:
> - added Julien's R-b
> ---
>  xen/arch/arm/domain_build.c             |  7 +-
>  xen/arch/x86/setup.c                    |  7 +-
>  xen/common/Makefile                     |  1 +
>  xen/common/device-tree/dom0less-build.c | 15 ++--
>  xen/common/domain.c                     |  2 +
>  xen/common/domctl.c                     | 43 ++---------
>  xen/common/domid.c                      | 95 +++++++++++++++++++++++++
>  xen/include/xen/domain.h                |  3 +
>  8 files changed, 126 insertions(+), 47 deletions(-)
>  create mode 100644 xen/common/domid.c
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 463ae4474d30..789f2b9d3ce7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2050,6 +2050,7 @@ void __init create_dom0(void)
>          .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version)=
,
>      };
>      unsigned int flags =3D CDF_privileged | CDF_hardware;
> +    domid_t domid;
>      int rc;
> =20
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2074,7 +2075,11 @@ void __init create_dom0(void)
>      if ( !llc_coloring_enabled )
>          flags |=3D CDF_directmap;
> =20
> -    dom0 =3D domain_create(0, &dom0_cfg, flags);
> +    domid =3D domid_alloc(0);
> +    if ( domid =3D=3D DOMID_INVALID )
> +        panic("Error allocating domain ID 0\n");
> +
> +    dom0 =3D domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
>          panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
> =20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 1543dd251cc6..398da734c0c5 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1047,8 +1047,11 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>      if ( iommu_enabled )
>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> =20
> -    /* Create initial domain.  Not d0 for pvshim. */
> -    bd->domid =3D get_initial_domain_id();
> +    /* Allocate initial domain ID.  Not d0 for pvshim. */
> +    bd->domid =3D domid_alloc(get_initial_domain_id());
> +    if ( bd->domid =3D=3D DOMID_INVALID )
> +        panic("Error allocating domain ID %u\n", get_initial_domain_id()=
);
> +
>      d =3D domain_create(bd->domid, &dom0_cfg,
>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>      if ( IS_ERR(d) )
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index c316957fcb36..0c7d0f5d46e1 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D dev=
ice.o
>  obj-$(CONFIG_DEVICE_TREE_PARSE) +=3D device-tree/
>  obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
>  obj-y +=3D domain.o
> +obj-y +=3D domid.o
>  obj-y +=3D event_2l.o
>  obj-y +=3D event_channel.o
>  obj-$(CONFIG_EVTCHN_FIFO) +=3D event_fifo.o
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index 6bb038111de9..f4b6b515d2d2 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -833,6 +833,7 @@ void __init create_domUs(void)
>      {
>          struct kernel_info ki =3D KERNEL_INFO_INIT;
>          int rc =3D parse_dom0less_node(node, &ki.bd);
> +        domid_t domid;
> =20
>          if ( rc =3D=3D -ENOENT )
>              continue;
> @@ -842,13 +843,13 @@ void __init create_domUs(void)
>          if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
>              panic("No more domain IDs available\n");
> =20
> -        /*
> -         * The variable max_init_domid is initialized with zero, so here=
 it's
> -         * very important to use the pre-increment operator to call
> -         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved=
 for Dom0)
> -         */
> -        ki.bd.d =3D domain_create(++max_init_domid,
> -                                &ki.bd.create_cfg, ki.bd.create_flags);
> +        domid =3D domid_alloc(DOMID_INVALID);
> +        if ( domid =3D=3D DOMID_INVALID )
> +            panic("Error allocating ID for domain %s\n", dt_node_name(no=
de));
> +
> +        max_init_domid =3D max(max_init_domid, domid);
> +
> +        ki.bd.d =3D domain_create(domid, &ki.bd.create_cfg, ki.bd.create=
_flags);
>          if ( IS_ERR(ki.bd.d) )
>              panic("Error creating domain %s (rc =3D %ld)\n",
>                    dt_node_name(node), PTR_ERR(ki.bd.d));
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 5241a1629eeb..a7e303253d1a 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -692,6 +692,8 @@ static void _domain_destroy(struct domain *d)
> =20
>      lock_profile_deregister_struct(LOCKPROF_TYPE_PERDOM, d);
> =20
> +    domid_free(d->domain_id);
> +
>      free_domain_struct(d);
>  }
> =20
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index f2a7caaf853c..71e712c1f316 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -51,20 +51,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodem=
ask,
>                                     MAX_NUMNODES);
>  }
> =20
> -static inline int is_free_domid(domid_t dom)
> -{
> -    struct domain *d;
> -
> -    if ( dom >=3D DOMID_FIRST_RESERVED )
> -        return 0;
> -
> -    if ( (d =3D rcu_lock_domain_by_id(dom)) =3D=3D NULL )
> -        return 1;
> -
> -    rcu_unlock_domain(d);
> -    return 0;
> -}
> -
>  void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *in=
fo)
>  {
>      struct vcpu *v;
> @@ -423,36 +409,19 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t)=
 u_domctl)
> =20
>      case XEN_DOMCTL_createdomain:
>      {
> -        domid_t        dom;
> -        static domid_t rover =3D 0;
> +        /* NB: ID#0 is reserved, find the first suitable ID instead. */
> +        domid_t domid =3D domid_alloc(op->domain ?: DOMID_INVALID);
> =20
> -        dom =3D op->domain;
> -        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
> +        if ( domid =3D=3D DOMID_INVALID )
>          {
>              ret =3D -EEXIST;
> -            if ( !is_free_domid(dom) )
> -                break;
> -        }
> -        else
> -        {
> -            for ( dom =3D rover + 1; dom !=3D rover; dom++ )
> -            {
> -                if ( dom =3D=3D DOMID_FIRST_RESERVED )
> -                    dom =3D 1;
> -                if ( is_free_domid(dom) )
> -                    break;
> -            }
> -
> -            ret =3D -ENOMEM;
> -            if ( dom =3D=3D rover )
> -                break;
> -
> -            rover =3D dom;
> +            break;
>          }
> =20
> -        d =3D domain_create(dom, &op->u.createdomain, false);
> +        d =3D domain_create(domid, &op->u.createdomain, false);
>          if ( IS_ERR(d) )
>          {
> +            domid_free(domid);
>              ret =3D PTR_ERR(d);
>              d =3D NULL;
>              break;
> diff --git a/xen/common/domid.c b/xen/common/domid.c
> new file mode 100644
> index 000000000000..7839a2885810
> --- /dev/null
> +++ b/xen/common/domid.c
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Domain ID allocator.
> + *
> + * Covers dom0 or late hwdom, predefined domains, post-boot domains.
> + * Excludes system domains (ID >=3D DOMID_FIRST_RESERVED).
> + *
> + * Copyright 2025 Ford Motor Company
> + */
> +
> +#include <xen/domain.h>
> +
> +static DEFINE_SPINLOCK(domid_lock);
> +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> +
> +/*
> + * Allocate domain ID.
> + *
> + * @param domid Domain ID hint:
> + * - If an explicit domain ID is provided, verify its availability and u=
se it
> + *   if ID is not used;
> + * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] ra=
nge,
> + *   starting from the last used ID. Implementation guarantees that two
> + *   consecutive calls will never return the same ID. ID#0 is reserved f=
or
> + *   the first boot domain (currently, dom0) and excluded from the alloc=
ation
> + *   range.
> + * @return Valid domain ID in case of successful allocation,
> + *         DOMID_INVALID - otherwise.
> + */
> +domid_t domid_alloc(domid_t domid)
> +{
> +    static domid_t domid_last;
> +
> +    spin_lock(&domid_lock);
> +
> +    /* Exact match. */
> +    if ( domid < DOMID_FIRST_RESERVED )
> +    {
> +        if ( __test_and_set_bit(domid, domid_bitmap) )
> +            domid =3D DOMID_INVALID;
> +    }
> +    /*
> +     * Exhaustive search.
> +     *
> +     * Domain ID#0 is reserved for the first boot domain (e.g. control d=
omain)
> +     * and excluded from allocation.
> +     */
> +    else
> +    {
> +        domid_t num =3D DOMID_FIRST_RESERVED;

nit: s/num/bound/, or something like that.

I don't care much though. If there's not going to be a v16 (and I hope not.=
 The
series has been girdling the mailing list long enough) feel free to ignore =
this.

> +
> +        domid =3D find_next_zero_bit(domid_bitmap, , domid_last + 1);
> +        if ( domid =3D=3D num && domid_last !=3D 0 )
> +        {
> +            num =3D domid_last + 1;
> +            domid =3D find_next_zero_bit(domid_bitmap, num, 1);
> +        }
> +
> +        ASSERT(domid <=3D DOMID_FIRST_RESERVED);
> +        if ( domid < num )
> +        {
> +            __set_bit(domid, domid_bitmap);
> +            domid_last =3D domid;
> +        }
> +        else
> +            domid =3D DOMID_INVALID;
> +    }
> +
> +    spin_unlock(&domid_lock);
> +
> +    return domid;
> +}
> +
> +void domid_free(domid_t domid)
> +{
> +    int rc;
> +
> +    ASSERT(domid <=3D DOMID_FIRST_RESERVED);
> +
> +    spin_lock(&domid_lock);
> +    rc =3D __test_and_clear_bit(domid, domid_bitmap);
> +    spin_unlock(&domid_lock);
> +
> +    ASSERT(rc);
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
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index e10baf2615fd..8aab05ae93c8 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -38,6 +38,9 @@ void arch_get_domain_info(const struct domain *d,
> =20
>  domid_t get_initial_domain_id(void);
> =20
> +domid_t domid_alloc(domid_t domid);
> +void domid_free(domid_t domid);
> +
>  /* CDF_* constant. Internal flags for domain creation. */
>  /* Is this a privileged domain? */
>  #define CDF_privileged           (1U << 0)


