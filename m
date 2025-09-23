Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97EAB943CF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 06:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128130.1468646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uoD-0002KU-KB; Tue, 23 Sep 2025 04:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128130.1468646; Tue, 23 Sep 2025 04:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uoD-0002GV-Do; Tue, 23 Sep 2025 04:39:21 +0000
Received: by outflank-mailman (input) for mailman id 1128130;
 Tue, 23 Sep 2025 04:39:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0uoA-0000c8-Um
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 04:39:19 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42994bca-9837-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 06:39:16 +0200 (CEST)
Received: from SJ0PR03CA0379.namprd03.prod.outlook.com (2603:10b6:a03:3a1::24)
 by SA3PR12MB7829.namprd12.prod.outlook.com (2603:10b6:806:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Tue, 23 Sep
 2025 04:39:10 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::a0) by SJ0PR03CA0379.outlook.office365.com
 (2603:10b6:a03:3a1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 04:39:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Tue, 23 Sep 2025 04:39:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:39:04 -0700
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
X-Inumbo-ID: 42994bca-9837-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InkQXB/oYYvDztmGOvNzuq0gdb7wGxCYKAP1vbr33jgjy99yQHsg6ym98vq2uhH03qCwsvclRjgTkxFX+khpKm1c61rM4i5bOuZmUMhZWNVs3o78BrzsdKCdpRwoKzD7EGWwUz3zK99JXjtqdCvE63TgdeQo8Fu0gam3pjJWIfBSwcRLYYCPa0Du+34Ftjhk9goLJT6Pr/DOPnjt3PRLzDwBC+l0zUvONifZxGLPUSqONfB6D8vL8dU27MjAuDJF6CZg95QJFkPU4B0UkbcI54/5QbcDIG2PyJirDkHLex5O3Z0puFt1WmOS+Aj7jYG/debBuN94m8I9XkSWieTKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UK7p1dxIdAUwnp9/KlnmFuOMlvoXNyC3ltvAs175wZ0=;
 b=Hc3iSF9AIsX4PMi+eBB1vom6+2epv2fnDYW/Kst4vqHozLg+CrcG9A3V9H5XXwvoR/xIqMe/2ciNlnG+4vSeVgv2QE2OA8dkGhNE80+xbYYS7WKJtiI9xcOUCqBCw90PRK0/0ASPUZcEJu8g19nOfXplYxTSqkKl4DaJvEbefIjVxsqZehk1gm0Jo9AiNxlijrwoIYXIXhiNzdwdG/eia0QIJ+OAEyv5Ju+LzcqTCrs9gZRSdNmp6gaa4fHmOVjtVeZ54biUdETZQNcEZyTqJxz/G6+9VWhaUIQCqR3AFmKpVWkEPCY1iONwvN6T4Vq4RNxfuBjK88LKR1H/pAcJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UK7p1dxIdAUwnp9/KlnmFuOMlvoXNyC3ltvAs175wZ0=;
 b=t3jvn98Dg337iCtF/PQLDIg5f2ThBJ3bTlGz286X5Qc8xQXCTlaBhhpTjxTAQ2joWfaYnyYSYvcOKuNDvmOBg8CV3ZVCaBwDLmkxWluDX16AXWU4eY04FR5e2RoPuUgb/BNphqDFnQog+xLgDOtJYqAazbwQFQo2eqBAS9ozK1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v10 5/8] tools/cpufreq: extract CPPC para from cpufreq para
Date: Tue, 23 Sep 2025 12:38:23 +0800
Message-ID: <20250923043826.3831957-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923043826.3831957-1-Penny.Zheng@amd.com>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|SA3PR12MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b0e6f0-ac36-448d-8eb8-08ddfa5b236b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pvOsfUH2VGXNCRGcFkTXkNL8tnMhWyN6MYQoIptQnxJt0rzy4zQ2XtV0h/nO?=
 =?us-ascii?Q?AJMwxTZhir+QyeAeDa8zND7utCNJaJQ6boug1NMkdx1oKX5jwsa8pdUY0ySq?=
 =?us-ascii?Q?5vzMS62kRVZn8fpNVhbmrMCEpHmWUzdC4WWh2cR4PCuAdzNQFnY01TVTszsL?=
 =?us-ascii?Q?tvLGR0xQ4r/L5OOtst6l8wAOstUTd9D0LIokqt74AxMxt7siVNUHJj4qCfg9?=
 =?us-ascii?Q?UF5mqWf6NCXGKRYuyi5wovocKbbF7gxQcXFp+wF2DdeWqjW7kIOi6yFZq6ha?=
 =?us-ascii?Q?bR3rcyTTRvXSTY4+f9j0jvwu5v0TLK0YlAiS37KXkq7qO4dMP3lI5G2sJvtH?=
 =?us-ascii?Q?ENRLx6kpeWNuSKp1SVr6aSz59RbD+udUPebT1UW5stxKVG9rS8ZtOpC/uMq4?=
 =?us-ascii?Q?OyObK0ILOr1d3WXWunTJYVRDTRplb/xIGEbjKmRDHniGzuvwEc3KhKFUHQi4?=
 =?us-ascii?Q?m0TbE/QnKI5cyLAqOibDnOcDn0RWMHRMAsXv9QJNnIFnKYwN0FnIfBSruThl?=
 =?us-ascii?Q?VO25dDwuqVzgDKHr65i1aFUKzT8Pz0M14PULyfMIJNV8Hq6c/nYWE9zh1VCE?=
 =?us-ascii?Q?FmPV6/m62T6NmGXpEcHNZ82Spt8jJUuZaC3usRhTI0OayUg1YDwGDcO+fTaf?=
 =?us-ascii?Q?SPxh6vwZHa3NrIC1enV8oPVJPZ6ar4aHALYVnktnCoWyvOy5am1lPnEdJg6c?=
 =?us-ascii?Q?FQ0BNISDtpZwnG9jPC+WRUCGt2JkWp4tRNSBSPyzpZAtt6X/6xdOD+GtKer0?=
 =?us-ascii?Q?wQ4WK2CEXtaONvQWmwDPxMt50hpfgWeIi+2LkLIDAo53nPBhEYpq55fVnpD2?=
 =?us-ascii?Q?hoW1iTGqgkKFFy7YYxixKHM28HD1PRPyI3TRSeHOSzEdZgtoFSYaLl8oqOrY?=
 =?us-ascii?Q?2QMwLRwVNc/YXS/IjzhCCiAVsSpzmM386ojfptyQGFsCuo187VXByEF+NA3N?=
 =?us-ascii?Q?I0rNL4a/fFUvzvaxVLV4OvAUX2+yCmr27ijht4Qp1Y23hnybtEDrnocKi5Q1?=
 =?us-ascii?Q?INh10mntjSsHQYWufgqeafKe7sdR1tt5gMOfXxNRbA4Fp9oI9/YiMonVBLRC?=
 =?us-ascii?Q?RfQFziTVAbo2Tv3sqD2zuMSp3uTMfyM1y9zxMSGD3atJAIE0K0ctpDVm+2xh?=
 =?us-ascii?Q?0IqFCah+BhNZYw16BRUdcNFrvJF99xDYs6y/Oxq5g0Ali1XeDvoxS1Q3HNij?=
 =?us-ascii?Q?fEgx2lkfBxXn+yOimrIq90Dfszj1Vk200qVH1AaVwacmUnX5eAlpSSDfkRK7?=
 =?us-ascii?Q?M8wdNnZwoIGO9zKDKoSOqWIHTLbaGaHr2YLmSipfSDVts50w48sprvFhMC44?=
 =?us-ascii?Q?B/UTRi6e2IFid75BX1vrc/j41VUuSs/AW91oqXFfnNsZJruHR2brox9G1yjq?=
 =?us-ascii?Q?byNr5Vu0YjvCQbSpCwnuIN+2D3jOmBAuaDfH7p44RMaQfZ1SiSN1iP3HJhqs?=
 =?us-ascii?Q?I8xDScut4yJ2e6rv570FOn3eWxPW3l2Rypj6xDjC3detar6DvWP6r1JbmAle?=
 =?us-ascii?Q?Fh9ItOAlWO/TR2kgIWhBI0a4WHt8nfmtpmot?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:39:09.8346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b0e6f0-ac36-448d-8eb8-08ddfa5b236b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7829

We extract cppc info from "struct xen_get_cpufreq_para", where it acts as
a member of union, and share the space with governor info.
However, it may fail in amd-cppc passive mode, in which governor info and
CPPC info could co-exist, and both need to be printed together via xenpm tool.
If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
make xen_sysctl.u exceed 128 bytes.

So we introduce a new sub-field GET_CPUFREQ_CPPC to dedicatedly acquire
CPPC-related para, and make get-cpufreq-para invoke GET_CPUFREQ_CPPC
if available.
New helpers print_cppc_para() and get_cpufreq_cppc() are introduced to
extract CPPC-related parameters process from cpufreq para.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com> # hypervisor
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
v4 -> v5:
- new commit
---
v5 -> v6:
- remove the changes for get-cpufreq-para
---
v6 -> v7:
- make get-cpufreq-para invoke GET_CPUFREQ_CPPC
---
v7 -> v8:
- use structure assignment as it is a alias
- add errno info to the error print
---
v9 -> v10
- drop the outer union
---
 tools/include/xenctrl.h     |  27 +++++-----
 tools/libs/ctrl/xc_pm.c     |  47 +++++++++++-----
 tools/misc/xenpm.c          | 103 ++++++++++++++++++++++--------------
 xen/drivers/acpi/pm-op.c    |  43 +++++++++------
 xen/include/public/sysctl.h |  31 ++++++-----
 5 files changed, 155 insertions(+), 96 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 965d3b585a..c14ecd66aa 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1924,22 +1924,19 @@ struct xc_get_cpufreq_para {
     uint32_t cpuinfo_cur_freq;
     uint32_t cpuinfo_max_freq;
     uint32_t cpuinfo_min_freq;
-    union {
-        struct {
-            uint32_t scaling_cur_freq;
+    struct {
+        uint32_t scaling_cur_freq;
 
-            char scaling_governor[CPUFREQ_NAME_LEN];
-            uint32_t scaling_max_freq;
-            uint32_t scaling_min_freq;
+        char scaling_governor[CPUFREQ_NAME_LEN];
+        uint32_t scaling_max_freq;
+        uint32_t scaling_min_freq;
 
-            /* for specific governor */
-            union {
-                xc_userspace_t userspace;
-                xc_ondemand_t ondemand;
-            } u;
-        } s;
-        xc_cppc_para_t cppc_para;
-    } u;
+        /* for specific governor */
+        union {
+            xc_userspace_t userspace;
+            xc_ondemand_t ondemand;
+        } u;
+    } s;
 
     int32_t turbo_enabled;
 };
@@ -1953,6 +1950,8 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
                         int ctrl_type, int ctrl_value);
 int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
                         xc_set_cppc_para_t *set_cppc);
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para);
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
 
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 6fda973f1f..5b4e489acf 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -274,25 +274,24 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
         /*
          * Copy to user_para no matter what cpufreq driver/governor.
          *
-         * First sanity check layout of the union subject to memcpy() below.
+         * First sanity check layout of the struct subject to memcpy() below.
          */
-        BUILD_BUG_ON(sizeof(user_para->u) != sizeof(sys_para->u));
+        BUILD_BUG_ON(sizeof(user_para->s) != sizeof(sys_para->s));
 
 #define CHK_FIELD(fld) \
-        BUILD_BUG_ON(offsetof(typeof(user_para->u), fld) != \
-                     offsetof(typeof(sys_para->u),  fld))
+        BUILD_BUG_ON(offsetof(typeof(user_para->s), fld) != \
+                     offsetof(typeof(sys_para->s),  fld))
 
-        CHK_FIELD(s.scaling_cur_freq);
-        CHK_FIELD(s.scaling_governor);
-        CHK_FIELD(s.scaling_max_freq);
-        CHK_FIELD(s.scaling_min_freq);
-        CHK_FIELD(s.u.userspace);
-        CHK_FIELD(s.u.ondemand);
-        CHK_FIELD(cppc_para);
+        CHK_FIELD(scaling_cur_freq);
+        CHK_FIELD(scaling_governor);
+        CHK_FIELD(scaling_max_freq);
+        CHK_FIELD(scaling_min_freq);
+        CHK_FIELD(u.userspace);
+        CHK_FIELD(u.ondemand);
 
 #undef CHK_FIELD
 
-        memcpy(&user_para->u, &sys_para->u, sizeof(sys_para->u));
+        memcpy(&user_para->s, &sys_para->s, sizeof(sys_para->s));
     }
 
 unlock_4:
@@ -366,6 +365,30 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
     return ret;
 }
 
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para)
+{
+    int ret;
+    struct xen_sysctl sysctl = {};
+
+    if ( !xch  || !cppc_para )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    sysctl.cmd = XEN_SYSCTL_pm_op;
+    sysctl.u.pm_op.cmd = GET_CPUFREQ_CPPC;
+    sysctl.u.pm_op.cpuid = cpuid;
+
+    ret = xc_sysctl(xch, &sysctl);
+    if ( ret )
+        return ret;
+
+    *cppc_para = sysctl.u.pm_op.u.get_cppc;
+    return ret;
+}
+
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 6b054b10a4..c7f19cea28 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -801,6 +801,34 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
     return mantissa * multiplier;
 }
 
+/* print out parameters about cpu cppc */
+static void print_cppc_para(unsigned int cpuid,
+                            const xc_cppc_para_t *cppc)
+{
+    printf("cppc variables       :\n");
+    printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
+           cppc->lowest, cppc->lowest_nonlinear);
+    printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
+           cppc->nominal, cppc->highest);
+    printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
+           cppc->minimum, cppc->maximum, cppc->energy_perf);
+
+    if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
+    {
+        unsigned int activity_window;
+        const char *units;
+
+        activity_window = calculate_activity_window(cppc, &units);
+        printf("                     : activity_window [%"PRIu32" %s]\n",
+               activity_window, units);
+    }
+
+    printf("                     : desired [%"PRIu32"%s]\n",
+           cppc->desired,
+           cppc->desired ? "" : " hw autonomous");
+    printf("\n");
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -826,71 +854,45 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( hwp )
-    {
-        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
-
-        printf("cppc variables       :\n");
-        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
-               cppc->lowest, cppc->lowest_nonlinear);
-        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
-               cppc->nominal, cppc->highest);
-        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
-               cppc->minimum, cppc->maximum, cppc->energy_perf);
-
-        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
-        {
-            unsigned int activity_window;
-            const char *units;
-
-            activity_window = calculate_activity_window(cppc, &units);
-            printf("                     : activity_window [%"PRIu32" %s]\n",
-                   activity_window, units);
-        }
-
-        printf("                     : desired [%"PRIu32"%s]\n",
-               cppc->desired,
-               cppc->desired ? "" : " hw autonomous");
-    }
-    else
+    if ( !hwp )
     {
         if ( p_cpufreq->gov_num )
             printf("scaling_avail_gov    : %s\n",
                    p_cpufreq->scaling_available_governors);
 
-        printf("current_governor     : %s\n", p_cpufreq->u.s.scaling_governor);
-        if ( !strncmp(p_cpufreq->u.s.scaling_governor,
+        printf("current_governor     : %s\n", p_cpufreq->s.scaling_governor);
+        if ( !strncmp(p_cpufreq->s.scaling_governor,
                       "userspace", CPUFREQ_NAME_LEN) )
         {
             printf("  userspace specific :\n");
             printf("    scaling_setspeed : %u\n",
-                   p_cpufreq->u.s.u.userspace.scaling_setspeed);
+                   p_cpufreq->s.u.userspace.scaling_setspeed);
         }
-        else if ( !strncmp(p_cpufreq->u.s.scaling_governor,
+        else if ( !strncmp(p_cpufreq->s.scaling_governor,
                            "ondemand", CPUFREQ_NAME_LEN) )
         {
             printf("  ondemand specific  :\n");
             printf("    sampling_rate    : max [%u] min [%u] cur [%u]\n",
-                   p_cpufreq->u.s.u.ondemand.sampling_rate_max,
-                   p_cpufreq->u.s.u.ondemand.sampling_rate_min,
-                   p_cpufreq->u.s.u.ondemand.sampling_rate);
+                   p_cpufreq->s.u.ondemand.sampling_rate_max,
+                   p_cpufreq->s.u.ondemand.sampling_rate_min,
+                   p_cpufreq->s.u.ondemand.sampling_rate);
             printf("    up_threshold     : %u\n",
-                   p_cpufreq->u.s.u.ondemand.up_threshold);
+                   p_cpufreq->s.u.ondemand.up_threshold);
         }
 
         printf("scaling_avail_freq   :");
         for ( i = 0; i < p_cpufreq->freq_num; i++ )
             if ( p_cpufreq->scaling_available_frequencies[i] ==
-                 p_cpufreq->u.s.scaling_cur_freq )
+                 p_cpufreq->s.scaling_cur_freq )
                 printf(" *%d", p_cpufreq->scaling_available_frequencies[i]);
             else
                 printf(" %d", p_cpufreq->scaling_available_frequencies[i]);
         printf("\n");
 
         printf("scaling frequency    : max [%u] min [%u] cur [%u]\n",
-               p_cpufreq->u.s.scaling_max_freq,
-               p_cpufreq->u.s.scaling_min_freq,
-               p_cpufreq->u.s.scaling_cur_freq);
+               p_cpufreq->s.scaling_max_freq,
+               p_cpufreq->s.scaling_min_freq,
+               p_cpufreq->s.scaling_cur_freq);
     }
 
     printf("turbo mode           : %s\n",
@@ -898,6 +900,24 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
     printf("\n");
 }
 
+/* show cpu cppc parameters information on CPU cpuid */
+static int show_cppc_para_by_cpuid(xc_interface *xc_handle, unsigned int cpuid)
+{
+    int ret;
+    xc_cppc_para_t cppc_para;
+
+    ret = xc_get_cppc_para(xc_handle, cpuid, &cppc_para);
+    if ( !ret )
+        print_cppc_para(cpuid, &cppc_para);
+    else if ( errno == ENODEV )
+        ret = 0; /* Ignore unsupported platform */
+    else
+        fprintf(stderr, "[CPU%u] failed to get cppc parameter: %s\n",
+                cpuid, strerror(errno));
+
+    return ret;
+}
+
 /* show cpu frequency parameters information on CPU cpuid */
 static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
 {
@@ -957,7 +977,12 @@ static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
     } while ( ret && errno == EAGAIN );
 
     if ( ret == 0 )
+    {
         print_cpufreq_para(cpuid, p_cpufreq);
+
+        /* Show CPPC parameters if available */
+        ret = show_cppc_para_by_cpuid(xc_handle, cpuid);
+    }
     else if ( errno == ENODEV )
     {
         ret = -ENODEV;
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index a7eaf29c31..f50acd7088 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -77,6 +77,17 @@ static int read_scaling_available_governors(char *scaling_available_governors,
     return 0;
 }
 
+static int get_cpufreq_cppc(unsigned int cpu,
+                            struct xen_get_cppc_para *cppc_para)
+{
+    int ret = -ENODEV;
+
+    if ( hwp_active() )
+        ret = get_hwp_para(cpu, cppc_para);
+
+    return ret;
+}
+
 static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
 {
     uint32_t ret = 0;
@@ -143,9 +154,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( hwp_active() )
-        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    if ( !hwp_active() )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -165,29 +174,29 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
         if ( ret )
             return -EFAULT;
 
-        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
-        op->u.get_para.u.s.scaling_max_freq = policy->max;
-        op->u.get_para.u.s.scaling_min_freq = policy->min;
+        op->u.get_para.s.scaling_cur_freq = policy->cur;
+        op->u.get_para.s.scaling_max_freq = policy->max;
+        op->u.get_para.s.scaling_min_freq = policy->min;
 
         if ( policy->governor->name[0] )
-            strlcpy(op->u.get_para.u.s.scaling_governor,
+            strlcpy(op->u.get_para.s.scaling_governor,
                     policy->governor->name, CPUFREQ_NAME_LEN);
         else
-            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
+            strlcpy(op->u.get_para.s.scaling_governor, "Unknown",
                     CPUFREQ_NAME_LEN);
 
         /* governor specific para */
-        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
+        if ( !strncasecmp(op->u.get_para.s.scaling_governor,
                           "userspace", CPUFREQ_NAME_LEN) )
-            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
+            op->u.get_para.s.u.userspace.scaling_setspeed = policy->cur;
 
-        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
+        if ( !strncasecmp(op->u.get_para.s.scaling_governor,
                           "ondemand", CPUFREQ_NAME_LEN) )
             ret = get_cpufreq_ondemand_para(
-                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
-                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
-                &op->u.get_para.u.s.u.ondemand.sampling_rate,
-                &op->u.get_para.u.s.u.ondemand.up_threshold);
+                &op->u.get_para.s.u.ondemand.sampling_rate_max,
+                &op->u.get_para.s.u.ondemand.sampling_rate_min,
+                &op->u.get_para.s.u.ondemand.sampling_rate,
+                &op->u.get_para.s.u.ondemand.up_threshold);
     }
 
     return ret;
@@ -385,6 +394,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         ret = set_cpufreq_para(op);
         break;
 
+    case GET_CPUFREQ_CPPC:
+        ret = get_cpufreq_cppc(op->cpuid, &op->u.get_cppc);
+        break;
+
     case SET_CPUFREQ_CPPC:
         ret = set_cpufreq_cppc(op);
         break;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index eb3a23b038..66c9b65465 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -478,22 +478,19 @@ struct xen_get_cpufreq_para {
     uint32_t cpuinfo_cur_freq;
     uint32_t cpuinfo_max_freq;
     uint32_t cpuinfo_min_freq;
-    union {
-        struct {
-            uint32_t scaling_cur_freq;
-
-            char scaling_governor[CPUFREQ_NAME_LEN];
-            uint32_t scaling_max_freq;
-            uint32_t scaling_min_freq;
-
-            /* for specific governor */
-            union {
-                struct  xen_userspace userspace;
-                struct  xen_ondemand ondemand;
-            } u;
-        } s;
-        struct xen_get_cppc_para cppc_para;
-    } u;
+    struct {
+        uint32_t scaling_cur_freq;
+
+        char scaling_governor[CPUFREQ_NAME_LEN];
+        uint32_t scaling_max_freq;
+        uint32_t scaling_min_freq;
+
+        /* for specific governor */
+        union {
+            struct  xen_userspace userspace;
+            struct  xen_ondemand ondemand;
+        } u;
+    } s;
 
     int32_t turbo_enabled;
 };
@@ -523,6 +520,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
     #define SET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x05)
+    #define GET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x06)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -547,6 +545,7 @@ struct xen_sysctl_pm_op {
     uint32_t cpuid;
     union {
         struct xen_get_cpufreq_para get_para;
+        struct xen_get_cppc_para    get_cppc;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
         struct xen_set_cppc_para    set_cppc;
-- 
2.34.1


