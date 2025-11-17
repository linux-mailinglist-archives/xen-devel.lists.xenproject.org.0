Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E021C64A7A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164032.1491047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0JJ-0004Xm-Ks; Mon, 17 Nov 2025 14:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164032.1491047; Mon, 17 Nov 2025 14:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0JJ-0004VJ-I1; Mon, 17 Nov 2025 14:34:29 +0000
Received: by outflank-mailman (input) for mailman id 1164032;
 Mon, 17 Nov 2025 14:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QskY=5Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vL0JH-0004VC-9J
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:34:27 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8354bcb7-c3c2-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 15:34:25 +0100 (CET)
Received: from SJ0PR13CA0014.namprd13.prod.outlook.com (2603:10b6:a03:2c0::19)
 by DM4PR12MB9733.namprd12.prod.outlook.com (2603:10b6:8:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 14:34:20 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::57) by SJ0PR13CA0014.outlook.office365.com
 (2603:10b6:a03:2c0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Mon,
 17 Nov 2025 14:33:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 14:34:19 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 17 Nov
 2025 06:34:16 -0800
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
X-Inumbo-ID: 8354bcb7-c3c2-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkZsvFu7woLdCuNvd6LmTQw7Qbz0M2HgsJrrYb12ME/ALhZ37yrrvFhnfWjkZ3a1lnI80KnuurZndEBraAqpGIFe6CbHG5gFvN/0MzBUOrvJBBjiC2L/cihb4fDOT+imtrAUMH/dc5Tqqu/LHFvbgpUyOOXBIzkkvDdwBWZfQxOYojO4MjVhxQXwC26aFNInVCtxBhnfJTo1VEgSyLPecJ7npwD3yZR2jtfNeCClu85QVSXQmyjIHigXwila7+tgw5lqUcz/xBRwCz+3zaPqpw5Elu/8wkhvmF04Qi2zv47ggeCnEamwheqbkEv1HvarioRgznKBQ9I5gJ59erxeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R16eIR3RDCZbRw6IRhjcnO8BiX9OFvrPVP/AYKsaa1Q=;
 b=Y/D+G7Pgz++m7MCmwF2sTlG0o5UeCcmJYt3FId6csYsrxk3mevRpvOAH4Wu7EhEQK4CWoudgqH3q4stZQbjok+KaB9TEq1hSjMdIFLwmon6Ceaqco7eXLinc/6cftV5X44zSpj73EYJncyc2sIDyYLEIX6bJ2aaQzKhyRytKpFS4mw/mkDQfVo5BIht3QUYbFyBrEmTpSkU145i+zhp+uu3Jpl50SRKQUx1vY+eDFOIyfiWiFydqXgdCp4NO96W4GzaEV5pfh7wcFl4LNFnTiWqypoIOYGU74PkHMci4mTT8ywho/0gwO9Pq/LQZWRhKc49FBOxiI0rWPd93gAqiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R16eIR3RDCZbRw6IRhjcnO8BiX9OFvrPVP/AYKsaa1Q=;
 b=QzHdSIbplnfHpCC/aa12qp/ekkvLavRXasTtfpoT8MmSKmmXAOvL/udEkFoDlqR8af1dUoMvjSoJ7TvBeJuf/eX51wkXD51xAjz2TvuhltU+ewA/uB9y1iQxq95CEhTbGsEEulMbSiEeMxWYt/4OberqxEQX3y8PlQQ9AOmjcfM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 17 Nov 2025 15:34:10 +0100
Message-ID: <DEB1LPKJSO4H.23SQXSLYDAW1K@amd.com>
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
X-Mailer: aerc 0.20.1
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
In-Reply-To: <20251114180130.346755-1-grygorii_strashko@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|DM4PR12MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7e8253-3559-405a-f31f-08de25e6649f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlI3UTJUbGFaYzdCWHV5MlUyNlJjRmhzYXVKUmpYUDlRY1pidm1od0p1bEhv?=
 =?utf-8?B?VW4wdUJvcTBQSkdRZ2VzUmRMOHJleVdDYUJQdFA1RUJyWmJwd3hhRlFGdUZD?=
 =?utf-8?B?U3BVRUNNWSswSGVobmhkaFhkYjVwa0tLc2dKZlpvS29uendVbVY1elNUc05F?=
 =?utf-8?B?S0J0SE04UFRxSHBYV3hNeDZ5MUNRNkRHNHBxNVJzYVl3ZkQ5MlpzV3BPYXlS?=
 =?utf-8?B?YW1Jbzk5dkJpanFEejFWUlZTaUJzZ0pqcUF4NTlFa1NlbHJxVVhUYWxnNnJ2?=
 =?utf-8?B?ZGsycy9ZV3RaUHhmQUcrT0NhVjNRemRUU200Q0hVbFBJVFo4Q0tjbkRCdzFS?=
 =?utf-8?B?RFhEUlF1NzdSaWNKR1Q2UFAzOWJYMEtmbzNjMXZ1SXdNa3FMYnNvK21JYVpl?=
 =?utf-8?B?L0NGYzQwV0lWK0tZdURuRC9LYlNFZzRFMitScWhpNk42b3VMWHM2YnFFZG5E?=
 =?utf-8?B?dSszTStBVUZXWXByZytxaG5ITTdaYXlOakFSbU82aVJCQ3daV2JWTWZpOHJP?=
 =?utf-8?B?VWlyUVZaRzlUL0NoUFVXSmtJK0tqZ3NSUVIvazhqK29xV1A3a0Q5a1h2VmdG?=
 =?utf-8?B?dmJUOWJ2YjlEd0xqRmFIZGNKTzRCdHZKbE9Kc2lQNFRXclJmY2dIai9VbDR4?=
 =?utf-8?B?SmpOTEcrQWxmTlA2bWhuZ2l3UEhYMFFObTllNkNuOFNEMmdiOVlsTUVKT0Zx?=
 =?utf-8?B?aGFSTWFZWElxL1hQbnhTNTg3MFNrU1UxZUN5VWZkRkFIVGs3akxjd2FiMTQ5?=
 =?utf-8?B?MVJtKyt3U2J6TS9GWk1UYVlGeGd0Q3Mwc1JyTWxlbURsYTZPOStYbW1PdFV0?=
 =?utf-8?B?WjFnR1J3dTNRcU9jTjNnWnFKSkphZHpDcXhWWXZRQ0x4T1NJMEFIMDMzbDYy?=
 =?utf-8?B?QmRPK3VPNnRDTGZobmZCb2V6b2huZHBvN3NOTU5SUDR5Qmc2V3poclFRaGZV?=
 =?utf-8?B?UGhSaXM1alozNXpwYlNQbDIzUnBKRzVERTVmaUE5dUI3TnNKVXRIZ1RWa1N6?=
 =?utf-8?B?R1h2d1E1ckNudHZWRzErU0xFYks4Y1JaNW53VU1iTlNMc1AxL01rOG1xTjF1?=
 =?utf-8?B?RDdxZXE2OFBPMFV3OG0waWd1YitWQU1ZTktCRDUvWjFWSTljSk5ycU5OREZB?=
 =?utf-8?B?VWZ2TGZESndzSDdOUk1mRTRNZFFucFhUdjRqVHRubUNtZ1drTVVodFJvdWpt?=
 =?utf-8?B?Q1VIRjVKejlEQ3E1TWJjUkVscHNwQmxld0hpZnRvazRma3JtNkJzbWR4OHNV?=
 =?utf-8?B?TjNITjMrck9uc2VEYnhEUDJ2amJZRUsyQjZJNkF6eDBJVng0blZ4cjF2cjFI?=
 =?utf-8?B?UElqd0Zqb3pYcWdSYTNRa2tJdk5aaDJJaUJrcGtyNHZYcUVoQWRNdFF5Mzd2?=
 =?utf-8?B?QTFvcXIzRW9uNXZjakwwYkdRS0oxOUd4V01CellETGpidi83eER4REttUjhx?=
 =?utf-8?B?YW5JQUVicGYwQ25aOWdMOTNCZE5KOTBlUHdWRDhHUVQwWkFqbkpFL1M5c01M?=
 =?utf-8?B?R09XSHUvM0d2ZlJqM0V6SHEwZmFjQ3NjK3JqS0o0QmJPWjBNTWJQMitvV2FQ?=
 =?utf-8?B?UDljYldIRU1yV1RhRVdzRUpsYzR0MHZUWUtWUVJkUmxUZ2NYdTd6MENxOEhG?=
 =?utf-8?B?MkY1cGdwWGRjUVFoT3ViWVZUa1VLc0RYblhJWjRvcEsydndpdEF1KzNoS2FW?=
 =?utf-8?B?dWcyQUJHNEgveS9tZjlLMUI0anh6M0lPdGNsTThDMGcxSlpLTWh5dGtZSU42?=
 =?utf-8?B?RHNkR3Q0VDE1bFFVdCtqSTQ0UWJqcW03WnIvWHdGWVNNN0RJNWMwRkhteTlI?=
 =?utf-8?B?VXFvUnBlZW41TWxMQUJ5QU9NQllGelE3c0c5OFVYc0RjaWZsbkdjdjNTdzZ3?=
 =?utf-8?B?Wit3TGd4SlpUc2EralVkKzkxekVKYnBWU1NFNXlGdkdJdG9rK3lLYjNhaHlp?=
 =?utf-8?B?bzdFU3BuZ2tFYktJdDBzeXZIVHFFMzAyR0NQbGhBUTBlKzl6a0FKRmNSSnlr?=
 =?utf-8?B?OW1hV2h6cEJYZENkZVpVL3MzQ3R1UW9KZkhadEk3U1BvMnRTTEl3aHcwVHlV?=
 =?utf-8?B?RGtDRzNnL3Y0OVlucEd0MWN4YnVVNFcvMXRITmlXY0oxZ0hiWC9nTit3ZEU1?=
 =?utf-8?Q?KgfQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:34:19.2757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7e8253-3559-405a-f31f-08de25e6649f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9733

On Fri Nov 14, 2025 at 7:01 PM CET, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Now all libfdt features are built-it unconditionally, but...
>
> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
> nodes, so full libfdt is not needed in this case and minimal, RO
> configuration can be used.
>
> ARM - situation is more complicated:
> 1) ARM reads Host DT (fdt.c RO)
> 2) ARM reads passthrough DT (RO)
> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW=
 APIs)
> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API
>
> Hence, add possibility for optimizing libfdt usage by introducing separat=
e
> Kconfig options for each libfdt feature and select them where needed.
>
> Following libfdt modules are not used after this change:
>  Makefile.libfdt
>  fdt_addresses.c
>  fdt_strerror.c
>  fdt_check.c

This is a nice idea, and the less we compile of this nonsense library the
better.

>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> Not sure about using DOMAIN_BUILD_HELPERS for selecting=20
> LIBFDT features, as DOMAIN_BUILD_HELPERS doesn't exactly
> says that domain's DT will be generated when selected.

We likely want a DEVICE_TREE_WRITER Kconfig, or some such. That would compi=
le
in all code that performs DTB writes and gate the DTB overlay. Not having i=
t
restricts libfdt to fdt.c and fdt_ro.c, and having it adds fdt_rw, and allo=
ws
the others depending on EFI and/or overlay settings.

But the helpers themselves are not terribly well organized, so I'd say it's
not strictly required for now.

>
>  xen/arch/arm/Kconfig       |  4 ++++
>  xen/common/Kconfig         |  4 ++++
>  xen/common/libfdt/Kconfig  | 14 ++++++++++++++
>  xen/common/libfdt/Makefile | 12 +++++++++---
>  4 files changed, 31 insertions(+), 3 deletions(-)
>  create mode 100644 xen/common/libfdt/Kconfig
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index cf6af68299f6..f10cd3d7effc 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -111,6 +111,8 @@ config ARM_EFI
>  	bool "UEFI boot service support"
>  	depends on ARM_64 && !MPU
>  	default y
> +	select LIBFDT_RW
> +	select LIBFDT_EMPTY_TREE

Only on UEFI? That's surprising. Why does this entry point need more than
creating a DTB for a domU in dom0less?

>  	help
>  	  This option provides support for boot services through
>  	  UEFI firmware. A UEFI stub is provided to allow Xen to
> @@ -149,6 +151,8 @@ config HAS_ITS
>  config OVERLAY_DTB
>  	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on SYSCTL
> +	select LIBFDT_RW
> +	select LIBFDT_OVERLAY
>  	help
>  	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
> =20
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 401d5046f6f5..256aff269c3b 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -28,6 +28,8 @@ config DOM0LESS_BOOT
> =20
>  config DOMAIN_BUILD_HELPERS
>  	bool
> +	select LIBFDT_WIP
> +	select LIBFDT_SW

Out of curiosity, what's the relationship between those libfdt files and th=
e
helpers? What do they use them for?

It's not like LIBFDT_WIP or LIBFDT_SW have very insighful names (through no
fault of your own. The original file organization is dubious at best), so w=
hy
not just compile those files conditionally on DOMAIN_BUILD_HELPERS instead?

Something like...

> =20
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
> @@ -680,4 +682,6 @@ config PM_STATS
>  	  Enable collection of performance management statistics to aid in
>  	  analyzing and tuning power/performance characteristics of the system
> =20
> +source "common/libfdt/Kconfig"
> +
>  endmenu
> diff --git a/xen/common/libfdt/Kconfig b/xen/common/libfdt/Kconfig
> new file mode 100644
> index 000000000000..3abd904b2969
> --- /dev/null
> +++ b/xen/common/libfdt/Kconfig
> @@ -0,0 +1,14 @@
> +config LIBFDT_WIP
> +	bool
> +
> +config LIBFDT_SW
> +    bool
> +
> +config LIBFDT_RW
> +    bool
> +
> +config LIBFDT_EMPTY_TREE
> +    bool
> +
> +config LIBFDT_OVERLAY
> +    bool
> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
> index 6ce679f98f47..c832d1849a5c 100644
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -1,7 +1,13 @@
> -include $(src)/Makefile.libfdt
> =20
>  SECTIONS :=3D text data $(SPECIAL_DATA_SECTIONS)
> =20
> +obj-libfdt-y :=3D fdt.o fdt_ro.o

> +obj-libfdt-$(CONFIG_LIBFDT_WIP) +=3D fdt_wip.o
> +obj-libfdt-$(CONFIG_LIBFDT_SW) +=3D fdt_sw.o

... turning these two into:

  obj-libfdt-$(CONFIG_DOMAIN_BUILD_HELPERS) +=3D fdt_sw.o fdt_wip.o

Likewise for fdt_empty_tree.o and fdt_overlay.o for ARM_EFI and OVERLAY_DTB
respectively.

> +obj-libfdt-$(CONFIG_LIBFDT_RW) +=3D fdt_rw.o
> +obj-libfdt-$(CONFIG_LIBFDT_EMPTY_TREE) +=3D fdt_empty_tree.o
> +obj-libfdt-$(CONFIG_LIBFDT_OVERLAY) +=3D fdt_overlay.o
> +
>  # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during r=
untime.
>  ifneq ($(CONFIG_OVERLAY_DTB),y)
>  OBJCOPYFLAGS :=3D $(foreach s,$(SECTIONS),--rename-section .$(s)=3D.init=
.$(s))
> @@ -15,7 +21,7 @@ CFLAGS-y +=3D -I$(srctree)/include/xen/libfdt/
>  $(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
>  	$(call if_changed,objcopy)
> =20
> -$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(LIBFDT_OBJS)) FORCE
> +$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(obj-libfdt-y)) FORCE
>  	$(call if_changed,ld)
> =20
> -targets +=3D libfdt-temp.o $(LIBFDT_OBJS)
> +targets +=3D libfdt-temp.o $(obj-libfdt-y)

Cheers,
Alejandro

