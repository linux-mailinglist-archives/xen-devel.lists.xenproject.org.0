Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8B6ADA88A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016594.1393540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3gX-0007n5-Mx; Mon, 16 Jun 2025 06:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016594.1393540; Mon, 16 Jun 2025 06:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3gX-0007kw-Id; Mon, 16 Jun 2025 06:51:13 +0000
Received: by outflank-mailman (input) for mailman id 1016594;
 Mon, 16 Jun 2025 06:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3YS-0008OL-4k
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:52 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2009::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e9824fe-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:50 +0200 (CEST)
Received: from CY5PR15CA0099.namprd15.prod.outlook.com (2603:10b6:930:7::9) by
 CY3PR12MB9555.namprd12.prod.outlook.com (2603:10b6:930:10a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:42:46 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:930:7:cafe::dd) by CY5PR15CA0099.outlook.office365.com
 (2603:10b6:930:7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Mon,
 16 Jun 2025 06:42:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:43 -0500
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
X-Inumbo-ID: 1e9824fe-4a7d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9JZQw5ms4AjSvk9Gio4QELYflws1yTdPRXKsZ1BM9GT8PjZIt/aWe5XRfXExrEduUNlOjiJ5bq/MY6sskEQqKGSUNf6V1oxWY6xqPKklFD7+702qTZ0xHLPp80kJqC2pNOF1CBIVbOJvZkZctoHRJuN31PXmTEr7LMO74snnu07oPq7XlVIpfBfY3CcS8E42Dp7U3Gx430qPKThy3EmiZ5s3vrpfiBqfsZbqM5hMsGZrydVV+ghgM0PK0GOQt27J9O92gNiNuSnfATu9Z4g6ZGgLC2RVwAD9KznaqRVh3VY27xrFKHkrlSWtq7mtdCk+ECHocqdQWmudKK/UqL1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjV4dXIDIbWp0L8VeuBDiAUAVrHgampbCea6EtH+5mI=;
 b=u2bWw3xil0yBGw62oyTN9ierYUfxcG3Klr2ihiOcFciiDs0khg1z45shUzPhh31wh7LJdHi50Yr34V6F1lLczX5ShSYUF8wlYlpQJvLkgaPmQ0r9enw16eKjv8Kq2/pt4P1dFhynpKAM9b3C/U/Fcuw80MuhMREKnLo1G3/vvHFbg/lxB6A2aQEnimMpS1vICC/TYw+5zMEExddX/p1cnijmiCziL7tl2y00up16oUbqBhNBdnz/4FwC9wkQ0T19R36EQdYmJkeoTRk97/I+ro0ugbsickgAhEinIO0gSuNyguKAF3FLeAnt6TYPlP0buzcvjnYyfX7qL5NDRqvBdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjV4dXIDIbWp0L8VeuBDiAUAVrHgampbCea6EtH+5mI=;
 b=q5vLtFoUgZUqeueL283qLg8Hlv4D/boFmzocIFugY9MCjG7V2AKNp6gN/LiuygHiPVEb9sCtYTLsvGCcwji1LijAShDk1B0GoaKjtkyZGW1SBZbBW4K4bUHOXsmo/BcavyD7DeLEtb3RIZ8HibB5UVrUwmpm0fCBzDGlT8DlhgI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Sergiy
 Kibrik" <Sergiy_Kibrik@epam.com>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v5 18/18] xen/sysctl: wrap around sysctl hypercall
Date: Mon, 16 Jun 2025 14:41:28 +0800
Message-ID: <20250616064128.581164-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|CY3PR12MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: d507cb0d-5841-4c08-f6c3-08ddaca10133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EmPfogi0i52IlRGbq9bGYewxbVmExiwdmDBgBX+DSxWIxp25qXz7are3dvcb?=
 =?us-ascii?Q?o7FTLkGgadGLOlBYAZSRPq8gqatAPtjBFfKnVgBe5lMJD3BmpMs5qOkeyTkI?=
 =?us-ascii?Q?i4nXRzyicN2RUAqc96zwF1mL5kIYo0VDKG1ww5BrWueD1/NbRJAADapfpQyF?=
 =?us-ascii?Q?oTqaDjTPeP+TmWFvz7IgtfyVxO+4QA3JKbzvbY5vhWvv0RHSyOfSrATEZVe/?=
 =?us-ascii?Q?K+v41FzVVJccbI+GWRUeIh03jVTm8o3AoumRp6vENkCtPWcws9YLoYCd7oky?=
 =?us-ascii?Q?C9K87W8lKN50xk6t/HuhFchuvooMsr0H6g2GUIzqMDSesiluiSht2qwLPmG9?=
 =?us-ascii?Q?UtlSR5BmWoKQA9igjdbr63ojkGNUlI6cPWjwr9Q55O/YQ2B/AL6ySCK3n++g?=
 =?us-ascii?Q?fWgqEYwksVhsVzDVrq6TchxGxIh2ElLETWHzDQ8Mqp1n3kMkCPFKFoyyu9gC?=
 =?us-ascii?Q?/urm0FDE29fyEN7DlSyknX4khI+mnfswOHnExvNA/jNBdR4b7sYXpSUXoFg7?=
 =?us-ascii?Q?xX8b7AmsNqVU8B5q2sUN3KRjN5NgnhS2mvpR91t2LRj6Q90AJ6jj+rFIOedL?=
 =?us-ascii?Q?1wSW1oQnmkwcHVEBxO8Os+7ksgtirSa/LfG6K6KIlhDOocKTHVjdowuxN/94?=
 =?us-ascii?Q?7xdJoSwi15sImNwxvjA7TRL/BDqD4lnAGtd6dBQyHIYGALEMrvL7VVx+TMfY?=
 =?us-ascii?Q?2sd63COxyCcwhRmSaEsQFT69r7xA7MbpvV4+vAM+IkTYvmsv8VLAMY0IMTlc?=
 =?us-ascii?Q?Ww3Jsnh+25o1WhvL9SgjAUrd2hlZ9NiV+xjS+2lcUxd3iphW6FI00QA+XseM?=
 =?us-ascii?Q?cwjgSutgg27tw4hB0ldyQ2fyxK4QdJAKFylByCgCgmwZapuudCBAS0w5sInF?=
 =?us-ascii?Q?6xy4kWWuJ/1lWexSSNEfC06KmNQq6Sefavc1GWDv4+dw8/nsYTBIysMeqz4H?=
 =?us-ascii?Q?YX+7k8ram1BnYXdHASa51JFIEWefxWxH7atnllA3AAZpZeY3GUKwT4oI2ANJ?=
 =?us-ascii?Q?8m2QttEKPppTo18YfwfnBQg33+xCZTk9Dey5BrQJRynFpCkewOhSf3fY/QWh?=
 =?us-ascii?Q?TlkO5DB/LLxBUGGaUIeWrP8u0jQ4oKyNScqlI23dNY/JsdRLCLOCSLce794+?=
 =?us-ascii?Q?Xdbsj0vKg2aizKqd9LBs83lLHZaMZWf0DjFq84IGzmZ63ODmxu0AnSgL2n8B?=
 =?us-ascii?Q?UQL0tPsgPKqVkYQanVpFF9nV+zEGzbXIVzA5BOiaHOhT2kz+30MSCSMIYIqU?=
 =?us-ascii?Q?rmDo9MuMyqeEzuj3SY5Q9Q77VpLKnSrgAxsCcoDApUaHyJUTEIJpVdnBHMFZ?=
 =?us-ascii?Q?J78ByDEYTUJ5q2P7y9XkzLh97NJVutHHjRFrHSPHUtSu475iQYV0W3P7/bYa?=
 =?us-ascii?Q?7VL5UH6NkoZMyT2XGcrkqnfc6pPvxgcfUPt9vsNLhG8bmis8/k+WXKgpIFaT?=
 =?us-ascii?Q?N1QVMJFhaXcSe2MjAEvrjQIy8wtds2GJBp6o5U6FikCc2ppdXYVPAzES1lFd?=
 =?us-ascii?Q?5qiA3iVFYvKr42dD/d99HMA4a6U6qbrawawW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:46.5373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d507cb0d-5841-4c08-f6c3-08ddaca10133
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9555

From: Stefano Stabellini <stefano.stabellini@amd.com>

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
index 2ad27f898e..dff1ecf674 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -26,3 +26,4 @@ CONFIG_EXPERT=y
 # CONFIG_INTEL_IOMMU is not set
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set
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


