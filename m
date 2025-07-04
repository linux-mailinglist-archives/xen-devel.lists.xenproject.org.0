Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB36AF8E9A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033105.1406597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXcks-00024l-0h; Fri, 04 Jul 2025 09:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033105.1406597; Fri, 04 Jul 2025 09:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckr-00020t-Ry; Fri, 04 Jul 2025 09:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1033105;
 Fri, 04 Jul 2025 09:30:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckq-0007ek-Fn
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:48 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2414::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9024422e-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:46 +0200 (CEST)
Received: from SJ0PR03CA0375.namprd03.prod.outlook.com (2603:10b6:a03:3a1::20)
 by CH2PR12MB9542.namprd12.prod.outlook.com (2603:10b6:610:27d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 09:30:42 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::da) by SJ0PR03CA0375.outlook.office365.com
 (2603:10b6:a03:3a1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 09:30:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 09:30:41 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:37 -0500
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
X-Inumbo-ID: 9024422e-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUDbNto4h0GTAtGtL9dMyrSBwyDs7CcdlKNIGEKc3YMp6i+vhhB9kZolPwL9j4RnmI3J5Bu/CPLp3sWH1zvt90QbwGP4MuvwlaTatdCww6cZ2KstNHIY2fGJNEoJDKVqKtqC6VMuJvNpf4cuCPCaXmFFUDeO3eiIqu0HqZ9RrHc0B8HiA0jl6nz2h8IQeFB0ziUyjnb4iaKigJuXLuYaFmIm5XLoUr1wVTd4IQUMBQzaKo2M9m6CPYR2ZskTf5zQD5kX3d19K7EiuC3G0HG1LX4bQ45VGQIeHxqjp1RJcHUsXTY0/HaNI31yv6/52Rja2h0Lv4KUxQx66SevHF0MCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdgLxZJojMqTzA4uMqMuY2FrEHyVqR+LGLe1iCymvs4=;
 b=vj4ibauizXIgzaD1+X0JoqTNVz2WxGVV8iNc/TtwleoF4Uzzp97e58AH1Z24ugnRn96D8Ou1pwe94lwyaAPdYjnMaMJB0A1Kz5EyJjbdbPaxBgjO9ac4mICplX5jyZB9CwB1GY5KxA7fo2Jj3DA0MBi0tMyVsUVwoZRVMrM0CGbJfDyCovqoYuNOpqYDcd6DDvsEb7zmY/10X7QIc/U8UdE8EIW/1xkBBooGGc0MUvZSsZ0TIltH8Q8Ba57QUbwSgy1wbp8f+EWpPsSVPocdzDXT//7LmjQOU1FOd+pqddiBSmphDW4cpb373r9EY9gfJ7RybUI87/Vi1L1RyIRR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdgLxZJojMqTzA4uMqMuY2FrEHyVqR+LGLe1iCymvs4=;
 b=5fRMlFnn6f0KndpoYnqDwlh4VAnm0hbCAwnp/tbpRq7KhUz0Ovzy6i+qb5EQZUwHCXGEfrpVd0YmDvSfvu5H7EVAtmD0RBSyq9e0OiR0y7sb+Drhm9OwlnNoEfzsOijMlJyS0sFqelAF01wZRPuzHVYr0cZGQPjeUhjfhqdFcR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 11/18] xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
Date: Fri, 4 Jul 2025 17:29:45 +0800
Message-ID: <20250704092952.822578-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CH2PR12MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: f7522110-d8fa-4b28-befa-08ddbadd720f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Irews2tcDAfPKTiGu8vBhKwXywkEUD5B0TRwBVz5d4IUgD+eFnSrP3Eicflp?=
 =?us-ascii?Q?T140fyEMld8FIpxrmc9Y1e19a8J8y3L1jFtqUAZ+QNY6HWZbrVNf4JmQpL5B?=
 =?us-ascii?Q?2NxZnwuiTMT8k6fDyt5PVNLUU1s75hHd2qYFb3f72eKzSVrsz5bGQwKp1a+t?=
 =?us-ascii?Q?7Zw/ccNxexkkg1/JIgSt9K8/caGzcPVhP2HqGd2toisGKdQHaWglpDmmgOLa?=
 =?us-ascii?Q?kVd1tNP+KusehwrwLW9CFdz2LMI58R5SQsVvkaA8FGWZm2FR3vtDJwAQHCq8?=
 =?us-ascii?Q?b6SG0kP0w6xnaFadF2yjIxVvbcX5UUKnBHIt7QLiXuRDsuNSYVCO551pRWhd?=
 =?us-ascii?Q?nUHXeFf1dJddVgrrIynvtlUm1Y4VdAxpKq+uydcEYl+OFUu+xZGm1KwCFAwx?=
 =?us-ascii?Q?dIxMAw1uFzXpJRidnGkpEFio2LfEZzmYMTPfrAIT7scnyR7nLva0GsrkLnno?=
 =?us-ascii?Q?9dFa062xo8oV17cnZDgP0tlTtH9DNKR871Yvxi15Jv2YqjGOf287RHa1bgaY?=
 =?us-ascii?Q?qxevlEtsM4FCHz0fKHwQ6JhTf9VdcnsxEc+PG1jYzIKGoihDb4xQIrNnXhmf?=
 =?us-ascii?Q?xitZ9xVWaaa3lP7qOk6cNvATc9X/VlAN7aVxTkdM5UutgThSGy6RLv0f+x+E?=
 =?us-ascii?Q?fqPKYl/Lta+nSoa4hwmFMXYOHBM0HMXzDMlLNW/lNownfOtv6tLvgGb24vlh?=
 =?us-ascii?Q?l94hYFNfVulJJw3dt1AnaPRxvZKKYpEx0fdsFBgm2jALH7VwdVDCrvia3uRj?=
 =?us-ascii?Q?qj0GRhzzakwo39TJlAG1gcGyhXGBGhlqPzkczzYVHKzGMDCFKxVxXTjGUTpZ?=
 =?us-ascii?Q?lsTxaCTqIL1LZ8SthMg03ffKhdUMCylaYo/gOcrghaRvyLucu1ht/TeOZFus?=
 =?us-ascii?Q?A7+tuPB3X/YArKiT1t/s2/OItub3l6yjU48houYDflHIzeMwUgXC5uqh6nDv?=
 =?us-ascii?Q?f4K7bBqCOmDJ8NuvS+hwQ3qgxb+u9r0cdvYAVNGZk1K8OakJuBs8FBYW3Gqh?=
 =?us-ascii?Q?JzkenXg/GHY/2HPD1lmtGXwhfcmR883TGhIwPu/Dd5EOnu/vlCjRCAZtvuam?=
 =?us-ascii?Q?6yt5qR0cBpr6ggs88/4ShIhVHOnDvivKmn6M9cVk7DbBSL64RKHORf0Ppb/6?=
 =?us-ascii?Q?GtRNISSmO2pqaT1UbuQ9TwP3hjZjaxKhgQIGRJs2bVzuT73K6iqmmlippuRC?=
 =?us-ascii?Q?UDPA4wXku0wAvLNah80azq5AvmbhjHyesFmPL6irFd8DToWX1KN28xi1CyNZ?=
 =?us-ascii?Q?MPdS6NqV9aPlQb/wk10pYRGI/rG7NrQRSVfUsbB0UI2tHl6PO6LbZEdwHDXI?=
 =?us-ascii?Q?E7Oea9g+iyVXHtoYqtJvJu7Yn9FuksbcI5D+ObS2FLTti8h6n9NOjw/lbgfl?=
 =?us-ascii?Q?pATMDQHRWV0VF1T9RTUYzlExRkGglmuXrjIByTlvZyi7opyjTHxiPrv+W2TQ?=
 =?us-ascii?Q?99V3SWIabNszD036bdmu46pN/ed7IbLHJsOsh7Vnydp01NttGztmorYLCj1J?=
 =?us-ascii?Q?U0jFCmhat7yckOJaWVE4si2N3vKidjEBe6T2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:41.9284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7522110-d8fa-4b28-befa-08ddbadd720f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9542

Function cpupool_do_sysctl is designed for doing cpupool related sysctl
operations, and shall be wrapped.

The following static functions are only called by cpupool_do_sysctl(), then
shall be wrapped too:
- cpupool_get_next_by_id
- cpupool_destroy
- cpupool_unassign_cpu_helper
- cpupool_unassign_cpu

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/sched/cpupool.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 3d02c7b706..f5459c2779 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -241,10 +241,12 @@ struct cpupool *cpupool_get_by_id(unsigned int poolid)
     return __cpupool_get_by_id(poolid, true);
 }
 
+#ifdef CONFIG_SYSCTL
 static struct cpupool *cpupool_get_next_by_id(unsigned int poolid)
 {
     return __cpupool_get_by_id(poolid, false);
 }
+#endif /* CONFIG_SYSCTL */
 
 void cpupool_put(struct cpupool *pool)
 {
@@ -352,6 +354,7 @@ static struct cpupool *cpupool_create(unsigned int poolid,
 
     return ERR_PTR(ret);
 }
+#ifdef CONFIG_SYSCTL
 /*
  * destroys the given cpupool
  * returns 0 on success, 1 else
@@ -379,6 +382,7 @@ static int cpupool_destroy(struct cpupool *c)
     debugtrace_printk("cpupool_destroy(pool=%u)\n", c->cpupool_id);
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Move domain to another cpupool
@@ -568,6 +572,7 @@ static int cpupool_unassign_cpu_start(struct cpupool *c, unsigned int cpu)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 static long cf_check cpupool_unassign_cpu_helper(void *info)
 {
     struct cpupool *c = info;
@@ -633,6 +638,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     }
     return continue_hypercall_on_cpu(work_cpu, cpupool_unassign_cpu_helper, c);
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * add a new domain to a cpupool
@@ -810,6 +816,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
     rcu_read_unlock(&sched_res_rculock);
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * do cpupool related sysctl operations
  */
@@ -975,6 +982,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     return ret;
 }
+#endif /* CONFIG_SYSCTL */
 
 unsigned int cpupool_get_id(const struct domain *d)
 {
-- 
2.34.1


