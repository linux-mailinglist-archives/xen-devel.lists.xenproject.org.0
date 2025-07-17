Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA0B08B73
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 12:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046590.1416943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucMKn-0001ow-Ji; Thu, 17 Jul 2025 10:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046590.1416943; Thu, 17 Jul 2025 10:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucMKn-0001md-H4; Thu, 17 Jul 2025 10:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1046590;
 Thu, 17 Jul 2025 10:59:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucMKm-0001mS-53
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 10:59:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2416::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19ededab-62fd-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 12:59:26 +0200 (CEST)
Received: from MW4PR04CA0172.namprd04.prod.outlook.com (2603:10b6:303:85::27)
 by IA1PR12MB6186.namprd12.prod.outlook.com (2603:10b6:208:3e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 10:59:20 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::da) by MW4PR04CA0172.outlook.office365.com
 (2603:10b6:303:85::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Thu,
 17 Jul 2025 10:59:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 10:59:19 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 05:59:16 -0500
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
X-Inumbo-ID: 19ededab-62fd-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkoKRnIoAdvNL1j6qcF/RDrZ5tzhBBbr2XZwzMf5wp9Rl0cH6fPzsc7I4oJfnjpuOtAK6rLt81ehu/B1DejQGCN38cuSUT0rI1pwZs1U5lUU0wbC5VZXPhXc1Y94fXIZmy1kXbTqTQzKF2eQvGl4r4NAWpjtu10gYp4v0tJN/QCkscEhSkzQaRqL2rfvspY6nR56PBFBKymSvzgXznHZHBRn3KQj+sajo6/YTGLjSnFQ4gHoBi7Q1GojX6MLuV8yV6DoIGq7Gu6kn6KnfKCk/XxrFrEQmLsgciNwPf3ssdVIH1As/wDjqdks01IY9MyYuhIo/b1He1mphLJ0w6G4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZbVjUSKbBzMmoXlEHPxqPc9/yv7PUX40JWLW+NUzWM=;
 b=fX9+uNt1X6JHcR6ZHVHsygU3rq6rKiEF+/wEdOq9P1r+YKqK8Q5bN9wTngNvL+cxInbK5frlwhkl8ChFNbyOMNw5oEx4ncb+u/WFAteITbkKnM1dBQx5zhGnarYZsnleZF5okiXxUM0uaRKaKUtkR39hzjD7o11sGO1WjqDwHJwMV4jgKnv7zGdvUhf4d89ipmZIwN2aNKKH5Zy/72tsPSUMsah9os0DUbUuRQWsAEPTB1ZlruIWKPX4i62RwMDec13mxUK3HQONp+RSSpjUDfPyYMArwzQJeeThanQovYjyNHDLIo5j8v9XUlcHsnYFpNVzmJKOc0dA5bnKKa0F1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZbVjUSKbBzMmoXlEHPxqPc9/yv7PUX40JWLW+NUzWM=;
 b=Z4pjG30+xH3DTS6n6DV78+KOtRmhGTPbLIaemvSz2x0iks8xkJwNMXD6K1bEYZN8/kT4sD10adMDmz68c2NyfQP25Bz2wrrmITXZSAjfPuWHHfFOZ2Ogx7XvZaG+CsHv0QVy2vYpJNH2/UCjueFBpIfH0ti9Nx7vsi0a6cVxHkk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Jul 2025 12:59:15 +0200
Message-ID: <DBEA05LLKKR8.2SWMMEL6KJTL9@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>,
	<jgross@suse.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v10 3/3] xen/domain: use get_initial_domain_id() instead
 of open-coded 0
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250623182721.194238-1-dmukhin@ford.com>
 <20250623182721.194238-4-dmukhin@ford.com>
In-Reply-To: <20250623182721.194238-4-dmukhin@ford.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|IA1PR12MB6186:EE_
X-MS-Office365-Filtering-Correlation-Id: dfac6fb7-d7f1-411f-3ec7-08ddc520faef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmJHT0pvbjdsTmJ5eEtqWkVVUjFOZitCTTl1bXBPWjZOWlErRlZpVVNDMGFj?=
 =?utf-8?B?NjhoRDlyc3ZlQSt4anAzQW5jbEtzdVZITVFyeUlMNmt6UE1OZTJKTTJaS1pM?=
 =?utf-8?B?WDc2R3hzYW16Z1BwRFArYkJKTFRTOWxsVXA3UGhWZW1saTFnb1preCtaUFhn?=
 =?utf-8?B?TEo3OGwwOTc1MVBSemt1MUFybUtLMStCbXduT2FLT011Qnd4amdPU3ByTlZz?=
 =?utf-8?B?U0NiTm4vQ1pUcTRITkQwQ09mMk5HQXZBSEtseEIyTmhBR0Mwb2UydGtYRmp0?=
 =?utf-8?B?TGNVeWl0TmRMZUVWak9TdHBkaVR6Q3E3dkxiU1dySGsxKzB1OUs4WEk1SVRu?=
 =?utf-8?B?T1FmS2w5R1ZoUFJlSUlkRzlOYW1DTEg0c0xOU0wvNHloZHRTODVlajRIR2Vo?=
 =?utf-8?B?U1laeWJvMHlHTEl2U3RZM0xhZ1JSYWxHRmYrdU45RWI5bk9SOVVhTzR6K0pp?=
 =?utf-8?B?YzdrUW4vSjV1MHE3UitZdXVmMlY5SWZBcE1YMGV3QVF4YlhiK1pVbUpIL2tD?=
 =?utf-8?B?OWN6Zk5uUVZ4c3BFcTg3bzNVMm9JclpuRkRzK2cvOEtxclg0eWpiazB1dTdK?=
 =?utf-8?B?VmVHV2N4UGsrMFpKVTYvTFlkblhZYjZOeWFmV2lJZjNEeEpkUTE5c3hMZmkw?=
 =?utf-8?B?Nlo0VkhsQ0NDY21FUGRVaDJYa0xjSlRCZDg5OXUyUStWaGltMkNhZzh4bTEz?=
 =?utf-8?B?L0xHZmdyWVIwWGhDQTJ3OW9oTmc1UzVkUWcvOEhldmQ3Z2UvTVNZU2Nzdm1s?=
 =?utf-8?B?a1pCclplRERSZlZkLytJNnJNSndYVHo1VDlhRW1mdzJSSUFyWmFyVjNXeFo4?=
 =?utf-8?B?RnkvNW4xemc3WUp2M0pycERDSHBwTnV5NGVZOGM0UVJ1NzVkZmlUQ3ZQM003?=
 =?utf-8?B?d2lGa0pObWVPcWVtN2hIcnozSDVMN3BDTlNYbjJsd3hiSVNnSEczNEI4WG9y?=
 =?utf-8?B?TXVLdDV6VXQyZHJnejg4YWpsS2tVZGdnVHJCNmFkanV1MnBhV2N6dUdpS0lp?=
 =?utf-8?B?U2N2N1NvdGxIclhOTkExSWlIcS8wWlZ3Z3ZmS0JuVlhSN1RWMlRIN0RnaW8x?=
 =?utf-8?B?eVlVcmZ5cEhoWVcwZHlpQ0FFdzhLK1NKTGxvUmV4eDdSdWtHWGJQQittU1dL?=
 =?utf-8?B?cG9Vb3VndnlESXAwcjNiMDFJalhualRNbXpGR3VTdkVOSlFuazNUS25OaUpm?=
 =?utf-8?B?RGtyalZGSFpnMGtEZ1pIUTdIVzFXdlZPc0RHWVZCRmpURFlLT09oQlYvQ1dB?=
 =?utf-8?B?eFNtSEtWL0M2L3dCWDhvZVNJT2xTSi9HeFJiWXArM3NzTUFOMTI1aGpYQSti?=
 =?utf-8?B?dnNYME43YzI4UzlJM01vai9RUkxFeGJBM0dFSGdEOGdrV20wb3NBNnZJZ0R6?=
 =?utf-8?B?MGU4SlJCNnZJMS8zazhuQ2lXYXRpbHg5dkkvYVJ4bGsxL2hQSlhkNkh6Sytn?=
 =?utf-8?B?eC9Va09RblZONUZFYzJtSjZvYkE4UkEvYzZXNi8raUViekxtMXNvNUJuV0o2?=
 =?utf-8?B?VCtsRkk3ZDR6OStQeXpNekNHaUZvNzR5aUY0U0RmcVBkUmhIcFBVa29KVTZW?=
 =?utf-8?B?Z1hMeU1ZV2hIMTd2YzBUYkZqZUx3N3NHdmFYcFBhVE1kUXA3RG8wZGxiYUds?=
 =?utf-8?B?NVB5MVJsM0l6SngwcEtGTFJFVk5PaXdpU2M5WndsTlpUZnZoNnRVTkNxcGEw?=
 =?utf-8?B?bG1iZEFVNTVBbjNZdG1lTlUxblBXTjMxME03cXRiU0o2WTAvb1F0UWk3TDRM?=
 =?utf-8?B?SCtEdTA0QlQ4aXZucWljZmU5dFdla2JST05HVWxsRk05eU43ZFZkMUVTN1pT?=
 =?utf-8?B?V2pyRklUY0JLOTEyZW5SZFVWUEE0Wkl2bzgrbmNGM2ZoYldBeWxWSXZqbmZM?=
 =?utf-8?B?OGRYZ2o4bDM3WmtOa2NWSCtBTlA4TXM1T0R2amtSQzFyZHlrTWMyVUVxeVFa?=
 =?utf-8?B?WVFkV25oSmZWWnRac0JOMnR0NW9vZzZmcWJxY2x1dklmV3hMdXkyblcrNnJw?=
 =?utf-8?B?ZnNsalNLS2d5RE50cGI2NFNTMkppcGVhUTU4d2o1SCs1aHpZWUpYV0RwSUtN?=
 =?utf-8?Q?vE5nUg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 10:59:19.4744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfac6fb7-d7f1-411f-3ec7-08ddc520faef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6186

+Juergen for late-hwdom bit

Hi,

On Mon Jun 23, 2025 at 8:28 PM CEST, dmkhn wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Remove the open-coded domain ID 0 and replace it with a call to
> get_initial_domain_id().

Ideally we'd be better off replacing it where applicable with  is
hardware_domain(), or is_control_domain(), or a ORd version of both dependi=
ng
on what the hardcoded 0 means to do.

>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v9:
> - new patch
> ---
>  xen/arch/arm/domain_build.c | 4 ++--
>  xen/common/domain.c         | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b59b56636920..b525d78c608f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2074,9 +2074,9 @@ void __init create_dom0(void)
>      if ( !llc_coloring_enabled )
>          flags |=3D CDF_directmap;
> =20
> -    domid =3D domid_alloc(0);
> +    domid =3D domid_alloc(get_initial_domain_id());
>      if ( domid =3D=3D DOMID_INVALID )
> -        panic("Error allocating domain ID 0\n");
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id()=
);
> =20
>      dom0 =3D domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )

On arm this is just another level of indirection. It might work as a marker=
 to
know where dom0 is hardcoded, though. So sounds good to me.

> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index be022c720b13..27575b4610e3 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -492,7 +492,7 @@ static int late_hwdom_init(struct domain *d)
>      struct domain *dom0;
>      int rv;
> =20
> -    if ( d !=3D hardware_domain || d->domain_id =3D=3D 0 )
> +    if ( d !=3D hardware_domain || d->domain_id =3D=3D get_initial_domai=
n_id() )

This is tricky. get_initial_domain_id() is only non-zero in shim-mode. And =
in
that mode there's no control nor hardware domain (hence why the initial dom=
ain
id is not zero in that case).

>          return 0;
> =20
>      rv =3D xsm_init_hardware_domain(XSM_HOOK, d);
> @@ -501,7 +501,7 @@ static int late_hwdom_init(struct domain *d)
> =20
>      printk("Initialising hardware domain %d\n", hardware_domid);
> =20
> -    dom0 =3D rcu_lock_domain_by_id(0);
> +    dom0 =3D rcu_lock_domain_by_id(get_initial_domain_id());

Hmmm. More generally this is probably trying to find the previous hardware
domain. Which the caller already has a pointer to.=20

Maybe this would work?

```
	-static int late_hwdom_init(struct domain *d)
	+static int late_hwdom_init(struct domain *d, struct domain *old_hwdom)
	 {
	 #ifdef CONFIG_LATE_HWDOM
	     struct domain *dom0;
	     int rv;

	-    if ( d !=3D hardware_domain || d->domain_id =3D=3D 0 )
	+    if ( d !=3D hardware_domain || !old_hwdom )
	         return 0;

	     rv =3D xsm_init_hardware_domain(XSM_HOOK, d);
	@@ -493,8 +493,6 @@ static int late_hwdom_init(struct domain *d)

	     printk("Initialising hardware domain %d\n", hardware_domid);

	-    dom0 =3D rcu_lock_domain_by_id(0);
	-    ASSERT(dom0 !=3D NULL);
	     /*
	      * Hardware resource ranges for domain 0 have been set up from
	      * various sources intended to restrict the hardware domain's
	@@ -512,11 +510,9 @@ static int late_hwdom_init(struct domain *d)
	 #ifdef CONFIG_X86
	     rangeset_swap(d->arch.ioport_caps, dom0->arch.ioport_caps);
	     setup_io_bitmap(d);
	-    setup_io_bitmap(dom0);
	+    setup_io_bitmap(old_hwdom);
	 #endif

	-    rcu_unlock_domain(dom0);
	-
	     iommu_hwdom_init(d);

	     return rv;
	@@ -967,7 +963,7 @@ struct domain *domain_create(domid_t domid,
	     if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
	         goto fail;

	-    if ( (err =3D late_hwdom_init(d)) !=3D 0 )
	+    if ( (err =3D late_hwdom_init(d, old_hwdom)) !=3D 0 )
	         goto fail;
```

Juergen, do you have any thoughts about this?

>      ASSERT(dom0 !=3D NULL);
>      /*
>       * Hardware resource ranges for domain 0 have been set up from
> @@ -2479,7 +2479,7 @@ domid_t domid_alloc(domid_t domid)
>          if ( domid =3D=3D DOMID_FIRST_RESERVED )
>              domid =3D find_next_zero_bit(domid_bitmap,
>                                         DOMID_FIRST_RESERVED,
> -                                       1);
> +                                       get_initial_domain_id() + 1);

IMO, this should be either 1 (for defence in depth against using zero) or 0=
.
There's nothing special with any other initial domain ids.

>  #endif
> =20
>          if ( domid < DOMID_FIRST_RESERVED )

Cheers,
Alejandro

