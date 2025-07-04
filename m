Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAFDAF8EE1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033150.1406617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcuZ-0006Sq-CU; Fri, 04 Jul 2025 09:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033150.1406617; Fri, 04 Jul 2025 09:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcuZ-0006QM-9t; Fri, 04 Jul 2025 09:40:51 +0000
Received: by outflank-mailman (input) for mailman id 1033150;
 Fri, 04 Jul 2025 09:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXclG-0006x0-9a
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:31:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fddd7d3-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:31:12 +0200 (CEST)
Received: from MW4PR02CA0006.namprd02.prod.outlook.com (2603:10b6:303:16d::12)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 09:31:07 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:303:16d:cafe::e9) by MW4PR02CA0006.outlook.office365.com
 (2603:10b6:303:16d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:31:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:31:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:59 -0500
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
X-Inumbo-ID: 9fddd7d3-58b9-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykCvh/3iZtTVKStB2YYeiTcK9s+XhW2pjLVNGbVtIebsf/h7pym8kNTrPViBu5/Gp/s+4QWaG3Ky2rUqdRomURiqibZ7AxCEJg5DG6ns0oOau1Yfgy5aRhAro6Gwg61CxqpiUaCC+Z+6A8o3kWqf35Cz6W33It2iLMxjR0MfuXCY4ZsK3ZRT8iJk9cERJSn2W7xcJw5R7pq382TV484HrEXVDDz7xeI5wMLFGTW1GsskXNE6jxTDsMWqYzHCDd6eT1yF6js6B2VPno5AuQLWMFMx7Pl+rurIfbPXq6xL/ZxOUtLgMc+iuwbFkdRgCM0tSfnpZMs1dpxqk/jd705Qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1LpiZC0rlbfXrVfLcubSIpVFQgeVU79WtlQi0mk+O4=;
 b=xkzyNLbM8NPBHWz4+pyijPW8PLJOMJhdvc7plhY+LAgTOpdu41N5o7us45XmW639etlyt4gcYENbjFOZmXbM9vOhSJ8peF0GNQeg/eB1dhS+fuf62i1QeOmDBzAFYH6JDdX4Hr2iToQ5r4x11+QoKSg8DY0jAy/QbY4rvAq1mZsCJ/kE71yyQpQGJhKGRtWc8w0xLDSmgg893rJbDBy7rexewdV2Wa1x0xbC2bQIpPBq1dNeiny0jBj+YtT4ex3KSjZcdrZ4QlGJoDfA+zxJVXweLy6tyCUivNJ9shemBkV6cSh82crYVX24Kbyz5r4u7yTSGBzdykr7G5fE/K1mEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1LpiZC0rlbfXrVfLcubSIpVFQgeVU79WtlQi0mk+O4=;
 b=1P2hdc9VHryUgyw1z0JtpkKhyQOUNsiwsEcsJ3R7T9gK0DeVxMGBqFc42BpS/oC5lruR5wYF/kaffOWQ/Yn4Dxv80tqcAN6JCHxOtSYkOHwumbNeXkG6Q3Xv3GodLGDZ2cQmm6Cx1MJZS9Az7fM/PDSIBvQiXOfMyWLsqXkrmZQ=
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
Subject: [PATCH v6 18/18] xen/sysctl: wrap around sysctl hypercall
Date: Fri, 4 Jul 2025 17:29:52 +0800
Message-ID: <20250704092952.822578-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c5e7a09-0eb6-4be8-4e1c-08ddbadd810e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RJxuKO1DVoXxHSIInJFoPqKwpgIFuvpYVAxulCnk/62Wc2JU9gi6jDTBNlXI?=
 =?us-ascii?Q?nfISalsRCcZr2XRg5jnaV48XQ+3vS9tj6PnxTvUnMJbidB2+Xkm17yzoYLUp?=
 =?us-ascii?Q?8btVI3nkuumaiu2Q/9Yk1fzdMI/WiguYRwPTe4y4gp0FPmqxUZYqOlMtKhHy?=
 =?us-ascii?Q?lotO1ghWy4u5oIxBJdLrX/M6hzaM5Ho0QwirI94uXh5rhEHIsxFK9T+gdyQY?=
 =?us-ascii?Q?V0u8bmbOokv5qtTfjmkJOl08+9rbA2FnbBkF2fckdQpPT9aSw57wxUR5bE4z?=
 =?us-ascii?Q?ZwBslcosP/hT000tBNKvhLNk5+mf/2b2NMPjC9qV0cBG+9RVgrYrDUZ7mURB?=
 =?us-ascii?Q?Xr2UwYwtLOweTBqoF+UD+kLtcWsPAEQXfUhUW+ESiz42OP45W9jnouTzl8pF?=
 =?us-ascii?Q?wTDNsJ3F7wDc/fWshCQ5xtXaPATx8ZKgvlyP9+oLHBDYhjBcgoV4Cv1rLrBy?=
 =?us-ascii?Q?9aP92raOECOo5/H5YDxXgHOqOZysDmLYDfein51mRu2ABjLrJC2sjtw4xwfh?=
 =?us-ascii?Q?+fxHtnCeIsvwRsnTQ9UnZE9+S3XPcTVyTZcKgO+jkl5yynyROZvguDkYog80?=
 =?us-ascii?Q?vhJNtzanMbM6HoJJ/+ZSVNo00EVKL32sv/YAhWyOHRBmg1E2ImDhrVYO8/8/?=
 =?us-ascii?Q?AFxveFv9XeNyoBnWGSFJ4Lpq4fPPJANi+Pf0wu6X9r1+lvtuNh2B/pGzQwRo?=
 =?us-ascii?Q?CVVb60UcB8Md3cbo+l2N1sA+CB/wd4/CTiEbj1hqUPgNWnQjPkW3ob8SwnhX?=
 =?us-ascii?Q?4I4IRgrVXkhQ8aLm1nfswzwdBYzMxLIJtXzdOLIj0J/O3dABrVYhSU9UPmYj?=
 =?us-ascii?Q?9EqYqbvTtJ+nLO/Yb8++r6q0IxQ98CQoM37dEgHMM5ztbPJ9pxYz5rM4TNLl?=
 =?us-ascii?Q?w6d37pYLkNhLjiEht3yaiAiUPW+7tSpCH2tzzJhcUPc35FfQYQgNuJCvmXpV?=
 =?us-ascii?Q?uvaiQbbjgb6zKYfbqhu+yTi4TXMi7fkKiQtkHztz7B/rbjSgJumqGtEvpv67?=
 =?us-ascii?Q?sQ5JkRrf34P3t8Q284O0C4WD3c0Bp5rAOm0cndR7fG2TT5JHTGZ6/Anp5zSP?=
 =?us-ascii?Q?4SO2hPh3Kbd7hZ16qw2lZ2YsSFG9kaiDfoZEnHo6q0/IFQzuAI4+my5JGITD?=
 =?us-ascii?Q?4fY1lQ0ZijWQEu74r+uIO039C4gnDFEc4C7eYmdVrnErGu5G6ngsx9R0BDua?=
 =?us-ascii?Q?iq4DywYL2HMRZuVCrUxImeNBGkpHIdRCHmFJxd+VsU5pwGzKVrGUS4zulSys?=
 =?us-ascii?Q?/J8KdA6soo63JHFPocV8pcuIi9+vApH9t3BaCTyxLpkTD44w/EMDIFtdzNbR?=
 =?us-ascii?Q?PnevJI9di/0h3MeAcp/6VMVbWa9dKRiMxaSPsxrfbFrY7tEwHMItWt6NIliC?=
 =?us-ascii?Q?xwURieJdxdHTZ8wIK5qUcH7WS7B/VLvDPx7I3BLI43CLdP/KGWNBCNS6p/i+?=
 =?us-ascii?Q?B/bF21edrH8T2XN8TRP9gxAc5jYE5qtGqA6B+fmrwVQkuoUU0Gs5kyWMfj3I?=
 =?us-ascii?Q?oTsSlEM+hieCFCfdXtghol4DGQMv8UHiNGUK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:31:07.0859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c5e7a09-0eb6-4be8-4e1c-08ddbadd810e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341

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


