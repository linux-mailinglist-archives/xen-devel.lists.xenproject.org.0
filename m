Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A190DAFAA2A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035118.1407383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcPP-0005s8-HJ; Mon, 07 Jul 2025 03:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035118.1407383; Mon, 07 Jul 2025 03:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcPP-0005p6-CV; Mon, 07 Jul 2025 03:20:47 +0000
Received: by outflank-mailman (input) for mailman id 1035118;
 Mon, 07 Jul 2025 03:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJd-0007mT-Jw
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:49 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20631.outbound.protection.outlook.com
 [2a01:111:f403:2408::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f3b0ed-5ae0-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 05:14:47 +0200 (CEST)
Received: from BY3PR10CA0004.namprd10.prod.outlook.com (2603:10b6:a03:255::9)
 by DS0PR12MB7608.namprd12.prod.outlook.com (2603:10b6:8:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 03:14:40 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::8) by BY3PR10CA0004.outlook.office365.com
 (2603:10b6:a03:255::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:40 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:36 -0500
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
X-Inumbo-ID: 88f3b0ed-5ae0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEiGm2JmNyV2Dk56df/8Ee7a+rs7bv2N6X/DfaUTEX4YT5JKPh9nijVcRa1q3B/hlOaqt9vodb+UlZHwEtHTS+pIZ3VCbYyk3J1kv47Oqs3cpeUlB3/d1OxwCRKy481b7vsPdam2exptbRQ/x0Vgp+f5p9dugmKfYDSNCAtZy9tXzTj9usfsyVKdI1OCnTYFCzvG/u3xO6EZA2XIM5/9WcVAwH9eMwVsvjDkHo9P2zw31al0vP9dj2q7eUcYpRyEUcx4mlrnwAXuSiCngs6eFet97Mrzpd5Sw+k8i70Iyjm9laFTZs0Gpb8oHUDYoFKkMH5H9PenNtsXCVgEF0JTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1LpiZC0rlbfXrVfLcubSIpVFQgeVU79WtlQi0mk+O4=;
 b=s+BzYbOgi8o0O9OHX+0C9JJm5j142F9wfUHOh1nuA4WFnDev8u5tjvURLnHX6OwBsyV0M8puSQhb6UibRRpR2DWs7+vRM7C0S5o1fvrtS7UQUl+SG2O6ghOCD6MUIfGLLK/tJX6u+B6EFdTxl6doY2idh39kBadnw8jFrVeD06NpwjQdKNJWo6Avq2zIEtf2aI0D0no3KlhxVbwLzLB93tL/SxWfbZt1W8rAqC4vHTBgF/qqEHG9a/x65gZCMBCKCYcW7MpA6XayhZM3woosp2ABDeo71rkQk4BZa8s9bTtwIpqCaxzjkw9MCZbXbX3bVePnVUMpmLHX6d++/fVsvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1LpiZC0rlbfXrVfLcubSIpVFQgeVU79WtlQi0mk+O4=;
 b=aY4Dq0Q+uRqYrenAHPHeygBJKX60yjXYzFzBIetm2pGPVorK5pq29ZRe/TXomZp+llHKBGuNJWSJ3tBclnGrnFm7znVzDRYmj9idaaffe6inoaOuHeAt0DllWyJYU4uUKBjB5W8lw8UJFEsoFoGE4ag2WA45gJhygmt8O0SGWaU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH 11/11] xen/sysctl: wrap around sysctl hypercall
Date: Mon, 7 Jul 2025 11:13:46 +0800
Message-ID: <20250707031346.901567-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|DS0PR12MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d930276-5280-49ca-f76d-08ddbd0469bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wA7vOce+YzLPANF//O1dgjHRE/3mnkatDWpQRx3UroKt9ND82kEyZoIy00iF?=
 =?us-ascii?Q?nyK70b0lzPw/L/DQ5h6jcb+6TrTcOMK+/vn5LCsdCmhh1Y2zmcy7eenZ235F?=
 =?us-ascii?Q?dm343p83wfmJYz1U2GP0HW0i1pAhEpWHOKk/k9CC5CkE1sBrBGIPULgFp4UU?=
 =?us-ascii?Q?JJZmhpk4mb86mHpgIJqU2mYTf65DZaOCupygdoXHitgM232+KAGpA74C6gDq?=
 =?us-ascii?Q?KlbKIIbKjFq052XMcNpB1OOmcHGuVqw0h7esQBh/5dkjvEB0W23sDRl8BBtt?=
 =?us-ascii?Q?19FORxWGdX01X3HDEg9mR20vAHibEW7NhJ2t2qVIXf/z5eq5AZQHp8+EoI13?=
 =?us-ascii?Q?IEypDMBF53rBpPmUXrKeP9FW2v0/YEJ8PE+PxjhFWCzO7lQkknlyIOxf1189?=
 =?us-ascii?Q?HEDuPbfHwLPJirhSc/FTFdV996UyzX65fYnwgW1CisLJJKK7oEIgC7mzYfVa?=
 =?us-ascii?Q?7C+JBAL9KUPVjlixSfLNzfFNeKKO5YohgMyf//EMUwwvfD4OJMEMq1WEe60M?=
 =?us-ascii?Q?1ZPmYokmSw8rVIGCrB8KoJDcmDkF6ugRLSWlbB5FKHX2r0e5jYofR3jlQILM?=
 =?us-ascii?Q?zy0hojg+AbUeS5ClwYWkiHED7j2buzzaUblGz7l/2K9cTvioJ/f4FK8zzxr5?=
 =?us-ascii?Q?qktqZoRqLiSMrk9ftRP/22OfrVh47scRzVhzqgj8UR7uDRp4s6tEqa9r6I+/?=
 =?us-ascii?Q?5ybuTvPjpSrPUt5kU3q8CgmDWHjw/NpRD2GPrTupUuQVCcsWQZaao0bE2iGc?=
 =?us-ascii?Q?rSnyZnqdzQhLGzFASDROGnI0FqjMTbSh4kZOqdLGzls+db2xDVEGVoSkfrFo?=
 =?us-ascii?Q?EfNrrxqB1VaZFwslOzlZ9O4OOhjuAmRGLL6raZ6WaRfAs46saVlG8MRK7PWn?=
 =?us-ascii?Q?zAedVDIiz9Kg3WUCHZHPhEflREbCqjOL5Mb7+NGAOoyaT5/DmTJZGiS0X1pz?=
 =?us-ascii?Q?qWSOZLIygRFFX/TLxcsbc7tWJ/SBAULstakJje93E+JkWAl6YgXP52cfBt+F?=
 =?us-ascii?Q?tgRT6eGlc6Num7lg1bS+cICdJkFujqL8ySsn0TG+aZjQjtXJRtJc6jPjJmGy?=
 =?us-ascii?Q?u4ZAswNYxUIq4FNFV8jxofF9OgjGbD2dscGnQSyngJrqfJrkMUGhxBomk7Kz?=
 =?us-ascii?Q?zpD6iF5uqtqae5VSf86rcDzsEcWheVB/PU4kqPmhJpgQ45L/6PpFkayuY2Yz?=
 =?us-ascii?Q?fsAgHmz81iBbpJVb8Q5FIrlWFb2vLriCaHdJXLWi/86RznhitwTeDOMDBS+2?=
 =?us-ascii?Q?KVFptfw1RFUdZLm8LDSxra4LV5bCqd4tiro/gKLAVFUPFxhWsNKp9EDTAmK/?=
 =?us-ascii?Q?8hcxLOf7gw2UVV6Yk2LTahu+TPvzP3jrtvv3pwyOBQrpGoAeKznDK0D8nP24?=
 =?us-ascii?Q?GmY+SzzASlX/B2jXD/fHayrPxgGCIkY0zlyoeKrBGdOArPddeUrtGKfWx2zr?=
 =?us-ascii?Q?lR+odHbR0dP6BkrdSwW/gl+L2vi505t7gBUuItayu03JIicrU3WW4Rci5KzQ?=
 =?us-ascii?Q?HWcbWuO1e6+xFY5Kk7YwqkbVLNAcRKd7cMDt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:40.6718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d930276-5280-49ca-f76d-08ddbd0469bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7608

From: Stefano Stabellini <sstabellini@kernel.org>

Wrap sysctl hypercall def and sysctl.o with CONFIG_SYSCTL, and since
PV_SHIM_EXCLUSIVE needs sorting in the future, we move them out of
PV_SHIM_EXCLUSIVE condition at the same time.

We need to make SYSCTL with prompt back, add help info and set default
value as y. We shall at least provide "# CONFIG_SYSCTL is not set" in preset
configs for PV shim on x86.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- remove all transient "#ifdef CONFIG_SYSCTL"-s in sysctl.c
---
v2 -> v3:
- move out of CONFIG_PV_SHIM_EXCLUSIVE condition
---
v3 -> v4:
- make SYSCTL with prompt
- state unsetting SYSCTL in pvshim_defconfig
---
v4 -> v5:
- adapt to the new changes in commit "xen: introduce CONFIG_SYSCTL"
- expand help info also for PV shim
- refactor commit message
---
 xen/arch/x86/configs/pvshim_defconfig | 1 +
 xen/common/Kconfig                    | 6 +++++-
 xen/common/Makefile                   | 2 +-
 xen/include/hypercall-defs.c          | 8 ++++++--
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 9dc91c33e3..aab5940e62 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -28,3 +28,4 @@ CONFIG_EXPERT=y
 # CONFIG_GDBSX is not set
 # CONFIG_PM_OP is not set
 # CONFIG_PM_STATS is not set
+# CONFIG_SYSCTL is not set
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 65f07289dd..64865112a1 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -616,7 +616,11 @@ menu "Supported hypercall interfaces"
 	visible if EXPERT
 
 config SYSCTL
-	def_bool y
+	bool "Enable sysctl hypercall"
+	default y
+	help
+	  This option shall only be disabled on some dom0less systems, or
+	  PV shim on x86, to reduce Xen footprint.
 
 endmenu
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..15ab048244 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -49,6 +49,7 @@ obj-y += spinlock.o
 obj-$(CONFIG_STACK_PROTECTOR) += stack-protector.o
 obj-y += stop_machine.o
 obj-y += symbols.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += tasklet.o
 obj-y += time.o
 obj-y += timer.o
@@ -70,7 +71,6 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
-obj-y += sysctl.o
 endif
 
 extra-y := symbols-dummy.o
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 7720a29ade..c1081d87a2 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -194,8 +194,10 @@ kexec_op(unsigned long op, void *uarg)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 platform_op(xen_platform_op_t *u_xenpf_op)
@@ -273,8 +275,10 @@ physdev_op                         compat   do       hvm      hvm      do_arm
 #ifdef CONFIG_HVM
 hvm_op                             do       do       do       do       do
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
 #endif
 #ifdef CONFIG_KEXEC
-- 
2.34.1


