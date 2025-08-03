Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D6B1933F
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068340.1432329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKG-0005qL-Tz; Sun, 03 Aug 2025 09:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068340.1432329; Sun, 03 Aug 2025 09:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKG-0005nB-PS; Sun, 03 Aug 2025 09:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1068340;
 Sun, 03 Aug 2025 09:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKF-0005hH-55
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa39aed4-704e-11f0-b897-0df219b8e170;
 Sun, 03 Aug 2025 11:48:16 +0200 (CEST)
Received: from BYAPR21CA0017.namprd21.prod.outlook.com (2603:10b6:a03:114::27)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:10 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::e1) by BYAPR21CA0017.outlook.office365.com
 (2603:10b6:a03:114::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.1 via Frontend Transport; Sun, 3
 Aug 2025 09:48:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:10 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:01 -0500
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
X-Inumbo-ID: fa39aed4-704e-11f0-b897-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEYtYo4cK4NN2NLq29evqs4m5ANUxwzJGoMyn7RrNhPUGMdzsXxmRSiQ4qTYNfjL0jvlkFWHBmz+UxyTSVZxBO5+mWlMbnugFqzg2q52HCeu9RImu2I+/CIEzfJUmx9EJnZ8rhsKFBOJXlg1pm6frMY2myCC5aA5EvPZOu750M0DhsVEl+AmAdVL9rZlT+0MLkrZE4J8nmM52dF0Dt1BYYw+ggVyXOWhtlD+9wnbW9gRcOabV4YgTLKka/Dg+BT8jFcfzX+qLVA6hgSoIyN5hWOEchCdFZoiCKangkOP6xDjLE7+rCawVsqIWKeOcHyHmPwHbd4Y6W0WkrqsmwO+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFOt+PCzlFzbUDdrbC/A6T41ntOa9X+pZCsEOSsCT40=;
 b=VeSrGkQFhtjmrYBDlngbp1roUikEx9r4Y4DUTBL1vsMpyz8wZ54REz2P7Sw+DUUe8DX1IoZ0hEAscrvOjn8exbLTEim9BQg9q2IXLoTCzKi+pPJVrKJrNfbCboHBFzX3h4Y6Fj5JON1CFDf7PdOBmC/uRvSoMB6oYbuaI8m73fNLQuB1SDYzXqJCBLY4Rx/GirR7B9BdgomgPykBN7M94yzXkderAemIumqdk+Pr/7w26tln1eeSAL/YvgIgE+uGKokZ7GhXSYcTIYsVl78A1TNi6zTrUvlU026E/YY2X+faBixFDGmnNTQowjVp49/hxvGQZO+6j+goFci2bXvRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFOt+PCzlFzbUDdrbC/A6T41ntOa9X+pZCsEOSsCT40=;
 b=FRPuTqH0TUpTm5JBe+xsTMxHdGK+kdoNOB9w35+G/5Ibq9vfQ8TJ7YJLLho7xNBeQwJ9sYLBJM6CzSQ5McIf6wq2CoUYHcjZZOM9+yIOz/YZbhRZjm0qiTE+vdQefLaSKoag12LZHWbFPtYPBAufkvdW2WN6bFTdRFccxvtXFdQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 01/25] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Date: Sun, 3 Aug 2025 17:47:14 +0800
Message-ID: <20250803094738.3625269-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a77a8c-7231-4743-9d25-08ddd272db7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JxsVR9tR3AxbvdiAOCcP4ZRwwb9PQ9h6iPlqKe60DM1o3c7a4f55wTHD7jV6?=
 =?us-ascii?Q?UqmXg5CtHyWMr9OLS/Dnwg6GWZpzP40y5zY4g0WOp6UD0uNtnJWMoRU/aDZ7?=
 =?us-ascii?Q?OHj7LTkL6u/GwmkkHBB9kcwwAKJZOqWKGB6MFM5FE6+CflECt5sYMO/G0tO8?=
 =?us-ascii?Q?CTymen0fGfFe0yxm/bqUfsn2vSMi7jzphd2YoedKhKWNGDhgb3uX3nKNnUeK?=
 =?us-ascii?Q?chv9U33qDwJkQ2Xbm6fWK4hyVBW4OEy2tcZ9ITTtIrtf91Iuz266jqJYy4bn?=
 =?us-ascii?Q?LG6ASsxOb90PrZjKJI7+ZjQLTVhBNlUJwDOfCPpNfF5THmkXm895v+hfurjD?=
 =?us-ascii?Q?YcYXOiU7aw2v55sQ4S4QvNXP9zjICnmQUovRPDpORh+pUmzBp9HwmjnWbpWQ?=
 =?us-ascii?Q?6qQA6ssn+fySJPgcsPbmQUcvoVEFeJU2hJhlHRK9PktSeyP2tJQ6gc5SYToE?=
 =?us-ascii?Q?zflgUMuy+jbMno/iEQofffk09N+1k43NgIFoyrJ8+88/ggZb3qi9c0OihYYx?=
 =?us-ascii?Q?W+L5bXiflTqUtRWJu52Usp21ORCzTHGljyaIE7t/uV7z8OdiUKROs1Ed3kri?=
 =?us-ascii?Q?xkROF6WoVjfTZMsepB7das8jMVz/TFAkgag+ggZv/E7k2RNNqaeXEL7F+kME?=
 =?us-ascii?Q?7bEFEGt0egIFG8CmLlUYKvWrc3YFkOgwDIIfGqQgN3LfO1fxfkEtQupPTojo?=
 =?us-ascii?Q?lsyJGaeToPW0+qcY2biL4BG58uaESJMOOEmHhWPqzFZ6mSMgxnHawtwlhsRW?=
 =?us-ascii?Q?cHtB0y87cJ+eBWKy/hqQcqkA4ALpwyWY8iBwZgEA/RVUmyCSZuTRMkC4I7mN?=
 =?us-ascii?Q?5qJGq/iD/BU1szJzEY9LUujp1l0/wklvQ6FDGMPZ+ZvbGpzFRuIZyRo1HjLr?=
 =?us-ascii?Q?vtLkMW+TLvgSOWz8P17vTF4+tVzrASoHuuJ4TozrGKGstFA3zcBHbOZhL7sg?=
 =?us-ascii?Q?P3aHL9FwL98jaG53EjfgPE3cEzJgpvNuz9oG9Y9r4VDKNwj0bDd/2+yoaDTE?=
 =?us-ascii?Q?3eQyNz6B41d/magiJu4couQ3fBT28xPS1Twrp0+iGsrOIW3otKex7lAb7Qp8?=
 =?us-ascii?Q?NMSNs12Qq8TxNJnDWL1+J+UJzQ46Wy9r/gSlbvQ3pceWEPhcvdS3xt8fOfcQ?=
 =?us-ascii?Q?3GjsZ7Tuej0xh3b5LDcN9ygts2EmmZ9erpRPstdn3ROO9WqYGZo05b8roh6a?=
 =?us-ascii?Q?RpvdPZtsyG8jHsHsBKocpWHDRepA+WsVck4CO35dVsEhRvP/PnqcWobM4YTB?=
 =?us-ascii?Q?f9Xc1Oj2sA0kkaCvUw1+/UqBUBog7AGGqcn/ToUJNJObNv1TieiaGpDOu66z?=
 =?us-ascii?Q?E2yvpHKKWVWFQmkkYo5OESoe+XYhrIBnRnoXi6ver4kLI9nyuyfFtHmLKdR4?=
 =?us-ascii?Q?9dqIS1C0j14ihlTnuncgs7hVpFKIiTH9K/X8bdumTbLPXzTtVp66cMs/igoq?=
 =?us-ascii?Q?JzkK10ZTX/HVQs+xCTsZcpCZZsv1ANIq226z0QkvG1PEFfQm+7ktEWV2Rekh?=
 =?us-ascii?Q?wgRIbzWaUDpS5Uw9dTGvHbYwZ3gIjbV1yo0+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:10.5614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a77a8c-7231-4743-9d25-08ddd272db7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182

In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
a few functions, like domctl_lock_acquire/release() undefined, causing linking
to fail.
To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
/hypercall-defs section, with this adjustment, we also need to release
redundant vnuma_destroy() stub definition and paging_domctl hypercall-defs
from PV_SHIM_EXCLUSIVE guardian, to not break compilation
Above change will leave dead code in the shim binary temporarily and will be
fixed with the introduction of CONFIG_DOMCTL.

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove paging_domctl hypercall-defs
---
 xen/arch/x86/Makefile        | 2 +-
 xen/common/Makefile          | 5 +----
 xen/include/hypercall-defs.c | 6 +-----
 xen/include/xen/domain.h     | 4 ----
 4 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 5aab30a0c4..7676d7cdd8 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -28,6 +28,7 @@ obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
 obj-y += e820.o
@@ -79,7 +80,6 @@ obj-y += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/common/Makefile b/xen/common/Makefile
index c316957fcb..756ddf52c3 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
@@ -69,10 +70,6 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
-ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
-endif
-
 extra-y := symbols-dummy.o
 
 obj-$(CONFIG_COVERAGE) += coverage/
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index c1081d87a2..a2f2a7fa75 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -197,9 +197,9 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
 paging_domctl_cont(xen_domctl_t *u_domctl)
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -278,9 +278,7 @@ hvm_op                             do       do       do       do       do
 #ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
-#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
@@ -296,8 +294,6 @@ dm_op                              compat   do       compat   do       do
 hypfs_op                           do       do       do       do       do
 #endif
 mca                                do       do       -        -        -
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 paging_domctl_cont                 do       do       do       do       -
-#endif
 
 #endif /* !CPPCHECK */
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..33dd90357c 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -182,11 +182,7 @@ struct vnuma_info {
     struct xen_vmemrange *vmemrange;
 };
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 void vnuma_destroy(struct vnuma_info *vnuma);
-#else
-static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
-#endif
 
 extern bool vmtrace_available;
 
-- 
2.34.1


