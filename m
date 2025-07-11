Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB62B011C3
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040190.1411650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nY-0003mP-UV; Fri, 11 Jul 2025 03:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040190.1411650; Fri, 11 Jul 2025 03:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nY-0003kA-Oe; Fri, 11 Jul 2025 03:51:44 +0000
Received: by outflank-mailman (input) for mailman id 1040190;
 Fri, 11 Jul 2025 03:51:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nW-0002LK-D9
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:42 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20603.outbound.protection.outlook.com
 [2a01:111:f403:2405::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a04c2dd-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:51:41 +0200 (CEST)
Received: from SJ0PR03CA0122.namprd03.prod.outlook.com (2603:10b6:a03:33c::7)
 by PH7PR12MB9065.namprd12.prod.outlook.com (2603:10b6:510:1f7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 11 Jul
 2025 03:51:36 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::2a) by SJ0PR03CA0122.outlook.office365.com
 (2603:10b6:a03:33c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 03:51:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:33 -0500
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
X-Inumbo-ID: 5a04c2dd-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igbXQbu95ahE3jcITyHeVKlMo5qgGOIVIimp6CYGIaYd3+nGUcA4Db1HxAWwH/OFa8g1lsDSessFGUP0NBOo2Hu2+tLvqJmDw3BiUDnLmFMfbIeF5ntq29wM6+LJbAJoOW7huzJg04rgeYIqX7YdAU6zWvM7fl7ekR49JGaZ60fYikGbPSu6ymhWgA9Jw+4dSnabfokGTYxdF6liVHakbBjJ9fHmGGi5WXH1VW8FRmSFV6ZOMYocGa9VQ/7x9rt1xpWzz9a1cSyLyvaH2RaJOuGUePVv0DfMkcMmWZwux0eJr+5HQ5lSYruW6ElzuMYJ1S5qOYI9OX23PSBvID3LmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quQ3T5IvBlVz42cNV/i6n96IfGb1lLaw5U5J0cUdN88=;
 b=wFIyeMJxQCRx7y4m65RwI0BhOf+Xv87zFDvZ/KWcoLW96oEsjLCod0rlXiSsjxQOo7UiQQ/FaDhtgPUPkTU2PHv9BGjYQ1Pk4OffTbcau2C44WGx04pNDt7VvqrogNYru+0a6bf0xp9pqR+jG3kTuTS6/c3TjTrMMvXp45RExNdHAYr6A38z8n3Bq5LtJUXHsXs0EBtWIh2i4Q/evS41TBXnS7F4eQWwLzb4Z6EBoutL+mSFFAhVNAHud7zqiDWaw4w4h9OhbXv0b4z/FG3wSB/a9MtyDElTaik2SO73+vnoT8z6hb0GfCwkupJPLyjxRXYDA8ZoWd+7MPyWqiPGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quQ3T5IvBlVz42cNV/i6n96IfGb1lLaw5U5J0cUdN88=;
 b=5PLqrwyq60eiuGmwUS624JuOb7YakKgPzG7dO3/uSdBig1+4eRXU/e0FVDx5fAGp1VYaX3WvfgX07qfE8t2jSReXP1eDIPV0TUrYsAyGaBVmUAfnrgJQcoPVq7UsljRWVSffpoPxvaKKCOMmtzWudfLiKsuHnKygtWVclfM5YfE=
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
Subject: [PATCH v6 06/19] xen/cpufreq: make _PSD info common
Date: Fri, 11 Jul 2025 11:50:53 +0800
Message-ID: <20250711035106.2540522-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|PH7PR12MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: 6819686e-12a5-434c-f89e-08ddc02e3bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LTrprnHS64mTwjJBGDJ0vHYMlVPhR4k5gV4lHoxrJgBfms1HdO8wT6nuN43i?=
 =?us-ascii?Q?8FGn9/P2eJqlpEhM8ZFIgd9kPH993lZVDXARscX++uCc74RvO3cmHJhpa5cL?=
 =?us-ascii?Q?DbbEtE1uCneMQv4QQNdZtgAFhcgDXyWYcWfSnfm4I6FDqfdiouEyZqI6xqvh?=
 =?us-ascii?Q?v4QnfAXDPCL/ZcchKj6a9DzgnDiRAvXJgY1YPXidEoVbqZPDolcYvWCjT/Iv?=
 =?us-ascii?Q?zmOcfhlEOp3P0qfuPm4vxXeFgPgTnLVPfby4B1XChtv/hmED5OQ37rYZFMAk?=
 =?us-ascii?Q?w0TB8sKJn3fEoEjpUhaDX0tZkPRzpWSKiLp9Wcou5J+/aGIr+ZhS3g2yi0zJ?=
 =?us-ascii?Q?hupbzGiingFpooDm7wfsMCbKR555BldSrBWpxhpJ5URzih5Kt6JcbkwbelRg?=
 =?us-ascii?Q?hbjnT+5K+Q1VhvOgNtrYuM/6AacVbT9OGAmEnDz01WRP23NZ7C+sXKYOy/tE?=
 =?us-ascii?Q?KTD4lTLdpCL9549sIlNl83pDaqon6Z9E5RQH8AUNYOlaW7sxRaOmp4q7pPfa?=
 =?us-ascii?Q?3KK46nYuNWVqdpvo/ZMVIAizZuARyrJEYKI9NFVXet5U8Uvs2CIscFhYfmHV?=
 =?us-ascii?Q?eFSSbQHKieSkNOuFBrpDbIC6SKSKGV9SlkHuuhx6nV9ZlDrPvs7dZPR8vfbb?=
 =?us-ascii?Q?uYBp8BP86pew9+mnWlc3d+oAteETYFDoBo66SQC43NBQGwOJamoTVwGgrhOH?=
 =?us-ascii?Q?kNEnxQWgUkCcijJTSoPE3Wrh5NInWjZduZLSS4vPp/IxqVesLxMJtt5kpRfc?=
 =?us-ascii?Q?lqoyblBFFVJOgFvTFLlCmn7C0sd9UozWkhs7JKYolncbWAQwo4FWTHA8INbg?=
 =?us-ascii?Q?6SPvQYERPym5tHdfbqYS5aBWyNNlyH6yE7QbD6uPWhq/zpq44harbr7wddIk?=
 =?us-ascii?Q?0obxwV5naAKeQck7a7qSmo6uIbYc5k7LLReQySXcNRnZ54mswFzyCiJfA9Nf?=
 =?us-ascii?Q?SMKpzXdX0XvwnIi7jE+nIhyJkvQbgIG5ndyLaLeZTHNgGyVfzWFoPwTSv2y7?=
 =?us-ascii?Q?2BD9ejnvULDQk+f8J6T/xHcsVXtFYSlHUUpusFXQq0WpCsqDk6FzyqSL+gwE?=
 =?us-ascii?Q?OHQBq+mrGQbzGAs1WWopdhR56RShVo4M1VI7EUTLkrjp/1FCMVbD4HN4SOlo?=
 =?us-ascii?Q?8BmxLYi6fd3igtzhBnQqJQqz8zDQq3pe+9hcznaamfGTrGflttoOnZHEUO5Z?=
 =?us-ascii?Q?0r5/LuHxAgXyKB15hlZwYBvKh0RKht+98Bz6nUQ2C7So6uB385isWDMFjwVl?=
 =?us-ascii?Q?4Ua9stToZNW96YUxuOAt1ezypiuFuQAZ2XphHlM8FPfRpN0Yy4BxFuJqo+6x?=
 =?us-ascii?Q?+26XZZbj5fALqesYPn1EdCrBfFmojqAf68KnMe9vdWHK5Q5QoYoQ8Ht+dGqn?=
 =?us-ascii?Q?/neq+T7OhTKbdDOJUxVhJiziVQuyRzX2dOeN26F95o7TqdrUucNcroYPX1gL?=
 =?us-ascii?Q?sD1kfbBRHm3dCSByfiogcAU6bafUBIS7CXFjdy75xEyhXGozgY4otxEgkFhZ?=
 =?us-ascii?Q?hPCU9H1y+KIe+cfa1YizZtWmpY5Kv6xYtUIo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:36.1814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6819686e-12a5-434c-f89e-08ddc02e3bf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9065

_PSD info, consisted of "shared_type" and "struct xen_psd_package", will not
only be provided from px-specific "struct xen_processor_performance", but also
in CPPC data.

Two new helper functions are introduced to deal with _PSD. They will later be
re-used for handling the same data for CPPC.
In the meantime, the following style corrections get applied at the same time:
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
v5 -> v6:
- remove redundant local variable "domain_info_ptr"
- change check_psd_pminfo() to bool return
- Comment wants to start with a capital letter
- reword title and commit message
---
 xen/drivers/cpufreq/cpufreq.c | 100 ++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 29 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 887bc5953d..e387b8a0d9 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -226,9 +226,29 @@ int cpufreq_limit_change(unsigned int cpu)
     return __cpufreq_set_policy(data, &policy);
 }
 
-int cpufreq_add_cpu(unsigned int cpu)
+static int get_psd_info(unsigned int cpu, uint32_t *shared_type,
+                        const struct xen_psd_package **domain_info)
 {
     int ret = 0;
+
+    switch ( processor_pminfo[cpu]->init )
+    {
+    case XEN_PX_INIT:
+        *shared_type = processor_pminfo[cpu]->perf.shared_type;
+        *domain_info = &processor_pminfo[cpu]->perf.domain_info;
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
@@ -236,14 +256,13 @@ int cpufreq_add_cpu(unsigned int cpu)
     struct cpufreq_dom *cpufreq_dom = NULL;
     struct cpufreq_policy new_policy;
     struct cpufreq_policy *policy;
-    struct processor_performance *perf;
+    const struct xen_psd_package *domain_info;
+    uint32_t shared_type;
 
     /* to protect the case when Px was not controlled by xen */
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    perf = &processor_pminfo[cpu]->perf;
-
     if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
         return -EINVAL;
 
@@ -253,10 +272,14 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (per_cpu(cpufreq_cpu_policy, cpu))
         return 0;
 
-    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
+    ret = get_psd_info(cpu, &shared_type, &domain_info);
+    if ( ret )
+        return ret;
+
+    if ( shared_type == CPUFREQ_SHARED_TYPE_HW )
         hw_all = 1;
 
-    dom = perf->domain_info.domain;
+    dom = domain_info->domain;
 
     list_for_each(pos, &cpufreq_dom_list_head) {
         cpufreq_dom = list_entry(pos, struct cpufreq_dom, node);
@@ -279,21 +302,27 @@ int cpufreq_add_cpu(unsigned int cpu)
         cpufreq_dom->dom = dom;
         list_add(&cpufreq_dom->node, &cpufreq_dom_list_head);
     } else {
+        uint32_t firstcpu_shared_type;
+        const struct xen_psd_package *firstcpu_domain_info;
+
         /* domain sanity check under whatever coordination type */
         firstcpu = cpumask_first(cpufreq_dom->map);
-        if ((perf->domain_info.coord_type !=
-            processor_pminfo[firstcpu]->perf.domain_info.coord_type) ||
-            (perf->domain_info.num_processors !=
-            processor_pminfo[firstcpu]->perf.domain_info.num_processors)) {
-
+        ret = get_psd_info(firstcpu, &firstcpu_shared_type,
+                           &firstcpu_domain_info);
+        if ( ret )
+            return ret;
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
@@ -339,8 +368,9 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (ret)
         goto err1;
 
-    if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
-                   perf->domain_info.num_processors)) {
+    if ( hw_all || cpumask_weight(cpufreq_dom->map) ==
+                   domain_info->num_processors )
+    {
         memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
 
         /*
@@ -395,29 +425,33 @@ err0:
 
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
+    ret = get_psd_info(cpu, &shared_type, &domain_info);
+    if ( ret )
+        return ret;
+
+    if ( shared_type == CPUFREQ_SHARED_TYPE_HW )
         hw_all = 1;
 
-    dom = perf->domain_info.domain;
+    dom = domain_info->domain;
     policy = per_cpu(cpufreq_cpu_policy, cpu);
 
     list_for_each(pos, &cpufreq_dom_list_head) {
@@ -433,8 +467,8 @@ int cpufreq_del_cpu(unsigned int cpu)
 
     /* for HW_ALL, stop gov for each core of the _PSD domain */
     /* for SW_ALL & SW_ANY, stop gov for the 1st core of the _PSD domain */
-    if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
-                   perf->domain_info.num_processors))
+    if ( hw_all || cpumask_weight(cpufreq_dom->map) ==
+                   domain_info->num_processors )
         __cpufreq_governor(policy, CPUFREQ_GOV_STOP);
 
     cpufreq_statistic_exit(cpu);
@@ -499,6 +533,17 @@ static void print_PPC(unsigned int platform_limit)
     printk("\t_PPC: %d\n", platform_limit);
 }
 
+static bool check_psd_pminfo(uint32_t shared_type)
+{
+    /* Check domain coordination */
+    if ( shared_type != CPUFREQ_SHARED_TYPE_ALL &&
+         shared_type != CPUFREQ_SHARED_TYPE_ANY &&
+         shared_type != CPUFREQ_SHARED_TYPE_HW )
+        return false;
+
+    return true;
+}
+
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 {
     int ret = 0, cpu;
@@ -581,10 +626,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 
     if ( perf->flags & XEN_PX_PSD )
     {
-        /* check domain coordination */
-        if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
-             perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
-             perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
+        if ( !check_psd_pminfo(perf->shared_type) )
         {
             ret = -EINVAL;
             goto out;
-- 
2.34.1


