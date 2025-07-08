Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D13BAFC84D
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 12:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036350.1408605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ5W2-0008DK-4C; Tue, 08 Jul 2025 10:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036350.1408605; Tue, 08 Jul 2025 10:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ5W2-0008As-16; Tue, 08 Jul 2025 10:25:34 +0000
Received: by outflank-mailman (input) for mailman id 1036350;
 Tue, 08 Jul 2025 10:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZ5Vz-0008Am-TV
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 10:25:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de11fe67-5be5-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 12:25:29 +0200 (CEST)
Received: from BY3PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:217::22)
 by CH1PR12MB9647.namprd12.prod.outlook.com (2603:10b6:610:2b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 8 Jul
 2025 10:25:24 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::4d) by BY3PR04CA0017.outlook.office365.com
 (2603:10b6:a03:217::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 10:25:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 10:25:22 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 05:25:21 -0500
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
X-Inumbo-ID: de11fe67-5be5-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKNpm6HCc5yjt8qNIMFtgbdceq2rk5busKwf7HdPK6opwQtUG4M+EYNYpT7GWXCdgmJ0XuxTechIepvh8pMHsR+VDMRzyLUhS2G/vmj6/+SyeJrXRIrIDFjDBqA9ZGnL/tNewVmdGulnHhgDGXhrmy6xABR83AJ5lyR5/urgrYMxUThzAlXtJoD05MdBRkww/pPW8mThbuh9H5TXMCRZf2+/43zOs5qv9P0hfn3XOo6FXQBM2OlWWTNDOk6S/Hw7Zkq6UviZQXlxCC7pftq+R4shO0HB/wSxFx0/QTSJQ5PTTb+OAOSM36ms93KIimGtQqM0ztSHV3uJ9bEwxVy42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GW5CeQwrcdmpiL0T5P0SGzzQlZMiG+uudhkrTeDjjk=;
 b=blYe5phi1hJxvXvFJv6BLg1VBUeM4/iBRaq5hiU6AmRxJEoAPpcidnGGdOFBkrAqNVHzNeZ38e6e5H9mnz9u7Jd+E9F7a4K5YdUHI3J7vhBKZhiZN8eaADNYT4B6qq2GAiF0Wd53DKT9ptMArPjWziofHlfQ6Q0mTcSc0NsZXqmfcuBc9YBdLbdiZdwQVtP8qajYnWFy2TWaNf8Un5CfONRFWWSE0QeR4EH/Ki1tOjWtgD5S+JbhA8C7v8DGHCfFkiGOw0Hx2nL7RTDxrjnoDT7uts8h3Ea037cnxvLdtTK+88VylHaAOzBcQ9gc9sWTL8Ktng3Mu0ur3KOtBRqlCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GW5CeQwrcdmpiL0T5P0SGzzQlZMiG+uudhkrTeDjjk=;
 b=a1bq4q2HD/5ehJshS1Hu1UzgpWdWzkfdHS7Sz3VTn8SHU6opQJz/PvuZBJGnAL2h+dy7BqB3I9LKDWit5JU2xjURSWyvqlyiUOgNvx+IWAwgmBuKZkZgCHlY7OWA8QctAuYIni25RBQIeKsZOWnX5pC+poWJoUYrIrb7BceNMrA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 8 Jul 2025 12:25:19 +0200
Message-ID: <DB6LN9YLAF8J.1OV1IDMXC7F0Q@amd.com>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>
Subject: Re: [PATCH 2/2] xen/x86: introduce AMD_MCE_NONFATAL
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <20250708000712.2731666-2-stefano.stabellini@amd.com>
In-Reply-To: <20250708000712.2731666-2-stefano.stabellini@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|CH1PR12MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 36540564-95ab-41fa-454f-08ddbe09bf54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?em9ZRFBTOS8yZThkSUNlSkZYL1VGcW5wMVFERnl1bU1ZaDM0UzZvM284WnJy?=
 =?utf-8?B?UHQwS0J1RUJsVGx1TTVKYWR4b2xZVnBtaG5pN3ZncGtrTUZlSFFTUDNxREw5?=
 =?utf-8?B?QkdwUHRtSFJTMkluUUdpdlhZb3hQNzBRSVRBL1dydHUvdktENlJCRkRmRXR0?=
 =?utf-8?B?bE5HbzBvdk5na3UzWHpRbUVXUklKRlJVQUJRYi9ITVdEOHRtZHI1TE5mQ3Fy?=
 =?utf-8?B?bTJGMVJsOUdHMFpUMDhQT0F6RVdYRmtjWjcyNjErY3Qvd0pnTXF6U0VDOFdV?=
 =?utf-8?B?NmxnY3pqVGhYcXVqNnNYVktHeVUzMjZVWGkvcElGQnI2Z2dHR25rbzNXbTRp?=
 =?utf-8?B?NlVadWpqZXN1SyszNnM5S2lKeUlzb3NTKy9GWVBlMnBpejVPSEhOcW1sTVVv?=
 =?utf-8?B?Y3FTZWU0dFcxSllTV2JTYll5Q1dKbnh2Z3lwM0dlNUxRRGJ3a2lJZy8wYXhq?=
 =?utf-8?B?bVIwcG1zdXZLM1NnUm9GZzFybjBWUlc3Ylk2ZGk0R3dLNmFvSk54ZWNEWGVU?=
 =?utf-8?B?OEF0bU5XdFhxMXZYNEV0ZFRkTUppNHZPb2hKSkgzOWh1Y0dXMGV6NGM2a0sy?=
 =?utf-8?B?bzBKNnFIWEFLbXpCYzZIRENYU3BHZVhRSm5GejVQUnRET3RqV2FIaElFMG1t?=
 =?utf-8?B?QjRZRVMwSjFpTXBRTUtnM1pOVmJKR2ZXOUwxQkdiZFMyazZkaDJVWml1TkJa?=
 =?utf-8?B?eGdZU0tNcDlhUjJ4T3JYQ2R6YWxyNy84ZW1oSDVGYlZodnRlVVJrY0VSR0l2?=
 =?utf-8?B?UHRwR05kOVJTSTEwMGFoYkJreUpKalllYzVDSlhSRkNLY3VpRzdOSm5abW8y?=
 =?utf-8?B?dW4vQUNVNlc0clNGVW5XcU82UXY3ME0xMlovRjNqaTgzZmYvN05sQ2o3eThi?=
 =?utf-8?B?NGZySHA2dHJqM3FqcyttdE41OHJkYVI5bk5PS2xFL3d5d1lpeTROaEdIbkVQ?=
 =?utf-8?B?OU1NMGlKZGhXTTJqSllXNjFzWVZ6YzdxRW5Cdkd3dXduSmlmY3pzS3VxeG9o?=
 =?utf-8?B?bUNzbmkvNGE2Rjc0L2xXcTkxSERPTjJmRzQ1d1g0M3dhNjZwcy9IOUlsOXlm?=
 =?utf-8?B?Wm5EUjBRWE8wRjc3MGZLSGFIRUg1NFQzREFVbWZ6eWcrUVhDODhjT2FIY2Vu?=
 =?utf-8?B?aHZ2RVNkMm01ckxaM2NrdnNTS1FnQ0MyUDFPL2U0bDI3dHlSYk9Eek1EYzlG?=
 =?utf-8?B?YkZXOTJxVjhQcnEzcGVPSk5OR3NOdXNvaXdVdzRicTBEV1RsaG5qMVgzdjl4?=
 =?utf-8?B?by8wQUpFU3UzQWtyWmsrU0pjQWw3VDVkdXhTQ0VJa3VtQ2xORjZGTGV1UENj?=
 =?utf-8?B?Vk5PMzRUSDNSeG5nQTZZT0JYaGpHNFNFaFd2SmcwUEU1aFN0cm1lRW83cjcy?=
 =?utf-8?B?RC9tSFNSamtRWldNTmVXQUthdUlDRXl2amNFWlZ4aDdLM214bVpFbjk5SU8w?=
 =?utf-8?B?ckU1alEyMmx6amRXbXhFaldIdldFTlZ0cjloOCtMTVI0eDJyRk4zQVJ0eFlm?=
 =?utf-8?B?UWpheTRlYk1TTnFCTUt4ak9sb044RFpWczNsb2VTMGJUMTF2dG1CbjIvZisy?=
 =?utf-8?B?RlBBVDNrWmpaNWV1M1VqTXlRN21zSXd5Q0g5bEkrdHMwOGJab3IwZUNyd2Vz?=
 =?utf-8?B?VkxHcHFrUlFYVVRkUk9FOWZRQ0lVK01rNFhaMGJ1K21SSkdrQmJ2MWU4Wlds?=
 =?utf-8?B?aWZrT0xYSWRIcUs3Y2d4OWl3Njl1aVBjOGk0Zk5lTFR6UStsTkJjbjhRQ2Vj?=
 =?utf-8?B?MjBBenRCTkFWbk5NYTR4U09IYUR4d1NETEwxcndXVFVkdnV5eUwxT0MvOVZC?=
 =?utf-8?B?TW9aTFo4WEZCV3lzcEt1b0J1cGRCUGlSdkFRRjFGZ1hFNllRK2ppWWRTQld1?=
 =?utf-8?B?OTluQU9wdnAzVFRvbXhjdUhlemFEZHpJcGdmYzhxbTMxV0Z5Q2x5cWU2RUcr?=
 =?utf-8?B?OWdQeTdpUktzK2gzNGZWWlY5d1Eza09RQTRMNmFLNU9YcU0wcHNhNDY3cERG?=
 =?utf-8?B?ZzJrZHI5RytPNkF3YmQ5bVd4MU1FU2RmQUdQN3B3SWQ1UWMvWWgxSEQyRUow?=
 =?utf-8?Q?9ZOQ2z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 10:25:22.9088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36540564-95ab-41fa-454f-08ddbe09bf54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9647

On Tue Jul 8, 2025 at 2:07 AM CEST, Stefano Stabellini wrote:
> Today, checking for non-fatal MCE errors on ARM is very invasive: it
> involves a periodic timer interrupting the physical CPU execution at
> regular intervals. Moreover, when the timer fires, the handler sends an
> IPI to all physical CPUs.
>
> Both these actions are disruptive in terms of latency and deterministic
> execution times for real-time workloads. They might miss a deadline due
> to one of these IPIs. Make it possible to disable non-fatal MCE errors
> checking with a new Kconfig option (AMD_MCE_NONFATAL).
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> RFC. I couldn't find a better way to do this.
> ---
>  xen/arch/x86/Kconfig.cpu               | 15 +++++++++++++++
>  xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  3 ++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> index 5fb18db1aa..14e20ad19d 100644
> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -10,6 +10,21 @@ config AMD
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on AMD platforms.
> =20
> +config AMD_MCE_NONFATAL
> +	bool "Check for non-fatal MCEs on AMD CPUs"
> +	default y
> +	depends on AMD
> +	help
> +	  Check for non-fatal MCE errors.
> +
> +	  When this option is on (default), Xen regularly checks for
> +	  non-fatal MCEs potentially occurring on all physical CPUs. The
> +	  checking is done via timers and IPI interrupts, which is
> +	  acceptable in most configurations, but not for real-time.
> +
> +	  Turn this option off if you plan on deploying real-time workloads
> +	  on Xen.
> +

This being in the CPU vendor submenu seems off. I'd expect only a list of
silicon vendors here. I think it ought to be in the regular Kconfig file.

>  config INTEL
>  	bool "Support Intel CPUs"
>  	default y
> diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mc=
heck/amd_nonfatal.c
> index 7d48c9ab5f..812e18f612 100644
> --- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
> +++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
> @@ -191,7 +191,8 @@ static void cf_check mce_amd_work_fn(void *data)
> =20
>  void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
>  {
> -	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
> +	if ( !IS_ENABLED(CONFIG_AMD_MCE_NONFATAL) ||
> +	     (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))) )
>  		return;
> =20
>  	/* Assume we are on K8 or newer AMD or Hygon CPU here */

It can be made more general to remove more code. What do you think of remov=
ing
all non-fatals and getting rid of the initcall altogether?

	diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
	index 5fb18db1aa..a4b892a1aa 100644
	--- a/xen/arch/x86/Kconfig.cpu
	+++ b/xen/arch/x86/Kconfig.cpu
	@@ -10,6 +10,20 @@ config AMD
	          May be turned off in builds targetting other vendors.  Otherwise=
,
	          must be enabled for Xen to work suitably on AMD platforms.

	+config MCE_NONFATAL
	+       bool "Check for non-fatal MCEs"
	+       default y
	+       help
	+         Check for non-fatal MCE errors.
	+
	+         When this option is on (default), Xen regularly checks for
	+         non-fatal MCEs potentially occurring on all physical CPUs. The
	+         checking is done via timers and IPI interrupts, which is
	+         acceptable in most configurations, but not for real-time.
	+
	+         Turn this option off if you plan on deploying real-time workload=
s
	+         on Xen.
	+
	 config INTEL
	        bool "Support Intel CPUs"
	        default y
	diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/Ma=
kefile
	index e6cb4dd503..c70b441888 100644
	--- a/xen/arch/x86/cpu/mcheck/Makefile
	+++ b/xen/arch/x86/cpu/mcheck/Makefile
	@@ -1,12 +1,12 @@
	-obj-$(CONFIG_AMD) +=3D amd_nonfatal.o
	+obj-$(filter $(CONFIG_AMD),$(CONFIG_MCE_NONFATAL)) +=3D amd_nonfatal.o
	 obj-$(CONFIG_AMD) +=3D mce_amd.o
	 obj-y +=3D mcaction.o
	 obj-y +=3D barrier.o
	-obj-$(CONFIG_INTEL) +=3D intel-nonfatal.o
	+obj-$(filter $(CONFIG_INTEL),$(CONFIG_MCE_NONFATAL)) +=3D intel-nonfatal.=
o
	 obj-y +=3D mctelem.o
	 obj-y +=3D mce.o
	 obj-y +=3D mce-apei.o
	 obj-$(CONFIG_INTEL) +=3D mce_intel.o
	-obj-y +=3D non-fatal.o
	+obj-$(CONFIG_MCE_NONFATAL) +=3D non-fatal.o
	 obj-y +=3D util.o
	 obj-y +=3D vmce.o

... with the Kconfig option probably in the regular x86 Kconfig rather than
Kconfig.cpu

Thoughts?

Cheers,
Alejandro

