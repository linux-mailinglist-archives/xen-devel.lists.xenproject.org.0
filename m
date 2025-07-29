Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1969B14C3D
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 12:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062388.1428044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughfJ-00031i-Ku; Tue, 29 Jul 2025 10:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062388.1428044; Tue, 29 Jul 2025 10:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughfJ-0002z0-Hx; Tue, 29 Jul 2025 10:34:37 +0000
Received: by outflank-mailman (input) for mailman id 1062388;
 Tue, 29 Jul 2025 10:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AO6o=2K=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ughfI-0002yu-4w
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 10:34:36 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [2a01:111:f403:2409::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d0e049a-6c67-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 12:34:33 +0200 (CEST)
Received: from DM5PR07CA0110.namprd07.prod.outlook.com (2603:10b6:4:ae::39) by
 IA1PR12MB8493.namprd12.prod.outlook.com (2603:10b6:208:447::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 10:34:29 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:4:ae:cafe::98) by DM5PR07CA0110.outlook.office365.com
 (2603:10b6:4:ae::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Tue,
 29 Jul 2025 10:34:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Tue, 29 Jul 2025 10:34:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 05:34:26 -0500
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
X-Inumbo-ID: 9d0e049a-6c67-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+TSGQIq63moil6uKPDnqNGpSkmg6lZE6jPXsTJ7tncjV7cnk72FzJajW+uFsIfG6dkRI+cUhwrJ1iSeyL6/aNSHq0nledcWhLpAdJHMqsogqSGa2c3A8m4r/yBHiUrgktodDKx4VA9z2TXam1Yy4iNT0tpVIlGtD5MMq3UhsEo98FzrZgOdDM5VzA7+i2leoc8IIxfYAYVL7S2QpNPK0nHmk8xeQdCM0GTFK3WfU+8kS3QxPO4FMtHZY/uiBMCPhPfVGE43TWy14RxxjoWmXj1j6IhiwrNbi59n/p3UIH5kojrj/LvzZZ2/i9moHwwcKhgzeWAzwHyW0yqnzArIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7PYC2I/JKqLlS0lzBIbfXmyD0ixg+6A7wY/nEYXk+k=;
 b=GsH3wRIZuJ7vR7D5zdzXIUu6Atbj4418aqnZoeH4+mM4s2V3A0FMjk9PiqAO6MfJ417aqKNL7c8FYXE1xhE+BJvreeJtRzq3A6OA3wpNSnD3Ab+a3XGyID25lnl57WSujFkvugdymxrVfI+Gz1V+ogPsXUuBHfv+xdLiBgmVkPnpnEW6MXTNF9mNJtLCxgZFd2lBf7a39KKeVkV/kaV9oS2xYnLdLqWz0aGGzXse4Kv7pApAcbnQzWJNMz97gziTjk2wKksBWJCUKRz6Chv5PLfpeQj2yCdUCUEp9I45VGmrQMMrcTvssEA8gfPeDxmmLPWY6SU/hZ/DYcYoQAtQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7PYC2I/JKqLlS0lzBIbfXmyD0ixg+6A7wY/nEYXk+k=;
 b=fVWdtu8ishNNmaa61TxqflEpm2R4a102LFCwc8mtFZKobfO7hIbD9JKtnBwPYVLw24OPFZpRODgTT95XaddbxChGeoPTcFC6QD95KnGNCvsjcpZMPc5CHOp8iGhvw3UBm1QFUiBB2lNshtegsQ+WX8xB+pSv2Sl+TqdjwnBgRI4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Jul 2025 12:34:25 +0200
Message-ID: <DBOGZOES2A5Q.20Y3MK677M83D@amd.com>
Subject: Re: [PATCH v11 1/3] xen/domain: unify domain ID allocation
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>
X-Mailer: aerc 0.20.1
References: <20250728183427.1013975-1-dmukhin@ford.com>
 <20250728183427.1013975-2-dmukhin@ford.com>
In-Reply-To: <20250728183427.1013975-2-dmukhin@ford.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|IA1PR12MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: b21c5486-bc51-4a74-80c4-08ddce8b7f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlpiZnZoVzdtVTh0Y3NqWncvUXA1NTQvVmdKdmx6N2MyK0YraDBaSDVTZmlv?=
 =?utf-8?B?TG1HZHhHdDhRaDZyUzVoTFFPa242SE51QXl4ZTFyWmkycVNEa0JHcmtGbVds?=
 =?utf-8?B?T3orUFVOTmFzV0dXVzg0anVyR0FGZXNJck9IK0RON3lieEtlOGNPT0RvTlBB?=
 =?utf-8?B?cXJUK0pRWDhkT202ZVRjYUlWQzg4ei9nSmJ6YTRWRUhJZWNuUGtVa0dGSW5E?=
 =?utf-8?B?VTZDeXJyWWxMTHJYZlRCZWlXc1V4dTd2RDQvR2JWUVlmUkMxdkZteThTOUZo?=
 =?utf-8?B?WU5qQkpkYm9reVVtUWF0RjJHaVU4R2kyZHgwUFUyak9KV0YxV0tQK3dDV21N?=
 =?utf-8?B?ZUZJRFk2ODhuZmlWSzZ5akc0clMwdWlncXZjOVdPcjlIbCsrTjJVc1VEOWVP?=
 =?utf-8?B?Zy9CM1dlR3hCamtmY2RVc2xaaTRKTUk3RkI1MFdTTCtwVTFxQklrdmIvODIw?=
 =?utf-8?B?ZzVZUEw3bEg5REtFTE1QcjJ2dDc4cWxjNHJoQjEranlKTmFIb1RFUGRsdUYz?=
 =?utf-8?B?VzdqcExYNnRxMWZsMERYQnJjZXZkZCtpTU5uZGJkdWNKazRZVDlBQk54bFZa?=
 =?utf-8?B?N3YvVXl0S3VRWllxSCtBb2VzL25JYlZNNjJ1QUNmRzZCZFRrTVlzNCs2TUl3?=
 =?utf-8?B?UzczdVJQUEkxdE1ubERPOWtGbnZlbXNVVVplbjNUYm83NWtrSHpWa214WGRK?=
 =?utf-8?B?YXZTQXdjTEFHOStqODN5aWZEZ2svSFM3ZXg5K0NzZ0owVUxja0d1elZCekFh?=
 =?utf-8?B?S0diVDlqUDA5eEZaczJhdTNqSWljU0xMMEMwOXN3R2l4RW1oTFlzanMxVzk4?=
 =?utf-8?B?dDl5OXhiL1FLRHRZRkh5VlczWkhHUm9iQ3NJWWFmdjZweXFvZUhTSlJ3WHVv?=
 =?utf-8?B?Nm9ET3JiYTZFanFJMzM2RE1Lc1VoV2VDOG1STUl4TjViTDJBVGNhdmRuc0Vn?=
 =?utf-8?B?djhBWTFBOEFzVVdlTjNCTEFZajZaS2kybDA2UDRRUGdjUkNRRVhDZktMdURR?=
 =?utf-8?B?a3VSYTZGTHZUWHVneWFGeGt4OUxUK280Zll4cTB5ZVJrYS90OC8xUitKU2dl?=
 =?utf-8?B?Y09raWlOdkRVNUxETXl6TzNTOVRiOU5JOHpJMUdUWmFwOS81NlBlVUZDcVVQ?=
 =?utf-8?B?a0swZE5YTW5JS1RpSVZ0R1N6RjFJei9wb2pYVFE3bGF2SjJRUVN0WXp0TjFX?=
 =?utf-8?B?Nkw5eVd3QS9wQVl2SFR3VnNsMDFqdnBFUU94c0hHbVNQYUxhV216eENSQVJj?=
 =?utf-8?B?djRDd2VNM0R6OUVscUZRQjhtSjlhMzYyTTZsN3pwU0lNVHJhMlMyL1BSRGQ0?=
 =?utf-8?B?S1JMUVdNRSswMjNwc3dCRnRYeXM5NmFTZDRyU1pUSStVMksxREhqY0VzZzNh?=
 =?utf-8?B?aW9CNk93dDhkR1V3c20yQmlhR1JKaktZeFZEamNDYWVLbGJrM2tydExmTzNx?=
 =?utf-8?B?RlQ5cDZrZTVtNnlYKzNSalU5eEYzZkpNc25Bb2Q4YTlZbXVlU1Q2ZFc4SjY5?=
 =?utf-8?B?RDFvb3pvNXZUMmhSK0I4SHBQVlRrcXVuL3MxMnZwcVk5SCtWeHdGMmVkRUd5?=
 =?utf-8?B?OWJaMEpLQkMxMjlpR3pCeW45ZllBMDdHc0xwYlJ0Mzh0d1RQcndGRnJEQ0hv?=
 =?utf-8?B?SldIYWkrb0lpN2FsdDJUc21Pa0xzR3gvWFAySlJobUlPYXMvQ3dubzZTY1Jn?=
 =?utf-8?B?dkJIbnRMQm1rZFQrWitKSHMzZ2I2ckc0aENQNFIvWWdxc3UwZVlBT3k4S0gy?=
 =?utf-8?B?RWI1WVBOQ2ZsMkV0eDVabXZOZW1nSVc5V2NGbXpHVXpEcDZYRDJVVXNFaUFp?=
 =?utf-8?B?WG85NWJmbVNPZlhsNXJZWlRqd2RLVkVaM1RsT01kSk5pMjV6MytIeXgyMy9a?=
 =?utf-8?B?dU5nMW4vMG56WGVrNXJQeldiQ1UrM3NFSHk5czVQcFBYc1FtNzRVbGRHU3JM?=
 =?utf-8?B?OFkxNmNxMjZhWlllcE9LQnQ1WGliZVVtZ2ZqTUkvenFEQkZDME5VL1JuV3U1?=
 =?utf-8?B?bmFvZlJSVHdTN1pCclR2KzNGQXM3NzhXTGp3dEhGVitjTjd0Y2JscFIvNngz?=
 =?utf-8?Q?nIahf+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 10:34:28.9538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b21c5486-bc51-4a74-80c4-08ddce8b7f70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8493

On Mon Jul 28, 2025 at 8:34 PM CEST, dmkhn wrote:
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

I can see why. The console switch code is a bit annoying. It's unfortunate =
it
relies on that global for the early wraparound.

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
> Changes since v10:
> - fixup #ifdefs in domid_alloc()
> - corrected use of domid_free() in domain_destroy()
> - rebased
> - moved domid_{alloc,free}() to common/domid.c so the functional test cou=
ld be
>   added later
> ---
>  xen/arch/arm/domain_build.c             |  7 +-
>  xen/arch/x86/setup.c                    |  7 +-
>  xen/common/Makefile                     |  1 +
>  xen/common/device-tree/dom0less-build.c | 15 ++--
>  xen/common/domain.c                     |  2 +
>  xen/common/domctl.c                     | 42 ++---------
>  xen/common/domid.c                      | 93 +++++++++++++++++++++++++
>  xen/include/xen/domain.h                |  3 +
>  8 files changed, 122 insertions(+), 48 deletions(-)
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
> index 6bb038111de9..1f9461d0e738 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -833,21 +833,20 @@ void __init create_domUs(void)
>      {
>          struct kernel_info ki =3D KERNEL_INFO_INIT;
>          int rc =3D parse_dom0less_node(node, &ki.bd);
> +        domid_t domid;
> =20
>          if ( rc =3D=3D -ENOENT )
>              continue;
>          if ( rc )
>              panic("Malformed DTB: Invalid domain %s\n", dt_node_name(nod=
e));
> =20
> -        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
> -            panic("No more domain IDs available\n");
> +        domid =3D domid_alloc(DOMID_INVALID);
> +        if ( domid =3D=3D DOMID_INVALID )
> +            panic("Error allocating ID for domain %s\n", dt_node_name(no=
de));
> +        if ( max_init_domid < domid )
> +            max_init_domid =3D domid;

nit: This is open-coding max_init_domid =3D max(max_init_domid, domid);

> =20
> -        /*
> -         * The variable max_init_domid is initialized with zero, so here=
 it's
> -         * very important to use the pre-increment operator to call
> -         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved=
 for Dom0)
> -         */
> -        ki.bd.d =3D domain_create(++max_init_domid,
> +        ki.bd.d =3D domain_create(domid,
>                                  &ki.bd.create_cfg, ki.bd.create_flags);

nit: With this change, the wrapped line can be unfolded into a single one.=
=20

>          if ( IS_ERR(ki.bd.d) )
>              panic("Error creating domain %s (rc =3D %ld)\n",
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 3c65cca5b0ff..23dbc1f46c78 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1466,6 +1466,8 @@ void domain_destroy(struct domain *d)
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
q =20
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
> index 000000000000..e553ab6e5468
> --- /dev/null
> +++ b/xen/common/domid.c
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Domain ID allocator.
> + * Covers dom0 or late hwdom, predefined domains, post-boot domains; exc=
ludes
> + * Xen system domains (ID >=3D DOMID_FIRST_RESERVED).
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
q + * Allocate domain ID.
> + *
> + * @param[in] domid Exact domain ID within [0..DOMID_FIRST_RESERVED-1] r=
ange or

nit: [in] is inconsequential, not being a pointer.

> + *                  DOMID_INVALID for exhaustive search within
> + *                  [1..DOMID_FIRST_RESERVED-1].
> + * @return Valid domain ID in case of successful allocation,
> + *         DOMID_INVALID - otherwise.
> + */
> +domid_t cf_check domid_alloc(domid_t domid)

Why cf_check? That's only needed when using indirection (i.e) function poin=
ters
so the call works with IBT. I don't think that's needed here?

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
> +     *
> +     * In dom0less build, domains are not dynamically destroyed, so ther=
e's no
> +     * need to do a wraparound of the IDs.
> +     */
> +#ifdef CONFIG_DOM0LESS_BOOT
> +    else if ( domid_last + 1 >=3D DOMID_FIRST_RESERVED )
> +        domid =3D DOMID_INVALID;
> +#endif

This hunk with the guards breaks dom0less-capable Xen booting a non-dom0les=
s
system (which effectively means any defconfig arm build). dom0 boots must w=
rap
around, irrespective of whether that same build could boot from a DTB.

The point of not wrapping around is merely a conservative check to ensure
dom0less-build can find a free domid by bump-allocating. This is already th=
e
case with your code, so there's no need to special-case dom0less.

Just remove it.

> +    else
> +    {
> +        domid =3D find_next_zero_bit(domid_bitmap,
> +                                   DOMID_FIRST_RESERVED,
> +                                   domid_last + 1);
> +#ifndef CONFIG_DOM0LESS_BOOT
> +        ASSERT(domid <=3D DOMID_FIRST_RESERVED);
> +        if ( domid =3D=3D DOMID_FIRST_RESERVED )
> +            domid =3D find_next_zero_bit(domid_bitmap,
> +                                       DOMID_FIRST_RESERVED,
> +                                       1);
> +#endif

Like before, this must be without the ifdef guards. Otherwise it breaks
non-dom0less runs on dom0less-enabled builds.

> +
> +        if ( domid < DOMID_FIRST_RESERVED )
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
> +void cf_check domid_free(domid_t domid)
> +{
> +    ASSERT(domid <=3D DOMID_FIRST_RESERVED);
> +
> +    spin_lock(&domid_lock);

Might be worth asserting the bit is set. That way we'll catch XSAs in CI if
we try to incorrectly move the current calls to domid_free().

> +    __clear_bit(domid, domid_bitmap);
> +    spin_unlock(&domid_lock);
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
> index e10baf2615fd..31946bb1b653 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -38,6 +38,9 @@ void arch_get_domain_info(const struct domain *d,
> =20
>  domid_t get_initial_domain_id(void);
> =20
> +domid_t cf_check domid_alloc(domid_t domid);
> +void cf_check domid_free(domid_t domid);

Neither of them should need the cf_check. Also, could you perhaps move the
explanation of how the allocation scheme works from the commit message into
the domid_alloc() prototype? That way callers can reason about the API with=
out
git-blaming to find out.

> +
>  /* CDF_* constant. Internal flags for domain creation. */
>  /* Is this a privileged domain? */
>  #define CDF_privileged           (1U << 0)


