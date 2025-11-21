Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E35FC789A4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168651.1494651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtM-0005Po-JX; Fri, 21 Nov 2025 11:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168651.1494651; Fri, 21 Nov 2025 11:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtM-0005KX-8K; Fri, 21 Nov 2025 11:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1168651;
 Fri, 21 Nov 2025 11:01:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrY-0008Dv-Aa
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:36 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29909f48-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:59:34 +0100 (CET)
Received: from CH5PR02CA0003.namprd02.prod.outlook.com (2603:10b6:610:1ed::23)
 by SJ2PR12MB9085.namprd12.prod.outlook.com (2603:10b6:a03:564::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:59:30 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:1ed:cafe::f4) by CH5PR02CA0003.outlook.office365.com
 (2603:10b6:610:1ed::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:59:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:27 -0800
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
X-Inumbo-ID: 29909f48-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPXENksRSRExohJNkJTf8jM2l7XMkXmnh4dcViUZcv0lrt7C7YWvaDi9GppbM1t4jJ0l85PmL8C2v3gHowekTW3+q/FkvFhvF3S7B/uBahBGo5PdvhSV+sM2v8wASNt+MMIb7SjnRtVdTWqzxzbjUxC2xULOGOF9x5DvM37crs8Y/2CKo4rAPmAwwfWLx1lo0hd9TCI5yFfGTmVaJTMvJP64TgtSjX5cUCMLZhasib8nKSot3Z/GV3LW7/W42SXj5JxJl/mV2iQCztM24tPjjDRAUvKzZ7WnoKAR23TgDFigyV+eMc4qO/xMcCbI1/M8cgjaB4nwIjDmPbuCZUMHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGsKqP94ALXNQ4bxTHNd4P70wKk3fIYwcVEXDRmLYiU=;
 b=fxiYeParN6pKl2epNx+GwvRWi54ixznpOSrlD4B+RiuuCturhUgdaCX2SUvCWOhMihnGqVhTGsgI3iIfjBaAihzGyhvUsYe5qUEKfjPN2j0hwifNmDkhHEmOj/KHPoh7NoIbF+E+hktLNNKiWt3diILx53hxX7HrkIHnDcqea46tJvXwIutP8Qlkz9fSl91EzVorx7+8SjsynraaUm9z4tZ+WP7VF/nBM4gg1dhZxrE2g8OgPUxHgHkPVK8CJo+rqrH1SlCL0Dj4ciXPKIkoID/kyZwY8K8Sn+juqx0Gra9GCH7csLpKB5nUiW9M/Kul/9wWDkCwy29wNimnpD5ouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGsKqP94ALXNQ4bxTHNd4P70wKk3fIYwcVEXDRmLYiU=;
 b=hNC1bhduSr0Pk5UojnMwZFzW31N5urIhGVIPg3A/H5Mx4ooG0ycfEyZaWbXwKDaTvp1VWI9yBSqGJ34xEs5suZ2aTAaHyZhk1iCyxiobvSB3rl2syUkZI74ErbXHIc+egTFbR0oi5YrWnPRpXinSGEm3UT37FdeFPU76+cJ4imw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v4 23/24] xen/domctl: wrap common/domctl.c with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:58:00 +0800
Message-ID: <20251121105801.1251262-24-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SJ2PR12MB9085:EE_
X-MS-Office365-Filtering-Correlation-Id: d55b4dd0-e5e6-48c4-3455-08de28ed0bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MbE08qhbdUhwvHxi8Tvl0MmgzHw7Fjsoqz5zoMNQjVTHCkfW03pYsBKtaSYt?=
 =?us-ascii?Q?AQbNBiOmJI4BJVob9d9cMXW6yJ+tz6VGndKNW/4Q4m5x18ve4NjKmhchqAlf?=
 =?us-ascii?Q?zKqODKFa8ImoL54psgT0akADFz32yptHNg7zlokF2fOnOy34M/f2GmvRArmY?=
 =?us-ascii?Q?H0FaAmzeI1jNJ6ihkgS4DrI+Y+4NBAhVUB24pwJLABMntybr154HCluqhe/K?=
 =?us-ascii?Q?/4LGuOVedzPi7zfoA2LoWw5RrbQsNU9NsribVImOexwavTFIrCMTLspr0xzR?=
 =?us-ascii?Q?1W++ccDkiWyw2QidvJEMvXx9RyuLNY/eUHdjOUhe7PoKPitt7Jl3W94+vIp3?=
 =?us-ascii?Q?8MQbQzj37iA44XIyNrRn3Dasu88rMTO6+YNYMVWWnhoZUyT8CjnEYbjVJNX1?=
 =?us-ascii?Q?27/QwW7X3hKw1BYV+Oo5Qnw4SBVrzvXEE8vIB+P4gn9GYKyDX1zaPyHqcLGs?=
 =?us-ascii?Q?TGGVbmXvsIHQepAUHQcfB5qqA5HYNjFok+2IJ0WlbV1viluJTNKp8XXMnc7W?=
 =?us-ascii?Q?yo3QeeXVKp5WDXdmG3gKwdgqt85UwaEHOtu0VDPeTBYbmt4RKZVj3VgU37zK?=
 =?us-ascii?Q?7QTUObIfQbx4/HGqsOmdpcbNU6xOmOTHYDIoRg0pCEnW9t8w2Yfttss6INrW?=
 =?us-ascii?Q?APvBCxJnwXnl78hLE+dHJ4ROSNuRoU5C5HR5cWRg+N7FewSMaDVOwT3NCGgq?=
 =?us-ascii?Q?cw4J1CezlCU+SQUFv6eHbkf02BWxWJ7rIm5g+4gYXb+GDg5OZjd8icEiN6+k?=
 =?us-ascii?Q?kLUSuGIpHMJnNtzV0G2Xq6n7soenuMhEyNn/leYmd6chBMRXCNjcn+P6FyDa?=
 =?us-ascii?Q?kqPWg5ZoNy+6bCTaIxyXmfbng0Xg0D5E0h5pL0KBDlw2EvJHLxxExMtM71Sj?=
 =?us-ascii?Q?WBuMUxvBP8xFHOwjNJd/cH+Rc6HsOp467EXoPGHc4H14Egjkhk/eMQTmH4vM?=
 =?us-ascii?Q?WGYS01/GootABBga5fzQ0bv4XHN2ac7qz7OGwAcFTsqN07DAEyCUseuWq4Yi?=
 =?us-ascii?Q?98s/wMKUBh619S3Ng/LrG8S2DXLDwafpx38GJvaW0Xmg36HW7AB48dYwadaR?=
 =?us-ascii?Q?hGei8n6k58OVH1/+RTSPx5ukoDjH21U695s/xA03nVEVHEV4pht2wd5yrJ2M?=
 =?us-ascii?Q?VwqkAa4wWJ6QuexqUwKOldpGYHOoUGJpM/kbjinYzDX7asTTgoz73w5bFku9?=
 =?us-ascii?Q?QgLP/nA6sH/gZ65dp9S7zRIfkxiQebqK7/RXgLrp4cQPmgam/xh0cdMNDfjQ?=
 =?us-ascii?Q?BTlzKHDkJeUd4i064iq8pv9HCXu1153aGLQnw55tBBpiXy9OaVd1hdo2Em13?=
 =?us-ascii?Q?PUMCDY83VhVFo5CRqnHuhRCf3OS0KLAbh2nMsDFEOGz2CZeqzrp/2y+P4kae?=
 =?us-ascii?Q?f/XiCnPPYzTbG8NYRq6eJsFbzGL+1n2830csnKbU8f/PFFdTbKDsc7nLCtWC?=
 =?us-ascii?Q?95Yc9wzRaJlk5bDRLJrI/CJPxMj68YV9JwYRPjZtSFhYjgTvl8NaYlnTPwgh?=
 =?us-ascii?Q?JVUI40dziGhyg5q4STVAn3vr2OglYsMSjI9mcQGvltQccZGzEJJQJ02jVTNr?=
 =?us-ascii?Q?H+9VfQ9GdProqDsMjOM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:30.2334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d55b4dd0-e5e6-48c4-3455-08de28ed0bbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9085

Wrap domctl hypercall def and domctl.o with CONFIG_MGMT_HYPERCALLS.
Make CONFIG_MGMT_HYPERCALLS optional and expand help message

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove stub in common/domctl.c
- combine the original commit of "xen/domctl: provide stub for
 domctl_lock_{acquire,release}"
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
v2 -> v3:
- add pitfall warnning in Kconfig help
---
v3 -> v4:
- refine help message
---
 xen/common/Kconfig           | 14 ++++++++++----
 xen/common/Makefile          |  2 +-
 xen/include/hypercall-defs.c |  6 ++++--
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 973b8e26bd..5aecb88680 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -654,11 +654,17 @@ menu "Supported hypercall interfaces"
 config MGMT_HYPERCALLS
 	bool "Enable privileged hypercalls for system management"
 	depends on !PV_SHIM_EXCLUSIVE
-	def_bool y
 	help
-	  This option shall only be disabled on some dom0less systems, or
-	  PV shim on x86, to reduce Xen footprint via managing unnessary
-	  hypercalls, like sysctl, etc.
+	  Management hypercalls provide the means for dom0 to manage the
+	  overall Xen system and other domains, including sysctl, domctl, etc.
+	  In a dom0less or pv-shim build, they can be omitted to cut down
+	  on the Xen binary's size. However, this comes at the loss of
+	  significant runtime functionality.
+	  So be cautious to disable it, as admins will face missing a few basic
+	  hypercalls like listdomains, getdomaininfo, etc, hence leading to
+	  have an impact on device-passthrough and DM.
+
+	  Unless you know what you are doing, you should enable this.
 
 endmenu
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 7c32fbd9f1..e0afc89591 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -71,7 +71,7 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 endif
 
 extra-y := symbols-dummy.o
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 38b21dccbd..5343fd7a6f 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -199,9 +199,11 @@ sysctl(xen_sysctl_t *u_sysctl)
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
-#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
+#endif
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -279,10 +281,10 @@ hvm_op                             do       do       do       do       do
 #endif
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl                             do       do       do       do       do
-#endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
 #endif
+#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
-- 
2.34.1


