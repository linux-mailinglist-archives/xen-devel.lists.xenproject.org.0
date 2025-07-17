Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8620B08AF3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 12:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046569.1416899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucM2a-0006vt-Lh; Thu, 17 Jul 2025 10:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046569.1416899; Thu, 17 Jul 2025 10:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucM2a-0006tw-Id; Thu, 17 Jul 2025 10:40:40 +0000
Received: by outflank-mailman (input) for mailman id 1046569;
 Thu, 17 Jul 2025 10:40:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucLqL-0002lK-Ft
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 10:28:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2009::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3e55ab9-62f8-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 12:27:57 +0200 (CEST)
Received: from DM6PR07CA0110.namprd07.prod.outlook.com (2603:10b6:5:330::26)
 by PH7PR12MB7257.namprd12.prod.outlook.com (2603:10b6:510:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 10:27:53 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:5:330:cafe::d2) by DM6PR07CA0110.outlook.office365.com
 (2603:10b6:5:330::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Thu,
 17 Jul 2025 10:27:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 10:27:52 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 05:27:50 -0500
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
X-Inumbo-ID: b3e55ab9-62f8-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DA/xzqJK5+CWJtLyF0TjjMjnI8dQLqdgX1cC/xO/9WFleeeptouNCJIUcNNhK+/N8nQK8vLNFLUOmZn7AsqPbjTpt3pl5Bo3Sw7viabDf5yxISLI7wUZcS8eyvqNUgZ9M2NdCH0WPUG+iF8rEIdmwcgV30NBMizLMt2GuTAHIaDly5QfsWr9zzAa6y9ogfNVTNAF+bVtSDLHMYuVzJ3ROYQOXN2kWxpgPnuR07gol6fB3hqFTV6giBeF/jOjoSE4onLmp6E2LN7UB5OMvB52fEv4u6w3ZioiQlD8lUa/gBWcm23D5QjK6aL9iyqQNd9E/2jYYbW09iH8fyhoZm+WwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1ENLuDZMzNVbgExsyjCzasqq1tyqNrl9pxOtGJO18U=;
 b=YdQRK5xIU0EF7bQPE3ncMeE6zExf9sj7RTU4cD9uDb874wlp4kTwOwr+gNrf80JtGflHEVxKczdAdQLHHGvg5uG40s6onylKcaiTAXZd5In24PBJqktfMUCB7dsnMRkKY+iuEv1HP/QdU2dPwMiA4jwmh4aX0mzxB4CZGQ9Az6u8dMth8qTGhMqqJRWJfqGCtxB3JO0jMichiACTn0Xed0Sy7090y5Z74ygcF8Zb+ZSIt6aw59QnOs6M0aUl29iFi+Yp9uSwQ58Ki172Ny5gn2QG6s64pXmnPzNIGd/QNq0bRPpc4K0kxLoQxviUZue6WYB/Et1iOxx81AzxxR3OnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1ENLuDZMzNVbgExsyjCzasqq1tyqNrl9pxOtGJO18U=;
 b=Q2DXQgI8O8fdhQJay1n1ZytN2+LAWp96dxtgT+RyVL02NmLuJB+OSQSrz6A2DEIouMM057BEmMU5VMIG6c/jFi//3Ct7m4Svm/jB+ddIlpxcmHl1OtohE4vp8dNQIagKdkql4KsGVDBbkPUUT9wWXhWGuSjUMtTgciM/y5k+o88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Jul 2025 12:27:48 +0200
Message-ID: <DBE9C2TQR079.3IQXRH5DEQ2JU@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v10 1/3] xen/domain: unify domain ID allocation
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250623182721.194238-1-dmukhin@ford.com>
 <20250623182721.194238-2-dmukhin@ford.com>
In-Reply-To: <20250623182721.194238-2-dmukhin@ford.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|PH7PR12MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: e38af2d0-3d29-498b-b5aa-08ddc51c9618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGFlVHVPeCtSVTZQMDlKSEpMcmJjT2VHeUE4N1Byb2JIbkNSQzZ4clpxZjZo?=
 =?utf-8?B?S2ZrMENEWnZYUSszUHVTYXFVbmRqdmFvZEwweVp6ZTlYVm1NcnVyWUNlVmNE?=
 =?utf-8?B?cTNYV01wZDJDR1E3elpIcHB2anJLVTlLbXJNUWt1MDdTalptQXJ0UW5RNWd1?=
 =?utf-8?B?VUxmR1J0UTFxc1BHS1hMeUQ0QkVoUFRlRWFBRVBTaDVvRU9XUFpnOWZpanBx?=
 =?utf-8?B?b1BVVkpzM0VIMzVtbXhXd0E1UzJhMkZDTGtLdVp6VHZjQWU2S0RLbGVRWDBv?=
 =?utf-8?B?dC9IWEZidjZ0RWtyTURwbjR5cDZoSmFURTBJUWsyWEpmU3VyZ0xSbURTYVhk?=
 =?utf-8?B?Tk0yeWJFaFlXUGUrS2sxa2R4TFAzMEZ4aExGVlZnK2VXVE1RL1lmbUN6Q3hH?=
 =?utf-8?B?UldYQmhKQUYzRjJ6bzdFZERZMFJMaE9wZE1rdXNGbUxTQXI1Y1JZTVQvNVlr?=
 =?utf-8?B?MEhJaXdEWnVFU3ljdjZZM3R4ajZkQ3M0aFZWL3Btb0lFNGpRZGY2NzNmYTg1?=
 =?utf-8?B?QmdDOVZXSElkSVRnM240RDdKRUlPSnVkRW04RjlyYzZnTzJwQ0ZXM3ZWMWsz?=
 =?utf-8?B?ZDVrdmROWldnQ1hMandNTXpza2QwM3lsdE56dUduUWVQc1lDS1phY1pxM2Jv?=
 =?utf-8?B?S1JTVk5Zay9QeUtXbFlPazVFM3ZJMnVVNlRUdHFhUENWMkd3V2tzVDdZak9F?=
 =?utf-8?B?RnhjWFR4aUVsVnJsZ3FPTXBHYmpVQThPQlJZOFQwSnRuOUJuT1JOd3Q1a0N4?=
 =?utf-8?B?RDFUdzlybXBObHREVHVjV3hoK3B1bnJIMXFwSU84ejM3SWZhOG1zQUJXMXpB?=
 =?utf-8?B?VTlWaiswdW1MdDVYSE5pOHdmWXNoc3dzak1nL0FzUmVkRy9TL0xIc1hLcG1P?=
 =?utf-8?B?NldITHVxS09Nak5RQ1lRYzdINjh6bnlyZTJ2Tkx1aWk1UHprTWN6OWR3WlJh?=
 =?utf-8?B?dmxOalFkbVFhTnJVdjdsaExmNDl2TW1nSWJqTUx4Y2IyNmluUzEwTmJOK2FL?=
 =?utf-8?B?RUdmOGRtS1MyTGtUZmRTRStreTViVFFGcjBUKzBCYkVYL2FTaXE3MjZlSTB4?=
 =?utf-8?B?Mm82OEFKTlhjOFRKK0pWdzlOcjhyYTFwRFkwQjJjaTVBZGpTR1ppQ1dPZ2Ro?=
 =?utf-8?B?V09yMGFMWmNzK2FRMmtPWU5IQU1CeExlWTBPY0t6N2toRnpXVVY2enZ5OXlO?=
 =?utf-8?B?SHBLYWtJaXZNb2sxY1MxdWhEakhWTG4wNzVBS3NEYXNEZVZVcjJwQjNGMGhm?=
 =?utf-8?B?ZnpSS2RibmRRb2pBVlprUG51QkhLckxwTXlzbTVrcm9JR2dsVnNIcWZ2cGFm?=
 =?utf-8?B?dXAvYTl6SHlFSk54Q2ZyNlhhUExSY0VBczF6aFdwMlo2b3BiL3FkSjZ2Vnoz?=
 =?utf-8?B?U21KeEJNWGZoZ1ZzOGFJdTQ0VHJJSEVmMmJjVEdZSlVLWGdLUWV5K0tkRnV6?=
 =?utf-8?B?T1pyZWR2c216Z014eWhDamZwZUJSVEE3dkJ6OWpmRW13bHJiY3NMSTBDZkFU?=
 =?utf-8?B?cjlZZVcxVmEwbUdJM2hyNVRMSjZQLzRsUythTlJhR0IyQnNsOXpMR3dEaTlI?=
 =?utf-8?B?dUEvUjAyZEpqZHRtQWlNck1CWUV3Vjd0RlN4UjlZWnFsdnVJNm5Ga083cWxr?=
 =?utf-8?B?MnpFR002eGZlTW5QZXR4a05zdEJ3WDhISEpINUlTVWJwb2VRTTh2ckpTcnpG?=
 =?utf-8?B?TkhBUDBra2E1VnVsYTljZVNsS2QzSkRNV3FwRnMvMDdKdi9zaHVpMFBnOWdh?=
 =?utf-8?B?MGFLbjhYZERGbHBQMTcxS04rVEI0SW12ZmRXaTJhdHJzOFpMNXFsSWFoSVdH?=
 =?utf-8?B?ck1rQ0hYNTB5bnVOUmQvVWxBMTFDWTdnemllc25tc1BPbWpOKyt3ZVpuNm1w?=
 =?utf-8?B?ZFo5VTF2MjFpaFNaUVNURi9pQVpZOTdwSmIzUlVUc01kWkpaQzJub1gzYjdz?=
 =?utf-8?B?RFZLSk5MZVBjRnc1QzhjMy9WREFsNlNmM05ScmdpK0ZtSTlMT0c2M2lFNjRX?=
 =?utf-8?B?TGZlSlExTFA0b1F1a2lEY0o3TmVIZlJhYzNDTFUrM3JCZjJVTE1ZRUNFQzRE?=
 =?utf-8?B?K2pGN28xc2VHemlpWkNxb01GdUdxT3hUbjBPdz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 10:27:52.3793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e38af2d0-3d29-498b-b5aa-08ddc51c9618
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7257

Hi,

Sorry I'm so late to this. I have a few suggestions to improve the ergonomi=
cs
of domid handling in dom0less/Hyperlaunch.

On Mon Jun 23, 2025 at 8:28 PM CEST, dmkhn wrote:
> From: Denis Mukhin <dmukhin@ford.com>
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
> common/domain.c based on the bitmap.
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
>   excluded from allocation range.
>
> Remove is_free_domid() helper as it is not needed now.
>
> No functional change intended.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes from v9:
> - dropped unrelated message formatting from create_dom0()
> - no wraparound of IDs in dom0less case
> - fixed ID#0 treatment
>
> Link to v9: https://lore.kernel.org/r/20250528225030.2652166-2-dmukhin@fo=
rd.com
> ---
>  xen/arch/arm/domain_build.c             |  7 ++-
>  xen/arch/x86/setup.c                    |  7 ++-
>  xen/common/device-tree/dom0less-build.c | 17 +++---
>  xen/common/domain.c                     | 75 +++++++++++++++++++++++++
>  xen/common/domctl.c                     | 42 ++------------
>  xen/include/xen/domain.h                |  3 +
>  6 files changed, 102 insertions(+), 49 deletions(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4ff161887ec3..9fa5143eb98c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2049,6 +2049,7 @@ void __init create_dom0(void)
>          .grant_opts =3D XEN_DOMCTL_GRANT_version(opt_gnttab_max_version)=
,
>      };
>      unsigned int flags =3D CDF_privileged | CDF_hardware;
> +    domid_t domid;
>      int rc;
> =20
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> @@ -2073,7 +2074,11 @@ void __init create_dom0(void)
>      if ( !llc_coloring_enabled )
>          flags |=3D CDF_directmap;
> =20
> -    dom0 =3D domain_create(0, &dom0_cfg, flags);
> +    domid =3D domid_alloc(0);

The way I=C2=B4d expect domid_alloc() to be used is twofold:

  1. "Give me this specific domid"

for which this interface looks fine, perhaps renamed to domid_alloc_exact(d=
omid)

  2. "Give me any domid"

for which we'd benefit more from a domid_alloc()

This removes the heuristics from the interface. Worst-case execution remain=
s the
same, under 500 iterations. (32K minus a little bit, checked 64bits at a ti=
me).

> +    if ( domid =3D=3D DOMID_INVALID )
> +        panic("Error allocating domain ID 0\n");
> +
> +    dom0 =3D domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
>          panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
> =20
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index f32efa7c6045..7adb92d78a18 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1044,8 +1044,11 @@ static struct domain *__init create_dom0(struct bo=
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
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-=
tree/dom0less-build.c
> index 3d503c697337..576fdfa6a19a 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -839,15 +839,13 @@ void __init create_domUs(void)
>          struct xen_domctl_createdomain d_cfg =3D {0};
>          unsigned int flags =3D 0U;
>          bool has_dtb =3D false;
> +        domid_t domid;
>          uint32_t val;
>          int rc;
> =20
>          if ( !dt_device_is_compatible(node, "xen,domain") )
>              continue;
> =20
> -        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
> -            panic("No more domain IDs available\n");
> -
>          d_cfg.max_evtchn_port =3D 1023;
>          d_cfg.max_grant_frames =3D -1;
>          d_cfg.max_maptrack_frames =3D -1;
> @@ -965,12 +963,13 @@ void __init create_domUs(void)
> =20
>          arch_create_domUs(node, &d_cfg, flags);
> =20
> -        /*
> -         * The variable max_init_domid is initialized with zero, so here=
 it's
> -         * very important to use the pre-increment operator to call
> -         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved=
 for Dom0)
> -         */
> -        d =3D domain_create(++max_init_domid, &d_cfg, flags);
> +        domid =3D domid_alloc(DOMID_INVALID);
> +        if ( domid =3D=3D DOMID_INVALID )
> +            panic("Error allocating ID for domain %s\n", dt_node_name(no=
de));
> +        if ( max_init_domid < domid )
> +            max_init_domid =3D domid;
> +
> +        d =3D domain_create(domid, &d_cfg, flags);
>          if ( IS_ERR(d) )
>              panic("Error creating domain %s (rc =3D %ld)\n",
>                    dt_node_name(node), PTR_ERR(d));
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 434d32901b1b..be022c720b13 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -66,6 +66,14 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>  struct domain *domain_list;
> =20
> +/*
> + * Domain ID allocator.
> + * Covers dom0 or late hwdom, predefined domains, post-boot domains; exc=
ludes
> + * Xen system domains (ID >=3D DOMID_FIRST_RESERVED).
> + */
> +static DEFINE_SPINLOCK(domid_lock);
> +static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> +
>  /*
>   * Insert a domain into the domlist/hash.  This allows the domain to be =
looked
>   * up by domid, and therefore to be the subject of hypercalls/etc.
> @@ -1452,6 +1460,8 @@ void domain_destroy(struct domain *d)
> =20
>      TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
> =20
> +    domid_free(d->domain_id);
> +

Shouldn't this go after domlist_remove()? Otherwise fun things might happen
if a domid is allocated while the old domain that still keeps the old domid
is still in its hash.

The domctl lock (maybe) protects this case implicitly, but it's probably be=
tter
to destroy things in a reasonable order.

>      /* Remove from the domlist/hash. */
>      domlist_remove(d);
> =20
> @@ -2433,6 +2443,71 @@ void thaw_domains(void)
>      rcu_read_unlock(&domlist_read_lock);
>  }
> =20
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
> +     *
> +     * In dom0less build, domains are not dynamically destroyed, so ther=
e's no
> +     * need to do a wraparound of the IDs.
> +     */
> +#ifdef CONFIG_DOM0LESS_BOOT

These ifdef guards are problematic. The fact that a platform supports dom0l=
ess
doesn't mean that every boot is dom0less (I can boot a non-dom0less system =
on
a dom0less-capable Xen).

Furthermore, the rationale for panicking on wraparound is because of exhaus=
tion,
but you do have a proper bitmap here to do proper exhaustive search, so IMO=
,
this branch is not necessary.

> +    else if ( domid_last + 1 >=3D DOMID_FIRST_RESERVED )
> +    {
> +        domid =3D DOMID_INVALID;
> +    }
> +#endif
> +    else
> +    {
> +        domid =3D find_next_zero_bit(domid_bitmap,
> +                                   DOMID_FIRST_RESERVED,
> +                                   domid_last + 1);
> +#ifdef CONFIG_DOM0LESS_BOOT
> +        if ( domid =3D=3D DOMID_FIRST_RESERVED )
> +            domid =3D find_next_zero_bit(domid_bitmap,
> +                                       DOMID_FIRST_RESERVED,
> +                                       1);

nit: I'd say 0 is fair game. On Hyperlaunch (and soon dom0less) it'll be po=
ssible
to have a domU with domid=3D0 and a hwdom/ctldom with domids !=3D 0 via the=
 domid
property on the DTB.

Starting from 1 might be slightly saner for defence in depth, so it really =
is
a nit. I don't think being cautious about dom0 is necessarily a bad thing.

> +#endif
> +
> +        if ( domid < DOMID_FIRST_RESERVED )
> +        {
> +            __set_bit(domid, domid_bitmap);
> +            domid_last =3D domid;

Rather than setting domid_last here, I'd move it right before the spin_unlo=
ck()
gated by "if ( domid !=3D DOMID_INVALID )". That'd also bump domid_last in =
the
exact match case.

It also allows to drop the (then) redundant braces.

> +        }
> +        else
> +        {

nit: redundant braces

> +            domid =3D DOMID_INVALID;
> +        }
> +    }
> +
> +    spin_unlock(&domid_lock);
> +
> +    return domid;
> +}
> +
> +void domid_free(domid_t domid)
> +{
> +    if ( domid < DOMID_FIRST_RESERVED )
> +    {
> +        spin_lock(&domid_lock);
> +        __clear_bit(domid, domid_bitmap);
> +        spin_unlock(&domid_lock);
> +    }
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index bfe2e1f9f057..8ef0c147c9b0 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -49,20 +49,6 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodem=
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

Good riddance. This is racy without the domctl lock.

> -
>  void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *in=
fo)
>  {
>      struct vcpu *v;
> @@ -421,36 +407,18 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t)=
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

nit: IMO. If createdomain didn't set domctl.domid, we shouldn't return EEXI=
ST,
     but ENOSPC. It's a very impossible case, so I don't care much though.

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

Cheers,
Alejandro


