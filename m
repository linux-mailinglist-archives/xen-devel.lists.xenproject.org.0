Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F52B02313
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 19:46:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041408.1412238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaHob-00086o-Jq; Fri, 11 Jul 2025 17:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041408.1412238; Fri, 11 Jul 2025 17:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaHob-00084c-Fk; Fri, 11 Jul 2025 17:45:41 +0000
Received: by outflank-mailman (input) for mailman id 1041408;
 Fri, 11 Jul 2025 17:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OS2t=ZY=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uaHoZ-00084W-BH
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 17:45:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9db411f-5e7e-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 19:45:37 +0200 (CEST)
Received: from BN1PR14CA0020.namprd14.prod.outlook.com (2603:10b6:408:e3::25)
 by DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 17:45:32 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::44) by BN1PR14CA0020.outlook.office365.com
 (2603:10b6:408:e3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.23 via Frontend Transport; Fri,
 11 Jul 2025 17:45:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 17:45:32 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 12:45:29 -0500
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
X-Inumbo-ID: d9db411f-5e7e-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OACEQvkqXHhiMYBs2g6ybXKZ6k/YkOw8mB9iR/l65zyctW7N+EcjD8qtuIYdgYe8+VQNEU+o/h0YALB7mjWFmtDrVWOmIgO1hghwWdh4noQKuinPA/vebQp3va3RXhM7IZUeeDHXnemjltPnddoNU71he2Kw02ZY0yC9NfuH/nQC0DARCgjiUxIFre6Rxwble1f7xawB/TyVxX+vfg5kreZ/sXVOnz/JW7Lzf7qzVdJqBdH3+75kRxbNBwjiZgqZ4SR118nFlrdby9Lkx8mU2UbqPs+MGZCjSJzXM7XMNTkgHWXdWT/8h0gqB+b1v1AsGjOFTOyPbcuYkYASyytWMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=175fTwE5D2iY0XTJ2Qw44dGL7GCMH5URhqbXoQl5dPg=;
 b=kaKI0OvIv0RckVnEU+k5WuYhTmvMPhcLpo0LcWbWZh9uPUwdvVRflEbTY2ZfyEPFOHfQfedjkxxpHQL+cwRk/wlputut/kTiriE/Tq0/euOnkayKTSVgQad7OAHKIcEKcs+dl8Qit0C4QJ2vJeaJ99CE6+YafQhJvnWTEJ6qU33jfvOOJSGgnNqAXs9NIvSFXBmo0gXPN0UGciCocQXP4Zf2P43s2CmtplFXly0O6UULi8TIB/EZfj+lq1zjQG5KPUHxQmywLCkKjsOPSTJggJ8EW9TY4o0bRsE7x2OK2WMbf5cAt7TQDS79Y3ANnDueZ3rYFKuo5IhpkjYW1zGzEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=175fTwE5D2iY0XTJ2Qw44dGL7GCMH5URhqbXoQl5dPg=;
 b=SyyAAxse6zT7sacUwExoHMo09QhpuBcLrwopfi+DIVvxKhyGYMfJs8ROX0abYN8eFkpH9fTDMrnC7sGCl7DDy0xQpdG/JsIm0slNiO81Pq/d+LUElk6g+z+Ku/3R1aXJ6IOoW+DpqiHiUJPqaz99fgxVO4Ci06hIdkgH/k5QOWY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Jul 2025 19:45:28 +0200
Message-ID: <DB9EVWXIJQ8X.3M8QTEWAFSEH2@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 05/11] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
 <20250708180721.2338036-6-alejandro.garciavallejo@amd.com>
In-Reply-To: <20250708180721.2338036-6-alejandro.garciavallejo@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|DM4PR12MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f004e5-3e52-47ae-56e8-08ddc0a2bbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTFsUzAvUnJzWm1GU2RsdzNSRE03UTdNYzE5VWd1NnlXdkhwaG5hdHg5cjk0?=
 =?utf-8?B?cENKY1pzQWZXY0IzeExWT2w5TDFwR3lNcTUyV3ZUc0g0K0NHK0ltMkcxMnJO?=
 =?utf-8?B?RHliUUpOMzBkWUtjN2c4VS8vMG05dVZxOVVXN1R3dmpXUndaZDhhRVFDRzhi?=
 =?utf-8?B?c0gwWThwMGdaNzFqWHlwalpaNFVCcGQ4dzRSRlNydExQa0xpNlJHREltWDA1?=
 =?utf-8?B?U3NEbDE0UkpqT3pWVGFNM3NCWmtmeTdGU2o0bkZ6cTJTdytGWStHSWtwWDZR?=
 =?utf-8?B?WXdobFYrZU1ibExZa3Y4Q1oxdnJsQjJqSHJUWGJGWTV5WklIV2xHZ3F6RTBX?=
 =?utf-8?B?MU9teGQwRWFaejU1L1FuWDQvNzVVVFNBOSsvV0VpVk5vSU1sVU5qSU9wazhy?=
 =?utf-8?B?U3VTb05vKzJ6ZXdialZJWVZHQkpjYTcweENaN1phS2FzekkrSVNvQklFSE1n?=
 =?utf-8?B?VjZyL2FiMUtSazltbFRqUWN3bDdZSTBDR201YmZWWDVuMUZKbkozZzJaNng4?=
 =?utf-8?B?M3hCdlJJd1ByZHc3Y09SOU9aWTZCdWZpcG94RGtiYmtoOXZjTlhmZjQvVTNn?=
 =?utf-8?B?RXNmU2ozZkIzV3R3bE9KMHBXSm1ncWxteEhFWDN1NFBiYlhYZG9LQlpFeno0?=
 =?utf-8?B?UEZOK2hLQUs2NHhQeDlCeDMwR0xnZ05NNEUzY3lVc3QrUUszS29SWVRxZFZs?=
 =?utf-8?B?VzJuUVNTeE4rM0lKcFlmbWxZZ1VRenlHTy9PNEM3SkJhU1NGcHV5WHJmdmxo?=
 =?utf-8?B?d0NBbEd1cnNkL3ZxM3p4dUZ4bExpYmlWcUhzSWNlMnFqbFBzcnc2OGZ4OENX?=
 =?utf-8?B?THB2S0xWVGt0aTByNU1VUHdJc21KMWwrQVJvNmM1NlNRTU9BV2o1RVNtc2ZD?=
 =?utf-8?B?YTMyMlpCc0NYcVdmRVNudHBYMUh4WlN4RVQxTW1kd0VicmF2REUxSXU0dWs3?=
 =?utf-8?B?L0RQZHZoVFQ0cDl6WFMvVEFsaXVteUs5eDM5RzVLM09QdUUzeHMraXVMQmNO?=
 =?utf-8?B?em1RdjJITDB5YmI5L1hLdEhVYUNIWE5kMmFvdFZpT0NFN0x1eDM2cDNjVlYv?=
 =?utf-8?B?WGNZYlFYbDlZN0ZvSW0zWkpyWEYzMWRmeTh1TVg5ZjBVYm92TlhaK2VDbVVO?=
 =?utf-8?B?UE81WmRvOCthQUY1b3dLSmNUQ0tJckRUdE5Mdm1heGdVV2cwSkR2eS84eWdr?=
 =?utf-8?B?cFpOUkVRWWpqQXM5OGtEQzlOdC9YbE4wbkpQY1ozRTA0VnlzVzAyUkpUdFh2?=
 =?utf-8?B?WlRmZ1FXdkY1QjNJcGNEbUdjMld6OFpZQTN5RmljTWpQaXFaN2IzUExOMGpq?=
 =?utf-8?B?Q2JNK2s2VFZpbElnREoyOWlZMFFzdVhhUng0Y1R1QTY3blkvRk5xM0pzSnc1?=
 =?utf-8?B?eEdKS1Y5OWRHbnNsRzlQWkYvcU9YVndMamVWQUxwVWFNMitZMkg0YzQ0ZTZv?=
 =?utf-8?B?aGs0eXEwN01lT0dra2pqSUJmb1hMY3ZCWFd6bFRJd2M4eUp5cXZFNHJySFZV?=
 =?utf-8?B?NHdwdTVIbjNnZjV5RWpMYmNyY2pua05CaGx2bG5QMGJueDU4ZE0xUGZ2YVJJ?=
 =?utf-8?B?cUFoS0ZsaWN0OVBjZGlqY0hkUlhOY3drYWFpU2YxcXIzbWJFcWFMSUlKZmQ4?=
 =?utf-8?B?b2diZk9kaDB6NWp1bS9wSk9wbysvZ0dxeEdKUm9XODVwTkw2R2hBelpETUZF?=
 =?utf-8?B?S2JZOW9Mc0xlSDJLSElZS0ZHZUZhOHVZY3FxK1NleHhNS1l5WmpGUVVnNTd3?=
 =?utf-8?B?YlQ0ZVJTQllEWE1ZQy8xY2pFWWpmVFZaVFNCVWxDQ2NQRG5tNzFlNUFTREly?=
 =?utf-8?B?WWxyZ3czWjNkc2l0VEVmRkl3UTBxMEk4UWZ5R0FxcVhudCtySU5rYWRISjNZ?=
 =?utf-8?B?eDhmMG43RjBEN2UvMGVZR1JrM2dOUThEaXhaY0FEdEwzRnNaRTYyazlkU2pC?=
 =?utf-8?B?L2dqZC8xOGppbnQ2WFlaWlcrMW4xUzZaZ0xwY0tPVW1QVDFWODd4TnFxd2Rv?=
 =?utf-8?B?Tm85MFdWcjV3VmRxOHJpZmVyakdUR1BFY0JEaXF2WG5BZUlwOUxTbXp6QWxw?=
 =?utf-8?Q?3G3L1y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 17:45:32.2182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f004e5-3e52-47ae-56e8-08ddc0a2bbb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111

On Tue Jul 8, 2025 at 8:07 PM CEST, Alejandro Vallejo wrote:
> From: Alejandro Vallejo <agarciav@amd.com>
>
> Part of an unpicking process to extract bootfdt contents independent of b=
ootinfo
> to a separate file for x86 to take.
>
> Move functions required for early FDT parsing from device_tree.h and arm'=
s
> setup.h onto bootfdt.h
>
> Declaration motion only. Not a functional change.
>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/arch/riscv/cpufeature.c            |  1 +
>  xen/arch/riscv/smpboot.c               |  1 +
>  xen/common/device-tree/device-tree.c   |  1 +
>  xen/common/device-tree/static-evtchn.c |  1 +
>  xen/common/sched/boot-cpupool.c        |  1 +
>  xen/include/xen/bootfdt.h              | 91 ++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h          | 78 ----------------------
>  7 files changed, 96 insertions(+), 78 deletions(-)
>
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index b7d5ec6580..b846a106a3 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -8,6 +8,7 @@
>   */
> =20
>  #include <xen/bitmap.h>
> +#include <xen/bootfdt.h>
>  #include <xen/ctype.h>
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
> diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
> index 470f6d1311..3b8bf98e20 100644
> --- a/xen/arch/riscv/smpboot.c
> +++ b/xen/arch/riscv/smpboot.c
> @@ -1,3 +1,4 @@
> +#include <xen/bootfdt.h>
>  #include <xen/cpumask.h>
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tre=
e/device-tree.c
> index 7bede20fa6..4ebdb2e52e 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -8,6 +8,7 @@
>   */
> =20
>  #include <xen/bitops.h>
> +#include <xen/bootfdt.h>
>  #include <xen/types.h>
>  #include <xen/init.h>
>  #include <xen/guest_access.h>
> diff --git a/xen/common/device-tree/static-evtchn.c b/xen/common/device-t=
ree/static-evtchn.c
> index 8b82e6b3d8..88342b44a1 100644
> --- a/xen/common/device-tree/static-evtchn.c
> +++ b/xen/common/device-tree/static-evtchn.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> =20
> +#include <xen/bootfdt.h>
>  #include <xen/event.h>
>  #include <xen/static-evtchn.h>
> =20
> diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpup=
ool.c
> index 641f3495cb..03be73efdd 100644
> --- a/xen/common/sched/boot-cpupool.c
> +++ b/xen/common/sched/boot-cpupool.c
> @@ -7,6 +7,7 @@
>   * Copyright (C) 2022 Arm Ltd.
>   */
> =20
> +#include <xen/bootfdt.h>
>  #include <xen/acpi.h>
>  #include <xen/sched.h>
> =20
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 65ba818e1a..6cf6c1317c 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -2,8 +2,11 @@
>  #ifndef XEN_BOOTFDT_H
>  #define XEN_BOOTFDT_H
> =20
> +#include <xen/byteorder.h>
> +#include <xen/bug.h>
>  #include <xen/types.h>
>  #include <xen/kernel.h>
> +#include <xen/lib.h>
>  #include <xen/macros.h>
>  #include <xen/xmalloc.h>
> =20
> @@ -16,8 +19,80 @@
>  #define NR_MEM_BANKS 256
>  #define NR_SHMEM_BANKS 32
> =20
> +/* Default #address and #size cells */
> +#define DT_ROOT_NODE_ADDR_CELLS_DEFAULT 2
> +#define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
> +
>  #define MAX_MODULES 32 /* Current maximum useful modules */
> =20
> +#define DEVICE_TREE_MAX_DEPTH 16
> +
> +/* Helper to read a big number; size is in cells (not bytes) */
> +static inline u64 dt_read_number(const __be32 *cell, int size)
> +{
> +    u64 r =3D 0;
> +
> +    while ( size-- )
> +        r =3D (r << 32) | be32_to_cpu(*(cell++));
> +    return r;
> +}

Bah, bad rebase. This should've been the new switch. I'll correct it on whe=
n I
resend it.

Cheers,
Alejandro

