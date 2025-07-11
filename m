Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DCB0123E
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040366.1411859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5RL-0005kX-JX; Fri, 11 Jul 2025 04:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040366.1411859; Fri, 11 Jul 2025 04:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua5RL-0005gR-FH; Fri, 11 Jul 2025 04:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1040366;
 Fri, 11 Jul 2025 04:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua5RJ-0003OR-Bx
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 04:32:49 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17d4f4d3-5e10-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 06:32:47 +0200 (CEST)
Received: from BN9PR03CA0528.namprd03.prod.outlook.com (2603:10b6:408:131::23)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 04:32:42 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:131:cafe::1d) by BN9PR03CA0528.outlook.office365.com
 (2603:10b6:408:131::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 04:32:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.1 via Frontend Transport; Fri, 11 Jul 2025 04:32:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 23:32:37 -0500
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
X-Inumbo-ID: 17d4f4d3-5e10-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccAyG2vqifkpVnkud0i58E42skBBBAyD8cnFaTfdbUMR7sB3WORCPl60yBgsQYfsKwMIU+ZmBOsewm+WCzEsxhrzzIZEIKVXYUALWimEGKwwsrbdqu7A0vmRTlA+8HRoX3ichiz/LFi5NvNjNiE/+Ww1i9egtTp85EuL2nfnArsyUetq84fwjW7T5dlgTNJrjuuh3DOsQ8DmVAWJefL96NKjyfhT4bYBGOrptBtI76bRNDQiQh2L5gpSzoKTxzwDt4PY3C78DqBXoF3uevi16vdtZ5v9wKZ2Mo6Ui/Sz/7614jmdo6NpQ3we6qxXx7IaQPayUCByqKRuZSrKqxH/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsdbWxBv56FOkGsY2m7yzhlzougzMSVRZxtAOx2nCOI=;
 b=E4uwIGMnVq0xKS/SlPkoTyFLsjdJ/N/3ADB3QDlEGGAx3JJyE7lhPS/bHRn68l0d4BgY4zWDWjDncQrVI998tyOso3khlOZ4d7oCj5kQ+rDFnSxb/Jsgq1j0qW1ilBKwoMxpPxtZXZWK43aBf0U8QmFFfUQmVf6DgB6Kkhu9iklObQCFnM97RTmQ80DbRAmaLdGXnnUPHV/X4l7kdSfriaY3y8fICcnLg8AYQbG27ZhPGBFrej+PaetwH8zM5oaZZBc4R1MBS0lcknkpVb6ByU0C/lALH+PKd+5L7f6yzVd1/0b1NxAYN1UF539eL4QAes+dAWmQDXftcFubewAGhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsdbWxBv56FOkGsY2m7yzhlzougzMSVRZxtAOx2nCOI=;
 b=C6RmFLX+7lBpxC/X6tMayYUSYDLtD02QqQycRHrgGZ3A8FVJDpgeRSQgfmokCEbn6MhGYv4/WBcnL7h/UPrLCrhVMxLM1wCQo316hAhI+FSXH1X/fuEOhQ9VI5Iq8PQWKJ4fmJkRNYPlGRSJk++o/TJ5oYhSTGsU6JEC7ZfGlng=
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
Subject: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
Date: Fri, 11 Jul 2025 12:31:58 +0800
Message-ID: <20250711043158.2566880-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711043158.2566880-1-Penny.Zheng@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: c31302cc-671d-4799-b135-08ddc033f9ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OidPS+Z+hYNDtSKer5V7x4LrJd4RQ5ZRdTfzDDxI1JyWp91WhtdR5IMJI2dN?=
 =?us-ascii?Q?oItTJhYY91Nv0EYTL3mutHICgOviCQDDdWX3b2ZI31fYz9yi/IkA3c83Eq6o?=
 =?us-ascii?Q?EzwAeA2veUDR2Mbs13wd0lvqPN1qOqLxbEiTzILdhRHGz7DcC67qkPDp74Aj?=
 =?us-ascii?Q?9oq+Go5idqgthSvgs5R7+n+56AugIsqPy/Ta7FSIPAU5vZiz4RZsjlYcF5Rj?=
 =?us-ascii?Q?CqWQaxJj51ypv5yK6xaPLcxpT5MiluEl19njB7luIYyGSFW5AtmGNuyqGmKS?=
 =?us-ascii?Q?yNIbgIzz4KlUTwKAB6K1WkNMfTNHPdU9wgiHFr7eCL/ildr5PECCscB9LWBZ?=
 =?us-ascii?Q?Tv3mObohMSsRNXZtetP/BvhtBWRZl9GAR/oqnwyeWe0wKA5g1sthL/XBw3zQ?=
 =?us-ascii?Q?OZcP+TH+WMPZDzqKrk9Xa3j4L5BvRzCpwE2DANkZOtOLX1be42sF1xQQsE2O?=
 =?us-ascii?Q?Uf7Egc19vR1Tqcsn55Vjw1x5SFENY0FoN3fvhunUqbTFodwHYYXwyqPQVw3M?=
 =?us-ascii?Q?IFErePphkSZYKCCfsusmLdNfNPZTmhnYaeuftxz4Sj07hkDlXAkWCpwKPXZ9?=
 =?us-ascii?Q?5bVrhzatO7HJzHubGa/7s0bAgxV+JErom7gy/61vqo/DXt5SavhHNqGYCTqB?=
 =?us-ascii?Q?SglLpO8OG9ociePSNCVH2JFbLZ4KArMe73y+GZClBOiShg90RftmjuxbLRqY?=
 =?us-ascii?Q?YTaM58gNdH1JNSPwEy91ftsrY4Ne1X37fp9hoQP2oq14TMDGD2x0m9YNe4Mx?=
 =?us-ascii?Q?XiOzMzxIOGJUzN/JdJ+tDm3HIlZloeovQmQPisuh1HXML63lv46D+VxES31Z?=
 =?us-ascii?Q?BXqlBZxqe2Ti1gxQWWc479YYvnidSsNgcy1nrEJK2zLQ06pzbD1e0501s6i4?=
 =?us-ascii?Q?ZXW70EYDiJDJ5+chnVSsIi2/YMt49KpMG8EBHHM5RnusBkhwv4pOlK2lYTqM?=
 =?us-ascii?Q?J85hlZE1FlqKjJoq9ii50Oxxc2Wf5XGlFPV4BWRPLE+c9yLUTzZbgq3i2Ssg?=
 =?us-ascii?Q?ImUWOJ6D04fhjxsQJbR7SKAJIZBnVfaB4K3YuSMm7PzA5PIenbXQ5mtpfzw9?=
 =?us-ascii?Q?aNP2varSVi7nF3rFFdZX4jmcK7k14RNemig4Wb41jLmBJcnJMp2bwLIb7svv?=
 =?us-ascii?Q?7dZIM0RRqr6bXWUuX3wJ0h6Ws909KKFYFPwhL07CSTDA/LM2/Rq2KYrMjmL7?=
 =?us-ascii?Q?u8KQszzCVKaFlq3jxg9DoEdjhM3yhvANQLIaC/Av2NCb9XdG/O0d3QR/T/+Y?=
 =?us-ascii?Q?ZnxARneyyjw92xS475ijguyhxa24Frul8o+YLJoGDIMVfJL4DFyYvle58Zma?=
 =?us-ascii?Q?GcdROgsD21dF7Eqx+jlKjbRXGsRm+1nxauiPNxuv1/KfMLLvYSkpr/HMWOkm?=
 =?us-ascii?Q?PiA+hkFqincu0l0aBb7B+YTf7Cw8nKFz2COs84Zc6CmmLpK1+I3Av9+NmJFk?=
 =?us-ascii?Q?pSnAxXDTYTWkfHuDidVNjwsfP9wfzlj0lXJa7fkoJGepjKk0eeWY6psF1bZN?=
 =?us-ascii?Q?RS1Wu/eyLMpvIVLGLswXnKeoaZy3BaVJ4+Kq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:32:42.0659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c31302cc-671d-4799-b135-08ddc033f9ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

From: Stefano Stabellini <sstabellini@kernel.org>

Wrap sysctl hypercall def and sysctl.o with CONFIG_SYSCTL, and since
PV_SHIM_EXCLUSIVE needs sorting in the future, we move them out of
PV_SHIM_EXCLUSIVE condition at the same time.

We need to make SYSCTL with prompt back, add help info and set default
value as y. We shall at least provide "# CONFIG_SYSCTL is not set" in preset
configs for PV shim on x86. With that, all dependent option get covered and
could be deleted.

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
v7 -> v8
- remove TRACEBUFFER, PM_OP, PM_STATS, LIVEPATCH entry in pvshim_defconfig
---
 xen/arch/x86/configs/pvshim_defconfig | 5 +----
 xen/common/Kconfig                    | 6 +++++-
 xen/common/Makefile                   | 2 +-
 xen/include/hypercall-defs.c          | 8 ++++++--
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 9dc91c33e3..c58c29adb0 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -19,12 +19,9 @@ CONFIG_EXPERT=y
 # CONFIG_SCHED_CREDIT2 is not set
 # CONFIG_SCHED_RTDS is not set
 # CONFIG_SCHED_ARINC653 is not set
-# CONFIG_LIVEPATCH is not set
 # CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS is not set
-# CONFIG_TRACEBUFFER is not set
 # CONFIG_AMD_IOMMU is not set
 # CONFIG_INTEL_IOMMU is not set
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set
-# CONFIG_PM_OP is not set
-# CONFIG_PM_STATS is not set
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


