Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD08B08ACB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 12:35:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046557.1416880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucLxJ-0004mf-TY; Thu, 17 Jul 2025 10:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046557.1416880; Thu, 17 Jul 2025 10:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucLxJ-0004ks-Qg; Thu, 17 Jul 2025 10:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1046557;
 Thu, 17 Jul 2025 10:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucLxI-0004kh-PK
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 10:35:12 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2416::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e4d139-62f9-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 12:35:08 +0200 (CEST)
Received: from MW4PR03CA0272.namprd03.prod.outlook.com (2603:10b6:303:b5::7)
 by CH3PR12MB8481.namprd12.prod.outlook.com (2603:10b6:610:157::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 10:35:00 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::f4) by MW4PR03CA0272.outlook.office365.com
 (2603:10b6:303:b5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 10:35:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 17 Jul 2025 10:35:00 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 05:34:57 -0500
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
X-Inumbo-ID: b4e4d139-62f9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsJK13ev/xiLK3xYQcE172Wz3BiNFgY1w/WifnXG6nLYkp8A4IXP7NAt7pDkcHro2W8xRtk+wFSp45uJERYEn/hAhofOzxSozkvBvdN7e/err/Gmhh+c4mlbtXmoZrDqp3bTtS6+LvWfDnILPryDaSkddFwzZsUilxLd3oMqEWS4q+KOIktUTqx2I9NXS8PQFO+XXQi6pPPTW91rjiA41hLqoJTgRcZxS3+fXTNFNuANUp3RsRm/eeUH1Fk9GMIbXruI6LzB3zgMQXXDpgY3+sMKeLMy+CD+uD8b19NxNeDddD//Eq+li9pDjMEXGfsHIVmpZu5hMMRzghyDVz3MRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hagBnJwKCeEezhfN+8rqc5x6t/L0kK62IsP3VCZ+tNY=;
 b=GTmC8GPfk5n2p99dYtFcHTAOwyQrCx5V/7xsMAeQwHaNA0i1K+RSMBAP3JdQ1l4fxPS+4Xb6kmNwmblWPPP94IqljVAoWfbuEObIn96sWU2sfNqo9RihhqMg5Y4exlMnEX3k3ABhFeJ3eFZwPONU3+ioU+43P1FDw0I7WniYLR57xYgwtAcjFGYvrvBkC2KhhUNfQfBZXE1/jW/mg7JIVM/lRo6VQI7WKXujWmnDAJdIiy7bjA1/xni47tp2dZD0xg4C9T4PViGs9Ow8X3kp7DMTf+4mT2NY8SrdZqofCRlURZA9mA3cdeQEwz8I6CtbgilErIWNtXpORO4eTxRczA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hagBnJwKCeEezhfN+8rqc5x6t/L0kK62IsP3VCZ+tNY=;
 b=J+ckDU7LHxz18GU6E9c14pnqjHYREqpS4K2FeAwmhBCyUbTPszIMTaUeBo7jsbNcnphcJ4iI2ZzDHzqsLN4d4/0Hr3UWZn3QrWLP1rb6fPieYQSRy5HONF9PyNKFBDiFfV0BjT955MONqMnl+uU43XKI0N0gHtkU5iQGngRQuCo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Jul 2025 12:34:56 +0200
Message-ID: <DBE9HJ5W3RUO.2K451XN5JAWG9@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, <dmukhin@ford.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v10 2/3] xen/domain: update create_dom0() messages
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250623182721.194238-1-dmukhin@ford.com>
 <20250623182721.194238-3-dmukhin@ford.com>
In-Reply-To: <20250623182721.194238-3-dmukhin@ford.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|CH3PR12MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: a611d5f5-6026-4723-8f61-08ddc51d9552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGVBRmFSL1d3dVpzd2p0SXdGQkozcGJGUTFEdjlydHNCaDkybUU5NEJtaE5t?=
 =?utf-8?B?M2ZLWno3WEJOR1dZV0dwcHNDQW9ia29tbitseFo4WlNES1p6S2dWeUFjbGdO?=
 =?utf-8?B?SmROVkc3L29lTUNFQ1lEVlhXTnVSWWw5NmY5ck9wWHI5WXQ5alBMQkNnalNy?=
 =?utf-8?B?MHo1RnQ2L01JQTdYY3Z6Z01WOTc0VzBkeG11Wmg4UlFpMjlVWWFsd2tPTmdz?=
 =?utf-8?B?aHUra0ZkK0paTjVHbGljdGhOc2N3Y3BxK28wTHVheS8zZysyN3JjNG9qTk1t?=
 =?utf-8?B?bFQvckNVMDNTL1Y2MW43bXBEMHB5MXFZZHhVdU1VMDhUZzR4b1dVYjVUZzll?=
 =?utf-8?B?Um1aWVRxVHdrM3BZdHArOW1TV2RJZXFmZjkxZkgvQXliSy83MnhmY1JGdDU2?=
 =?utf-8?B?Ui9ONlVhaGVvVHVDN2dWNU10dU14clA5MHJYVUZpU1BUMFJJbENKRlVuSzIv?=
 =?utf-8?B?TGpoa3Q5VUZ6aXY5ZFB0UzR1aGl2eWNMTmliTlV5Y1hST2xlclhlQXozK2w0?=
 =?utf-8?B?T2gxbHNpKzBNc3ZZcjJVaEhvWnRvZjVBZnBKd1VpRTZVSklvNWVVSUpjS3FW?=
 =?utf-8?B?UnBINmUzSHVQMEdnUHdYZ3hwVDFtZDdrZVU2czNmRHNCYTFxR09sVTI5dzhM?=
 =?utf-8?B?N3grUUNDVHhmcE9EdHpaMmlSVzhDNmhsbmgwVU1meHlTMzNoS2FYTmxuNzJy?=
 =?utf-8?B?ZG1icVIrb3F0SFR0TGtxN0VDU2FoM0hQUVhpRkNtbjJVK0JRU1F6K2YyWXRV?=
 =?utf-8?B?b3JyZUxlZzI2aCtwaGhCOHNjMjFHY3BXWnVWZVRQOTVxdnlJS0owWm5sejE2?=
 =?utf-8?B?ZjlEM2p0eGVFRlJtbnQ0YThrVmVwdW82bDNlVmRWb2hqQ0tJUFIrdWQ2TXc4?=
 =?utf-8?B?RS9ZUGxwWXRaOGtGWGVldWFpbVpuTWMxYlovV2R2bGJKeUdsK3pZNmxOa3RD?=
 =?utf-8?B?YjVqc0x3aEc3czl0UWlTZUFqMTIvTEl0cjEvbFBiVjA2RlZZbHBPcmdVWU00?=
 =?utf-8?B?UVpHeXl3ODhyT2xoRXZzWnJ1bDdISWZEVzhXaGNoWCtsaUFaNEg1Qzd4M2Jl?=
 =?utf-8?B?QXBwakZ6WWpQSS9Kc00vMk13VnZBVjhjQXR3VVloVjcyaGRuMU1OZnZ4L1NB?=
 =?utf-8?B?V3RvUUdSREhjZHNwQTF0eDNUY0pUSUUvY01nQjEvSXQzTlFOc291MTdibktM?=
 =?utf-8?B?akVJMkE4ZFlBR3Q4R2xlcmpKZVd0K1VoT1NOL00vL2M1ZEphMmNiWGZrOUIw?=
 =?utf-8?B?UW5qdGRhMFJJY3BwM21zUU5LQUhxamRkdE0yalV2T2pOWWxnbGpNUWUwUjYz?=
 =?utf-8?B?NE12MUo1bXFiUWtqVHVWSS9EMmNlbFgvdk5zUnduMXBOa0xmWUE0RzVSWlFU?=
 =?utf-8?B?dFd5TUxSZm9aT21qdGZHc2JyMlZzWk9sNTloa3NHT0U4aVFWeSs4N0VZdzJB?=
 =?utf-8?B?ZjIycjNKOWpuSUd5S2oxMGJ1T0krRnlWWm5qeUM3dWNQWHR5SG9YeU00bloz?=
 =?utf-8?B?TncvaS96OW1zbUNIUVFOaUV6SG1vMWYxWjhkNUgwUTE5bkNWK0FweVRaejBO?=
 =?utf-8?B?NTdoT29qK1JRYXQvY21LMUtvaldHSzkwVzlOdUprdDc4eEdNbFRJRE5JRmVn?=
 =?utf-8?B?czdTenVtR0NrTHVFSjlyQTdLYzNoRlRCdHRrL2l0dmVLekE5cWJUN01SMVVm?=
 =?utf-8?B?dHgwU0RTd3p0bGtNS0VsU0tPWnpEd2hhSTNPaGNNd0pnaUhWWWdQb1J6cVZC?=
 =?utf-8?B?S1hKK202SnFNcHRmWGJuRXZ6V2tYN0t2WmUyV2cyY2orVFA5VVg0d0hzUGhu?=
 =?utf-8?B?NWdVKzVhSS9zNDg2MUpRVDVCUWF5MlRWN0xlZDJFa1p0bzlGOVFsYTZMTktQ?=
 =?utf-8?B?VnV0cFErNHp2Z1Z5aG9VcWt1K0RFOGhIMFMxVlZZSUprcGI4Q3lQeXpYUFVk?=
 =?utf-8?B?bnBTUTZieWVsR1VzUG5WN2pHQ0dnWkloZlpmajR5MHhqUTl1L3VXQXJpNlFt?=
 =?utf-8?B?VTB1Y0MwSFA0Y3A1UldYa0lGL1F0cHE0STdIL1hiSGJ1VWZiZXI2VThVWVRN?=
 =?utf-8?Q?2oM+fq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 10:35:00.5079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a611d5f5-6026-4723-8f61-08ddc51d9552
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8481

On Mon Jun 23, 2025 at 8:28 PM CEST, dmkhn wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Use %pd for domain identification in error/panic messages in create_dom0(=
).
>
> No functional change.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

nit below. But with or without that change:

  Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

> ---
> Changes since v9:
> - new patch
> ---
>  xen/arch/arm/domain_build.c | 8 ++++----
>  xen/arch/x86/setup.c        | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9fa5143eb98c..b59b56636920 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2080,17 +2080,17 @@ void __init create_dom0(void)
> =20
>      dom0 =3D domain_create(domid, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
> -        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0));
> +        panic("Error creating d%d (rc =3D %ld)\n", domid, PTR_ERR(dom0))=
;
> =20
>      if ( llc_coloring_enabled && (rc =3D dom0_set_llc_colors(dom0)) )
> -        panic("Error initializing LLC coloring for domain 0 (rc =3D %d)\=
n", rc);
> +        panic("Error initializing LLC coloring for %pd (rc =3D %d)\n", d=
om0, rc);
> =20
>      if ( alloc_dom0_vcpu0(dom0) =3D=3D NULL )
> -        panic("Error creating domain 0 vcpu0\n");
> +        panic("Error creating %pdv0\n", dom0);
> =20
>      rc =3D construct_dom0(dom0);
>      if ( rc )
> -        panic("Could not set up DOM0 guest OS (rc =3D %d)\n", rc);
> +        panic("Could not set up guest OS for %pd (rc =3D %d)\n", dom0, r=
c);

nit: s/guest OS for %pd/%pd guest OS/

> =20
>      set_xs_domain(dom0);
>  }
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 7adb92d78a18..28bcfd1861d4 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1080,7 +1080,7 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
> =20
>          if ( (strlen(acpi_param) =3D=3D 0) && acpi_disabled )
>          {
> -            printk("ACPI is disabled, notifying Domain 0 (acpi=3Doff)\n"=
);
> +            printk("ACPI is disabled, notifying %pd (acpi=3Doff)\n", d);
>              safe_strcpy(acpi_param, "off");
>          }
> =20
> @@ -1095,7 +1095,7 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
> =20
>      bd->d =3D d;
>      if ( construct_dom0(bd) !=3D 0 )
> -        panic("Could not construct domain 0\n");
> +        panic("Could not construct %pd\n", d);
> =20
>      bd->cmdline =3D NULL;
>      xfree(cmdline);


