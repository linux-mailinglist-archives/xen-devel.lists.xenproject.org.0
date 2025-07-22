Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6542BB0D8C2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052396.1421116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfh-0005hM-Ne; Tue, 22 Jul 2025 12:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052396.1421116; Tue, 22 Jul 2025 12:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfh-0005cn-IY; Tue, 22 Jul 2025 12:00:37 +0000
Received: by outflank-mailman (input) for mailman id 1052396;
 Tue, 22 Jul 2025 12:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBff-0003QN-Bt
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:35 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:200a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 789289d7-66f3-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:00:33 +0200 (CEST)
Received: from BYAPR06CA0023.namprd06.prod.outlook.com (2603:10b6:a03:d4::36)
 by DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:00:21 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::7f) by BYAPR06CA0023.outlook.office365.com
 (2603:10b6:a03:d4::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:00:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:20 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:17 -0500
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
X-Inumbo-ID: 789289d7-66f3-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyyhxld95IcLC7csm5uaUhNgdx/fqOnnDGciVjS7Sq3wnEETcJIM0dwQwSq0yLdXrrNBDvh2imKF6jS38M1C1dmLoMrqaWh8N58jEcJ0REnxJre2c9dgev++dmPTG/SxWpsTqk81QqkGG1Lt/XV2G5NXidBO2GNBybG6ZLCrkFW3tv5LqFyl0hOEs+C8OqPOHRkmk+/nmxjvQi2wflhHR8K5rvQ7u1ZifFNj2R7Giq9IpS3pR3MYX2t1e1H5g1W2/ePKiwkSwYINFYnJcDwkSGEYLoBniwBmLISc+itpeDtfuvAI4vrw8af6T1LElMxGEKm/ueojX9WY0NWo5aIvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LocC/foNVlnGShyoYG8dy8sI9AfpBYaIjmmvQ32jtM8=;
 b=L2A9escwolSazi9dkiKAZtcbmVsWgXecrYxh2Narh1LAEjpETpcsDJYZTosNKxvJUmaj4Phf4ddV3ZWfVgJCMTsWp/DUiwJkT+aloR4d1Ki7EUZlAwDMrHiLaLWCbv4AXRdP0crpKruN4Bl0QP/onqmJ06FnMo1Hx9hnNZR/DMoQwWZmj7pTT5vKgE7XTxDi324TM2hJaxAOCDj0DYyCPF4HqOxjC2XbtRGYW+q0DWzEi+YBVjt7gXSSyDpybJaZV5CDu4RCz0HJUhUbWBBPFYsPdR0P+Sm4cfD/caztVyCZ2wShprqOrXbJOkISQubsnZu7WktWomXIs99j8kV5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LocC/foNVlnGShyoYG8dy8sI9AfpBYaIjmmvQ32jtM8=;
 b=gw9tYmR12RGYVA6xHvXL/48UWG8mOX/UzeCm9Bxzn9OBZr1wlZa3FaFSIV4JiCM05/pmJmmj2AVtrZ3UMhm/dmEow8A88CIcrem6FFXIjtfNfkDmVXwOx601lfgasvGz/WcJayAJDLZ6259T0iTQWUpEV86urebdwyJ2NJ6Y6Io=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 05/10] dom0less: Introduce kernel_info into the domain creation loop
Date: Tue, 22 Jul 2025 13:59:45 +0200
Message-ID: <20250722115955.57167-6-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|DS0PR12MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 4691801a-e936-4d37-8677-08ddc91754d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nHVZT/GQlJuj5td8NkRTWOq5j/jXc4IqncKpuoxlJcaxSydO0wH/2C/q7r/L?=
 =?us-ascii?Q?h/Is15D5/KHnmAUeF8svX7CM1gJ190uEyThbqELco27weRN7YEh9vjNv54k+?=
 =?us-ascii?Q?iI+e5/0zltpdL3caZJC8GXhposI8LUjz0o02Tg78vHxgOJ01Be5tHxbvMpKm?=
 =?us-ascii?Q?ddcWTDa+yhKIf2fPGCnEUVcv0XNYDpT4AiEy1WszHlb2Z1nTuZcf0TeQA+HO?=
 =?us-ascii?Q?r8NKcom+X89nFZC8e+miRehBtti5tbGWt2QnLBNLwUjuxS36RHWc0zWPeUQL?=
 =?us-ascii?Q?pukq+IbWECbZpXnmrpSV0IRdzSdYdqF5hhfEsUA9quZ89Ukv4Q4Tcm1B4oqC?=
 =?us-ascii?Q?yTvwKQA93K3KBi0x8g6T9LhVIurNn9tgG8hODZZYAyfdoQgedS2waG8qDu1q?=
 =?us-ascii?Q?hCxeEkTOxPWymC6H0dQltJyK9WQ6QikdSpoPNmwMgQYOfNckX7tIYCjCo+us?=
 =?us-ascii?Q?sULvk7zGbtgPZvcA6oXlPEmTRAZO9TmqjTLSkf8+w5lPPUvwyqqj5BDqyvER?=
 =?us-ascii?Q?Xgq9YTLrqlH7A0RD77AHOe+2BGiJVLrKZ52VuOPrUQ/+hHU4hbNre/wVu6qN?=
 =?us-ascii?Q?7MgqBP+dBfKf6fUgVOuHPcIHsOl3p3DQbn1XglHvsa2sHsfGSocp/K+jawB1?=
 =?us-ascii?Q?REpwwBJAO4LCN4B3AhOqs9Facj6CRRLXmXtOJLO1pO8lAcZRQ2Nyl7AEttYH?=
 =?us-ascii?Q?pLZQesgr/a3h0Zqy/HK4uu8PLRUGcTLm0qbLxMZ175h+8Jqh1HSZloxM5o/C?=
 =?us-ascii?Q?IrdOBDQFjlUpZQKmW4FWwT9Ly8AUlbCtgLKcVJvFlErDFc5W/XYo036Oim+D?=
 =?us-ascii?Q?n274ChKjk7kHp4ZwMLXeK7Icw/LVUGFBIru+ULHQSzqgnt1xpiSOlPI4KCLP?=
 =?us-ascii?Q?T10Le7i+Iv7rv3HniQME1btb0ACtKAAUc6AtPt4KBXEXBVpmBH5cWDjiyn3S?=
 =?us-ascii?Q?mcW7S+deiOphFSMvoctgl8PsOf+ma8Ky+1gAqq3HEBgkEl0mxmvynGRM+uql?=
 =?us-ascii?Q?4PE4s8dwyy4HpjE+dcRezhklpa4qw1BLVwm0Ft0/E4aX4YerRDgv8v0wyCLe?=
 =?us-ascii?Q?GSFZUNTckD06JEHoqxuW80QZEmRwvZtGnSG96Xs6l879S2DDIAkTmXI1xLc+?=
 =?us-ascii?Q?/VrIJ1sKfcVBxpZpAUxnUsd8NBA5Spt/pxKgyrBxvO85Zd8e1eVbIU8a0U8a?=
 =?us-ascii?Q?bFBxIK45X6lsihnaxLUyT/N1cU/uwEY/t3/LJkPLTrzuqHhzJISpH6OdJQoi?=
 =?us-ascii?Q?qdOXg3oLiNzSq2/K3UtqDR9ww66ee6HZqKXh0t/KYArlYtcWAiaoxQLd+DBi?=
 =?us-ascii?Q?6OosQSDdDzPvCsFImICt2EvuVsMs/If3Qk9VBnGZbpMejpGEimzanvMYV20y?=
 =?us-ascii?Q?z7TiDRPh8blHZ5adlK0CA22IUU1JUB8H9gf9U2SV2TamyA8V6xabBfP3UPNu?=
 =?us-ascii?Q?zsNozWeYM9ZMIxMwANHkAtCw9gU6oYaXSNR78XJyCyTyKw63WUgL8yumcKGE?=
 =?us-ascii?Q?3IFtjln0IGYwAO0nXxuGn60y644Aivj3WB1+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:20.0105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4691801a-e936-4d37-8677-08ddc91754d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7630

In later patches boot_domain becomes the common ground for the bindings
to drop the extracted information. In preparation for the bindings
themselves to be in a separate function, introduce kernel_info early in
the domain construction loop.

This simplifies a later diff, turning it into a strict cut-and-paste, rather
than a mutate-on-move.

Lines after domain_create() don't make use of the "d_cfg" and "flags"
variables because those will disappear when the bindings move to a
separate file.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/device-tree/dom0less-build.c | 109 ++++++++++++------------
 1 file changed, 54 insertions(+), 55 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index e49213e763..cee666786e 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -732,10 +732,10 @@ static inline int __init domain_p2m_set_allocation(
 }
 #endif /* CONFIG_ARCH_PAGING_MEMPOOL */
 
-static int __init construct_domU(struct domain *d,
+static int __init construct_domU(struct kernel_info *kinfo,
                           const struct dt_device_node *node)
 {
-    struct kernel_info kinfo = KERNEL_INFO_INIT;
+    struct domain *d = kinfo->bd.d;
     const char *dom0less_enhanced;
     int rc;
     u64 mem;
@@ -746,7 +746,7 @@ static int __init construct_domU(struct domain *d,
         printk("Error building DomU: cannot read \"memory\" property\n");
         return -EINVAL;
     }
-    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
+    kinfo->unassigned_mem = (paddr_t)mem * SZ_1K;
 
     rc = domain_p2m_set_allocation(d, mem, node);
     if ( rc != 0 )
@@ -761,66 +761,64 @@ static int __init construct_domU(struct domain *d,
          (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
     {
         need_xenstore = true;
-        kinfo.dom0less_feature = DOM0LESS_ENHANCED;
+        kinfo->dom0less_feature = DOM0LESS_ENHANCED;
     }
     else if ( rc == 0 && !strcmp(dom0less_enhanced, "legacy") )
     {
         need_xenstore = true;
-        kinfo.dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
+        kinfo->dom0less_feature = DOM0LESS_ENHANCED_LEGACY;
     }
     else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
-        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
+        kinfo->dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
 
     if ( vcpu_create(d, 0) == NULL )
         return -ENOMEM;
 
     d->max_pages = ((paddr_t)mem * SZ_1K) >> PAGE_SHIFT;
 
-    kinfo.bd.d = d;
-
-    rc = kernel_probe(&kinfo, node);
+    rc = kernel_probe(kinfo, node);
     if ( rc < 0 )
         return rc;
 
-    set_domain_type(d, &kinfo);
+    set_domain_type(d, kinfo);
 
     if ( is_hardware_domain(d) )
     {
-        rc = construct_hwdom(&kinfo, node);
+        rc = construct_hwdom(kinfo, node);
         if ( rc < 0 )
             return rc;
     }
     else
     {
         if ( !dt_find_property(node, "xen,static-mem", NULL) )
-            allocate_memory(d, &kinfo);
+            allocate_memory(d, kinfo);
         else if ( !is_domain_direct_mapped(d) )
-            allocate_static_memory(d, &kinfo, node);
+            allocate_static_memory(d, kinfo, node);
         else
-            assign_static_memory_11(d, &kinfo, node);
+            assign_static_memory_11(d, kinfo, node);
 
-        rc = process_shm(d, &kinfo, node);
+        rc = process_shm(d, kinfo, node);
         if ( rc < 0 )
             return rc;
 
-        rc = init_vuart(d, &kinfo, node);
+        rc = init_vuart(d, kinfo, node);
         if ( rc < 0 )
             return rc;
 
-        rc = prepare_dtb_domU(d, &kinfo);
+        rc = prepare_dtb_domU(d, kinfo);
         if ( rc < 0 )
             return rc;
 
-        rc = construct_domain(d, &kinfo);
+        rc = construct_domain(d, kinfo);
         if ( rc < 0 )
             return rc;
     }
 
     domain_vcpu_affinity(d, node);
 
-    rc = alloc_xenstore_params(&kinfo);
+    rc = alloc_xenstore_params(kinfo);
 
-    rangeset_destroy(kinfo.xen_reg_assigned);
+    rangeset_destroy(kinfo->xen_reg_assigned);
 
     return rc;
 }
@@ -837,9 +835,9 @@ void __init create_domUs(void)
     dt_for_each_child_node(chosen, node)
     {
         const char *llc_colors_str = NULL;
-        struct domain *d;
-        struct xen_domctl_createdomain d_cfg = {0};
-        unsigned int flags = 0U;
+        struct kernel_info ki = KERNEL_INFO_INIT;
+        struct xen_domctl_createdomain *d_cfg = &ki.bd.create_cfg;
+        unsigned int *flags = &ki.bd.create_flags;
         bool has_dtb = false;
         uint32_t val;
         int rc;
@@ -850,10 +848,10 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        d_cfg.max_evtchn_port = 1023;
-        d_cfg.max_grant_frames = -1;
-        d_cfg.max_maptrack_frames = -1;
-        d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version);
+        d_cfg->max_evtchn_port = 1023;
+        d_cfg->max_grant_frames = -1;
+        d_cfg->max_maptrack_frames = -1;
+        d_cfg->grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version);
 
         if ( dt_property_read_u32(node, "capabilities", &val) )
         {
@@ -861,7 +859,7 @@ void __init create_domUs(void)
                 panic("Invalid capabilities (%"PRIx32")\n", val);
 
             if ( val & DOMAIN_CAPS_CONTROL )
-                flags |= CDF_privileged;
+                *flags |= CDF_privileged;
 
             if ( val & DOMAIN_CAPS_HARDWARE )
             {
@@ -870,17 +868,17 @@ void __init create_domUs(void)
                             hardware_domain);
 
 #ifdef CONFIG_GRANT_TABLE
-                d_cfg.max_grant_frames = gnttab_dom0_frames();
+                d_cfg->max_grant_frames = gnttab_dom0_frames();
 #endif
-                d_cfg.max_evtchn_port = -1;
-                flags |= CDF_hardware;
+                d_cfg->max_evtchn_port = -1;
+                *flags |= CDF_hardware;
                 iommu = true;
             }
 
             if ( val & DOMAIN_CAPS_XENSTORE )
             {
-                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
-                d_cfg.max_evtchn_port = -1;
+                d_cfg->flags |= XEN_DOMCTL_CDF_xs_domain;
+                d_cfg->max_evtchn_port = -1;
             }
         }
 
@@ -889,45 +887,45 @@ void __init create_domUs(void)
             if ( llc_coloring_enabled )
                 panic("LLC coloring and static memory are incompatible\n");
 
-            flags |= CDF_staticmem;
+            *flags |= CDF_staticmem;
         }
 
         if ( dt_property_read_bool(node, "direct-map") )
         {
-            if ( !(flags & CDF_staticmem) )
+            if ( !(*flags & CDF_staticmem) )
                 panic("direct-map is not valid for domain %s without static allocation.\n",
                       dt_node_name(node));
 
-            flags |= CDF_directmap;
+            *flags |= CDF_directmap;
         }
 
-        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
+        if ( !dt_property_read_u32(node, "cpus", &d_cfg->max_vcpus) )
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
         if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) )
         {
-            if ( flags & CDF_hardware )
+            if ( *flags & CDF_hardware )
                 panic("Don't specify passthrough for hardware domain\n");
 
             if ( !strcmp(dom0less_iommu, "enabled") )
                 iommu = true;
         }
 
-        if ( (flags & CDF_hardware) && !(flags & CDF_directmap) &&
+        if ( (*flags & CDF_hardware) && !(*flags & CDF_directmap) &&
              !iommu_enabled )
             panic("non-direct mapped hardware domain requires iommu\n");
 
         if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
         {
-            if ( flags & CDF_hardware )
+            if ( *flags & CDF_hardware )
                 panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
 
             has_dtb = true;
         }
 
         if ( iommu_enabled && (iommu || has_dtb) )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+            d_cfg->flags |= XEN_DOMCTL_CDF_iommu;
 
         /* Get the optional property domain-cpupool */
         cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
@@ -937,57 +935,58 @@ void __init create_domUs(void)
             if ( pool_id < 0 )
                 panic("Error getting cpupool id from domain-cpupool (%d)\n",
                       pool_id);
-            d_cfg.cpupool_id = pool_id;
+            d_cfg->cpupool_id = pool_id;
         }
 
         if ( dt_property_read_u32(node, "max_grant_version", &val) )
-            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+            d_cfg->grant_opts = XEN_DOMCTL_GRANT_version(val);
 
         if ( dt_property_read_u32(node, "max_grant_frames", &val) )
         {
             if ( val > INT32_MAX )
                 panic("max_grant_frames (%"PRIu32") overflow\n", val);
-            d_cfg.max_grant_frames = val;
+            d_cfg->max_grant_frames = val;
         }
 
         if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
         {
             if ( val > INT32_MAX )
                 panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
-            d_cfg.max_maptrack_frames = val;
+            d_cfg->max_maptrack_frames = val;
         }
 
         dt_property_read_string(node, "llc-colors", &llc_colors_str);
         if ( !llc_coloring_enabled && llc_colors_str )
             panic("'llc-colors' found, but LLC coloring is disabled\n");
 
-        arch_create_domUs(node, &d_cfg, flags);
+        arch_create_domUs(node, d_cfg, *flags);
 
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
          */
-        d = domain_create(++max_init_domid, &d_cfg, flags);
-        if ( IS_ERR(d) )
+        ki.bd.d = domain_create(++max_init_domid,
+                                &ki.bd.create_cfg, ki.bd.create_flags);
+        if ( IS_ERR(ki.bd.d) )
             panic("Error creating domain %s (rc = %ld)\n",
-                  dt_node_name(node), PTR_ERR(d));
+                  dt_node_name(node), PTR_ERR(ki.bd.d));
 
         if ( llc_coloring_enabled &&
-             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
+             (rc = domain_set_llc_colors_from_str(ki.bd.d, llc_colors_str)) )
             panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
 
-        d->is_console = true;
-        dt_device_set_used_by(node, d->domain_id);
+        ki.bd.d->is_console = true;
+        dt_device_set_used_by(node, ki.bd.d->domain_id);
 
-        rc = construct_domU(d, node);
+        rc = construct_domU(&ki, node);
         if ( rc )
             panic("Could not set up domain %s (rc = %d)\n",
                   dt_node_name(node), rc);
 
-        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
-            set_xs_domain(d);
+        if ( ki.bd.create_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
+            set_xs_domain(ki.bd.d);
     }
 
     if ( need_xenstore && xs_domid == DOMID_INVALID )
-- 
2.43.0


