Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D7FC78167
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 10:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168464.1494499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNG3-0000I2-MX; Fri, 21 Nov 2025 09:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168464.1494499; Fri, 21 Nov 2025 09:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNG3-0000FE-Iz; Fri, 21 Nov 2025 09:16:47 +0000
Received: by outflank-mailman (input) for mailman id 1168464;
 Fri, 21 Nov 2025 09:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMNG2-0007sJ-Gf
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 09:16:46 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc849ea2-c6ba-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 10:16:45 +0100 (CET)
Received: from CH0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:610:b3::24)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 09:16:40 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::39) by CH0PR03CA0049.outlook.office365.com
 (2603:10b6:610:b3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Fri,
 21 Nov 2025 09:16:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 09:16:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 01:16:36 -0800
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
X-Inumbo-ID: cc849ea2-c6ba-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl7hFsWUV7WLkLnrkU7Pd9zpMgO78HSwo+QpWiVA9WoW1ltOLDRj9mWJmTonZhE/YQK912Smxcm0mdkSwT2FgXf7Z9q6bqCHL3up3UUkRzfofNcz28MUk/K0jW3oX//+oVICmMXIcrsS9o2JySgfUrJkcT46n0FG8Fg9EV8xXSUdbBs78NHszw2Pfq71ruiZF4V5mAm5zFCtQwrYqfY7U5CKsp7eeRmb1QhYW1M7TzAYw+AMK4NnR96DS/JJXSFqOCpaFoy2xSJ+PBuR2PDGWL5RI0OqHfnzbf7zQQxzAhQGLCxHYDQmggzSPJqmhMve7DT8WFjOwkDlf7QbJDYjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ypce8qKw6FYSDsYUV6gS5jLplfGibwksQtnlPdu1gTw=;
 b=UgrQnL+HrfmY1ql/vkAuNsAtJNMfXjt+4L7Xm/Kcm+c04nc+bVSKJyeHfiSYZbQG2+xbUm73mHY17EFdbwCcsRooIC5Ua7YY7EhhPGt+ZesdUH337nYuT4lMpvSh7BCI7BwJ/klFRP+7w91ladiomv7YM8X/bRsvotmknyA9x4gqZJCajS2aDl0qi04u9pAMh4FHzPYhgC8BjOh//h4+RaXSAY8jioScZCPsvULqV4fukahbllUiubGE+yQkBHoDvI4eGwUeD8iqJ/Is0CkZu/qEbHfPFRhWKd4wlt2LeXPAv+SH1SHVHB5b/+amyD9PS/N662zI6U3quyj6iZ+rlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ypce8qKw6FYSDsYUV6gS5jLplfGibwksQtnlPdu1gTw=;
 b=jWkscUkU4OlYiypUqoctOY2cByAOeh3gFS5uJbFuX4Jwgi6+BuNXGr4RKbvFKbYR48f46OVEpgvmhpfBZVW3hfMlxIf4DCTescFss148RlpidpTB4BqyDBMpMj0cf8mxFZ3KL1AhZhMyzZFOlV/rLGLEWHWzhbfAKG6dEaVYT5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 5/7] xen/p2m: move xenmem_access_to_p2m_access() to common p2m.c
Date: Fri, 21 Nov 2025 17:15:52 +0800
Message-ID: <20251121091554.1003315-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121091554.1003315-1-Penny.Zheng@amd.com>
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: c7600d78-2d57-4b41-f726-08de28deade2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WryY9AUL8QG35W+yAQbUj17kWM/cpMGJUUsLyuCQH1UnsfJHByyjdcbP7Bks?=
 =?us-ascii?Q?SXj8OkLYTPL8xlvo52Vst+vN11RcfUGucwubPZdG1rjST34Gj3Eh6zbdkQtS?=
 =?us-ascii?Q?uUjHd27ePs8iVpDazMIWirP3BuYdMqfDrrij2WfHiwWI6Ww1T6kv8OmMIGo9?=
 =?us-ascii?Q?whM4KrNWYT74BC1XAct/MiSlAVtKmkOK/8YgKqfk5duGcSvO+QbWt+aruzar?=
 =?us-ascii?Q?rsfEw51AxM82DFLrK/ZOuwB25GL3KBzwYQuSe0Cwlwr43owuMYzuVgjWTRrg?=
 =?us-ascii?Q?PICvX+Q7btQmib0f9DRqXqL2Q6If/zi/YiAuuHmdeGMmqeCf0Anw6jc0HZfa?=
 =?us-ascii?Q?eP6a9pIMKFXNNixmomBQiF0VeVYwst2KThOFDlqjsSe0woj5TEzo7itdgBfV?=
 =?us-ascii?Q?mZ6l0cSmSPxnHTKOvyJN4o9A76b5MsYVq1FuCvylVLvRghrm9aa+Ws4b5FY6?=
 =?us-ascii?Q?IzAQ0LHrfgBg2lZZLXAjfgmCsQpuvQeVeBXOjWkavzAP9wsKD6snNuB45Azj?=
 =?us-ascii?Q?vyrw+vtlH4j3EKYyDrBHhh/ZBr0IfDyRsDSImh8HPxdud1RltGzUdxl+chDR?=
 =?us-ascii?Q?qUa+Das3BVbM+Rofm0PWlDG6T48woB9GkClXcFqXtUzbkeH6kN7m5eFSB7R/?=
 =?us-ascii?Q?QS/6rmF735zTvy79uU2UpvIjumke+1TdRUdLUnCrMuAzS0vHO+hgGEsj0s4C?=
 =?us-ascii?Q?fMV2Q47n4tPdKmQb8Kia8Y0F1i2XIEEH3rr/7GHYC3LThVXiTb/PF2G2JNqm?=
 =?us-ascii?Q?k3Lp2LB4cGUrigxaCExFq4gBXXnjSMRAQez+q2nMtriAFw9Tz87bRYa2yt4k?=
 =?us-ascii?Q?GWvILNz6eL6Lot1nsNl/8JHjHt1p/BnRpj6sSHN5v8qY4WOb2Ga3yEDjb4qd?=
 =?us-ascii?Q?YXA8+zKfZdUvENw3Q2Dnc/uyDkQDwLiRDyYZ4ra55O6HPTpSfDU0pFiOiN8Z?=
 =?us-ascii?Q?sqYeWSOtebkWYj7UITee6xtTzLdpLLoZZVhrcDs8y14V4TT0M+WUsTi3ZkZ0?=
 =?us-ascii?Q?/jmqzGRGCJaB983rgYT6v5SE1xqaxeRO3pwsxX8UKioNNIBSvLWDuYZYOTcf?=
 =?us-ascii?Q?wb7CCpu7JsusaKJsE6XGeQaydy2GgQ7qlXvCkRR7OmnRnk5bnch/w/Yf+tq9?=
 =?us-ascii?Q?Xm41GVW3uQQjKK5s348wWxpUDe4oXHrsL3gBvtWVqO9vFJbWi+5G07WneckH?=
 =?us-ascii?Q?ITXn4N6cSoQcs31V7VCpW3s6fdYXBPPMdJ1ht7RV9Bw72sNZlt0c00dmGzM0?=
 =?us-ascii?Q?bA5YOY5ak1uHZYhil2JhaKuGSOwcZFlP2Dq5D4D1cffVXVJlfEf/XUy/UXav?=
 =?us-ascii?Q?twGWUFD9U5sI9CwAFpttyiiHThgMB6zIf/0TS0zQ8pisAj593S25mmP6HyRl?=
 =?us-ascii?Q?OiDNZjmgMjJDQUd/nLSgSE1YRlw2P3SKQ203GZqDsrZqkIZSl+bN9y1Nu1y7?=
 =?us-ascii?Q?EGx8ry4oNfusbf+BB7BDNR9Czhn3QsWpXrr27aMTSy8R16JqRArcbqT1xeF6?=
 =?us-ascii?Q?seqFJ/HXFnTVdUGWsqwGMMfHLmmPUKBdqJb+agJXYq6hjeyXhuaZLAvLeexy?=
 =?us-ascii?Q?fBCRgtQfxQeHCqo5FSg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 09:16:39.7629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7600d78-2d57-4b41-f726-08de28deade2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838

Memory access and ALTP2M are two seperate features, while both depending on
helper xenmem_access_to_p2m_access(). So it betters lives in common p2m.c,
other than mem_access.c which will be compiled out when VM_EVENT=n && ALTP2M=y.
Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M, otherwise it
will become unreachable when both VM_EVENT=n and ALTP2M=n, and hence
violating Misra rule 2.1
We also need to move declaration from mem_access.h to p2m-common.h
An extra blank line is inserted after each case-block to correct coding
style at the same time.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v3:
- Guard xenmem_access_to_p2m_access() with VM_EVENT || ALTP2M
- Move declaration from mem_access.h to p2m-common.h
- refine commit message
---
 xen/arch/x86/mm/mem_access.c | 36 --------------------------------
 xen/arch/x86/mm/p2m.c        | 40 ++++++++++++++++++++++++++++++++++++
 xen/include/xen/mem_access.h |  5 -----
 xen/include/xen/p2m-common.h |  3 +++
 4 files changed, 43 insertions(+), 41 deletions(-)

diff --git a/xen/arch/x86/mm/mem_access.c b/xen/arch/x86/mm/mem_access.c
index e6b609064c..e55e53f44c 100644
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -298,42 +298,6 @@ static int set_mem_access(struct domain *d, struct p2m_domain *p2m,
     return rc;
 }
 
-bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
-                                 xenmem_access_t xaccess,
-                                 p2m_access_t *paccess)
-{
-    static const p2m_access_t memaccess[] = {
-#define ACCESS(ac) [XENMEM_access_##ac] = p2m_access_##ac
-        ACCESS(n),
-        ACCESS(r),
-        ACCESS(w),
-        ACCESS(rw),
-        ACCESS(x),
-        ACCESS(rx),
-        ACCESS(wx),
-        ACCESS(rwx),
-        ACCESS(rx2rw),
-        ACCESS(n2rwx),
-        ACCESS(r_pw),
-#undef ACCESS
-    };
-
-    switch ( xaccess )
-    {
-    case 0 ... ARRAY_SIZE(memaccess) - 1:
-        xaccess = array_index_nospec(xaccess, ARRAY_SIZE(memaccess));
-        *paccess = memaccess[xaccess];
-        break;
-    case XENMEM_access_default:
-        *paccess = p2m->default_access;
-        break;
-    default:
-        return false;
-    }
-
-    return true;
-}
-
 /*
  * Set access type for a region of gfns.
  * If gfn == INVALID_GFN, sets the default access type.
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e2a00a0efd..2763f9a6be 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2189,6 +2189,46 @@ void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
     guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
+#if defined(CONFIG_VM_EVENT) || defined(CONFIG_ALTP2M)
+bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
+                                 xenmem_access_t xaccess,
+                                 p2m_access_t *paccess)
+{
+    static const p2m_access_t memaccess[] = {
+#define ACCESS(ac) [XENMEM_access_##ac] = p2m_access_##ac
+        ACCESS(n),
+        ACCESS(r),
+        ACCESS(w),
+        ACCESS(rw),
+        ACCESS(x),
+        ACCESS(rx),
+        ACCESS(wx),
+        ACCESS(rwx),
+        ACCESS(rx2rw),
+        ACCESS(n2rwx),
+        ACCESS(r_pw),
+#undef ACCESS
+    };
+
+    switch ( xaccess )
+    {
+    case 0 ... ARRAY_SIZE(memaccess) - 1:
+        xaccess = array_index_nospec(xaccess, ARRAY_SIZE(memaccess));
+        *paccess = memaccess[xaccess];
+        break;
+
+    case XENMEM_access_default:
+        *paccess = p2m->default_access;
+        break;
+
+    default:
+        return false;
+    }
+
+    return true;
+}
+#endif /* VM_EVENT || ALTP2M */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4de651038d..8e7d9ea2e3 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -73,11 +73,6 @@ typedef enum {
     /* NOTE: Assumed to be only 4 bits right now on x86. */
 } p2m_access_t;
 
-struct p2m_domain;
-bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
-                                 xenmem_access_t xaccess,
-                                 p2m_access_t *paccess);
-
 /*
  * Set access type for a region of gfns.
  * If gfn == INVALID_GFN, sets the default access type.
diff --git a/xen/include/xen/p2m-common.h b/xen/include/xen/p2m-common.h
index f0bd9a6b98..bd4169caee 100644
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -43,5 +43,8 @@ int __must_check check_get_page_from_gfn(struct domain *d, gfn_t gfn,
                                          bool readonly, p2m_type_t *p2mt_p,
                                          struct page_info **page_p);
 
+bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
+                                 xenmem_access_t xaccess,
+                                 p2m_access_t *paccess);
 
 #endif /* _XEN_P2M_COMMON_H */
-- 
2.34.1


