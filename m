Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B08AF8E9D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033087.1406529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckZ-0007ii-Ay; Fri, 04 Jul 2025 09:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033087.1406529; Fri, 04 Jul 2025 09:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckZ-0007gk-5T; Fri, 04 Jul 2025 09:30:31 +0000
Received: by outflank-mailman (input) for mailman id 1033087;
 Fri, 04 Jul 2025 09:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckX-0007ek-0b
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:29 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2414::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fc27dcd-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:18 +0200 (CEST)
Received: from BN9PR03CA0964.namprd03.prod.outlook.com (2603:10b6:408:109::9)
 by DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.22; Fri, 4 Jul 2025 09:30:12 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::10) by BN9PR03CA0964.outlook.office365.com
 (2603:10b6:408:109::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 09:30:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:11 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:05 -0500
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
X-Inumbo-ID: 7fc27dcd-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZzOicjLSI5G3GVKwknOT8vMnsAFxIf1vuIZo26ozpOOmvJbMSFPxwef8S4qQDjgU5PzpFnu1ikPiet2anS0K2VlAsJNdfELk87zeD3qYtcqcOCPVSwE/PYEMzGqgi72qUGQvRfKfMb9GusOmr4pHjKRXq6TGtx/yDRZhiBYgABMhIxiKfiAS3CKyOCTQ2KVr2nL8fnthncWvmXXeIQhNi3bK1oFGIhUa/nyYapgYSPFqnqimcvgs4BF6opBhGbJkpo1C2lIGLZRTO5ROaWmSPhyM/ibwMTQm0nkwRNcLLhcfej6AhOb6C8Hu1+hHEQG0TooGQuft5ierFsBy2p1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQBRDHox8B3/qU4d2DsgNdc5U0Ojeln0y/Ktbg/oOPg=;
 b=KNtFNxntIquRn8ln/ZaJbZzfEtDb9z/h4ZN8Np6JRJ1u72+Gck15/SW33Pda/omuBHn9IVax3uF+D6Hws4Bnr/l1/lRgRHJQXeCRAMmjEyXjTjx/7Qaqpa5acsISYXEXnl2uJKAP+oD5vEdPZbLT/+jznV6q0yCBaf64Jj4E0JjYEfhgx4rHqv/pjiAavgc3fqaO2B7q+vvGt5Arln3ar3/GTy+GvLfGP265MJe1jazLz8eZnpNXhOb99wpnOErk0Hk1FQ/EoZ8HzP0VDt/uCB05LuAGqz2GqPpT+MVASB10mfizTxMgicfO5da6kH3EAM+KWBHfs51fMExns0BIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQBRDHox8B3/qU4d2DsgNdc5U0Ojeln0y/Ktbg/oOPg=;
 b=NvEeeHWbxQGv/1C5fbhiCyQayRQ83B+JgS3SeKAEEn3Y89uxhzGJWP9jZoRSRAEiwmjUYJwMW9MiLqsfaotc3yxkKc1N0HYREYv4wwRxZE3PpWTAub3Ce9gTPTJQlpfNg4TBDc1A4ikARhi3SzrjeTZ4vibMc4wCFikHHwHIhn0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Nathan Studer <nathan.studer@dornerworks.com>, "Stewart
 Hildebrand" <stewart@stew.dk>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v6 00/18] xen: introduce CONFIG_SYSCTL
Date: Fri, 4 Jul 2025 17:29:34 +0800
Message-ID: <20250704092952.822578-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|DS0PR12MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ffb738-42cc-44b3-09d5-08ddbadd5f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cXNAK0fpxmTYrjXG+mHHg8YWpPTp2TMNiR5fZCBgDa6h9wlbGoPVQbyNI3/M?=
 =?us-ascii?Q?hnILhLg9REIscFJc8JXI+FOVzJ6VCea0R5KNGDKu7CSuI4i6lTQJZBIDT3VR?=
 =?us-ascii?Q?oppf51WhCVuxrGxzUiKbfwRp6Qpur7iOniFvafddPz6ms+dkZ6vcD1d4FLIW?=
 =?us-ascii?Q?ftbiMCBC6+AjfNf4eDK8XsaA22Vpvy3OZ76tPOzx1VTGKJAxJ+ksqOLVoTlA?=
 =?us-ascii?Q?0BGuF4gIiggHvsnt0ks0Ns39M4HCykQOXb+ag2DW1dlPfvUcWlCQUhMuz1zA?=
 =?us-ascii?Q?Dqncg0J79LzA/Nefq0LTFPJqcblQ68gTG8gVcA3rJa4gAV4QU+vv3OyIOI5O?=
 =?us-ascii?Q?+LeIRkWLpuVHVaiEQ2MvCwURRteckSOwLqGGJl9LOT/Qk9Vgvban264zDBFG?=
 =?us-ascii?Q?NrYzi/pNTYS8ZgunuAcHVSY20FZMbqy2ICefXjM02sIhsYWlzYyLW7CCbXzM?=
 =?us-ascii?Q?TCP+UcWBWL72skj9jKVCDsqcYz6XggvNMXDsBXjt12969/drS90Db12O6lMD?=
 =?us-ascii?Q?Pf8gTOv+wRy9rr4oyOQAolv92yXvc6kPgPgSJqK9CnhvkSt8I2ZkK9kiNAA7?=
 =?us-ascii?Q?cG/2uasMqj51BHLuxScw4JkFoVwwS7FkWGAi9VScVhcsAAicF7gY9qb03doS?=
 =?us-ascii?Q?ZlDl93Eq4qbASp4NWh2NPitIji9opkkCQdq94kGanCGpPUA1ZZPGsZAVF1/j?=
 =?us-ascii?Q?MgCi/56AMgVAYkiHUHPEc/pjO+wE2L1VwQW0C8Dh9E1QCOtQoxI1aW5kiucS?=
 =?us-ascii?Q?/hXKM9/IeIvAgITazFTwTYd0G86z4M2T5AH3B3bXfwD+/cobpfHY2ALMt52O?=
 =?us-ascii?Q?BOfWNw5/tfvjrJns5wvTHhl6G1V+bk7RtZLg0ww+in9u94GiM2XngzM/ppnb?=
 =?us-ascii?Q?+db6daQ4i9xQOyLVdiwhLVFWn7iyJizWdrWDNqLv2yTm1z5M8NVAL9jlVB0D?=
 =?us-ascii?Q?Yh5JyJCKJu73DYj0u59+DtzWTLsHVDfUVGQQ4CW60L9Du8SkKkVvcQrU0j59?=
 =?us-ascii?Q?Idxewbqil1n1eK0VjKNPZ+ljf79O8MoaC4QelqAQaXYP9ytb4GN27vOhUWRf?=
 =?us-ascii?Q?Okop++JUlb9aYV6dpcXwemYk3JKKcICrmG/zy6Vwi040wMZCINgnL4XucPlM?=
 =?us-ascii?Q?O2Y+zUDQlkmeppPZhjtARs8N7FTXcSMiBw50E9VZaS9CQwp8/onTZUzAwZwC?=
 =?us-ascii?Q?42G546o51AKOGZZVgi6YNKoPep3Q8cYgydDWR1aCQS6eRDqcnDn6p2fGT1mD?=
 =?us-ascii?Q?yR1sYNXsg2T2nOJx8+l6Gob91N9LFLCJQ6XGnKNzm/uqMs8pL7iUd/0tet0b?=
 =?us-ascii?Q?cxav09DvzNJjINYZD6P7lxmJs4KytxIsUBdSN/npV4ebGVG+01BBeNs+00NY?=
 =?us-ascii?Q?MBI4rbxEWaOS2AwTYNFt/ujF1s6r3O1r2hJQ6KUPpeScgzIxI281Xr3iYgov?=
 =?us-ascii?Q?xC5xGyE4VRyZW56n2BRcnLbI5XuIfR61EOr9hYaxQP7n2J4S85NfJoRW9Uq9?=
 =?us-ascii?Q?Y2tZogyGaRdt5Tluy40zAMKieRIXmCjsQoD3o0tiTbCdzj9f0Zt/E1l1Qg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:11.0333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ffb738-42cc-44b3-09d5-08ddbadd5f97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559

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
Penny Zheng (16):
  xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_readconsole
  xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
  xen/sysctl: wrap around XEN_SYSCTL_sched_id
  xen/sysctl: wrap around XEN_SYSCTL_perfc_op
  xen/sysctl: wrap around XEN_SYSCTL_lockprof_op
  xen/pmstat: introduce CONFIG_PM_OP
  xen/sysctl: introduce CONFIG_PM_STATS
  xen/sysctl: wrap around XEN_SYSCTL_page_offline_op
  xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
  xen/sysctl: wrap around XEN_SYSCTL_scheduler_op
  xen/sysctl: wrap around XEN_SYSCTL_physinfo
  xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
  xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
  xen/sysctl: wrap around arch-specific arch_do_sysctl
  xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"

Stefano Stabellini (2):
  xen: introduce CONFIG_SYSCTL
  xen/sysctl: wrap around sysctl hypercall

 xen/Kconfig.debug                            |   2 +-
 xen/arch/arm/Kconfig                         |   1 +
 xen/arch/arm/Makefile                        |   2 +-
 xen/arch/riscv/stubs.c                       |   2 +
 xen/arch/x86/Kconfig                         |   4 -
 xen/arch/x86/Makefile                        |   2 +-
 xen/arch/x86/acpi/cpu_idle.c                 |   2 +
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/arch/x86/configs/pvshim_defconfig        |   3 +
 xen/arch/x86/hvm/Kconfig                     |   1 -
 xen/arch/x86/psr.c                           |  18 +
 xen/common/Kconfig                           |  31 +-
 xen/common/Makefile                          |   2 +-
 xen/common/page_alloc.c                      |   4 +
 xen/common/perfc.c                           |   2 +
 xen/common/sched/arinc653.c                  |   6 +
 xen/common/sched/core.c                      |   4 +
 xen/common/sched/cpupool.c                   |   8 +
 xen/common/sched/credit.c                    |   4 +
 xen/common/sched/credit2.c                   |   4 +
 xen/common/sched/private.h                   |   4 +
 xen/common/spinlock.c                        |   2 +
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
 38 files changed, 569 insertions(+), 414 deletions(-)
 create mode 100644 xen/drivers/acpi/pm-op.c

-- 
2.34.1


