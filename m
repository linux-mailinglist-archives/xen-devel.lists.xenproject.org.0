Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A7CB7D28
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184894.1507198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQQ-0007jH-Go; Fri, 12 Dec 2025 04:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184894.1507198; Fri, 12 Dec 2025 04:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQQ-0007gd-6k; Fri, 12 Dec 2025 04:06:38 +0000
Received: by outflank-mailman (input) for mailman id 1184894;
 Fri, 12 Dec 2025 04:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQO-0007Dl-FF
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:36 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f228ef1f-d70f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:06:35 +0100 (CET)
Received: from MN2PR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:23a::15)
 by IA0PPF7646FEBB5.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Fri, 12 Dec
 2025 04:06:29 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::c3) by MN2PR03CA0010.outlook.office365.com
 (2603:10b6:208:23a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Fri,
 12 Dec 2025 04:06:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:29 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:26 -0600
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
X-Inumbo-ID: f228ef1f-d70f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaKiUXk4MzO/A9ATcrJfmwQ3GEdtj1ywfMcL6LVVRhblUcO6620R0y9c9M9O+FVNXSjzlVy6NPtCbf/0DnLFX3CScMmwXtxSZdEKWYmXPh2UJ0jZ0WoU8iI6Uhv/1NqH7/hAiHhwTDkbmT/od3Ewj0WWX/sYHa8cJJW+WAB+OY2TecutTdr+Q6SUyTbERQJIqZI0sjvuDiFqrBMgnycKheEzE5Unk7uq4h/ycMdQPg4j3X66fVc4iusOLCXR9YXbj3tpnrVbX/LnDA9trC4RKSTUt4tvQ77d7IbTzSZc/r/pQgFfQhKobifJev8VMvSUs0Gsrv77o8GKQI0fYT4/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXAQFART80WLThJjcvr6ZzdrnhTVp/Mdx6r3fmkmkIU=;
 b=FlfiKf8JIV23MnTnQeJIPecEzltaOXlsBZsX4bpBSTI6ewPNDgii+SQ7/CxdHvDjtCWw6ID6b6VpGmCGl0GNxE3/bAjL1AlydDGgcrLzySdjl7NE2yS0Y9YcfVKAbN5CERpPJOuKvXhwCDfpSgttL4WfzQVmYQ1CsZIPQck1/ZmP/HVeHS7gAJHaJmKPFb6pouRxeruglqAgKNqwdcbuo/IysYZ88rsgIK/c5W19TEDBm0sk7wU2VCJAFGWGBaLUP2E8r6xFH1Q46clnu4Jl32RsPpkx1izbSWgEpsTne/v3AGUNqzmLXHoaAigvkCIDaHGmQjjshuAFxxwHVdd4/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXAQFART80WLThJjcvr6ZzdrnhTVp/Mdx6r3fmkmkIU=;
 b=noXX+P9szPAnX6CGl130T2qdsUU3uY3gfPuYUzvWxcmLCjwAs3dVuDOsirCgCegTI3g9k02z7Buww7ycJFT7qr34LeL9Ksw9J30J/R9akKM1X63l/G6KNoLRnqmJUuBI5bjG4JMmUs8HStJ8MJwbCNYrzPMr/HQ/+PCbLX7z1tY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Penny Zheng <penny.zheng@amd.com>
Subject: [PATCH v5 03/24] xen/arm: move dt_find_node_by_gpath() to passthrough/device_tree.c
Date: Fri, 12 Dec 2025 12:01:48 +0800
Message-ID: <20251212040209.1970553-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|IA0PPF7646FEBB5:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6f502c-7898-45e6-ee24-08de3933d3ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?blVOFwB7jBrp8/v5J/AqmksMjwNkWafWx1jsI2HJ+4ceHP1ARRRevL+WZQsM?=
 =?us-ascii?Q?v600MmS7WMMWq/lll01Nm20Eb3HPvmYZb+syyuZ1TGmxqAUe0Sa0ES3Y+CAL?=
 =?us-ascii?Q?sG4d6588KCuchCYxLvsybAJI5O9YpGgF2YvOEo20os7+T4ulIVO3vlnP9PaK?=
 =?us-ascii?Q?/fblsC5M69KWLKf5gRfw/0wMM3jWdL/DfFVWyJ1VbOwjz8RIi2+j5BdVbFZU?=
 =?us-ascii?Q?IDsxKEO/I+6neewRxtOrWYalJNSUlQ4qh6VXVgyKL4aBwYASSgN90gBr9rW8?=
 =?us-ascii?Q?0LyGOdXN4Mi95LEaQ3gSl3Ouj8hOXK7dP9T/GJBXAb2rgP+Kin+kRZzu2SiN?=
 =?us-ascii?Q?NVuof9FVrYGCD3DgmV6jqyjJw6sLIr6etk0wwkHVUqgjHcxIEFGaM1V7JsNq?=
 =?us-ascii?Q?5on6UFUhuY7T7VX8OqMRA4FRi1QeVEdf3a/ubX/Hu/AAqMaZgVQJTuufG/ka?=
 =?us-ascii?Q?OReB4tURVhdasRahxiYbGNFbXixt1jMdphGb0n1KBOkjrNA9riOco4MfT08h?=
 =?us-ascii?Q?1fo7IVkhE8bQ6P1+qQTPNsrJOfYv0EsYo+mfZlfzGdo2HrguRBx0SuEbp2YG?=
 =?us-ascii?Q?0jdNysZyKxYS26x8JF9IP+9FhMf1+8Xj4Tn5jRRt7byPUYfxqhuTKW+cqdWT?=
 =?us-ascii?Q?YXrRNPS3xVzyxr6phzli24rwgusI/AWKELuABsrFdAIL42kmYRoWyN00iwfx?=
 =?us-ascii?Q?EWq0uqkb1+7rMN9ETPvl5Dwxmq992sQBH7P1bq2aNNVuealh5rTNxhEqna0r?=
 =?us-ascii?Q?MtL+QEhrPA6hBqTjG7sviaeLLMWG7MXTo5q0AD7Xo67Z1cW4HPMATpi0kjvi?=
 =?us-ascii?Q?w+QI7bBhodkAFk3yRhnJePy9oJJFTgenb67O5ujq7Z+xSSIxRBloPGguXNLs?=
 =?us-ascii?Q?WW0i2N7RM3yIj643AOLj4k9/3c9UT+SDCKoJynlwAakJVew/tCsM2hhu+bpt?=
 =?us-ascii?Q?8/+4uvccOV1J9+Z0Efkmc6dPblg+e9eHfcqikuC++itN5myhA6Irhr+OyJuK?=
 =?us-ascii?Q?7/4I3Z0yD5YxJ6BROt16+BbV74SCchzOGAfeFG0Jizz2B2Dki+bq1u7/tljG?=
 =?us-ascii?Q?VHXhGTJXZI6wKgxUHlPr/QhNb/jUvuJqG5RGVv2Qur4D/4Bgwd9qDYRCCQ8l?=
 =?us-ascii?Q?CkEOZ42E/pQ1EgZyKh2r0rfXREPNmWvQbhSdP+bY/MWZjr1fHnNUcIZ6EZFU?=
 =?us-ascii?Q?sU67F13TQiN54mTj9acx7kKR0iXy+1rVQ4cJzgeoRcUOGdG4fyEW9qEw1BbD?=
 =?us-ascii?Q?74jnt2cufx1aiC5chycW3+MYgXCuHgI4/k2gZ6VzAVRB22r+SkH2LmIeoxC3?=
 =?us-ascii?Q?DpfNZ7S33PixN9xxQZK4/sB+jbWxZTml6+9vjtqO1vj2aIaYu/MoMN92vec8?=
 =?us-ascii?Q?GKdD3p0Prcd3Wy5fpnDBnyizaxjtIOc0ar0RczK6N0q6ELHMseQxbwSvg6Ux?=
 =?us-ascii?Q?hkU1X8X7wuNKt6hyDKQ5QGRVGDdXoKnHlEwPlrWdgFE3JXKUdt5gynkQGs8u?=
 =?us-ascii?Q?HfkUQgd97+z2gKh9uupua5HJ2eMKjk/f8128c/hMDJZai8pdVc3QAQ0wLyGf?=
 =?us-ascii?Q?KtfFgHD6UOKAuABNXs0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:29.1101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6f502c-7898-45e6-ee24-08de3933d3ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF7646FEBB5

The common/device-tree/device-tree.c contains generic unflatten DT helpers API,
while dt_find_node_by_gpath() is specific for domctl (iommu) processing.
We move this function into drivers\passthrough\device_tree.c and make it
static, as it is used only there now.

Suggested-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Penny Zheng <penny.zheng@amd.com>
---
v4 -> v5:
- new commit
---
 xen/common/device-tree/device-tree.c  | 16 ---------------
 xen/drivers/passthrough/device_tree.c | 28 +++++++++++++++++++++++++++
 xen/include/xen/device_tree.h         | 13 -------------
 3 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 0b5375f151..d6cf417e94 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -371,22 +371,6 @@ struct dt_device_node *dt_find_node_by_path_from(struct dt_device_node *from,
     return np;
 }
 
-int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
-                          struct dt_device_node **node)
-{
-    char *path;
-
-    path = safe_copy_string_from_guest(u_path, u_plen, PAGE_SIZE);
-    if ( IS_ERR(path) )
-        return PTR_ERR(path);
-
-    *node = dt_find_node_by_path(path);
-
-    xfree(path);
-
-    return (*node == NULL) ? -ESRCH : 0;
-}
-
 struct dt_device_node *dt_find_node_by_alias(const char *alias)
 {
     const struct dt_alias_prop *app;
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index f5850a2607..eb0c233977 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -16,6 +16,7 @@
  */
 
 #include <xen/device_tree.h>
+#include <xen/err.h>
 #include <xen/guest_access.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
@@ -318,6 +319,33 @@ int iommu_add_dt_device(struct dt_device_node *np)
     return rc;
 }
 
+/*
+ * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
+ * path from the guest
+ *
+ * @u_path: Xen Guest handle to the buffer containing the path
+ * @u_plen: Length of the buffer
+ * @node: TODO
+ *
+ * Return 0 if succeed otherwise -errno
+ */
+static int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path,
+                                 uint32_t u_plen,
+                                 struct dt_device_node **node)
+{
+    char *path;
+
+    path = safe_copy_string_from_guest(u_path, u_plen, PAGE_SIZE);
+    if ( IS_ERR(path) )
+        return PTR_ERR(path);
+
+    *node = dt_find_node_by_path(path);
+
+    xfree(path);
+
+    return (*node == NULL) ? -ESRCH : 0;
+}
+
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7643622..241f269b57 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -550,19 +550,6 @@ static inline struct dt_device_node *dt_find_node_by_path(const char *path)
     return dt_find_node_by_path_from(dt_host, path);
 }
 
-/**
- * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
- * path from the guest
- *
- * @u_path: Xen Guest handle to the buffer containing the path
- * @u_plen: Length of the buffer
- * @node: TODO
- *
- * Return 0 if succeed otherwise -errno
- */
-int dt_find_node_by_gpath(XEN_GUEST_HANDLE(char) u_path, uint32_t u_plen,
-                          struct dt_device_node **node);
-
 /**
  * dt_get_parent - Get a node's parent if any
  * @node: Node to get parent
-- 
2.34.1


