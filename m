Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31BBB16217
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 15:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064027.1429772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7K1-0008Sd-DN; Wed, 30 Jul 2025 13:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064027.1429772; Wed, 30 Jul 2025 13:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh7K1-0008Pz-9p; Wed, 30 Jul 2025 13:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1064027;
 Wed, 30 Jul 2025 13:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rpg=2L=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uh7K0-0008Pt-9t
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 13:58:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:2417::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a6e6d90-6d4d-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 15:58:13 +0200 (CEST)
Received: from MW4PR04CA0109.namprd04.prod.outlook.com (2603:10b6:303:83::24)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 13:58:03 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:303:83:cafe::c4) by MW4PR04CA0109.outlook.office365.com
 (2603:10b6:303:83::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Wed,
 30 Jul 2025 13:58:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 13:58:01 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Jul
 2025 08:57:58 -0500
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
X-Inumbo-ID: 3a6e6d90-6d4d-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ep19GaMOHfHEJMPMGuULaL1Tqn3nhbwjkhXdTG5fy6DsJUYXFxXU2zynjcS3ckOReP6iPXG0GRdQcndlP3G0ovblo5ZV9RcRWRlqizvalMiLpG802jdOY07ghxOcIO7RGrJNzLYZHVE0bGw/rsRYg5gZdtuGNIFL/de2L1bR8eWNDFVRqixU0Snx9Mkrk1Jbl1ouuUArMmMLUVpGt3/p0jovmNPMNpTTqK5ifiBhdV3nYL/IlSLL/Sfg3+vptRmWp3jzV3poCR6wJsOi4r2R8JK7pTRfC+ery2NJdmUgNVsdUvGch0jqp3YvFpse61QkBgo0drMV8PtKRttch3KzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPcv6m7w7p9/Jw81lGadbOirMb48qtloOQSe7J3FS34=;
 b=yD/Z77//MIiYkjNOvlWus0+8wj0j1R9J2vrZTrOvxJY8s6D8kW7IAW+FLqmnB+z1ICRe1ko6RcUUVPXhj9jddBpXxLUDJyRtuN8MeM1W7N2Au4OuSrlNNqRenNbVnCYBEYNVlrEXzjMv+T53We/aLOOzh+J2Buhw/7JH4FElc4w9nVwdnj+Eurl4FkcgvPOVdU0a1j0sQPOjFYdd9SNq6wEMSGgW9QAT6c6OnCEbA7Qk3WR6x0QWJixcw5UOhJs8HJIcj+jTi8Q0nWeqlprHDlBbGmYjj94VnNYmME0Ly2a9+dDbgJ3d3nwMqFU0gtpCYsLG4XEmAbW4+baiNCDJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPcv6m7w7p9/Jw81lGadbOirMb48qtloOQSe7J3FS34=;
 b=DXAoK3qPTVbL4HBgJSyRqrIXLa0WnTyZZsdJ0BNZTrjs1khxchvBh19NIzVemOBG2uxfy0W8adN/2YA2jAz3YGxJCCNVo0bX5acDl4J1uZxHN3BOy8r0w5Jg7bIV0tFQIY9u4qTLQfL6Y1Dm+IQX9qny2E4YOaZ6TQYYle+BGHc=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Jul 2025 15:57:57 +0200
Message-ID: <DBPFY25O1BAY.1K0C7J7KDZOP9@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>
Subject: Re: [PATCH v12 1/3] xen/domain: unify domain ID allocation
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250730033414.1614441-1-dmukhin@ford.com>
 <20250730033414.1614441-2-dmukhin@ford.com>
In-Reply-To: <20250730033414.1614441-2-dmukhin@ford.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4a39a4-114e-435e-74af-08ddcf7118f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3VKNUZZWFVKQnBPdEhUTXRMaEdiOURReW5Qb08wQWh0WlY2N09aNjZrSklE?=
 =?utf-8?B?V2dtaHQxYWZ5T0xXQmpsaEFZVnBqeW9EYUlRY3h5TjlIbGhGbU45SXlJV0Fx?=
 =?utf-8?B?R2IyWlMzcW1OakV5NnoydkRzVE1PRjNRbFpJaHFqb1ZFaTVGY1ZzTm91cnFL?=
 =?utf-8?B?My80REpYT2s0WTJ4N3FuSE4ycktrMmpoUE5WRWUzUjV4dzZ6VklBb0EzOUhO?=
 =?utf-8?B?NUcxRmNEY0wrOUpzRmdNRTJzMTBjYjlvZEEzVHU3cDJJc0hsd0NCcnFoMVpn?=
 =?utf-8?B?NjMzY0wwYVl4S2tuZndxdHl5Yjl6RndwR1VlcG9nc0pvVUdFbXJ2TDRuYkJv?=
 =?utf-8?B?aUl1bzlBckZjZkpvNGZvUTFueXRoeFZDejdxVGtLNk9RUWVZM2NDWStkcER3?=
 =?utf-8?B?M1NGakgrYk5JeUNCVjRNN2Z3NnlEK2NtM3E1eDJ4ZzVyNWtBRDRPMFVuNG5Q?=
 =?utf-8?B?dlFaTENZMStVY1gyRmRtTmVraTl0R2RKRkRBdXAvQWQ3RXlFZ09ZbWM1OU1I?=
 =?utf-8?B?bE5FR3ZodHlRNUQxazFBYU5kS29hR3BZYm95aTRIYThBYW91UUFYRmozY0xD?=
 =?utf-8?B?Z2NMOFFvQzNqNTBMaG1oZWlXTEwwQm90L1NBTCtPcUd4OExhU3ZpRDVQZTUz?=
 =?utf-8?B?SHpIdnorYzBJUytqUmFIamJNdzRWTlFIeFF5V0kwVWl0aEZGU2tLbUJtZElP?=
 =?utf-8?B?ZHU0RHJJS2IxWVJCeFJBZU9SenpyR2VaaERBdmdQYXlWYWQxQm4vVlJYV3Ra?=
 =?utf-8?B?bXBvUEQ4K2gvZ3BwM3I2SnNPVUJ0Q2t4Q1hoaUt3SWJxK3dvZ05zeFA3SjNB?=
 =?utf-8?B?MEVxdGZoYy9YWUR0dUpwbEtqK0h5SzNORXhibEJ4N254emtjdmVnRnA5a0N5?=
 =?utf-8?B?TlI1OEl5bXhFcmRSd2xtdGFSTndsZ3lmL2liWWFkVS9EMWswV1RZNVhVSUYz?=
 =?utf-8?B?Y0Rkd0pLcXBmWjFrNHpRTDlxTUZ4U05yWm9XanAwY2xlanJ0bGVUYkdGeito?=
 =?utf-8?B?TXZ4eDVVL29Gc2IwMDhlR00vSzE4VVR0V1BiRHBDNGR5bTVMS1pxTlBjYWg5?=
 =?utf-8?B?N3hZVmdVSVNTekl1OSt2UEFndVhZeGNOemthWHhzcmdEWEtEOThMNCtNQXE3?=
 =?utf-8?B?aFV5WWoxeTdkNnJMSlNQdUIzdDJQZm02TWRkMlVOZTdMbXJKTmdTWmVObDRF?=
 =?utf-8?B?Z1hvdmdkb0hZZmR4V1FJWlIxYmFVdUpUMy9YRmJPUHRaTEs2Rlp0Z2JLS3dx?=
 =?utf-8?B?L3VvY01ESkRnRnlZamNrWFBVSFVsL2N6Wjk0UzJSRVJQRDdKb1lFR0tLWVVF?=
 =?utf-8?B?M2x2TVdReTVBRERBRlE5WlluMEgvM2Q5aXY1TzNNSG9LVHZWVVBVcmQvcU9E?=
 =?utf-8?B?OFREaW1xclJiS2RybEo1NFVoaWhjRjZDMFNkS1ZCaytjdHlTeEZJeWhSUXJk?=
 =?utf-8?B?NzltRVpHczRDSC9KNWpNRUxRR0xPdFdRY2t3dlpJbHM3OGp5R1JiMnJPQXE5?=
 =?utf-8?B?dHRTcWcvTC9Yc1ZveVhCTDR0aTZpTlcrcGRTeTBnaURFbCtzMXA0ZXFOVjYz?=
 =?utf-8?B?MnhjOGtyMUtkNERzNXBMcmFQR1VuSWVTajBHTEE1eWpTeUZqMXJ0NlhTczgx?=
 =?utf-8?B?ejJ4VVRzdXc4STN1ckZzYnRUZFA5eGdzeU50cnRCOVl5WDlmRzRwQUxPNldS?=
 =?utf-8?B?MEVvNHJ2VGNHaFRpM3JNZGdzc2dsamtLTnZKOTNVMEp3eTQ0djNDbThaT1Nn?=
 =?utf-8?B?OVlHTjBFenVlSkJDU0o0VjhwdUdVb2FDdHVoSi9ISm5STkllR25JRkhONGE3?=
 =?utf-8?B?azdFZVdPK0RvNnZpaHlQM1h0WGI1ckQ5a3gzNHlBV3B6SFpEdVoxS3BNM0h2?=
 =?utf-8?B?NDFsU3lsYWErSWJ1T2JnbDF1TFJkSEZiaG8yUE5iQk0zU0srWFB2aXdoRlcx?=
 =?utf-8?B?UHYzU3JrOUo2RnAyckY1VHg3Uk1qSGdSN3lwci9HcjNWL2ZTK0xNS0JMZFVU?=
 =?utf-8?B?Tlc4eWptYldCeTJITWdUOG91YnhRczRZWkZHaFU4MlRFbUUxTkJXbXh6ZzRt?=
 =?utf-8?Q?EX9qfn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 13:58:01.2654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4a39a4-114e-435e-74af-08ddcf7118f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896

On Wed Jul 30, 2025 at 5:34 AM CEST, dmkhn wrote:
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
>   starting from the last used ID. IDs are not wrapped around in dom0less =
case.
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
> ---
> Changes since v11:
> - fixed commentaries
> - dropped cf_check for new calls
> - dropped ifdef-ry from domid_alloc(), max_init_domid check in create_dom=
Us()
>   preserved
> - added ASSERT() to domid_free()
> ---
>  xen/arch/arm/domain_build.c             |  7 +-
>  xen/arch/x86/setup.c                    |  7 +-
>  xen/common/Makefile                     |  1 +
>  xen/common/device-tree/dom0less-build.c | 15 ++--
>  xen/common/domain.c                     |  2 +
>  xen/common/domctl.c                     | 42 ++---------
>  xen/common/domid.c                      | 94 +++++++++++++++++++++++++
>  xen/include/xen/domain.h                |  3 +
>  8 files changed, 124 insertions(+), 47 deletions(-)
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
> index 1543dd251cc6..2ff7c28c277b 100644
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
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id()=
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
> index 5241a1629eeb..12fbab01cd8e 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1473,6 +1473,8 @@ void domain_destroy(struct domain *d)
>      /* Remove from the domlist/hash. */
>      domlist_remove(d);
> =20
> +    domid_free(d->domain_id);
> +
>      /* Schedule RCU asynchronous completion of domain destroy. */
>      call_rcu(&d->rcu, complete_domain_destroy);
>  }
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index f2a7caaf853c..5509998aa139 100644
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
> @@ -423,36 +409,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t)=
 u_domctl)
> =20
>      case XEN_DOMCTL_createdomain:
>      {
> -        domid_t        dom;
> -        static domid_t rover =3D 0;
> +        domid_t domid =3D domid_alloc(op->domain);
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
> index 000000000000..155fef4236ad
> --- /dev/null
> +++ b/xen/common/domid.c
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Domain ID allocator.
> + *
> + * Covers dom0 or late hwdom, predefined domains, post-boot domains.
> + * Excludes Xen system domains (ID >=3D DOMID_FIRST_RESERVED).
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
> + *   starting from the last used ID. IDs are not wrapped around in dom0l=
ess
> + *   case. Implementation guarantees that two consecutive calls will nev=
er

The remark about dom0less is no longer relevant after removing the dom0less=
 ifdef
guards, and it should be in the in domain.h rather than here. With that:

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

