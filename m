Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F59DA9E6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 15:33:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844866.1260381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGJ6E-00073y-V2; Wed, 27 Nov 2024 14:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844866.1260381; Wed, 27 Nov 2024 14:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGJ6E-00072V-Rm; Wed, 27 Nov 2024 14:33:02 +0000
Received: by outflank-mailman (input) for mailman id 844866;
 Wed, 27 Nov 2024 14:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KjDT=SW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tGJ6D-00072P-K9
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 14:33:01 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2418::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7db7b41e-accc-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 15:32:56 +0100 (CET)
Received: from PH7P220CA0068.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::24)
 by MN2PR12MB4454.namprd12.prod.outlook.com (2603:10b6:208:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 14:32:48 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::cd) by PH7P220CA0068.outlook.office365.com
 (2603:10b6:510:32c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 27 Nov 2024 14:32:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 14:32:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 08:32:47 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Nov 2024 08:32:45 -0600
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
X-Inumbo-ID: 7db7b41e-accc-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxODo6NjE1IiwiaGVsbyI6Ik5BTTEyLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjdkYjdiNDFlLWFjY2MtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzE3OTc2LjU2NjM4Niwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fc3RsN5qbeU/qbJyeOzMZn/YEQZe6aUZZwXOo1GVYemLbVKf3Q2wRWm+SWhXuOd6i4fLdnyP4Nwc5yYhYdcV8ObpPyF/B3VA8GpFx4KYlOHQ5kVvFL4QMZSftBpSOY3EtNjG2yfIWQgsfHys6jtkMjZwVy4Oe7bGFlh/VsRNIQoUt/VLLLtD6ODatw3w2cpUpK7n/FI0aIUDflEZAyWs6TfwaO2ouJ7pBG4ckOaD8BObrvP9qpnO/duk797dTqK1O0X43+aFcO85op1BewSyotOQ3ys8DDF4PFpm+T83jeAsVVvekLVLwHzJ3T+OYNCESxbCHacmmzYQ1OCs/xBt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kbn5aWw/DEBk4v8+WEM0BTp73t+SZjB90yZzYEaeqtQ=;
 b=eJf2yg7/sU7p0BVuEImXiNu5jqNpu0r6ORA5J3nqKg+EPxfpf1br/aFbjcb+qx6ohjyG2Bjxw1XQpKG6NHbYCe8nyfY/YNRmT8NzV3TyB/YcVQic8QiQixcwYfnQIVayAULgZSuMGkcp3Pv3r3siY8Py3oOwELEBBhLhWoXuFJyA3H20y0ECEddL6vtvE5VnkbSNLykeUAuIqwbqGSHBdj6iWbkoCyvAEUEwA0U/RkOaQa6WXEeK39ft73fRB/JaqtoUKWTNxXFlvAw6q6jHacofVQBeaO1QyGaTxTdgGJz+4bWgKL2uWGImUEdY3p015iG6Z48dakH9W282LHyJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbn5aWw/DEBk4v8+WEM0BTp73t+SZjB90yZzYEaeqtQ=;
 b=xOdz5CM+9BMFbgmHnTK1JF4beNBvxNukzeFPU7f/bJhv41yMk+4LoSD7/c5nVPVJmUmLrNsY84ql9qnSkV4aDheTSYL51flp4v0mW1vGLHwT9PLQe8cZ0ePghPdUK62LCc7bkbkBiQNm6S287NsmKxeSbCF53w64YJDXzpzXfAA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6a15cbe6-1d0d-45ea-ab55-055266ba5fa8@amd.com>
Date: Wed, 27 Nov 2024 15:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/12] xen/arm: add initial support for LLC coloring
 on arm64
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
	<xen-devel@lists.xenproject.org>
CC: <andrea.bastoni@minervasys.tech>, <marco.solieri@minervasys.tech>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-3-carlo.nonato@minervasys.tech>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20241119141329.44221-3-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|MN2PR12MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: e062f634-5714-4259-1603-08dd0ef05dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnZFeDlKR0pDQkNlZEZGa2dOcDRpQ3ZuWHUxb05mL1YramNvdjZvZ3c2Vm1K?=
 =?utf-8?B?RjFPNCtxQkgwMTRMWlNVNDdsaTBrZW9QZlp0bUtOT0ZzeUk1RTlKNUhFeHRi?=
 =?utf-8?B?K3dKMnFRKytNaWo2NWJMY2IzdktZVkJrMkJQM2F1WmNkenJxeDM0cjRVV201?=
 =?utf-8?B?RFo0K1lWK3IzYlJpejBxd0ZzdWJwME0yRkg3dGJHbEtCWlp4SCtXZkx5Zk9E?=
 =?utf-8?B?UDFQaXk2aXlKbmxrUENqNGZoTjBZNnNnMWxENlJFTzNOVWRPWHpnTTMyNllF?=
 =?utf-8?B?TnE5c3VZQVVoYUcrMWUwL0Y5aUxOdkhaamJUdXh4WG1MNWcxUmxHRVNSdVVa?=
 =?utf-8?B?VitGRVFSdXczaThBc0IrZ2xZOEFVRGFBZW93c2JreXcxZWgycEpKYWVBeTl1?=
 =?utf-8?B?cU5BN3A0RUdzTkJJTWo3ZXZ3Q1VsM2djQUpRbWFuWDVVdDFTWm51Um9SaUIw?=
 =?utf-8?B?OGZod2JYc29Cam82OE1OSnV3TTBqWm5QMHFpUi9HcWNiM2VQNTc4Z1dvYjNi?=
 =?utf-8?B?NHJCVmpJR0Z4MjVOc09nV2Z3VEcxcjBJMUNLWHU3dHpzaTFHNEZHRUphd1FW?=
 =?utf-8?B?WXQ3Szc0S0U4Yk1CbDdPdTd5YTRsWHlFUG52SllwTzFzbDdWYUxWZVdiamM3?=
 =?utf-8?B?cFRlN2dQdldDVXV3ZkhveXo3dEFBQWo3NUpVOXJ3aDdrbE5BZytadHdQL1RN?=
 =?utf-8?B?MHdDL3dRY0srUG5CWjNSN3dpOUdSYlIzNUF1M1NwVG5CZXNLdGNZQk1OaVJR?=
 =?utf-8?B?VVIvUDVsUTZMTC9kckFKZWROUmhDN0I0WnZ1VFNCYWFZTmVja1d2Z085dDZX?=
 =?utf-8?B?WnliU3ZySGY1amVYTTgxVVplY1M5OWhrSFZPR05WaUY4SjIrUEwvQmFrT3dp?=
 =?utf-8?B?OVhyZ1Q4WWJ4OTRtVjR6cWtUMzY1OEU3WTgydk1hUWliUEVtUFZkbmNwbWlV?=
 =?utf-8?B?dXRZb3hYUjd5Z1U5bk9Kc3RDeHdSaXI5R0hkb245SEhwT0VET3Q1ZnhaaWtt?=
 =?utf-8?B?WTFEbk9KQmgvNXdJem9CMEp5ZU1tK0o5T25HeFIzaTBQNGQ0QUgvQkNqQVBD?=
 =?utf-8?B?NHMwQ1dKVGVZMG54RzRoVC9NNVNTSlBEL29IcDFkTlFSNzRJamNPN3RQbzZE?=
 =?utf-8?B?ekEzRGcrN2hKeGJ4WS81RE5VdzBJTDJURzJKWGlKWCttSGNGUmFqNk0yeWxF?=
 =?utf-8?B?VE9iRUtzQ25HS2ZiU2g2NWUvK0owL3Y5cjkxR1o4dFZyU0VzOE15NU5JdktM?=
 =?utf-8?B?c2xnZ3V6d2MwZi9TRTFDSkZiN0p0cTRRSlFXb1JqUTlIWHovOVAxcklSbkFa?=
 =?utf-8?B?MWNybmNlS0RDVWJ2aEVlWE1vN2tCTXBrWi9rRklPaE8vNytTZ3M0VzBUQnJP?=
 =?utf-8?B?MmZwUTFwR0lHbld2ODB5YVhzMDE5K2JkblphOU93SkhDVHFnR0VjWHpOT2Fv?=
 =?utf-8?B?cVh3K0w3QjBpbWhDZGpLTTlMMHUxelhibjRVK1Z3Z1pYYUNXU2tIVW5pUWl2?=
 =?utf-8?B?WHYzUFFkNDU4OHJQYXBSSTdwN0tKUGM5LzM4dlg1c05hVFdKZ2VJUVFUS1pX?=
 =?utf-8?B?dUkwMUViZyswa2ZVczNHS3VDRXdEV1VYWFgzV3lKTzI3ejh1NExKMGtQN2JI?=
 =?utf-8?B?OVNWUFY0VllFNEZjN1pRVUg0bHRsb2t3ZUI4Q29ta04vNmR3clpIZVVMcDVw?=
 =?utf-8?B?NUsvU0J2QlkxcTRCeDhoZzUyZDd1STFBUE1wTFcySk5yckd4cGVSYWRiR0xD?=
 =?utf-8?B?dGRCR3dYRkluS3EvTFVheGExS25WVTFuV1MyQ0R0cEVGaG9aWDhDQkprbEdp?=
 =?utf-8?B?djdoZXRvMThBd09lTlRGOWZ5NDBxWHB6cllFUkFONHdmbW5JV2xqQ0lNRElN?=
 =?utf-8?B?YnM4QU92bDlBQWwrdTNyajdxZlUxQmRBcE9aMi9DQ0Z3WHhGWmF6Q1ZVbVll?=
 =?utf-8?Q?6B8PIVuzXwoJZk4vMtW7NEogAUxeVNb9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 14:32:48.1193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e062f634-5714-4259-1603-08dd0ef05dab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4454



On 19/11/2024 15:13, Carlo Nonato wrote:
> 
> 
> LLC coloring needs to know the last level cache layout in order to make the
> best use of it. This can be probed by inspecting the CLIDR_EL1 register,
> so the Last Level is defined as the last level visible by this register.
> Note that this excludes system caches in some platforms.
> 
> Static memory allocation and cache coloring are incompatible because static
> memory can't be guaranteed to use only colors assigned to the domain.
> Panic during DomUs creation when both are enabled.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
> v10:
> - moved CONFIG_NUMA check in arch/arm/Kconfig
> v9:
> - no changes
> v8:
> - no changes
> v7:
> - only minor changes
> v6:
> - get_llc_way_size() now checks for at least separate I/D caches
> v5:
> - used - instead of _ for filenames
> - moved static-mem check in this patch
> - moved dom0 colors parsing in next patch
> - moved color allocation and configuration in next patch
> - moved check_colors() in next patch
> - colors are now printed in short form
> v4:
> - added "llc-coloring" cmdline option for the boot-time switch
> - dom0 colors are now checked during domain init as for any other domain
> - fixed processor.h masks bit width
> - check for overflow in parse_color_config()
> - check_colors() now checks also that colors are sorted and unique
> ---
>  docs/misc/cache-coloring.rst         | 14 +++++
>  xen/arch/arm/Kconfig                 |  1 +
>  xen/arch/arm/Makefile                |  1 +
>  xen/arch/arm/dom0less-build.c        |  6 +++
>  xen/arch/arm/include/asm/processor.h | 16 ++++++
>  xen/arch/arm/llc-coloring.c          | 78 ++++++++++++++++++++++++++++
>  xen/arch/arm/setup.c                 |  3 ++
>  xen/common/llc-coloring.c            |  2 +-
>  xen/include/xen/llc-coloring.h       |  4 ++
>  9 files changed, 124 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/llc-coloring.c
> 
> diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rst
> index 0fe3830c40..b608284e9b 100644
> --- a/docs/misc/cache-coloring.rst
> +++ b/docs/misc/cache-coloring.rst
> @@ -111,6 +111,20 @@ Auto-probing of LLC specs
> 
>  LLC size and number of ways are probed automatically by default.
> 
> +In the Arm implementation, this is done by inspecting the CLIDR_EL1 register.
> +This means that other system caches that aren't visible there are ignored.
> +
>  LLC specs can be manually set via the above command line parameters. This
>  bypasses any auto-probing and it's used to overcome failing situations, such as
>  flawed probing logic, or for debugging/testing purposes.
> +
> +Known issues and limitations
> +****************************
> +
> +"xen,static-mem" isn't supported when coloring is enabled
> +#########################################################
> +
> +In the domain configuration, "xen,static-mem" allows memory to be statically
> +allocated to the domain. This isn't possible when LLC coloring is enabled,
> +because that memory can't be guaranteed to use only colors assigned to the
> +domain.
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 15b2e4a227..7f0712e674 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_64
>         depends on !ARM_32
>         select 64BIT
>         select HAS_FAST_MULTIPLY
> +       select HAS_LLC_COLORING if !NUMA
> 
>  config ARM
>         def_bool y
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index e4ad1ce851..ccbfc61f88 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_IOREQ_SERVER) += ioreq.o
>  obj-y += irq.o
>  obj-y += kernel.init.o
>  obj-$(CONFIG_LIVEPATCH) += livepatch.o
> +obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>  obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>  obj-y += mm.o
>  obj-y += monitor.o
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index f328a044e9..d93a85434e 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -5,6 +5,7 @@
>  #include <xen/grant_table.h>
>  #include <xen/iocap.h>
>  #include <xen/libfdt/libfdt.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/sched.h>
>  #include <xen/serial.h>
>  #include <xen/sizes.h>
> @@ -890,7 +891,12 @@ void __init create_domUs(void)
>              panic("No more domain IDs available\n");
> 
>          if ( dt_find_property(node, "xen,static-mem", NULL) )
> +        {
> +            if ( llc_coloring_enabled )
> +                panic("LLC coloring and static memory are incompatible\n");
> +
>              flags |= CDF_staticmem;
> +        }
> 
>          if ( dt_property_read_bool(node, "direct-map") )
>          {
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 8e02410465..ef33ea198c 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -18,6 +18,22 @@
>  #define CTR_IDC_SHIFT       28
>  #define CTR_DIC_SHIFT       29
> 
> +/* CCSIDR Current Cache Size ID Register */
> +#define CCSIDR_LINESIZE_MASK            _AC(0x7, UL)
> +#define CCSIDR_NUMSETS_SHIFT            13
> +#define CCSIDR_NUMSETS_MASK             _AC(0x3fff, UL)
> +#define CCSIDR_NUMSETS_SHIFT_FEAT_CCIDX 32
> +#define CCSIDR_NUMSETS_MASK_FEAT_CCIDX  _AC(0xffffff, UL)
> +
> +/* CSSELR Cache Size Selection Register */
> +#define CSSELR_LEVEL_MASK  _AC(0x7, UL)
Seems unused. If so, please remove.

> +#define CSSELR_LEVEL_SHIFT 1
> +
> +/* CLIDR Cache Level ID Register */
> +#define CLIDR_CTYPEn_SHIFT(n) (3 * ((n) - 1))
> +#define CLIDR_CTYPEn_MASK     _AC(0x7, UL)
> +#define CLIDR_CTYPEn_LEVELS   7
> +
>  #define ICACHE_POLICY_VPIPT  0
>  #define ICACHE_POLICY_AIVIVT 1
>  #define ICACHE_POLICY_VIPT   2
> diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
> new file mode 100644
> index 0000000000..a7e0907816
> --- /dev/null
> +++ b/xen/arch/arm/llc-coloring.c
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring support for ARM
> + *
> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> + * Copyright (C) 2024, Minerva Systems SRL
> + */
> +#include <xen/llc-coloring.h>
> +#include <xen/types.h>
> +
> +#include <asm/processor.h>
> +#include <asm/sysregs.h>
> +
> +/* Return the LLC way size by probing the hardware */
> +unsigned int __init get_llc_way_size(void)
> +{
> +    register_t ccsidr_el1;
> +    register_t clidr_el1 = READ_SYSREG(CLIDR_EL1);
> +    register_t csselr_el1 = READ_SYSREG(CSSELR_EL1);
> +    register_t id_aa64mmfr2_el1 = READ_SYSREG(ID_AA64MMFR2_EL1);
> +    uint32_t ccsidr_numsets_shift = CCSIDR_NUMSETS_SHIFT;
> +    uint32_t ccsidr_numsets_mask = CCSIDR_NUMSETS_MASK;
> +    unsigned int n, line_size, num_sets;
> +
> +    for ( n = CLIDR_CTYPEn_LEVELS; n != 0; n-- )
> +    {
> +        uint8_t ctype_n = (clidr_el1 >> CLIDR_CTYPEn_SHIFT(n)) &
> +                          CLIDR_CTYPEn_MASK;
NIT: align CLIDR_xxx to opening (

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


