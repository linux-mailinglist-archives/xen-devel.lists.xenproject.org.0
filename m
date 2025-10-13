Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B9BD28ED
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141995.1476223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlU-00044A-Sk; Mon, 13 Oct 2025 10:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141995.1476223; Mon, 13 Oct 2025 10:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlU-0003z6-J5; Mon, 13 Oct 2025 10:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1141995;
 Mon, 13 Oct 2025 10:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fcm-0004Rd-Ry
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:52 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df28e40f-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:51 +0200 (CEST)
Received: from MN2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:208:23b::35)
 by DM4PR12MB6039.namprd12.prod.outlook.com (2603:10b6:8:aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:48 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:23b:cafe::f8) by MN2PR11CA0030.outlook.office365.com
 (2603:10b6:208:23b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 10:17:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:47 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:44 -0700
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
X-Inumbo-ID: df28e40f-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jb0SN2xp7vNHSMh0x4rv7zCmYonyyWrGsBDD7HodkKKFlAOZ6eEbO4p83J5iLO/lGrQ36r5AuUnlxJrI0HUILXnUFBs/rhXklKbCG2SXbfdtZ0wdhXd5tgVj4Xzw5AljJUg60FRsLYKYmcLtvTSts6Byoai4EpdNOEkplnir3Lt8muasyBSqJKvZe/x2icJnJxE4G3b0S/T2tuR85XVTxUcdkugPzKmvqWpQbTSTn/uTMMpNLjPFJsMuVhv7tZ/TakAM1ob5mwateh3b5aVkb8WCgZfnkiiHhWdgHcA+Wg38rDcuwUhn6p1SnDd0+QoXMhwbRz5PCHv2UG+JnkngMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2aSf4g6NxpM8zBIw6QU7YTARrV403WNSPl9azppxQs=;
 b=HqWfdoWR5A28I570WIqg1AlJ288IbF7iY8DG+1NlalKzG7/XK2VGbgr9hSYYnS8sMo+HyWCEKhvHjD3pvDtgp2py2XAS4lhvepuyhSxXXmfT0CEi/VK32uUdJSz1ItfGbB49q1dQtUxNIpxgd1LVrcqFIEc8YZs1EuNXUPUGZ23bKTDlHQ+l7GSouVFqwyhnMJxEBPx3a8yNNOyUEyKEjqRQ3LNRbv4yeApESFKoLEPTNRs17zizPvXvXCo/lsvwrnq3U6vljAf7KfzCYqaEwd3WwNGuFG7rY9zdKlM0MgkEqABGvN5KMsEpduNV1tSYh8utuPApSw6r+mFmMk5g6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2aSf4g6NxpM8zBIw6QU7YTARrV403WNSPl9azppxQs=;
 b=HX+jtnvvtB5CPxFSFY4/6dQzeaK0/twO2m4DT39X2gjdHNnVmChsFyRAPdUxSHGeatbMCJleNlnUUa4e6i8ku8DKInefGAUijuEQU26r1794z76IYPf/9Agn+gfOpbop9cLQB99mshXdUxMTU5qGGGVtWQAQKDitvROjr2XDxuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 28/28] xen/domctl: wrap common/domctl.c with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:40 +0800
Message-ID: <20251013101540.3502842-29-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DM4PR12MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 3139284e-e966-4924-5fc7-08de0a41c210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0jd0Mpd9oed2JAo19u2Remo43wktyhwirzGMv19OF4W7oMx6YBP3176EblMH?=
 =?us-ascii?Q?X996wjD40CsFm1tU83KMr9iOgqtpYL+ptNcvV8V/3UGPQxqx/AZAaWpxpPR7?=
 =?us-ascii?Q?6a5LNDwOh5tDAm8ZF+f/6qcHvXvDgLsM7DECiHHg/7rQteYZ33rH0NEpNcWb?=
 =?us-ascii?Q?84MmLFPh6y7paoF7UVl0N1L6S3Ssq8gmtlqmIirgrJTZAoPICilivTMdcIMJ?=
 =?us-ascii?Q?UH4b8gJFOJ7l/958JESwzz8kKRKD0U2+1zZfwIsj1bMc1lAj1R5Yy/M/ukGl?=
 =?us-ascii?Q?6lRru4xtUgGODwHbHeTxehfL0xzsynXpLNAlWZ/S1yWT5Xv2XXVn1H/1uICF?=
 =?us-ascii?Q?2vam3VkEezh82ttqOhbYwpZNZhenEsEsgPJ4BJtVErNPO0sXzP6YCM+qNTVk?=
 =?us-ascii?Q?tM+iB3lhEFjPjaUUuFYPFYRRMw/Zc6/ZtWnIS95FZxzVqlnPaJir7DinuIkC?=
 =?us-ascii?Q?R/Md2iyo9qA04wiGVH8OjZDetLocfF40micH4cFRuc09EpAlh/a4bC9xBD3G?=
 =?us-ascii?Q?q/gBzXgSDv6a3WSbUdKfyufIHIUbxuwJdQoubmvgmfZxUEMivROMOHHzBhXY?=
 =?us-ascii?Q?OH4J2lLovI6b5WcambwRRD4ROB4XGExG9kCHO65kGCuIZA/rQe6QhiY+3AkS?=
 =?us-ascii?Q?kvB03iGYVSFFKpH+7T3Y4O12Eh+654piz+lWEYgaytIBW4iiT+dPIL7/NkUp?=
 =?us-ascii?Q?XOghzQ9c09+m+z6lTVuCn7l6pgRibaID05so6F2HY5b7eWgKI+QTPG6ptp78?=
 =?us-ascii?Q?QSMzYWH3FT+rdR+7xSD94owQiHWhxUU0RK/pTV8ee7fDByOJbtmnuzn+bfJX?=
 =?us-ascii?Q?XoRhEKFKPzzvJUZ2ccpb/UU/JVIH+trpqHjdaL2BEp0J/pMhRe85I81opq9a?=
 =?us-ascii?Q?7a7wTf3Ak8kHnDuvxohOcJjRtCuBeE2h1E2hje4W0JkBMzi45Cqc71yoADxQ?=
 =?us-ascii?Q?v8zymnfNiwjpmxpdzDUmP/at5gbRTBrI/xro6TjbG5i8b3RRrgeVKVPJp9Bw?=
 =?us-ascii?Q?ZYaYp57KD9aXd8MInjXDW/brOcI3GD4xexPCaGFRX/+z/+2J0PejJjmM/VTU?=
 =?us-ascii?Q?snQrWpqh97/LJzJeOwHGnlrb7qu/S5F3B6EqUKQp8EzMwdLgYgJOcgX6u5h6?=
 =?us-ascii?Q?Nfg9+C7nxoHhT08vi1NfRQBZS48H0sfRgUP3DjQaElJG+jlxu5tbG2yBmW10?=
 =?us-ascii?Q?cjn6I4CNHjZzWyOSP3qR5b9qhgSNSl1L2JkTHSbWY6MG3j4pZcTKhGsFHrPq?=
 =?us-ascii?Q?tnUmaNdYpKJ0RCpGuCBW2ZAKE8ZY5zDZ2yuiY36MHCYNTIWNWoiUj47Bz0Jh?=
 =?us-ascii?Q?qprNj69pvyNsJBpohxplDj7hrRyWfv46qrB3r+Aa6ymyYGTvwTR2HN7jBcJF?=
 =?us-ascii?Q?8JdhQuiMwKrmFPAfI9oO/O0q2VaUtzPKzHpW1FJlAn/WzL0iiyGQ1lntcEc/?=
 =?us-ascii?Q?jJkbpY7VaQn6BamoCLgT5Le4Hkp2/7DozaUesfit9kNqEJ80Zni/b9pNXBCe?=
 =?us-ascii?Q?aHE1Q7Au5DljWj+Zci2Z3J3HYIFtyOWLdSkMPst/ZzEHNYNu3cZfX9m7l+Qe?=
 =?us-ascii?Q?c0cuHAEM8uFiGMEJyNw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:47.7777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3139284e-e966-4924-5fc7-08de0a41c210
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6039

Wrap domctl hypercall def and domctl.o with CONFIG_MGMT_HYPERCALLS.

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
 xen/common/Kconfig           | 6 ++++--
 xen/common/Makefile          | 2 +-
 xen/include/hypercall-defs.c | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 309d262386..efbe97c54a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -646,11 +646,13 @@ config SYSTEM_SUSPEND
 	  If unsure, say N.
 
 config MGMT_HYPERCALLS
-	def_bool y
+	bool "Enable privileged hypercalls for system management"
 	help
 	  This option shall only be disabled on some dom0less systems, or
 	  PV shim on x86, to reduce Xen footprint via managing unnessary
-	  hypercalls, like sysctl, etc.
+	  hypercalls, like sysctl, domctl, etc.
+	  Be cautious to disable it, as users will face missing a few basic
+	  hypercalls like listdomains, getdomaininfo, etc.
 
 config PM_OP
 	bool "Enable Performance Management Operation"
diff --git a/xen/common/Makefile b/xen/common/Makefile
index fdf826f218..45c0bda000 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,7 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domid.o
 obj-y += event_2l.o
 obj-y += event_channel.o
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 02d7b93e80..c243edc460 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -196,11 +196,11 @@ dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl(xen_sysctl_t *u_sysctl)
+domctl(xen_domctl_t *u_domctl)
 #endif
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
-domctl(xen_domctl_t *u_domctl)
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
@@ -279,8 +279,8 @@ hvm_op                             do       do       do       do       do
 #endif
 #ifdef CONFIG_MGMT_HYPERCALLS
 sysctl                             do       do       do       do       do
-#endif
 domctl                             do       do       do       do       do
+#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
-- 
2.34.1


