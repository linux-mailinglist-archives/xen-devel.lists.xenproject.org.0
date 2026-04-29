Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGPgNU7x8WkOlwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:53:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180C5493C3C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 13:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297238.1573342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI3Tg-0004B0-3x; Wed, 29 Apr 2026 11:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297238.1573342; Wed, 29 Apr 2026 11:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI3Tg-000480-15; Wed, 29 Apr 2026 11:53:16 +0000
Received: by outflank-mailman (input) for mailman id 1297238;
 Wed, 29 Apr 2026 11:53:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wI3Te-00047u-TB
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 11:53:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI3Te-005628-8s
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 13:53:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f1f129-e002-0a2a0a5209dd-0a2a4505a384-0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 13:53:13 +0200
Received: from [52.101.48.55]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f1f127-aaa8-0a2a45050019-34653037c223-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 13:53:13 +0200
Received: from CH5P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::8)
 by BL3PR12MB9050.namprd12.prod.outlook.com (2603:10b6:208:3b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 11:53:05 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::1d) by CH5P221CA0021.outlook.office365.com
 (2603:10b6:610:1f2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 11:53:05 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 11:53:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Apr
 2026 06:53:04 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Apr
 2026 06:53:04 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 06:53:01 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXtJ1GJYSoxKzokmNkyYG6IxIG6KBrW1EvQVgV1iARDd4FxYU7XHpCs8tMh/GuyDsDXpBqhtAEIqUWvG7RqdJU7Br07wyU/ymfHijvvrRTnJwHmzd1j8lDGn9eBwxY75Vue1PAtFOIAabYIH+RLEV2lDuhsA7wy/WaHjiuDpHlJ+JltwcsjXZlwXiS7Y4TO3F6WU00T0T/Y9Si6Cd4Z0gNnITB1bImpA1au5T0aIj5EZyZi6mguyHxyKLirJ0B0PHin3e5/7R58cVytEwbwhF+lUudHt1SYwX/fjz7ifqH96whHEVU8bh9reT7zV3mRnK3JOaJoXhSMAGS8NPnj0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSUccJ2NiKOgcdgBVQpHeOeKuu5G/GBUlOydb9+9OS8=;
 b=RtGcqWRlSN/cjMrhc16Tm462uUaoSxGe5Gqr0tTkCUoYT7K04Pd5OxCpsxjXus1pJ+VpOC8YnrapbLWpgyZXb5ig+qqBU7xXIT64w9T+yaGr1SNjs1bF/gp1JI28OZVmmo5RJQ9qeN6DvNBsD57erQZhf/hREitKEDBxKfuKW12uAkeOBEAYYbTNd8KldBFjclreGLJvAP70Dr00VDqx02XjTgHvDBs40CXpcSoRS2yOk7Qu4lHVO38y6SFwq05JarhfigFmuswqOTFxQR/Sb7IrEWtYiJk2nWvPYtDOsjHYVswIp4WXXV17EOxh3iCpjs3oHjAiYvtvOsZ8Cwabzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSUccJ2NiKOgcdgBVQpHeOeKuu5G/GBUlOydb9+9OS8=;
 b=bSOFWZq2tLGbH9FYPFK4OncwHjdXHwFJJgErt3rMYiMl8q35yNEF1rM65rg4M5BzMdmihyC0L8TjlwcWcE3hTYVed08g8osnR15AvmmQXiT680THC13kkY4vawgOYVFWMwlI8QphmJUCB+ysvsTwSKRQPjmMp+wUNuxNqSX+cn0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <6ba6db51-3ff0-4ecd-9f86-03735e7dfc05@amd.com>
Date: Wed, 29 Apr 2026 13:53:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Harry Ramsey <harry.ramsey@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20260420142224.1802911-1-luca.fancellu@arm.com>
 <20260420142224.1802911-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260420142224.1802911-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|BL3PR12MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: a842c483-bee4-4a72-e10b-08dea5e5dfe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QFEVf/FyZqmli+baGr6sgqGBBLu6MzeOtAHgC/aXm2VxjUYh36QKqB8BP/pCpIc4yiFMNjJVrhh37DU+MlDz0NiiJ7oL9+LlF62hfgRHQXPXCBfTBeu0w82jHzJqRRO9HhTfCshMvpo64MvmRhztB9BCwcj0rRCGUHhOzbxt/CRrUdUo1ApfHsZz7mn4wMjeVwUdVrzPIThYU7r7FiWOCW+ddLNwmFHerPshHCsuCVVzB1Fpn/o/cie1NGWY4dmVj4yPYMJQtNayEApjU/cQ+Ezy+CLMHy8Tl6wGaRusARtYd21tRJm10EvkbRI6OQLSvxqCQC6dQAkTIY/yOOYcr4W080l0gwrLhqSlS2B4IY/4FF7K9DCJtiYF2ln1kY+GAoPZLvy0fuocxASA1gnRzDJ8gbReqIaUQQ+ndS/a8nthCZLSyv1WYxtCsnQ3lB3VeioxwOk3NxkoaQuq0wkyDxr8HYx9dBivUXloBls8iPO71P0cfBQUVemwys7vz0oJ48uz11cxvUTZORGSVgicnvmNqKPvK9sTu3VGx27Df6557FoafxByVzYvLxnX8rmbqlBBaCXQsdFqYqeMZW0plHVz2jMctELZhUdyGiWEZRX66qq4kZIt4SuCEyg2Qgj5tEAZr0wukhQ202gX9Vk88PUJolXbIBtH8NwSERsh3shc6UnaAe9kCRfFZIDWnchYZEMpLP2PcAVTlFqSiRii1b/UssqmjFVvXLiDd2ibrUI5vzIfZrYRU2gpL6RgBem05irWzPT5KoahwnZmFFJ/JQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XhdL2p0dgJFrw/Z5Df2XMdYJqDTsAElBEUeVUYydB2FdUre4l9lhJkOp6f8nx/qQKSl/9TwjkfA8/5/Zf90P6XZ7EAqsrVamWdfgorFIWLyF0Huloy14HglD2Rd/INWblUCNcdctUWdEVG/Me1orlhiWwGHJiHtnnKWhPEAqxKnSu+o1FP3U/JyhkhRDJyLp+nKTiMcF/ASIiQsBUmnzX9fsJdeV4Vze5oOTVQ3CgrNBCAqFy8tFd/M9NPXsHsMzHbQpWCYHVbD6ghZmj/E20KOJwQPvJEpgFVXwib9L7ZD2wr0zaAcH9bM1TLsBX+3jigG1wsYp8YzIDC4OBmPiVvPxkGlSj2UzD0/zPpZJApkvI0Q7t+vhoYW6xztx+x+992wgxikV0K7cXYIM8zMDmQVA0ZY+HC6VwVfizj1iS9E+kRU91SNfkONSrzt7QO40
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 11:53:05.4991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a842c483-bee4-4a72-e10b-08dea5e5dfe3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9050
X-purgate-ID: tlsNG-c201ff/1777463593-E1FDA443-60848554/0/0
X-purgate-type: clean
X-purgate-size: 15877
X-Rspamd-Queue-Id: 180C5493C3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]



On 20-Apr-26 16:22, Luca Fancellu wrote:
> From: Harry Ramsey <harry.ramsey@arm.com>
> 
> Add a new device tree property `v8r_el1_msa` to select the MSA (memory
> system architecture) at EL1 for Armv8-R architecture: MPU or MMU, the
> former is the default if the property is not passed.
> 
> The check and setting of this new input parameter for the guest
> configuration is performed in arch_domain_create() instead of the more
> usual arch_sanitise_domain_config() because the former has access to the
> Xen internal guest creation flags which are required to ensure PMSA can
> work (domain requires static allocation and direct mapping).
> 
> The property is valid only when used on MPU systems and will result in
> a panic on MMU ones.
> 
> Bumped XEN_DOMCTL_INTERFACE_VERSION because of the new domctl input
> parameter.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4:
> - Rework the patch to have the v8r_el1_msa input parameter more
>   enclosed in the Armv8-A (mmu)/Armv8-R (mpu) space.
> v3:
> - Improve commit message and device tree property description
> - Remove macro protection
> - Remove unused function is_mpu_domain
> - Code formatting
> ---
>  docs/misc/arm/device-tree/booting.txt       | 14 ++++
>  xen/arch/arm/dom0less-build.c               |  3 +
>  xen/arch/arm/domain.c                       |  4 ++
>  xen/arch/arm/include/asm/domain.h           |  4 ++
>  xen/arch/arm/include/asm/domain_build.h     |  8 +++
>  xen/arch/arm/include/asm/mmu/domain-build.h | 46 +++++++++++++
>  xen/arch/arm/include/asm/mpu.h              |  5 ++
>  xen/arch/arm/include/asm/mpu/domain-build.h | 27 ++++++++
>  xen/arch/arm/mpu/Makefile                   |  1 +
>  xen/arch/arm/mpu/arm32/mm.c                 |  5 ++
>  xen/arch/arm/mpu/arm64/mm.c                 |  5 ++
>  xen/arch/arm/mpu/domain-build.c             | 76 +++++++++++++++++++++
>  xen/include/public/arch-arm.h               |  7 ++
>  xen/include/public/domctl.h                 |  4 +-
>  14 files changed, 207 insertions(+), 2 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/mmu/domain-build.h
>  create mode 100644 xen/arch/arm/include/asm/mpu/domain-build.h
>  create mode 100644 xen/arch/arm/mpu/domain-build.c
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 977b4286082f..c3f484a3b01a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -322,6 +322,20 @@ with the following properties:
>      Should be used together with scmi-smc-passthrough Xen command line
>      option.
>  
> +- v8r_el1_msa
> +
> +    A string property specifying whether, on Armv8-R systems, a domain
> +    should use PMSAv8 (MPU) at EL1 or VMSAv8 (MMU) at EL1.
Instead of repeating at EL1 you could move it next to "on Armv8R systems"

> +
> +    - "mmu"
> +    Enables VMSAv8 at EL1. This requires hardware support and is only
> +    optionally available on AArch64.
Maybe it's due to the combination of words but it does not immediately tell that
it's not present on AArch32. I would add: "Not supported on AArch32".

> +
> +    - "mpu"
> +    Enables PMSAv8 at EL1. This is the default behaviour when the property is
> +    not passed. This configuration requires static allocation (xen,static-mem)
> +    and direct mapping (direct-map).
> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 4181c105389a..6f0256f9d825 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -24,6 +24,7 @@
>  #include <asm/domain_build.h>
>  #include <asm/firmware/sci.h>
>  #include <asm/grant_table.h>
> +#include <asm/mpu.h>
>  #include <asm/setup.h>
>  
>  #ifdef CONFIG_VGICV2
> @@ -322,6 +323,8 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>      if ( domu_dt_sci_parse(node, d_cfg) )
>          panic("Error getting SCI configuration\n");
>  
> +    arch_dt_v8r_el1_msa_parse(node, d_cfg);
"arch" prefix should be used by functions called from the common code that have
arch-specific implementation. This is not the case for functions you're
introducing here, so please drop this prefix.

Also, I would continue using the SCI approach e.g. call it domu_dt_msa_parse()
and decide to panic at the call site rather than making this decision in the
function itself.

> +
>      if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>      {
>          int vpl011_virq = GUEST_VPL011_SPI;
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 26380a807cad..dfa7ace1141b 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -18,6 +18,7 @@
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
>  #include <asm/current.h>
> +#include <asm/domain_build.h>
>  #include <asm/event.h>
>  #include <asm/gic.h>
>  #include <asm/guest_atomics.h>
> @@ -725,6 +726,9 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = sci_domain_init(d, config)) != 0 )
>          goto fail;
>  
> +    if ( (rc = arch_set_v8r_el1_msa(d, config, flags)) != 0 )
> +        goto fail;
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index ffe5d0d9f0a6..4a3fb825962b 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -128,6 +128,10 @@ struct arch_domain
>  #endif
>  
>      struct resume_info resume_ctx;
> +
> +#ifdef CONFIG_MPU
> +    uint8_t v8r_el1_msa;
> +#endif
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index 6674dac5e2f8..921d6f98f4f4 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -4,6 +4,14 @@
>  #include <xen/fdt-kernel.h>
>  #include <xen/sched.h>
>  
> +#if defined(CONFIG_MMU)
> +#include <asm/mmu/domain-build.h>
> +#elif defined(CONFIG_MPU)
> +#include <asm/mpu/domain-build.h>
> +#else
> +# error "Unknown memory management layout"
I don't think that this error msg is correct for domain build.

> +#endif
> +
>  typedef __be32 gic_interrupt_t[3];
>  int make_psci_node(void *fdt);
>  void evtchn_allocate(struct domain *d);
> diff --git a/xen/arch/arm/include/asm/mmu/domain-build.h b/xen/arch/arm/include/asm/mmu/domain-build.h
> new file mode 100644
> index 000000000000..3e0d9a6a2a08
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mmu/domain-build.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_MMU_DOMAIN_BUILD_H__
> +#define __ARM_MMU_DOMAIN_BUILD_H__
> +
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <public/domctl.h>
> +
> +static inline
> +void arch_dt_v8r_el1_msa_parse(struct dt_device_node *node,
> +                               struct xen_domctl_createdomain *d_cfg)
> +{
> +    const char *v8r_el1_msa;
> +
> +    if ( !dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa) )
> +        panic("'v8r_el1_msa' property found, but CONFIG_MPU not selected\n");
> +}
> +
> +static inline
> +int arch_set_v8r_el1_msa(struct domain *d,
> +                         const struct xen_domctl_createdomain *config,
> +                         unsigned int flags)
> +{
> +    if ( config->arch.v8r_el1_msa )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "arch.v8r_el1_msa set, but CONFIG_MPU not selected\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +#endif /* __ARM_MMU_DOMAIN_BUILD_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 72fa5b00b861..8a8c01086206 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -27,6 +27,11 @@
>  
>  #ifndef __ASSEMBLER__
>  
> +/*
> + * Utility function to determine if an Armv8-R processor supports VMSA.
> + */
NIT: No need for multi-line comment for a single sentence that can fit in one line.

> +bool has_v8r_vmsa_support(void);
> +
>  /*
>   * Set base address of MPU protection region.
>   *
> diff --git a/xen/arch/arm/include/asm/mpu/domain-build.h b/xen/arch/arm/include/asm/mpu/domain-build.h
> new file mode 100644
> index 000000000000..463cd85b5b7e
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/domain-build.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_MPU_DOMAIN_BUILD_H__
> +#define __ARM_MPU_DOMAIN_BUILD_H__
> +
> +#include <xen/device_tree.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <public/domctl.h>
> +
> +void arch_dt_v8r_el1_msa_parse(struct dt_device_node *node,
> +                               struct xen_domctl_createdomain *d_cfg);
> +
> +int arch_set_v8r_el1_msa(struct domain *d,
> +                         const struct xen_domctl_createdomain *config,
> +                         unsigned int flags);
> +
> +#endif /* __ARM_MPU_DOMAIN_BUILD_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index 3327fadd5d0e..e3997e41b81b 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_ARM_32) += arm32/
>  obj-$(CONFIG_ARM_64) += arm64/
> +obj-y += domain-build.o
>  obj-y += domain-page.o
>  obj-y += mm.o
>  obj-y += p2m.o
> diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
> index a4673c351141..5eaeb3400e6c 100644
> --- a/xen/arch/arm/mpu/arm32/mm.c
> +++ b/xen/arch/arm/mpu/arm32/mm.c
> @@ -38,6 +38,11 @@
>          break;                                            \
>      }
>  
> +bool has_v8r_vmsa_support(void)
> +{
> +    return false;
> +}
> +
>  /*
>   * Armv8-R supports direct access and indirect access to the MPU regions through
>   * registers:
> diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
> index ed643cad4073..b07e729a7d05 100644
> --- a/xen/arch/arm/mpu/arm64/mm.c
> +++ b/xen/arch/arm/mpu/arm64/mm.c
> @@ -32,6 +32,11 @@
>          break;                                                  \
>      }
>  
> +bool has_v8r_vmsa_support(void)
> +{
> +    return system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_VMSA_SUPPORT;
> +}
> +
>  /*
>   * Armv8-R supports direct access and indirect access to the MPU regions through
>   * registers:
> diff --git a/xen/arch/arm/mpu/domain-build.c b/xen/arch/arm/mpu/domain-build.c
> new file mode 100644
> index 000000000000..1bdd0ffedebb
> --- /dev/null
> +++ b/xen/arch/arm/mpu/domain-build.c
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/device_tree.h>
> +#include <xen/domain.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/types.h>
> +#include <xen/sched.h>
> +#include <asm/mpu.h>
> +#include <asm/mpu/domain-build.h>
> +#include <public/arch-arm.h>
> +#include <public/domctl.h>
> +
> +void __init arch_dt_v8r_el1_msa_parse(struct dt_device_node *node,
> +                                      struct xen_domctl_createdomain *d_cfg)
> +{
> +    const char *v8r_el1_msa;
> +
> +    d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE;
> +
> +    if ( !dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa) )
> +    {
> +        if ( !strcmp(v8r_el1_msa, "mmu") )
> +            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA;
> +        else if ( !strcmp(v8r_el1_msa, "mpu") )
> +            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA;
> +        else
> +            panic("Invalid device tree option for v8r_el1_msa\n");
> +    }
> +}
> +
> +int arch_set_v8r_el1_msa(struct domain *d,
> +                         const struct xen_domctl_createdomain *config,
> +                         unsigned int flags)
> +{
> +    switch ( config->arch.v8r_el1_msa )
> +    {
> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE:
> +        fallthrough;
> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
> +        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
> +        {
> +            dprintk(XENLOG_INFO,
> +                    "PMSA is not valid for domain without static allocation and direct map (v8r_el1_msa)\n");
> +            return -EINVAL;
> +        }
> +        break;
> +
> +    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA:
> +        if ( !has_v8r_vmsa_support() )
> +        {
> +            dprintk(XENLOG_INFO,
> +                    "Platform does not support VMSA at EL1 (v8r_el1_msa)\n");
> +            return -EINVAL;
> +        }
> +        break;
> +
> +    default:
> +        dprintk(XENLOG_INFO, "Unsupported arch.v8r_el1_msa value (%u)\n",
> +                config->arch.v8r_el1_msa);
> +        return -EINVAL;
> +    }
Why do we even need this split. It seems like all the above checks could be done
in arch_dt_v8r_el1_msa_parse given that it is called after static-mem,direct-map
are set. This would simplify this file and we would not even need to introduce
new domain-build split for one function.

> +
> +    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
> +
> +    return 0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index cd563cf70684..7d6f87e8b2b1 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -330,6 +330,10 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>  #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>  
> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE    0
> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
> +
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
>      uint8_t gic_version;
> @@ -355,6 +359,9 @@ struct xen_arch_domainconfig {
>      uint32_t clock_frequency;
>      /* IN */
>      uint8_t arm_sci_type;
> +    /* IN */
> +    uint8_t v8r_el1_msa;
> +    uint16_t pad;
Before this change there were 3B of implicit padding. Now you added 1B of data
and 2B of explicit padding. The struct size is the same, so why bumping the
interface version? I don't see it necessary here. Also, why explicit padding?
With explicit padding I do think you need to now check that it's 0.

>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 8f6708c0a7cd..23124547f347 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -30,9 +30,9 @@
>   * fields) don't require a change of the version.
>   * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
>   *
> - * Last version bump: Xen 4.19
> + * Last version bump: Xen 4.22
>   */
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
>  
>  /*
>   * NB. xen_domctl.domain is an IN/OUT parameter for this operation.

~Michal


