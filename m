Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CF9AC4AA7
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997944.1378754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzz-0003N6-7L; Tue, 27 May 2025 08:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997944.1378754; Tue, 27 May 2025 08:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzz-0003HT-10; Tue, 27 May 2025 08:49:27 +0000
Received: by outflank-mailman (input) for mailman id 997944;
 Tue, 27 May 2025 08:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJpzx-00031E-M4
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2418::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c02f8df-3ad7-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:49:23 +0200 (CEST)
Received: from MW4PR04CA0177.namprd04.prod.outlook.com (2603:10b6:303:85::32)
 by PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 08:49:16 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::d9) by MW4PR04CA0177.outlook.office365.com
 (2603:10b6:303:85::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 27 May 2025 08:49:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:12 -0500
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
X-Inumbo-ID: 7c02f8df-3ad7-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCG2C4Bp7gqVUeII16p7l9MRN65Vyg95KVcVdTfuIC46Grbh/Ols386RnS71jm4hKiqQlqzLVdxkxyrgm33bpLB4NqWPHAJ+ABKQPLQuxzjLZLC1eRuo9tQeBhUIIxDNnBXPOKGx9UxGgwnHk2u2hnNTnErW2XH/PKVdQSkFwprDa39Dp1aPbCMXIimVXMG6PZNZqtAydP0oKxKdrVdxKVsnbyhpoXuultnzDFsOgLekq5Y1RQsULq5nzIcdZin3esWnuQ7DiPG/11M062L652qqQqOyLw5obz5+dm28d/JYfUn+j/9Vjdv10ctT5VtpTT0vnZuYT908+LxlmFtb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4m9MyBy1xfClJaMl4Tf2AJuBzOa30FJWa7hBBPvoTo=;
 b=u0QyNsvVTBbQwVnquXp2D0i9fljA/+7NMpZhx9HH8phlnHbVeqKTQhd2p1RX8w/ltXJdoKY/+ABQVvuVXrAqHIQYwrfm1ZllIdkQ7NbtkxN3WwGyUmf45opBfe2fGdm1Lb9spcz9NxksN9bYpBLjnAcYu3aMYwtVwCU6ww/BsrkX23eQmwfk3sbHFd+xUf6fnOg+ehSf1VWqLD0r5Fd5MHLvFRaPfNOVvdPMmABpuJtscNZ8iZzDGjf+YBmF48neyXL19tnv2BlIwcbGVT9hJ6IjVDEOtpyaPWkXnI0TxNAIkOQ3Vq+st7S2BLjTFHZfK3j2IfyT8ndWYloPgDXWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4m9MyBy1xfClJaMl4Tf2AJuBzOa30FJWa7hBBPvoTo=;
 b=tOY2/r9mbe22cU5cUDWjaEOV4slyYU00KBqJChQXuzDuFr9pBz1R5S16+FAbknnMV99s3TOTb6L7xIOxCsadcicB8k2hOy79fXJkBJv1h8PX1yXhRlUpY+V0Kx4tAKtU/cWA0Y3xaIKkzjatZk4/zWBnihjd+egjqeqTLEKGf7Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct xen_processor_performance"
Date: Tue, 27 May 2025 16:48:18 +0800
Message-ID: <20250527084833.338427-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|PH0PR12MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f459e77-b13c-45de-f145-08dd9cfb5c67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m2p9VgpfY6RUQzZGqRdRJKY2TfFV55f5LcdIP7Zhm8TFhjfGLoeSNRngv9NN?=
 =?us-ascii?Q?u9FBwiqnufte5I98HK+lEnLPZ8VTKTJE+JcpxHOKAFCb4oW8pibLIVuomtMa?=
 =?us-ascii?Q?nrzVeJZ9wOVEXX4YNbMWt2vTndsSe/L46GJsHUZtd+HBPhiTUrShToBz8ssf?=
 =?us-ascii?Q?NXofj6WhJTucIpYW2iOjupv7iHkGXfCuwHDf2yY1aCC7S2o1mGOStpeoDYYM?=
 =?us-ascii?Q?HKBkJiKcAV99P1wdj9EXhMr2smIn1UWqnNiF0F2ps7TPE3B7rfps1Hq5O68u?=
 =?us-ascii?Q?ppjVRURvqUhQqmjFGp4QJnq/vxE+GQgvBLOxrkS3+Yt8PUKSvAEAvsEBf6BH?=
 =?us-ascii?Q?Ndq20gS9NSQbmPDUYe8vkgQhWE1YYARiZWi5+EAN085EhQ5EISivAIYUjjDK?=
 =?us-ascii?Q?399D6fCuwzOOTsIHH3ATsgzFDaWbtAOf37UwFP02VHH1pUpcSk6kQgeyhOxC?=
 =?us-ascii?Q?PSfHgJGLxfWrsUo2uwCwjEBrBYLvwGqbigD/GulExveF9cIut2PKmYr91PIW?=
 =?us-ascii?Q?vMU3EjotFt/OQv8ow5da0N+OJUsdPYa0Heg9RXM+R9eAzJcA47bjo3A3h3hh?=
 =?us-ascii?Q?oOs+Vtq+oYXqwmWMxRX66S4e9+HSHcOvTSYbYBnnuoA0aFTyuzUM1tsi1wG0?=
 =?us-ascii?Q?uvxHQIcibTStHHpGinUTbd9lsa6IaETrBLz2CF4ww8gW1Uzy3PyvvY1cSk4b?=
 =?us-ascii?Q?QIRDryl/HnNwoxQxHyaIdlZd8XRemMikJb4Fxlss42s7m4R4kPrZCJ1oYm59?=
 =?us-ascii?Q?zRwEbRm0lfEniV7ofT6T8m+5IVhwEeC0Butu1bY1CEwu8IooDl3QIbCxPsJm?=
 =?us-ascii?Q?FBpQymnzn2ar/uBu13X3wszxg9uC+FdkoJFEyI8Mtzrmg1QMzxJXqg06/jJN?=
 =?us-ascii?Q?VJIAKMvgLVbyYQ1XlAX11RPmp9MeElXWGL0T1izWdCCo9gZEwcAQMyn2VRy4?=
 =?us-ascii?Q?Gk3CvI52XORqaohMSkcWwZagz3ysuNRuIMjM1MVXK7pfTW84p5QP/EJLzP+F?=
 =?us-ascii?Q?b0GP75uvmRhO6JvxX7IzMEohZgaq3wFIZIRFr75u6UQH/CQJiOvs981CTNHx?=
 =?us-ascii?Q?hBJJ30Iy/5CfSVtfyHlFsWHJaA0Dqd+1Tx56QPFna3oL4ElwLYjTx4ToQL9+?=
 =?us-ascii?Q?JHNRz1QhyLvBVILL2uq5UT6hP0GKmOkYhOFzlNvnJAkxh9xT1nyTkN1A0s3x?=
 =?us-ascii?Q?+cOU6oa6w23pNdI6J+3ZzVa3XmlELX6w1yvFweCxH7+PRlnRosKCoNqR4RAt?=
 =?us-ascii?Q?QANYpEJjsw+C4gvqnn2BbZjdZaVNyPIT1UDWvhDJwVHMhQeu3IHSeMih8fod?=
 =?us-ascii?Q?maROHB5BXVUlTtt04AhoCkPiMvsro9XjFzKBuEbXDvKQJyqGBTQEWt1QkJnB?=
 =?us-ascii?Q?qkuZLSOjM6VkpvqvxE2n2CAYvvDXpDhHkHc47xQZLyuB7t1aAsx8oYaeYTl1?=
 =?us-ascii?Q?nsTIL3Y6WX122OxQVIVj+/Q/KHSo6sTCWrXAe+rBzCS1c1swIFuSDzvXQZ5H?=
 =?us-ascii?Q?B85Y1p1nK4rgjY7Allq4IrOp6KEr+rIEtAKQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:15.6264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f459e77-b13c-45de-f145-08dd9cfb5c67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7907

_PSD info, consisted of "shared_type" and "struct xen_psd_package", will not
only be provided from px-specific "struct xen_processor_performance", but also
in CPPC data.

In cpufreq_add/del_cpu(), a new helper get_psd_info() is introduced to
extract common _PSD info from px-specific "struct xen_processor_performance",
in the meantime, the following style corrections get applied at the same time:
- add extra space before and after bracket of if()
- remove redundant parenthesis
- no need to put brace for printk() at a seperate line

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
v4 -> v5:
- let check_psd_pminfo() pass in "uint32_t shared_type"
- replace unnessary parameter "uint32_t init" with processor_pminfo[cpu]->init
- replace structure copy with const pointer delivery through
  "const struct xen_psd_package **"
- blank line between non-fall-through switch-case blocks
- remove unnessary "define XEN_CPUPERF_SHARED_TYPE_xxx" movement
---
 xen/drivers/cpufreq/cpufreq.c | 111 ++++++++++++++++++++++++----------
 1 file changed, 79 insertions(+), 32 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 08d027317c..9567221d97 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -191,9 +191,29 @@ int cpufreq_limit_change(unsigned int cpu)
     return __cpufreq_set_policy(data, &policy);
 }
 
-int cpufreq_add_cpu(unsigned int cpu)
+static int get_psd_info(unsigned int cpu, uint32_t *shared_type,
+                        const struct xen_psd_package **domain_info_ptr)
 {
     int ret = 0;
+
+    switch ( processor_pminfo[cpu]->init )
+    {
+    case XEN_PX_INIT:
+        *shared_type = processor_pminfo[cpu]->perf.shared_type;
+        *domain_info_ptr = &processor_pminfo[cpu]->perf.domain_info;
+        break;
+
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+int cpufreq_add_cpu(unsigned int cpu)
+{
+    int ret;
     unsigned int firstcpu;
     unsigned int dom, domexist = 0;
     unsigned int hw_all = 0;
@@ -201,14 +221,14 @@ int cpufreq_add_cpu(unsigned int cpu)
     struct cpufreq_dom *cpufreq_dom = NULL;
     struct cpufreq_policy new_policy;
     struct cpufreq_policy *policy;
-    struct processor_performance *perf;
+    const struct xen_psd_package *domain_info;
+    const struct xen_psd_package **domain_info_ptr = &domain_info;
+    uint32_t shared_type;
 
     /* to protect the case when Px was not controlled by xen */
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    perf = &processor_pminfo[cpu]->perf;
-
     if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
         return -EINVAL;
 
@@ -218,10 +238,15 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (per_cpu(cpufreq_cpu_policy, cpu))
         return 0;
 
-    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
+    ret = get_psd_info(cpu, &shared_type, domain_info_ptr);
+    if ( ret )
+        return ret;
+    domain_info = *domain_info_ptr;
+
+    if ( shared_type == CPUFREQ_SHARED_TYPE_HW )
         hw_all = 1;
 
-    dom = perf->domain_info.domain;
+    dom = domain_info->domain;
 
     list_for_each(pos, &cpufreq_dom_list_head) {
         cpufreq_dom = list_entry(pos, struct cpufreq_dom, node);
@@ -244,21 +269,30 @@ int cpufreq_add_cpu(unsigned int cpu)
         cpufreq_dom->dom = dom;
         list_add(&cpufreq_dom->node, &cpufreq_dom_list_head);
     } else {
+        uint32_t firstcpu_shared_type;
+        const struct xen_psd_package *firstcpu_domain_info;
+        const struct xen_psd_package **firstcpu_domain_info_ptr =
+                                                        &firstcpu_domain_info;
+
         /* domain sanity check under whatever coordination type */
         firstcpu = cpumask_first(cpufreq_dom->map);
-        if ((perf->domain_info.coord_type !=
-            processor_pminfo[firstcpu]->perf.domain_info.coord_type) ||
-            (perf->domain_info.num_processors !=
-            processor_pminfo[firstcpu]->perf.domain_info.num_processors)) {
-
+        ret = get_psd_info(firstcpu, &firstcpu_shared_type,
+                           firstcpu_domain_info_ptr);
+        if ( ret )
+            return ret;
+        firstcpu_domain_info = *firstcpu_domain_info_ptr;
+
+        if ( domain_info->coord_type != firstcpu_domain_info->coord_type ||
+             domain_info->num_processors !=
+             firstcpu_domain_info->num_processors )
+        {
             printk(KERN_WARNING "cpufreq fail to add CPU%d:"
                    "incorrect _PSD(%"PRIu64":%"PRIu64"), "
                    "expect(%"PRIu64"/%"PRIu64")\n",
-                   cpu, perf->domain_info.coord_type,
-                   perf->domain_info.num_processors,
-                   processor_pminfo[firstcpu]->perf.domain_info.coord_type,
-                   processor_pminfo[firstcpu]->perf.domain_info.num_processors
-                );
+                   cpu, domain_info->coord_type,
+                   domain_info->num_processors,
+                   firstcpu_domain_info->coord_type,
+                   firstcpu_domain_info->num_processors);
             return -EINVAL;
         }
     }
@@ -304,8 +338,9 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (ret)
         goto err1;
 
-    if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
-                   perf->domain_info.num_processors)) {
+    if ( hw_all || cpumask_weight(cpufreq_dom->map) ==
+                   domain_info->num_processors )
+    {
         memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
 
         /*
@@ -360,29 +395,35 @@ err0:
 
 int cpufreq_del_cpu(unsigned int cpu)
 {
+    int ret;
     unsigned int dom, domexist = 0;
     unsigned int hw_all = 0;
     struct list_head *pos;
     struct cpufreq_dom *cpufreq_dom = NULL;
     struct cpufreq_policy *policy;
-    struct processor_performance *perf;
+    uint32_t shared_type;
+    const struct xen_psd_package *domain_info;
+    const struct xen_psd_package **domain_info_ptr = &domain_info;
 
     /* to protect the case when Px was not controlled by xen */
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    perf = &processor_pminfo[cpu]->perf;
-
     if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
         return 0;
 
-    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
+    ret = get_psd_info(cpu, &shared_type, domain_info_ptr);
+    if ( ret )
+        return ret;
+    domain_info = *domain_info_ptr;
+
+    if ( shared_type == CPUFREQ_SHARED_TYPE_HW )
         hw_all = 1;
 
-    dom = perf->domain_info.domain;
+    dom = domain_info->domain;
     policy = per_cpu(cpufreq_cpu_policy, cpu);
 
     list_for_each(pos, &cpufreq_dom_list_head) {
@@ -398,8 +439,8 @@ int cpufreq_del_cpu(unsigned int cpu)
 
     /* for HW_ALL, stop gov for each core of the _PSD domain */
     /* for SW_ALL & SW_ANY, stop gov for the 1st core of the _PSD domain */
-    if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
-                   perf->domain_info.num_processors))
+    if ( hw_all || cpumask_weight(cpufreq_dom->map) ==
+                   domain_info->num_processors )
         __cpufreq_governor(policy, CPUFREQ_GOV_STOP);
 
     cpufreq_statistic_exit(cpu);
@@ -464,6 +505,17 @@ static void print_PPC(unsigned int platform_limit)
     printk("\t_PPC: %d\n", platform_limit);
 }
 
+static int check_psd_pminfo(uint32_t shared_type)
+{
+    /* check domain coordination */
+    if ( shared_type != CPUFREQ_SHARED_TYPE_ALL &&
+         shared_type != CPUFREQ_SHARED_TYPE_ANY &&
+         shared_type != CPUFREQ_SHARED_TYPE_HW )
+        return -EINVAL;
+
+    return 0;
+}
+
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 {
     int ret = 0, cpu;
@@ -545,14 +597,9 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 
     if ( perf->flags & XEN_PX_PSD )
     {
-        /* check domain coordination */
-        if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
-             perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
-             perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
-        {
-            ret = -EINVAL;
+        ret = check_psd_pminfo(perf->shared_type);
+        if ( ret )
             goto out;
-        }
 
         pxpt->shared_type = perf->shared_type;
         memcpy(&pxpt->domain_info, &perf->domain_info,
-- 
2.34.1


