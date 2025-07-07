Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904CFAFAA18
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035072.1407271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJA-0007MK-19; Mon, 07 Jul 2025 03:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035072.1407271; Mon, 07 Jul 2025 03:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJ9-0007Kk-Ph; Mon, 07 Jul 2025 03:14:19 +0000
Received: by outflank-mailman (input) for mailman id 1035072;
 Mon, 07 Jul 2025 03:14:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJ7-0007KZ-U6
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:18 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2418::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 762004bc-5ae0-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 05:14:16 +0200 (CEST)
Received: from BYAPR08CA0062.namprd08.prod.outlook.com (2603:10b6:a03:117::39)
 by SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 03:14:10 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::a1) by BYAPR08CA0062.outlook.office365.com
 (2603:10b6:a03:117::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:02 -0500
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
X-Inumbo-ID: 762004bc-5ae0-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gq/9a0eboryCgYRKOVFIE2lH4H/Kyd7icDvF1b9o2ieDo2gangELNX0SLUJi958S/4ktL8xA2Z0qRna2YIEnTWWSAHyKfueyYYCJmkKHO8149w7Ya2B3lY2sljk2xc6/Ky925AVvA5yyfpIH37zS2QVos7aBLcRFDwy/uqsIOuIJO7vJFlZjIDR3PlcqqBCUDVnSq7Q1szKLHw137GVO10VzGu7IQxTLPQUUhJduBo1fZPidGbJ7r6TlH8rknuX+0BJm89Hby0hkw8zv6MSBbuvFecOP1njf1hiDjHZHPHe/QhGTWudWrEJ1vWn6nrNtEkRWu3MXZ8Tl/GGRq57o8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqj866d5mRC6ZVhCHnWNoJAXSzg4Pmss+ut2zFhLpdE=;
 b=kRJLJdp4uLXMU0VqCUwq1c9ex0Mz1n/VfOLMv+4iPJy3ZTVTx/mYj4QSXUpmsfn1ijQC4C7ccG9zSH51FU6i+A4Py0mx36ErTo/pEtttAnyv3GNC3Fi+klorqOGI3HpqX8XkbwgkaYmmHO/wOnhYIz8Sg1gZY3IJoxmnLV48yDtIBcdFMZV5qyXspYc7A8JX8LDeCHyZUz7UnZpIpmr3mfQGnmOHfn3FfmxKElEZOejExbf2S3QOExh2/RTASLwjXYTwP9Rceyx+KgRYL8Xw7l0r6RgvzfgxlF03KQa9KRNOFkZUfnVH8bCS7npMHk1cqaJCAtzJ7NJyuWIzWIFZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqj866d5mRC6ZVhCHnWNoJAXSzg4Pmss+ut2zFhLpdE=;
 b=JGRb8DJGHpVhRgTaih4TDNKDLgwByBZJlo5lr2FbhZzGYZ/1Qdckjq+ja62mR9yo3THBPmCW4ev+XPyk1NsjZdhLe3YNAMt6IWhEHSxnU3m9RcWflz5cBmj07eUuM+76ChUaHjq/k0fR9ZLgLLn13Z4/4j441m2MEqGp47ylIUc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>, Nathan Studer <nathan.studer@dornerworks.com>,
	"Stewart Hildebrand" <stewart@stew.dk>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v7 00/11] xen: introduce CONFIG_SYSCTL
Date: Mon, 7 Jul 2025 11:13:35 +0800
Message-ID: <20250707031346.901567-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|SJ0PR12MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: d391060d-7be1-4f75-76dc-08ddbd045726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LUWONc+WxGa4/D5BBaAgOV5tRG1tsXRcb59eH4wAcZ7GM9GKj9bb4CxQDJuc?=
 =?us-ascii?Q?2NXy3C8tHfzUKFkamh0XIsFsFvYhAIAUuVvhI7YBSbmLJVkCI//NN/97gONf?=
 =?us-ascii?Q?kJ37Vw46U6G8b/jBu5E78BvaUPqHZiEiDPRj7z5Oq5pfibEY0LUT7Xx83/Co?=
 =?us-ascii?Q?DD+A40A9+x4FklJsEP4v7M0L5OLF2BM/vrT08Yg21FgaP9UGAKMDdwNGct+A?=
 =?us-ascii?Q?Be8kKPpSVzI49SGMpUvZ7hRb5KqC3ChdZG1h2OcQvQ301eQ+2kMp277khS7z?=
 =?us-ascii?Q?ACA7cQhsSaWxKy0DeTiHRj8V5ilFh/W2YVLZ9mN2U9vqhipLTsFBl3BnMbR9?=
 =?us-ascii?Q?U+4rcpeqd3pYpRpN/5N4I6ZEg4MjfZ3j8LxWaMZP9Gc2YHCJ0aFKYx6QqbBg?=
 =?us-ascii?Q?L8gHtHD16lUKsIP067dTnXBZkCGfIiA6RDoBpWBsxX3j0IKXpcdsU9iMeZi1?=
 =?us-ascii?Q?Z3QJV4scvcXaT44H0y45PegryqOji5e8AVF60Pj8Ze6cy6ojpqR+AOjxTdqj?=
 =?us-ascii?Q?p1CYjinFLfmYc46Bv88ZoYQz/nkndGTON2fB1LRtXYcVRoi4AzYSnsHazRht?=
 =?us-ascii?Q?NDumacDNJ/uoaC4z8BJzl8x/7C2TnsNf97RoYOj3T0swiP0R9EKWty1zX/qn?=
 =?us-ascii?Q?HgzD6ba9r19g/HvWfW35wE1eiFPtfNldOVRkSqj/KFztccYHOe2HRn1UQ16V?=
 =?us-ascii?Q?P5DOJBNM2+VLQiRm2F0Igrvpg0DuLOjPjIjEefF64UDTOv/9WppEMc67ajMk?=
 =?us-ascii?Q?i5bPEd4HNjnDuz2P3sRWE+wyUbIiNIrs+wTsYTgDT5Ahm6UVJkGyyN4A2gAd?=
 =?us-ascii?Q?vube5XjSiHk2LnjdjBvbgKkNpEVYZp0ExjTIELGnNI2TzX/uXyVNy156jSHB?=
 =?us-ascii?Q?QX3/94W6n94z8cGhwLv7JLKE8A6hpAz9u11ux53NWtpz1H4zdyFH9aIynuJz?=
 =?us-ascii?Q?bsu0cLgRwzTAoNP23fVPfrI6i504wUUDk82hxKbDiOe+CreiB3A6riYpZWGH?=
 =?us-ascii?Q?GoEea2HKDT9TakQn6UHZ6XYwx8dBxciLk3XRn147PBFRIQ+8rxoyxWC0NHRO?=
 =?us-ascii?Q?vzpWQLHb+a7H61i4NERLPdyn/DP9DedLtlUfDwQVc80yPSEF8cFojYXU6TzM?=
 =?us-ascii?Q?iTaWCd7RkjtmtUwcEGY+fbQFo7Gn48JVgPn1USvKshNxXHCAoEgu3Ua2uX68?=
 =?us-ascii?Q?CQZuwwM6n7VuTs61iLLOUExAj+C9Lz0VxXQfocYlrzQ/dqfrpcNuPQsusAAG?=
 =?us-ascii?Q?LC+6NHZR6Mw5ad1HukxvYIpztACbS96oMCo/IpzpJNngFAZXhStK2P5aitki?=
 =?us-ascii?Q?WoumgF1GiZhGUAm0Q5hnOmBaOvAonFSb3eLPr+FAfTa8GOyiFaFC1gCJR0uG?=
 =?us-ascii?Q?HNMGM0SN1RRwtbMZEmZtMmRJtJq6Do4txGE8/duJZziQMwnZ4mIlT1/MPJCo?=
 =?us-ascii?Q?LfDQ4veSBua8n02Z7qKQmIKvuOx15pAHIP7n+ccZIj6KuFW1BdqPZpa+X/op?=
 =?us-ascii?Q?UaXLIwD5DJcEqBBXswq5qG9JPmCxLJMHWFoaVM7BRh2u3eTwN7/CxCIkvQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:09.4795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d391060d-7be1-4f75-76dc-08ddbd045726
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902

It can be beneficial for some dom0less systems to further reduce Xen footprint
via disabling some hypercalls handling code, which may not to be used &
required in such systems. Each hypercall has a separate option to keep
configuration flexible.

Options to disable hypercalls:
- sysctl
- domctl
- hvm
- physdev
- platform

This patch serie is only focusing on introducing CONFIG_SYSCTL. Different
options will be covered in different patch serie.

Features, like LIVEPATCH, Overlay DTB, which fully rely on sysctl op, will
be wrapped with CONFIG_SYSCTL, to reduce Xen footprint as much as possible.

It is derived from Stefano Stabellini's commit "xen: introduce kconfig options to
disable hypercalls"(
https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)

---
Commit "xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"" and commit "
xen/sysctl: wrap around sysctl hypercall" shall be commited together.
---
v6 -> v7:
- Only do rebasing
---
Penny Zheng (10):
  xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_readconsole
  xen/sysctl: wrap around XEN_SYSCTL_sched_id
  xen/pmstat: introduce CONFIG_PM_OP
  xen/sysctl: introduce CONFIG_PM_STATS
  xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
  xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
  xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
  xen/sysctl: wrap around arch-specific arch_do_sysctl
  xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"

Stefano Stabellini (1):
  xen/sysctl: wrap around sysctl hypercall

 xen/arch/arm/Kconfig                         |   1 +
 xen/arch/arm/Makefile                        |   2 +-
 xen/arch/arm/sysctl.c                        |   2 -
 xen/arch/riscv/stubs.c                       |   2 +-
 xen/arch/x86/Kconfig                         |   4 -
 xen/arch/x86/Makefile                        |   2 +-
 xen/arch/x86/acpi/cpu_idle.c                 |   2 +
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/arch/x86/configs/pvshim_defconfig        |   3 +
 xen/arch/x86/hvm/Kconfig                     |   1 -
 xen/arch/x86/psr.c                           |  18 +
 xen/arch/x86/sysctl.c                        |   2 -
 xen/common/Kconfig                           |  22 +-
 xen/common/Makefile                          |   2 +-
 xen/common/page_alloc.c                      |   2 +
 xen/common/sched/arinc653.c                  |   6 +
 xen/common/sched/core.c                      |   4 +
 xen/common/sched/cpupool.c                   |   8 +
 xen/common/sched/credit.c                    |   4 +
 xen/common/sched/credit2.c                   |   4 +
 xen/common/sched/private.h                   |   4 +
 xen/common/sysctl.c                          |   4 +-
 xen/drivers/acpi/Makefile                    |   3 +-
 xen/drivers/acpi/pm-op.c                     | 395 +++++++++++++++++++
 xen/drivers/acpi/pmstat.c                    | 355 -----------------
 xen/drivers/char/console.c                   |   2 +
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                |  41 --
 xen/drivers/video/Kconfig                    |   2 +-
 xen/include/acpi/cpufreq/cpufreq.h           |   3 -
 xen/include/acpi/cpufreq/processor_perf.h    |  10 +
 xen/include/hypercall-defs.c                 |   8 +-
 xen/include/xsm/xsm.h                        |  18 +
 xen/xsm/dummy.c                              |   6 +
 xen/xsm/flask/hooks.c                        |  14 +
 37 files changed, 552 insertions(+), 418 deletions(-)
 create mode 100644 xen/drivers/acpi/pm-op.c

-- 
2.34.1


