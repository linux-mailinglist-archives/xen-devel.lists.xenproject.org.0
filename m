Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0FA8792A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949114.1345744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERi-000078-G9; Mon, 14 Apr 2025 07:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949114.1345744; Mon, 14 Apr 2025 07:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERi-0008WP-CI; Mon, 14 Apr 2025 07:41:34 +0000
Received: by outflank-mailman (input) for mailman id 949114;
 Mon, 14 Apr 2025 07:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERg-0008Gw-Tc
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2417::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e122d48c-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:30 +0200 (CEST)
Received: from CH0P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::8)
 by SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 07:41:26 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::c8) by CH0P221CA0027.outlook.office365.com
 (2603:10b6:610:11d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 07:41:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:24 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:21 -0500
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
X-Inumbo-ID: e122d48c-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBFTu1gird7mucKYLZlyFSMj/3xWTaeTDuhq4Lh79E8fOiYrJ5Z0kXD0NgT6fpx1MDd6Tyt8MGwpkiNMQYmQM5a9ihRg0jZf/OAjrBqI3JE5Cy8V3TWtXsR0cNlG0JgQmThl3GkHz8iMlJD++4PxK8Vs5D+46vn2jAitYdHgW19YKiPTcqpT1UDanB9S/MmVrh2YTkj+K9wmT5/mMW1tR+20WDqeKNzRTltQNnbsvx5EJCCNTJ2I7LNbN2/R6yEFe2Ks7RiC93Rwi4Y6M/oxUDoVs9nneqHafMDcCPdp5VYOm+EpN0jatFV2BV2Yu6PLzrMdXaskU/PKVrH8ABd9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArA15AsxDcV53pi24NZHesBDb6FJeO7+vzxGj359L/E=;
 b=PxU4mkUMjTz8GNvckSzuBjH7sTG4uYUkLNHo+X6TDKK+DuPpdPnrg4r8aUHhNj10/VjDny6KfwGyvSXauRXWeNtcotTcHHdcKHnZXc0gA7+f8lCgfi5EXiN0JzJvhARFGrf00PuI+HH6EB9Yr9m0vHlSIGpxvP4y6kX9+Q2Fa52bvU7rn1zWakAeC2eOi3KJy6KQH6rgKnEBCw72MsoxSgSWFtBSjNsDv0I0Bd7b4qbb0QdydKAovm7rvaI6qreoEmOFYZUgfbBGDVGzVL//VARLAGwcdba7GuHeO3OEPT7COq15LRi6MahfPibG9EZF4SzqVZDrPj5sx0GV0hWYRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArA15AsxDcV53pi24NZHesBDb6FJeO7+vzxGj359L/E=;
 b=jRVf7wOJqF7BAIQKot63gKVH4FnI/jwGSsavG+ovLLfqACSVCvPgk76I8nW6Zgx2hY9Z2m7nUYkS8d4y8GnAkf92VY9wS+kN790CXN9XUAizv1DrjxA5jgxoQsOvy3+ji3t1Z2gspIOwyYGsboIYdnji+EAXk7ydEx1emYQkhy4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 02/15] xen/cpufreq: extract _PSD info from "struct xen_processor_performance"
Date: Mon, 14 Apr 2025 15:40:43 +0800
Message-ID: <20250414074056.3696888-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bc6bbe-8690-4de2-4036-08dd7b27c23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wE8ePRmw3NcLeTFuWkizkbwJycqll9CRPHOR++WHUf2xwF//NaVdEAs83oer?=
 =?us-ascii?Q?gmj7zeGclLuVvh7Vj3Y/UbX7XRHj4xvB2bQquxk+npzdP008nprmM7srFX8v?=
 =?us-ascii?Q?/YyancdnNnw18Dnz4RPI75HYKW5fLgGO9gJgYgfeOmX3Ftqll1Vw2Cl6nP6z?=
 =?us-ascii?Q?0h69u0XAH1Ldu4b65npe760Nxg70ZRT/hCWddqww6yXZDNTYbCDkvN6bxogA?=
 =?us-ascii?Q?iR1EJW6MOV6ql4bVGe4kNFAciQ2V6rp1Q5rPNDn2zwFHmGjZyo3Y3xcyK2Lv?=
 =?us-ascii?Q?IFVob2pc7ggBbtDB3Zfye+BqXKT9iX96P+YA4681jsvk9E3N25j4CEzpMaq4?=
 =?us-ascii?Q?2M8N9WhVqccJceVA5OLLCjDkX8pLew/+bPlSFbykNlhwFggXbSCimZ/aKTw/?=
 =?us-ascii?Q?A6QlPN5/rGCzvc3Jy3TGGdV1P9RZ6zWkkYOFbyxFi/FQ0y/ftUlWs9fEwJkZ?=
 =?us-ascii?Q?+ooA0BxHjzlwm3SI69QMwY/fNzi5OJmUK2CtkVPQ5KA/aEZazyA+3m4oi/2s?=
 =?us-ascii?Q?Ag2HISE2eYki6mLA/gSUhRjYUqIEsGk8qxMjhKQbeWv6zwFrsn2yfa3qOtxL?=
 =?us-ascii?Q?vKwG+skMPsbMQY/vHbj40cFBZhUrcmYNb5JmIAD0sL7hgLxjBypyTcCe/nlz?=
 =?us-ascii?Q?6YhOVHfslB5FBTV0p9x9DnUVJkQM/owBTm8YoTio4w+3DfvlhFQ22dqJXAvV?=
 =?us-ascii?Q?F+T7+8ar8gpBlm5lRTeSX8vFkchpDXo6yM/VrZVwBY9CtPme4y5xSiaRJpyb?=
 =?us-ascii?Q?5PysouGgPuQ3qkWHSfYiNbYZt2rvfANDYgzTeH6QUXwtTrOxwHzw3owjQw82?=
 =?us-ascii?Q?V8BGJbZop+qWt+EGBitXQkFTY/ajyzrgr8aUPztJqvAhEMo8rPBaU+qSQSYY?=
 =?us-ascii?Q?CRlfW1VRbhdqk7/R2CufSoCSjgqRGC8trU1x/kqIiWy+lbboa4kIPuqar9X3?=
 =?us-ascii?Q?8rFHkr0VICUfu8FqkGhK8FVv0TSxN8OuOEuMoNUwR5SA0mDIBRa4dR4M48g9?=
 =?us-ascii?Q?b+vtoIYm0C+4+OHKgQMqmlW4Fddj17vhx0HuVKK/iwZokZKKXeRG7LA3JeN2?=
 =?us-ascii?Q?XdXsNQvqwqJCa/4B5Qm2w60L+7NqODf55gUC126r4LsngF6Mmtfoeuc6Xnmx?=
 =?us-ascii?Q?2PqaCX0Jx4mHXpQFLlnSzpHqStyIM7rtJQsf2zUOd7X4LNklb91oNqyjxBea?=
 =?us-ascii?Q?/soOPQf5ZRnG1tAAtFtrKaQynpeEGNDsn/dwkxUfv3QWsXfDBaSoRDhlT539?=
 =?us-ascii?Q?IVOsYwLRNMcjae0FVGQHb9GtvmgJr/R2UGXtFuwMe+VfejiH292q+chCRcLG?=
 =?us-ascii?Q?56XQfLBPVocw0OEx7RrXgdcyfNUmtYKwJq9EMHkeDgtgjtYFwbKWzVF/uxj4?=
 =?us-ascii?Q?wJ5OmNYr97JoNHXrxWWpaPe/hbw8iVuJcVP0aQ4IvP4H/TnLhWSz5kV/n49c?=
 =?us-ascii?Q?QpjJseYHehcE0avJM8Tc6CPczvGaCZcwNUNbrx+mvABFqBjb8TuN60srehA1?=
 =?us-ascii?Q?xeefLZ/VxRMG/urW8jA716djgkIiH/q2p2V6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:24.8457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bc6bbe-8690-4de2-4036-08dd7b27c23b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092

Since we need to re-use _PSD info, containing "shared_type" and
"struct xen_psd_package", for CPPC mode, we move all
"#define XEN_CPUPERF_SHARED_TYPE_xxx" up as common values, and introduce
a new helper check_psd_pminfo() to wrap _PSD info check.

In cpufreq_add/del_cpu(), a new helper get_psd_info() is introduced to
extract "shared_type" and "struct xen_psd_package" from
"struct xen_processor_performance", and a few indentation get fixed at
the same time.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 xen/drivers/cpufreq/cpufreq.c | 107 ++++++++++++++++++++++++----------
 xen/include/public/platform.h |  10 ++--
 2 files changed, 82 insertions(+), 35 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index b01ed8e294..b020ccbcf7 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -191,9 +191,31 @@ int cpufreq_limit_change(unsigned int cpu)
     return __cpufreq_set_policy(data, &policy);
 }
 
-int cpufreq_add_cpu(unsigned int cpu)
+static int get_psd_info(uint32_t init, unsigned int cpu,
+                        uint32_t *shared_type,
+                        struct xen_psd_package *domain_info)
 {
     int ret = 0;
+
+    switch ( init )
+    {
+    case XEN_PX_INIT:
+        if ( shared_type )
+            *shared_type = processor_pminfo[cpu]->perf.shared_type;
+        if ( domain_info )
+            *domain_info = processor_pminfo[cpu]->perf.domain_info;
+        break;
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
@@ -201,14 +223,13 @@ int cpufreq_add_cpu(unsigned int cpu)
     struct cpufreq_dom *cpufreq_dom = NULL;
     struct cpufreq_policy new_policy;
     struct cpufreq_policy *policy;
-    struct processor_performance *perf;
+    struct xen_psd_package domain_info;
+    uint32_t shared_type;
 
     /* to protect the case when Px was not controlled by xen */
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    perf = &processor_pminfo[cpu]->perf;
-
     if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
         return -EINVAL;
 
@@ -218,10 +239,15 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (per_cpu(cpufreq_cpu_policy, cpu))
         return 0;
 
-    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
+    ret = get_psd_info(processor_pminfo[cpu]->init, cpu,
+                       &shared_type, &domain_info);
+    if ( ret )
+        return ret;
+
+    if ( shared_type == CPUFREQ_SHARED_TYPE_HW )
         hw_all = 1;
 
-    dom = perf->domain_info.domain;
+    dom = domain_info.domain;
 
     list_for_each(pos, &cpufreq_dom_list_head) {
         cpufreq_dom = list_entry(pos, struct cpufreq_dom, node);
@@ -244,20 +270,27 @@ int cpufreq_add_cpu(unsigned int cpu)
         cpufreq_dom->dom = dom;
         list_add(&cpufreq_dom->node, &cpufreq_dom_list_head);
     } else {
+        uint32_t firstcpu_shared_type;
+        struct xen_psd_package firstcpu_domain_info;
+
         /* domain sanity check under whatever coordination type */
         firstcpu = cpumask_first(cpufreq_dom->map);
-        if ((perf->domain_info.coord_type !=
-            processor_pminfo[firstcpu]->perf.domain_info.coord_type) ||
-            (perf->domain_info.num_processors !=
-            processor_pminfo[firstcpu]->perf.domain_info.num_processors)) {
-
+        ret = get_psd_info(processor_pminfo[firstcpu]->init, firstcpu,
+                           &firstcpu_shared_type, &firstcpu_domain_info);
+        if ( ret )
+            return ret;
+
+        if ( (domain_info.coord_type != firstcpu_domain_info.coord_type) ||
+             (domain_info.num_processors !=
+              firstcpu_domain_info.num_processors) )
+        {
             printk(KERN_WARNING "cpufreq fail to add CPU%d:"
                    "incorrect _PSD(%"PRIu64":%"PRIu64"), "
                    "expect(%"PRIu64"/%"PRIu64")\n",
-                   cpu, perf->domain_info.coord_type,
-                   perf->domain_info.num_processors,
-                   processor_pminfo[firstcpu]->perf.domain_info.coord_type,
-                   processor_pminfo[firstcpu]->perf.domain_info.num_processors
+                   cpu, domain_info.coord_type,
+                   domain_info.num_processors,
+                   firstcpu_domain_info.coord_type,
+                   firstcpu_domain_info.num_processors
                 );
             return -EINVAL;
         }
@@ -304,8 +337,9 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (ret)
         goto err1;
 
-    if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
-                   perf->domain_info.num_processors)) {
+    if ( hw_all || (cpumask_weight(cpufreq_dom->map) ==
+                    domain_info.num_processors) )
+    {
         memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
         policy->governor = NULL;
 
@@ -354,29 +388,34 @@ err0:
 
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
+    struct xen_psd_package domain_info;
 
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
+    ret = get_psd_info(processor_pminfo[cpu]->init, cpu,
+                       &shared_type, &domain_info);
+    if ( ret )
+        return ret;
+
+    if ( shared_type == CPUFREQ_SHARED_TYPE_HW )
         hw_all = 1;
 
-    dom = perf->domain_info.domain;
+    dom = domain_info.domain;
     policy = per_cpu(cpufreq_cpu_policy, cpu);
 
     list_for_each(pos, &cpufreq_dom_list_head) {
@@ -392,8 +431,8 @@ int cpufreq_del_cpu(unsigned int cpu)
 
     /* for HW_ALL, stop gov for each core of the _PSD domain */
     /* for SW_ALL & SW_ANY, stop gov for the 1st core of the _PSD domain */
-    if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
-                   perf->domain_info.num_processors))
+    if ( hw_all || (cpumask_weight(cpufreq_dom->map) ==
+                    domain_info.num_processors) )
         __cpufreq_governor(policy, CPUFREQ_GOV_STOP);
 
     cpufreq_statistic_exit(cpu);
@@ -458,6 +497,17 @@ static void print_PPC(unsigned int platform_limit)
     printk("\t_PPC: %d\n", platform_limit);
 }
 
+static int check_psd_pminfo(const struct xen_processor_performance *perf)
+{
+    /* check domain coordination */
+    if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
+         perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
+         perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
+        return -EINVAL;
+
+    return 0;
+}
+
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 {
     int ret = 0, cpu;
@@ -539,14 +589,9 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 
     if ( perf->flags & XEN_PX_PSD )
     {
-        /* check domain coordination */
-        if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
-             perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
-             perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
-        {
-            ret = -EINVAL;
+        ret = check_psd_pminfo(perf);
+        if ( ret )
             goto out;
-        }
 
         pxpt->shared_type = perf->shared_type;
         memcpy(&pxpt->domain_info, &perf->domain_info,
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 2725b8d104..67cf5eeabd 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -440,6 +440,11 @@ struct xen_psd_package {
     uint64_t num_processors;
 };
 
+/* Coordination type value */
+#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
+#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
+#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
+
 struct xen_processor_performance {
     uint32_t flags;     /* flag for Px sub info type */
     uint32_t platform_limit;  /* Platform limitation on freq usage */
@@ -449,10 +454,7 @@ struct xen_processor_performance {
     XEN_GUEST_HANDLE(xen_processor_px_t) states;
     struct xen_psd_package domain_info;
     /* Coordination type of this processor */
-#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
-#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
-#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
-    uint32_t shared_type;
+    uint32_t shared_type; /* XEN_CPUPERF_SHARED_TYPE_xxx */
 };
 typedef struct xen_processor_performance xen_processor_performance_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
-- 
2.34.1


