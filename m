Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4F6B0A187
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 13:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048489.1418713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucitu-0002LD-6D; Fri, 18 Jul 2025 11:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048489.1418713; Fri, 18 Jul 2025 11:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucitu-0002JP-2w; Fri, 18 Jul 2025 11:05:14 +0000
Received: by outflank-mailman (input) for mailman id 1048489;
 Fri, 18 Jul 2025 11:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us2c=Z7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucitr-0001tY-Ud
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 11:05:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2414::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1015babf-63c7-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 13:05:07 +0200 (CEST)
Received: from SJ0PR13CA0026.namprd13.prod.outlook.com (2603:10b6:a03:2c0::31)
 by LV3PR12MB9233.namprd12.prod.outlook.com (2603:10b6:408:194::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.27; Fri, 18 Jul
 2025 11:05:03 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0::4) by SJ0PR13CA0026.outlook.office365.com
 (2603:10b6:a03:2c0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.15 via Frontend Transport; Fri,
 18 Jul 2025 11:05:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 11:05:02 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 06:04:58 -0500
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
X-Inumbo-ID: 1015babf-63c7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUx7mxNmqYd0yUEmWtJiMaCHfXMPspCchlpXam7+sNoq/F+OhMzS/b8ghQAF6FpwLDp/4jeQMORRfMPL53jKZ4V8fnZg1GxNL1B/BwwEof5kaKFDBzZXlakDF4zAkUA9b+Wbbym4PqDFDllPZLXlCjIoe0Oz5bHJxL3Vkn3iB5vPoQ4vPzuhRkJYgbQtkhrX2G6ahFRjAEHEHlKjyKdmlQvub2s1bF2WAjxm1slz/wZ5c7Ap49hUFQBh1OAVPbDKNQ29PcLds+NUhjwGdHk4xSyUcoNiKgx9WAmoMpJi4oAAtj/xnxS58mx3FO3QRyLAoskaf3U44mKACxLOicCh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MIYp3ilmABwnVsElIcIvBp9zry/SK0K2hMs9kmhwAY=;
 b=hVetoHdnsK5q9pHSqQfS1UHvXtrUiz1H6XgnaW2ORw80Mhg/pdzpZFqTsE61XYw70GvmWWc9KuIdULV5GJ1ndJwXKqnpOTxVCakcoFtmTvj6XeHhk49QiBH956ZtCL1njrHe9SGEqM/yQ1log1gfzM/PCn5Zs+X5QriSryuyOO/1BIVxBpcUVXwuVN5p35vKNjbOHFroKEQRLqId57R/L5JiaTa6xzsE4p/U0ate+nwDkmhKtEKwi0la6Fvm/4YrjBF4KOFqpJY7qjCaqaiG06GjwskmrdDA8TPxVqwgU9wnSOkC51MRYPG2nCox+i7WGr5J6zR3FwE4v5h0BBXNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MIYp3ilmABwnVsElIcIvBp9zry/SK0K2hMs9kmhwAY=;
 b=M4Uhtaf9vSdm7xu0XTiYkckf8bzkMSRibXYY2cgSMWj9vavDlIas47wudJJpqQgcjg2tswjwF2AiQoUrVmXT2jOERnrEUWemptRE9pTU8Fu++i8NlvoZOdYeH4l5FKe+SZiznjyRafR/vE1n6Ee6yKFA10LFhilaqphrumT9O28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Jul 2025 13:04:56 +0200
Message-ID: <DBF4R1PG1FZP.13QERUGFTBZY0@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v8] xen/console: introduce domain_console struct
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250716020447.1029992-1-dmukhin@ford.com>
In-Reply-To: <20250716020447.1029992-1-dmukhin@ford.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|LV3PR12MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5410c9-d0c1-4df2-182f-08ddc5eaf1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnZ5OEJLVnlKeEE0R2VqMmNOMDl4ZVU4TS9uVllILzBudSs2MmdpK3BoTzVl?=
 =?utf-8?B?MkR5V3J4SkdiWitVOTQ1bGhlRWI1N29XR2t5K0dLd0Y3ZEMzTTZHMUhRQzY3?=
 =?utf-8?B?cnlYY0EvTXY0MUlJTE42VXNRMzYrZlJXdGJUdjNuZVU2QnE4a2ZnaTdpNnNk?=
 =?utf-8?B?N3NndFdsc1NscUJ6MHM2ZXdMZXpiZmxRV3R4TnovenpXVGk0cDhsMS9uK3lD?=
 =?utf-8?B?U2JkQTVoZW14b051NUtxOUdiS2xVcjlWMzd2UDZDU1JJMTA3cnR5eXhxVkoy?=
 =?utf-8?B?YTZHQWVvd1FmVEdzRnpaeElZUHNMOVp6RDBFT2dFOTNsQ0tTWlYzY0dMZmdU?=
 =?utf-8?B?OUdXSUJ3RVpMM08zRmNRaFJUaWg1enlZTjJGemVyT3BXdkFQcTB2T3hTWEtL?=
 =?utf-8?B?QmxBRW5aWFRMVzZ5Zm4wTy8zZHFLak5ycWhMeEVSVDFDMDR0V3cwYUVteTli?=
 =?utf-8?B?VEUvQkJObUJzQlVVT3QxNGtNMG5jaTJ3b28vRHJDV29VaFVvMnZkWnNQaU1M?=
 =?utf-8?B?czBRb0ZHRE9qL1hDK3JEWmMremF3dldzR1BjTTVzNThibHkrMU5JcDJWek9m?=
 =?utf-8?B?dnlybWZxbjZ5dFo1SHNyQmlWa0FTQ1BsL0RFeTRGOGdETlhIeTdxa0hQUWt0?=
 =?utf-8?B?NXBIa0FuNFVhY0lBV1o1N2ZWQUprb2dyTTh3cDZXdWNqaGxyd3YwWENtTkJ1?=
 =?utf-8?B?SjZBV3JIM3g4dGx6UDFsanhiL0M5blp1ampZbWJ5alhxdkljdFA1TGJmdXUx?=
 =?utf-8?B?TVo4M3MwVXlLang1WE5OSU1QMG8yODJjMDc0M01NWWQ4aDU1NTZISkxCOEZW?=
 =?utf-8?B?NkhYbTlsNGxleXQySWZVaEJjNEJXQWQ5Sm5jSlgySHArTTVqbjZxT0RtMFZV?=
 =?utf-8?B?RjRxV0hNQnF0c2tndTNZai9CYm9YNVlTY0M5bFJJRk1lYm5IdXhMK2oxT3Bs?=
 =?utf-8?B?bWhYcmhzUXorNjFGNjNNU05DWjVNbSttZ0xZcHJUV3BFdmo5UGlOWVJnNkc4?=
 =?utf-8?B?Q0dkdC9TbDQwckJjS2tTQ3FJTkZsRG1POFppcW1PaFJIN2tGbjF5bmdtZHow?=
 =?utf-8?B?YXJpZHhZZSs0TUNkU1FqUENQNEJYaCs1MUVha1lWMWFVWndzNEVxd3A4azNz?=
 =?utf-8?B?eStkTUlrbm12cUxHeEFFRDVXU2VSLy9HUytzV2dzK1lKK0d2WjQ5RzFqeWRF?=
 =?utf-8?B?dC9OOEVXL0tRUFd5S01aR3pQZzZEZlA4T0w3WXJXcTdrUGRaNW9ab0tkZHdz?=
 =?utf-8?B?VjRlRFVtYzE3Q1kzQW5HM3ZBRFdMWDJCKzRvVUI0bTFYaUtQZ2xNZ2trelRs?=
 =?utf-8?B?blZSK3R4Rzd0Rzc5dUVqOHdhTThQRm05eGp5eHVTRFpRNDZ2TG5pOU9aWll2?=
 =?utf-8?B?RUxtMENNVktyWFk4WGo5RllCOUtBVjU1SFdXNG5hN1F5NkVOV1I2YVJtYURt?=
 =?utf-8?B?V0V5QTk3bmJuK1ByTTV1cnVzTDJjMXFnemt3Z1p0MXhmejJlNFRQQTRTLzJO?=
 =?utf-8?B?S1FjUDIyV2k2MGxCMTBNT0JEaWRjd0xKNWNDblM3YTRKMzM1cUF5MFBFaUVO?=
 =?utf-8?B?K3dhclg5aENzOXpHMTJxbkpLUGlWc2pCRkZUS3E2U2tIamZYejlTYjd4WkdZ?=
 =?utf-8?B?WFRHZTJJMk14eUlya2ZQUWxhU09qUlBJVTRpN3lkV1U4UTl2dnJTQnBlVkZB?=
 =?utf-8?B?WU05b3k1cU5zQ0xIZ2hRZ2x6RTUrRFFCNlhxNVYvMERpUUhsWWJHRjVjOVlo?=
 =?utf-8?B?TmdnR1J1ZjZ5QWxUUWNXNkpKN3NCN3NuNXBVVERQNS95NzJEUVRZM1NBeVVx?=
 =?utf-8?B?dWNTVVYxdnVuZVo2bkpJbk54MWNOZlJQbTFVZWQ3alk3M3grTTVydTY1M1Nw?=
 =?utf-8?B?SzM1RXJPbWtzSXM4ZUg5SGFCK09obTNwdmNlaERJRFpOQ0hROTV2U1VwNGFi?=
 =?utf-8?B?RGp2bEFsSUtqeitJYktiMGdyL0hiRnMzZG50MkIrOTNOU3JYTTFjNkJlVjVl?=
 =?utf-8?B?WVpGdGZ4bXlOcDR5L2ZzalRuUHpUTGdTdnEwb2VoLzJ1NmtXZnRxUFNLdDFV?=
 =?utf-8?Q?9RXq8E?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:05:02.5020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5410c9-d0c1-4df2-182f-08ddc5eaf1cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9233

Hi,

I like the new encapsulation, but I have a few questions.

On Wed Jul 16, 2025 at 4:04 AM CEST, dmukhin wrote:
> From: Denis Mukhin <dmukhin@ford.com>=20
>
> Introduce domain_console for grouping data structures used for integratin=
g
> domain's diagnostic console with Xen's console driver.
>
> Group all pbuf-related data structures under domain_console. Rename the m=
oved
> fields to plain .buf, .idx and .lock names, since all uses of the fields =
are
> touched.
>
> Bump the domain console buffer allocation size to 256. No extra symbol fo=
r the
> value since it is used only once during data structure declaration. All s=
ize
> checks use ARRAY_SIZE().
>
> Allocate domain_console from the heap so that the parent domain struct si=
ze
> stays below PAGE_SIZE boundary to account for more console-related fields
> added in the future.
>
> Finally, update the domain_console allocation and initialization code.
>
> No functional change.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v7:
> - use ARRAY_SIZE() for cons->buf checks
> - update the commit message
> ---
>  xen/arch/arm/vpl011.c      |  2 +-
>  xen/arch/x86/hvm/hvm.c     | 18 ++++++++++--------
>  xen/arch/x86/pv/shim.c     |  2 +-
>  xen/common/domain.c        | 19 +++++++++----------
>  xen/drivers/char/console.c | 21 +++++++++++----------
>  xen/include/xen/sched.h    | 22 ++++++++++++----------
>  6 files changed, 44 insertions(+), 40 deletions(-)
>
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 480fc664fc62..d0d17c76b72c 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl01=
1_init_info *info)
>      }
>      else
>      {
> -        d->console.input_allowed =3D true;
> +        d->console->input_allowed =3D true;
>          vpl011->backend_in_domain =3D false;
> =20
>          vpl011->backend.xen =3D xzalloc(struct vpl011_xen_backend);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 56c7de39778b..684d2c0c195c 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
>  static int cf_check hvm_print_line(
>      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>  {
> -    struct domain *cd =3D current->domain;
> +    const struct domain *d =3D current->domain;
> +    struct domain_console *cons =3D d->console;
>      char c =3D *val;
> =20
>      ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
> @@ -571,16 +572,17 @@ static int cf_check hvm_print_line(
>      if ( !is_console_printable(c) )
>          return X86EMUL_OKAY;
> =20
> -    spin_lock(&cd->pbuf_lock);
> +    spin_lock(&cons->lock);
> +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
>      if ( c !=3D '\n' )
> -        cd->pbuf[cd->pbuf_idx++] =3D c;
> -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\n')=
 )
> +        cons->buf[cons->idx++] =3D c;
> +    if ( (cons->idx =3D=3D (ARRAY_SIZE(cons->buf) - 1)) || (c =3D=3D '\n=
') )
>      {
> -        cd->pbuf[cd->pbuf_idx] =3D '\0';
> -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
> -        cd->pbuf_idx =3D 0;
> +        cons->buf[cons->idx] =3D '\0';
> +        guest_printk(d, XENLOG_G_DEBUG "%s\n", cons->buf);
> +        cons->idx =3D 0;
>      }
> -    spin_unlock(&cd->pbuf_lock);
> +    spin_unlock(&cons->lock);
> =20
>      return X86EMUL_OKAY;
>  }
> diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
> index bc2a7dd5fae5..bd29c53a2d34 100644
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pg=
entry_t *l4start,
>       */
>      d->max_pages =3D domain_tot_pages(d);
> =20
> -    d->console.input_allowed =3D true;
> +    d->console->input_allowed =3D true;
>  }
> =20
>  static void write_start_info(struct domain *d)
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 303c338ef293..caef4cc8d649 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
>      BUG_ON(!d->is_dying);
>      BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
> =20
> -    xfree(d->pbuf);
> +    xvfree(d->console);

XVFREE() to avoid a dangling pointer. But look at the end. I'd just remove =
the
pointer altogether.

> =20
>      argo_destroy(d);
> =20
> @@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
>          flags |=3D CDF_hardware;
>          if ( old_hwdom )
>              old_hwdom->cdf &=3D ~CDF_hardware;
> -
> -        d->console.input_allowed =3D true;
>      }
> =20
>      /* Holding CDF_* internal flags. */
> @@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
>      spin_lock_init(&d->shutdown_lock);
>      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> =20
> -    spin_lock_init(&d->pbuf_lock);
> -
>      rwlock_init(&d->vnuma_rwlock);
> =20
>  #ifdef CONFIG_HAS_PCI
> @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
> =20
>      /* All error paths can depend on the above setup. */
> =20
> +    err =3D -ENOMEM;
> +    d->console =3D xvzalloc(typeof(*d->console));
> +    if ( !d->console )
> +        goto fail;
> +
> +    spin_lock_init(&d->console->lock);
> +    d->console->input_allowed =3D is_hardware_domain(d);
> +
>      /*
>       * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-dom=
ain
>       * resources want to be sized based on max_vcpus.
> @@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
>      if ( (err =3D argo_init(d)) !=3D 0 )
>          goto fail;
> =20
> -    err =3D -ENOMEM;
> -    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
> -    if ( !d->pbuf )
> -        goto fail;
> -
>      if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
>          goto fail;
> =20
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index ba5a809a99fb..b0d50a910e27 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -521,7 +521,7 @@ struct domain *console_get_domain(void)
>      if ( !d )
>          return NULL;
> =20
> -    if ( d->console.input_allowed )
> +    if ( d->console->input_allowed )
>          return d;
> =20
>      rcu_unlock_domain(d);
> @@ -564,7 +564,7 @@ static void console_switch_input(void)
>          {
>              rcu_unlock_domain(d);
> =20
> -            if ( !d->console.input_allowed )
> +            if ( !d->console->input_allowed )
>                  continue;
> =20
>              console_rx =3D next_rx;
> @@ -744,6 +744,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARA=
M(char) buffer,
>          else
>          {
>              char *kin =3D kbuf, *kout =3D kbuf, c;
> +            struct domain_console *cons =3D cd->console;
> =20
>              /* Strip non-printable characters */
>              do
> @@ -756,22 +757,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_PA=
RAM(char) buffer,
>              } while ( --kcount > 0 );
> =20
>              *kout =3D '\0';
> -            spin_lock(&cd->pbuf_lock);
> +            spin_lock(&cons->lock);
>              kcount =3D kin - kbuf;
>              if ( c !=3D '\n' &&
> -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1))=
 )
> +                 (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1=
)) )
>              {
>                  /* buffer the output until a newline */
> -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
> -                cd->pbuf_idx +=3D (kout - kbuf);
> +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
> +                cons->idx +=3D kout - kbuf;
>              }
>              else
>              {
> -                cd->pbuf[cd->pbuf_idx] =3D '\0';
> -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf=
);
> -                cd->pbuf_idx =3D 0;
> +                cons->buf[cons->idx] =3D '\0';
> +                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbu=
f);
> +                cons->idx =3D 0;
>              }
> -            spin_unlock(&cd->pbuf_lock);
> +            spin_unlock(&cons->lock);
>          }
> =20
>          guest_handle_add_offset(buffer, kcount);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index fe53d4fab7ba..f7bb44328bbc 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -371,6 +371,17 @@ struct evtchn_port_ops;
> =20
>  #define MAX_NR_IOREQ_SERVERS 8
> =20
> +/* Domain console settings. */
> +struct domain_console {
> +    /* Permission to take ownership of the physical console input. */
> +    bool input_allowed;
> +
> +    /* hvm_print_line() and guest_console_write() logging. */
> +    unsigned int idx;
> +    spinlock_t lock;
> +    char buf[256];

I'd rather see things a bit shuffled. Like:

      /* hvm_print_line() and guest_console_write() logging. */
      spinlock_t lock;
      unsigned int idx;
      char buf[255];

      /* Permission to take ownership of the physical console input. */
      bool input_allowed;
=09
That way the struct is fully packed (note the s/256/255/) and input_allowed
remains visually away from the other group of fields.
input_allowed remains away from the lock, indicating that input_allowed

Note that the lock is 64bit aligned when CONFIG_DEBUG_LOCK_PROFILE is set.

Thoughts?

> +};
> +
>  struct domain
>  {
>      domid_t          domain_id;
> @@ -562,12 +573,6 @@ struct domain
>      /* Control-plane tools handle for this domain. */
>      xen_domain_handle_t handle;
> =20
> -    /* hvm_print_line() and guest_console_write() logging. */
> -#define DOMAIN_PBUF_SIZE 200
> -    char       *pbuf;
> -    unsigned int pbuf_idx;
> -    spinlock_t  pbuf_lock;
> -
>      /* OProfile support. */
>      struct xenoprof *xenoprof;
> =20
> @@ -653,10 +658,7 @@ struct domain
>  #endif
> =20
>      /* Console settings. */
> -    struct {
> -        /* Permission to take ownership of the physical console input. *=
/
> -        bool input_allowed;
> -    } console;
> +    struct domain_console *console;

Why a pointer? domain_console is a fixed-size type, so unless the domain is
overflowing PAGE_SIZE (which we very definitely don't want either) I'd cons=
ider
making it a regular member Simplifies memory management too. No alloc/free =
nor
potential dangling pointers.

Do check how big struct domain is, though.

>  } __aligned(PAGE_SIZE);
> =20
>  static inline struct page_list_head *page_to_list(

Cheers,
Alejandro

