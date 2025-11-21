Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD6C7896E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168580.1494589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqp-0000NF-Sj; Fri, 21 Nov 2025 10:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168580.1494589; Fri, 21 Nov 2025 10:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqp-0000Kr-Lq; Fri, 21 Nov 2025 10:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1168580;
 Fri, 21 Nov 2025 10:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqo-0008Dv-Ef
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:50 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d83e49b-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:58:47 +0100 (CET)
Received: from SN7PR04CA0214.namprd04.prod.outlook.com (2603:10b6:806:127::9)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:58:37 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:127:cafe::40) by SN7PR04CA0214.outlook.office365.com
 (2603:10b6:806:127::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:58:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:30 -0800
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
X-Inumbo-ID: 0d83e49b-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdkZb3ClXkv+kb5h7/Fanr9d3VCJdrOASG8zjvfcwQLXPn038PwlPhVXG5bBRoGBBGFGGSj2zAVQDAJJ8t4auablHfjlO6tFEmclP5Bho48QUR52GXYN7w9wAIMCcDTkqaX1wakqljdSnpByEHZuEyCRU5m2HQhj4tGSadi1wY8RR0pvNXimht1+6kSfwNIPQj54cEUjFpYXAsNxOEmxq0IjTnWjs7qFbBWPG62EkPFKzfSofd97wVMMm3y899oHONycijNJAm23TfD8STWq7owwq37BkyJbpONy9NPnDNV0zEsfLbTqKSmDV5FcGBNl7jUQyativzUuaU2Om9E+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUCDwf6m9s3EcL9ImUik1eDJPyQ22v+t+7I6d4R0DDM=;
 b=IB+VwBwIYiT/qf1aBeSwLnleVobKWralOI6Vjg+QdgispOWvDQV8aA+TTdQOedRO4fzl8zB11iPoqOyDnMeMGV1OS36JGX27EU1SmTYI5Lu7K2YHHeVBTnm1PVzXRBAWWsviBL0JThh7TPKB88fGcEE162aCV77Pr7vxpoH/h4Xw+zsN8QyKTM8/vWJcRNL0JE/YZpgBrXRbEHVzJuW3F6ryskuRQ8afdVdZ+QGmn1OFI9BlnfWYTqdHq+sT9JkoSKU6rFbNv7U9wWp3d1v2tqlSg+CYlWETTmjCjKNSOjvZvLbKEaQnLmp+wbOcQFxsY4BelK8EIbAUKb8ZWzyGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUCDwf6m9s3EcL9ImUik1eDJPyQ22v+t+7I6d4R0DDM=;
 b=5AKK1qz6hUcLcEzS/os+iNUWJxzWR3+ddHrTTtwUakHvUUHT22WEhZ5cdK1g+tSi/5xsvwbcMLu3/FUtf1YHArqfFyXu0xdMMsUAit2gSMopTOyYaObtjmurlbUu6s40efMY5WS5j3wMsmRPKU+seuqvW9urBe/T6H/p6QDu4bI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <xen-devel@dornerworks.com>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Nathan Studer
	<nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 03/24] xen/sysctl: replace CONFIG_SYSCTL with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:40 +0800
Message-ID: <20251121105801.1251262-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|PH7PR12MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d3b036-7fae-4e4a-5569-08de28ecebb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sbDiPq/Q449JtTTipMj1gbjvTN8HeZZC7ubR5pAb8NgVUL+0v/dvSW8+mBKX?=
 =?us-ascii?Q?kb26eLrpzm5rgimwUD2ICl9cb4apH1NMaUb7sNPBcLrEEbWl5qa9nH3NGLeO?=
 =?us-ascii?Q?S+7l78zxij/TWu+K5MwESk0X8+TAQeU9+5qKmp4zDDAco25+KXt9n+369XaU?=
 =?us-ascii?Q?416v8piTWabSFEeiXqHK0GnrtX55jYyop4vM8DR0m2mHe3Z1orTIf5SqOQSO?=
 =?us-ascii?Q?KbbFO4KseLT1pY12wrST9tWlqc0i78daoIVzMQYsqlgIPOehlwE85qNuQxWl?=
 =?us-ascii?Q?RXWrjAodDNbZMkH2qbc/UDYfWXCiHvEcdmr8f5WXS9uRDNtlpDUavC7QxMLF?=
 =?us-ascii?Q?07wYWy0FV+aYOTC4FKrW71saemFQYF4CQGJLrE5lBSmEFX8m99Nz3Agiqpk+?=
 =?us-ascii?Q?wxZj0gqbYB6Zk76L1UD2rOp6jRTbhMijz9sddc0wvHhC/Tt1iG36EZAZKDPT?=
 =?us-ascii?Q?qY4U12A8cM4L4He8GCcuU0V0UA1hhvYVCt96DbR2zIOwDhm08PZj/npBDpgD?=
 =?us-ascii?Q?KDJAgXkZaSJqD1Cxuwk8Gs6OQAumkTx1Sq9tySqVlwWy8Mai4SBBtTJrgG4k?=
 =?us-ascii?Q?s7NkNzgJQvgwwYBLnZ2Hvz7/PQESxG33dxb6S7hjBrat5uI4QubzOM6hxKSn?=
 =?us-ascii?Q?QgjzyabdhswgdLp+F96M4zLGngB0iJLOIBHR6Uh1v1LDz4IEe8BWuX2MhmDX?=
 =?us-ascii?Q?wlEyRdyicYT3OypsmqmnpKI0l2biQNQDeUUbmXEBRO7g8/xqWNVHDIwabcBD?=
 =?us-ascii?Q?TuA/47pWtfyhWvF7YGRDdbs3uzGRlLk7L9XQaks7FBSTP22oa7z226BsxxZy?=
 =?us-ascii?Q?vNwgsuQu4idMSfS5gc7y08WmkIXTGiEyq6jVoWlC5oQfmRv2dh6vwrmmX2Xo?=
 =?us-ascii?Q?RCN0fz1PJ9KyrtJeG8i7alrEkHHqqqPWy0A9CIQxq3GzArHvUZv4+evgk80D?=
 =?us-ascii?Q?8PFglshWNoxg9bAUT0eeBH+vhs64Swa5jnRBlksBNLrsArBwqZUc3u1Ek9Yw?=
 =?us-ascii?Q?c+LmUtPBd7I9OZlQ4dKQBZm/oWM/6QsC95ByY+D8e0H+gj74Rf5RF3wmFaOv?=
 =?us-ascii?Q?D5whLG2t060f4hh5O9jTdGLioWZfnt1HVVCvogEAZR4vuLxjB7S2cC5C8RCq?=
 =?us-ascii?Q?r6r7sYvfMmtM2E77CH5cf4F/YlvQmweroKw+1IkKccPQoQ562Y85WlcgKkIQ?=
 =?us-ascii?Q?mcQXCNvn8qx45CVLKSu98ZYz/qaPaUxIT4wSUEyCc0TTaozr/5Lp8gAACC+K?=
 =?us-ascii?Q?dLoGDro/2cky2lf4T7UNShnVfCojCa5erEIAvdM0OQBQeBQ640ImD/cVB3VC?=
 =?us-ascii?Q?TGEanULQIjGBy3lk4lcDBXnOD23RfxZ0MODlLdIGY2UdLDKmdFI94swa/+NN?=
 =?us-ascii?Q?hWC0mx6Tt3tSaofVfswMnI87IuidX4cWebTLLZqhTLfrUrXWMVpdEccjfbLm?=
 =?us-ascii?Q?b3QNp3XnXezdYy+RUcqIMvdD882aIDfpy+jedgKNsSN/hzF9vPnOwXzC5x3/?=
 =?us-ascii?Q?sQZrcnHXr4XdGP3YIJOgsAenCrYjKUMX5Yt7hucL3WCWkKKnxRHmgCUICeTA?=
 =?us-ascii?Q?MPwKts0Jlj81w5PSMGM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:36.4085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d3b036-7fae-4e4a-5569-08de28ecebb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878

Rename all the CONFIG_SYSCTL into CONFIG_MGMT_HYPERCALLS to help provide a
single option to manage all unnecessary hypercalls, including
sysctl, domctl, etc, in dom0less system and PV shim mode, which could also
make it easier to support randconfigs.
While doing the replacement, we fix some bugs on xsm system:
- wrap the whole xsm function to avoid bringing unreachable codes when
MGMT_DOMCTL=n
- add missing wrapping in include/xsm/dummy.h

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Juergen Gross <jgross@suse.com>
Acked-by: Stewart Hildebrand <stewart@stew.dk> #ARINC 653
Acked-by: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
v2 -> v3:
- wrap the whole xsm function
- add missing wrapping in include/xsm/dummy.h
- refine kconfig description
---
 xen/Kconfig.debug                     |  2 +-
 xen/arch/arm/Makefile                 |  2 +-
 xen/arch/riscv/stubs.c                |  4 ++--
 xen/arch/x86/Makefile                 |  2 +-
 xen/arch/x86/configs/pvshim_defconfig |  2 +-
 xen/arch/x86/psr.c                    | 26 +++++++++++++-------------
 xen/common/Kconfig                    | 15 ++++++++-------
 xen/common/Makefile                   |  2 +-
 xen/common/page_alloc.c               |  8 ++++----
 xen/common/perfc.c                    |  4 ++--
 xen/common/sched/arinc653.c           | 10 +++++-----
 xen/common/sched/core.c               |  6 +++---
 xen/common/sched/cpupool.c            | 16 ++++++++--------
 xen/common/sched/credit.c             |  6 +++---
 xen/common/sched/credit2.c            |  6 +++---
 xen/common/sched/private.h            |  4 ++--
 xen/common/spinlock.c                 |  4 ++--
 xen/drivers/char/console.c            |  4 ++--
 xen/include/hypercall-defs.c          |  4 ++--
 xen/include/xsm/dummy.h               |  6 ++++++
 xen/include/xsm/xsm.h                 | 24 +++++++++---------------
 xen/xsm/dummy.c                       |  6 +++---
 xen/xsm/flask/hooks.c                 | 22 +++++++++++-----------
 23 files changed, 93 insertions(+), 92 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c5..a69615cd63 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -37,7 +37,7 @@ config SELF_TESTS
 
 config COVERAGE
 	bool "Code coverage support"
-	depends on SYSCTL && !LIVEPATCH
+	depends on MGMT_HYPERCALLS && !LIVEPATCH
 	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
 	help
 	  Enable code coverage support.
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7e88ddd3d7..2aff1a1630 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,7 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
-obj-$(CONFIG_SYSCTL) += sysctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += vcpreg.o
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 340ed3cd6c..37b4346d3f 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -277,7 +277,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
     BUG_ON("unimplemented");
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* sysctl.c */
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
@@ -290,7 +290,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* p2m.c */
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f71ca9f18b..d21fdd49df 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -66,7 +66,7 @@ obj-y += smpboot.o
 obj-y += spec_ctrl.o
 obj-y += srat.o
 obj-y += string.o
-obj-$(CONFIG_SYSCTL) += sysctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += sysctl.o
 obj-y += time.o
 obj-y += traps-setup.o
 obj-y += traps.o
diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 24f4e4857d..d1db94df78 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -25,4 +25,4 @@ CONFIG_PDX_NONE=y
 # CONFIG_INTEL_IOMMU is not set
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set
-# CONFIG_SYSCTL is not set
+# CONFIG_MGMT_HYPERCALLS is not set
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index cce7020868..80ce5804b4 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -135,7 +135,7 @@ static const struct feat_props {
      */
     enum psr_type alt_type;
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     /* get_feat_info is used to return feature HW info through sysctl. */
     bool (*get_feat_info)(const struct feat_node *feat,
                           uint32_t data[], unsigned int array_len);
@@ -422,7 +422,7 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
     return true;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static bool cf_check cat_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
@@ -435,7 +435,7 @@ static bool cf_check cat_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* L3 CAT props */
 static void cf_check l3_cat_write_msr(
@@ -448,14 +448,14 @@ static const struct feat_props l3_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L3_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = cat_get_feat_info,
 #endif
     .write_msr = l3_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* L3 CDP props */
 static bool cf_check l3_cdp_get_feat_info(
     const struct feat_node *feat, uint32_t data[], uint32_t array_len)
@@ -467,7 +467,7 @@ static bool cf_check l3_cdp_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check l3_cdp_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -483,7 +483,7 @@ static const struct feat_props l3_cdp_props = {
     .type[0] = PSR_TYPE_L3_DATA,
     .type[1] = PSR_TYPE_L3_CODE,
     .alt_type = PSR_TYPE_L3_CBM,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = l3_cdp_get_feat_info,
 #endif
     .write_msr = l3_cdp_write_msr,
@@ -501,14 +501,14 @@ static const struct feat_props l2_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L2_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = cat_get_feat_info,
 #endif
     .write_msr = l2_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* MBA props */
 static bool cf_check mba_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
@@ -523,7 +523,7 @@ static bool cf_check mba_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check mba_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -561,7 +561,7 @@ static const struct feat_props mba_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_MBA_THRTL,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = mba_get_feat_info,
 #endif
     .write_msr = mba_write_msr,
@@ -826,7 +826,7 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
     return socket_info + socket;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len)
 {
@@ -858,7 +858,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 
     return -EINVAL;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 218ac3d549..6709c3c95c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -508,7 +508,7 @@ config CRYPTO
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
-	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL && HAS_VMAP
+	depends on "$(XEN_HAS_BUILD_ID)" = "y" && MGMT_HYPERCALLS && HAS_VMAP
 	select CC_SPLIT_SECTIONS
 	help
 	  Allows a running Xen hypervisor to be dynamically patched using
@@ -600,7 +600,7 @@ config DTB_FILE
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
-	depends on SYSCTL
+	depends on MGMT_HYPERCALLS
 	help
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
 	  This will allow live information about Xen's execution and performance
@@ -651,19 +651,20 @@ config SYSTEM_SUSPEND
 menu "Supported hypercall interfaces"
 	visible if EXPERT
 
-config SYSCTL
-	bool "Enable sysctl hypercall"
+config MGMT_HYPERCALLS
+	bool "Enable privileged hypercalls for system management"
 	depends on !PV_SHIM_EXCLUSIVE
 	default y
 	help
 	  This option shall only be disabled on some dom0less systems, or
-	  PV shim on x86, to reduce Xen footprint.
+	  PV shim on x86, to reduce Xen footprint via managing unnessary
+	  hypercalls, like sysctl, etc.
 
 endmenu
 
 config PM_OP
 	bool "Enable Performance Management Operation"
-	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	depends on ACPI && HAS_CPUFREQ && MGMT_HYPERCALLS
 	default y
 	help
 	  This option shall enable userspace performance management control
@@ -671,7 +672,7 @@ config PM_OP
 
 config PM_STATS
 	bool "Enable Performance Management Statistics"
-	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	depends on ACPI && HAS_CPUFREQ && MGMT_HYPERCALLS
 	default y
 	help
 	  Enable collection of performance management statistics to aid in
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 0c7d0f5d46..7c32fbd9f1 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -51,7 +51,7 @@ obj-y += spinlock.o
 obj-$(CONFIG_STACK_PROTECTOR) += stack-protector.o
 obj-y += stop_machine.o
 obj-y += symbols.o
-obj-$(CONFIG_SYSCTL) += sysctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += sysctl.o
 obj-y += tasklet.o
 obj-y += time.o
 obj-y += timer.o
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1f67b88a89..26615d1e97 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -602,7 +602,7 @@ out:
     return ret;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
     spin_lock(&heap_lock);
@@ -610,7 +610,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
     *free_pages = avail_heap_pages(MEMZONE_XEN + 1, NR_ZONES - 1, -1);
     spin_unlock(&heap_lock);
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static bool __read_mostly first_node_initialised;
 #ifndef CONFIG_SEPARATE_XENHEAP
@@ -1788,7 +1788,7 @@ int offline_page(mfn_t mfn, int broken, uint32_t *status)
     return 0;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * Online the memory.
  *   The caller should make sure end_pfn <= max_page,
@@ -1873,7 +1873,7 @@ int query_page_offline(mfn_t mfn, uint32_t *status)
 
     return 0;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * This function should only be called with valid pages from the same NUMA
diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 0f3b89af2c..97a94ef1fc 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -149,7 +149,7 @@ void cf_check perfc_reset(unsigned char key)
     }
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
 static xen_sysctl_perfc_val_t *perfc_vals;
 static unsigned int      perfc_nbr_vals;
@@ -266,7 +266,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc)
 
     return rc;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Local variables:
diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 8a4f4259d8..7d6c40d800 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -220,7 +220,7 @@ static void update_schedule_units(const struct scheduler *ops)
                       SCHED_PRIV(ops)->schedule[i].unit_id);
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /**
  * This function is called by the adjust_global scheduler hook to put
  * in place a new ARINC653 schedule.
@@ -335,7 +335,7 @@ arinc653_sched_get(
 
     return 0;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /**************************************************************************
  * Scheduler callback functions                                           *
@@ -661,7 +661,7 @@ a653_switch_sched(struct scheduler *new_ops, unsigned int cpu,
     return &sr->_lock;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /**
  * Xen scheduler callback function to perform a global (not domain-specific)
  * adjustment. It is used by the ARINC 653 scheduler to put in place a new
@@ -701,7 +701,7 @@ a653sched_adjust_global(const struct scheduler *ops,
 
     return rc;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /**
  * This structure defines our scheduler for Xen.
@@ -736,7 +736,7 @@ static const struct scheduler sched_arinc653_def = {
     .switch_sched   = a653_switch_sched,
 
     .adjust         = NULL,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .adjust_global  = a653sched_adjust_global,
 #endif
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index ec2448cfa1..88150432c3 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2064,7 +2064,7 @@ long do_set_timer_op(s_time_t timeout)
     return 0;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /* scheduler_id - fetch ID of current scheduler */
 int scheduler_id(void)
 {
@@ -2107,7 +2107,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
     return ret;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 {
     struct cpupool *pool;
@@ -2136,7 +2136,7 @@ long sched_adjust_global(struct xen_sysctl_scheduler_op *op)
 
     return rc;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void vcpu_periodic_timer_work_locked(struct vcpu *v)
 {
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index f5459c2779..51ba3cb43d 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -241,12 +241,12 @@ struct cpupool *cpupool_get_by_id(unsigned int poolid)
     return __cpupool_get_by_id(poolid, true);
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static struct cpupool *cpupool_get_next_by_id(unsigned int poolid)
 {
     return __cpupool_get_by_id(poolid, false);
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void cpupool_put(struct cpupool *pool)
 {
@@ -354,7 +354,7 @@ static struct cpupool *cpupool_create(unsigned int poolid,
 
     return ERR_PTR(ret);
 }
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * destroys the given cpupool
  * returns 0 on success, 1 else
@@ -382,7 +382,7 @@ static int cpupool_destroy(struct cpupool *c)
     debugtrace_printk("cpupool_destroy(pool=%u)\n", c->cpupool_id);
     return 0;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * Move domain to another cpupool
@@ -572,7 +572,7 @@ static int cpupool_unassign_cpu_start(struct cpupool *c, unsigned int cpu)
     return ret;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static long cf_check cpupool_unassign_cpu_helper(void *info)
 {
     struct cpupool *c = info;
@@ -638,7 +638,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     }
     return continue_hypercall_on_cpu(work_cpu, cpupool_unassign_cpu_helper, c);
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /*
  * add a new domain to a cpupool
@@ -816,7 +816,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
     rcu_read_unlock(&sched_res_rculock);
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 /*
  * do cpupool related sysctl operations
  */
@@ -982,7 +982,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     return ret;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 unsigned int cpupool_get_id(const struct domain *d)
 {
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 6dcf6b2c8b..0cbec2a9c0 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1256,7 +1256,7 @@ __csched_set_tslice(struct csched_private *prv, unsigned int timeslice_ms)
     prv->credit = prv->credits_per_tslice * prv->ncpus;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check
 csched_sys_cntl(const struct scheduler *ops,
                         struct xen_sysctl_scheduler_op *sc)
@@ -1299,7 +1299,7 @@ csched_sys_cntl(const struct scheduler *ops,
     out:
     return rc;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void *cf_check
 csched_alloc_domdata(const struct scheduler *ops, struct domain *dom)
@@ -2290,7 +2290,7 @@ static const struct scheduler sched_credit_def = {
 
     .adjust         = csched_dom_cntl,
     .adjust_affinity= csched_aff_cntl,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .adjust_global  = csched_sys_cntl,
 #endif
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 75316d42b7..307e63ebd8 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3131,7 +3131,7 @@ csched2_aff_cntl(const struct scheduler *ops, struct sched_unit *unit,
         __clear_bit(__CSFLAG_pinned, &svc->flags);
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check csched2_sys_cntl(
     const struct scheduler *ops, struct xen_sysctl_scheduler_op *sc)
 {
@@ -3163,7 +3163,7 @@ static int cf_check csched2_sys_cntl(
 
     return 0;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void *cf_check
 csched2_alloc_domdata(const struct scheduler *ops, struct domain *dom)
@@ -4248,7 +4248,7 @@ static const struct scheduler sched_credit2_def = {
 
     .adjust         = csched2_dom_cntl,
     .adjust_affinity= csched2_aff_cntl,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .adjust_global  = csched2_sys_cntl,
 #endif
 
diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index d6884550cd..b7ff67200b 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -356,7 +356,7 @@ struct scheduler {
                                     struct sched_unit *unit,
                                     const struct cpumask *hard,
                                     const struct cpumask *soft);
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     int          (*adjust_global)  (const struct scheduler *ops,
                                     struct xen_sysctl_scheduler_op *sc);
 #endif
@@ -512,7 +512,7 @@ static inline int sched_adjust_dom(const struct scheduler *s, struct domain *d,
     return s->adjust ? s->adjust(s, d, op) : 0;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int sched_adjust_cpupool(const struct scheduler *s,
                                        struct xen_sysctl_scheduler_op *op)
 {
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 0389293b09..9d08159615 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -690,7 +690,7 @@ void cf_check spinlock_profile_reset(unsigned char key)
     spinlock_profile_iterate(spinlock_profile_reset_elem, NULL);
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 typedef struct {
     struct xen_sysctl_lockprof_op *pc;
     int                      rc;
@@ -750,7 +750,7 @@ int spinlock_profile_control(struct xen_sysctl_lockprof_op *pc)
 
     return rc;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx)
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 9bd5b4825d..c38b58d5fc 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -371,7 +371,7 @@ static void conring_puts(const char *str, size_t len)
         conringc = conringp - conring_size;
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 long read_console_ring(struct xen_sysctl_readconsole *op)
 {
     XEN_GUEST_HANDLE_PARAM(char) str;
@@ -414,7 +414,7 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 
     return 0;
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 
 /*
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index cef08eeec1..4840de805b 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -194,7 +194,7 @@ kexec_op(unsigned long op, void *uarg)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
@@ -277,7 +277,7 @@ physdev_op                         compat   do       hvm      hvm      do_arm
 #ifdef CONFIG_HVM
 hvm_op                             do       do       do       do       do
 #endif
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 sysctl                             do       do       do       do       do
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index e4e1c680c8..9b1d31b6ec 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -148,11 +148,13 @@ static XSM_INLINE int cf_check xsm_domctl_scheduler_op(
     return xsm_default_action(action, current->domain, d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static XSM_INLINE int cf_check xsm_set_target(
     XSM_DEFAULT_ARG struct domain *d, struct domain *e)
@@ -180,6 +182,7 @@ static XSM_INLINE int cf_check xsm_domctl(
     }
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -191,6 +194,7 @@ static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static XSM_INLINE int cf_check xsm_alloc_security_domain(struct domain *d)
 {
@@ -485,11 +489,13 @@ static XSM_INLINE int cf_check xsm_resource_setup_misc(XSM_DEFAULT_VOID)
     return xsm_default_action(action, current->domain, NULL);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static XSM_INLINE int cf_check xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static XSM_INLINE int cf_check xsm_hypfs_op(XSM_DEFAULT_VOID)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 1d72431d32..4c6e0dc0f9 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -57,13 +57,15 @@ struct xsm_ops {
     int (*domain_create)(struct domain *d, uint32_t ssidref);
     int (*getdomaininfo)(struct domain *d);
     int (*domctl_scheduler_op)(struct domain *d, int op);
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*sysctl_scheduler_op)(int op);
 #endif
     int (*set_target)(struct domain *d, struct domain *e);
     int (*domctl)(struct domain *d, unsigned int cmd, uint32_t ssidref);
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*sysctl)(int cmd);
     int (*readconsole)(uint32_t clear);
+#endif
 
     int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
     int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
@@ -138,7 +140,7 @@ struct xsm_ops {
     int (*resource_setup_gsi)(int gsi);
     int (*resource_setup_misc)(void);
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     int (*page_offline)(uint32_t cmd);
 #endif
     int (*hypfs_op)(void);
@@ -244,7 +246,7 @@ static inline int xsm_domctl_scheduler_op(
     return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 {
     return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
@@ -263,23 +265,17 @@ static inline int xsm_domctl(xsm_default_t def, struct domain *d,
     return alternative_call(xsm_ops.domctl, d, cmd, ssidref);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
-#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.sysctl, cmd);
-#else
-    return -EOPNOTSUPP;
-#endif
 }
 
 static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
-#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.readconsole, clear);
-#else
-    return -EOPNOTSUPP;
-#endif
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_evtchn_unbound(
     xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
@@ -593,14 +589,12 @@ static inline int xsm_resource_setup_misc(xsm_default_t def)
     return alternative_call(xsm_ops.resource_setup_misc);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
 {
-#ifdef CONFIG_SYSCTL
     return alternative_call(xsm_ops.page_offline, cmd);
-#else
-    return -EOPNOTSUPP;
-#endif
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int xsm_hypfs_op(xsm_default_t def)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index b7b65a7122..dbe363f0de 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -19,12 +19,12 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl_scheduler_op           = xsm_sysctl_scheduler_op,
 #endif
     .set_target                    = xsm_set_target,
     .domctl                        = xsm_domctl,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl                        = xsm_sysctl,
     .readconsole                   = xsm_readconsole,
 #endif
@@ -97,7 +97,7 @@ static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .resource_setup_gsi            = xsm_resource_setup_gsi,
     .resource_setup_misc           = xsm_resource_setup_misc,
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .page_offline                  = xsm_page_offline,
 #endif
     .hypfs_op                      = xsm_hypfs_op,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 89e790b774..d0fd057db5 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -626,7 +626,7 @@ static int cf_check flask_domctl_scheduler_op(struct domain *d, int op)
     }
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_sysctl_scheduler_op(int op)
 {
     switch ( op )
@@ -641,7 +641,7 @@ static int cf_check flask_sysctl_scheduler_op(int op)
         return avc_unknown_permission("sysctl_scheduler_op", op);
     }
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_set_target(struct domain *d, struct domain *t)
 {
@@ -858,7 +858,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
     }
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int cf_check flask_sysctl(int cmd)
 {
     switch ( cmd )
@@ -946,7 +946,7 @@ static int cf_check flask_readconsole(uint32_t clear)
 
     return domain_has_xen(current->domain, perms);
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline uint32_t resource_to_perm(uint8_t access)
 {
@@ -1203,12 +1203,12 @@ static int cf_check flask_resource_unplug_core(void)
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__UNPLUG, NULL);
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int flask_resource_use_core(void)
 {
     return avc_current_has_perm(SECINITSID_DOMXEN, SECCLASS_RESOURCE, RESOURCE__USE, NULL);
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static int cf_check flask_resource_plug_pci(uint32_t machine_bdf)
 {
@@ -1273,7 +1273,7 @@ static int cf_check flask_resource_setup_misc(void)
     return avc_current_has_perm(SECINITSID_XEN, SECCLASS_RESOURCE, RESOURCE__SETUP, NULL);
 }
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
 static inline int cf_check flask_page_offline(uint32_t cmd)
 {
     switch ( cmd )
@@ -1288,7 +1288,7 @@ static inline int cf_check flask_page_offline(uint32_t cmd)
         return avc_unknown_permission("page_offline", cmd);
     }
 }
-#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static inline int cf_check flask_hypfs_op(void)
 {
@@ -1884,12 +1884,12 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
     .domctl_scheduler_op = flask_domctl_scheduler_op,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl_scheduler_op = flask_sysctl_scheduler_op,
 #endif
     .set_target = flask_set_target,
     .domctl = flask_domctl,
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .sysctl = flask_sysctl,
     .readconsole = flask_readconsole,
 #endif
@@ -1950,7 +1950,7 @@ static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .resource_setup_gsi = flask_resource_setup_gsi,
     .resource_setup_misc = flask_resource_setup_misc,
 
-#ifdef CONFIG_SYSCTL
+#ifdef CONFIG_MGMT_HYPERCALLS
     .page_offline = flask_page_offline,
 #endif
     .hypfs_op = flask_hypfs_op,
-- 
2.34.1


