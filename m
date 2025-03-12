Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85602A5D501
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909780.1316712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQf-0006mU-4F; Wed, 12 Mar 2025 04:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909780.1316712; Wed, 12 Mar 2025 04:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQe-0006f1-SX; Wed, 12 Mar 2025 04:10:48 +0000
Received: by outflank-mailman (input) for mailman id 909780;
 Wed, 12 Mar 2025 04:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNb-0006o2-Ik
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:39 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2009::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86f88d1e-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:34 +0100 (CET)
Received: from BN9PR03CA0424.namprd03.prod.outlook.com (2603:10b6:408:113::9)
 by CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:30 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::57) by BN9PR03CA0424.outlook.office365.com
 (2603:10b6:408:113::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 04:07:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:30 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:25 -0500
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
X-Inumbo-ID: 86f88d1e-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPZGXaZO89W7zW49ZlnWO7knZXs3o7Pwds5+lQek8m8LbTtdC7xf5XscxCTYGq7Q2/+AHCc/5TG9gFdO8fK4SCiljfckRg8WcWHg9eFYvIV7DePjI+ocz4iPw1M3MtKhS/oKIYfC5hubFoC46b0DX2hIlzo7M3BmukjUBbVObrdb8ialIAL5E71Zo5U1fUdf3vtminL72DWMktKyYr2oaHM52oDp0R5MlS43crC3z3iHTKuLN6XI93HCUW+7/iON0tvaLc/LMlW5ERO7HzQvJmosnwWA1nTbm/SfhV4lRaiuUbIMx5rohgtNufldDgaVMdyRGvBHuwP/e1kkQNgRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7eL6PKpkypQH6B94sjbTggVGB6Kr+OYdiNv5tTrv3c=;
 b=rBYV3sSXZvISoQ3Dj6dyLfGXLUj/LQjSSI1b7gXed2nSDmmV+kR+ZbWMzFmTGR8mgMVjWqQPEvuAH7ENEaxZfEFfaKfna+R3U4aHfY94Z86rxMXrk6VrS0VY/6AhBD+9CESLacpmqogNht0MJImCzxgOxP1iNPme51JsLtpqy2Nz4L0RHCR0z4u/WHxXvG6JIDPE9cZLtGmyAXs2HaIWKAonvaqCiddkhqzua8BFQ5qmig0kacLiSKyFeQj/tW/5pYmYMCAjXX4LZK7df7xrsX/9Ds3a5zbQl9SvG3PUyputrCYKuZfG8b+j0ue1itQxp3JWMdJ3pp1DPiAOQZag+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7eL6PKpkypQH6B94sjbTggVGB6Kr+OYdiNv5tTrv3c=;
 b=ygi8faLvIXsJPWSSnJ41FGvUb8nY6FO4wxzTU3K7rycLrC0cg2GDm4aZVa7gPsDwu3l7ZwN39ND2cFcjhq2qKFjx/dxS1QFfTj7RPQ7+sK9bdWJoFzPJgwaDlFGNEzzsTF0dgipmcl6VKyP1W3z8clhwXWocrypcX1vgZHLcbko=
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
	<gwd@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v1 12/19] xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
Date: Wed, 12 Mar 2025 12:06:25 +0800
Message-ID: <20250312040632.2853485-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|CY5PR12MB6250:EE_
X-MS-Office365-Filtering-Correlation-Id: 2921187c-9798-456c-76db-08dd611b6880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kAGT0S0ksHZDYHdA5zmojPU6DpTRrjnb2FazV366/xKqSG51Rq5TFRP2e07A?=
 =?us-ascii?Q?Z3hFiGb6gvLGklX55XEsC1N9Bsi6DAUxh/X8kKtqgiWrrCbtl2zvlO6g6iVQ?=
 =?us-ascii?Q?chvp/P4jMuIPLSbZfSEvB8xleY1LGii5DFIwdsQ/l+bh/uM5zNVLQ2llxeFK?=
 =?us-ascii?Q?VPq61LERQnApJEMIalVblSr0tJj75mthvdD46CnRNjEmmbIU5KkuZiCtDPJn?=
 =?us-ascii?Q?isMS/vP82oexPfbuLjkrQJ8FOpDRIHpnmMkgCdLRInq3ncSOFk4qJI12Cl3j?=
 =?us-ascii?Q?hhND9+rAMB9manrprwAi3s/3RwbcL5ABrFfjrn1bjYhy8S6ZPILa8NqAF+Tb?=
 =?us-ascii?Q?z9qF2MtcFkr0I7F8rnLRfQEQMrRWnf+CLndpi6cCTL7l4TlSO+BQXde150T4?=
 =?us-ascii?Q?nsRgWTutLQ3xs+d+TPBH42/PDuv1e4I79+Fxp/qmdgB8q+jCvpYUdVY7Mv6D?=
 =?us-ascii?Q?yMdeQlIuJf/CfMjqldnne7KllGo+J9+7ouGXhFs3VVQDGGjnOFmmuajaQTO8?=
 =?us-ascii?Q?YCrm8uyRpmyan9D1IbAbsDD2VpLLnWY7+Ebcpex/UXien3T8mOviKDawzoJK?=
 =?us-ascii?Q?Ei8L4sypDo+wXkztlu3Ik/RIx1pwGjOTD07rHVA0EkV5nYyaDhK29hixq8jt?=
 =?us-ascii?Q?oIfJLHC/B15Q3CyWRbtNzJovHJHz9uDpULcb8HOfm0yrhiOXUHVO5JuMgxPE?=
 =?us-ascii?Q?R9GVdoy1QhKY4VF2Wct5MWzaZn77XNtIGN7zgcFfjZ4C1hJLFXOG9LKl96LS?=
 =?us-ascii?Q?vO53Na3OPMDF7t9JNr7UmjxKChcZPNGnpIUuI5bG79Kl275vSwHMS8Frqunt?=
 =?us-ascii?Q?b0f2QD46VMbFbJMyUKIQEpO+d3qTs8gz9RKnMNZvMG1TyenovVYebJ7urU0S?=
 =?us-ascii?Q?GlU5izjvM3RfZBjyrODLN1WSAK+QfMaNZdeu4iAg+fPb8yBQYpY+kyJfA1EE?=
 =?us-ascii?Q?WUgMqJFX0z9eBSVBkpO9O7xUlmygQUjxV8de+0mfSE2nW8MEPPq6Zz7LXBlK?=
 =?us-ascii?Q?MM6zN952rVGJYhMV6QgqihRWWWTY7oKduo8qh8eira3Q6WUjAcdM6d/kFayi?=
 =?us-ascii?Q?qH20QDPSehgZNTmmitnXKVzDUXNwAemfQRyQbgi/isEPJ/z6AplpoUyr80jf?=
 =?us-ascii?Q?7WOx30054qsV5+DmK/ihXoJ0wgGqSTgWCfeVR83U6pfeU+9XLl4SRkqs/HEP?=
 =?us-ascii?Q?7WTr64FjH6pgSrhGI5UMWgdAgIN6BdlVvqMEU+rCoMkjiwAXLzHmV1zhTEVJ?=
 =?us-ascii?Q?Oiiaq/1rSqk9RQQaBpXTznNwxf/ZxpCjuyvF28kz+awbXifeWbPQuNqSj/7N?=
 =?us-ascii?Q?s91sPxbp4aXVleIubThR4LGATdL9JyG7oyA4okoFR0Ttcii+uGm5axD/ke9x?=
 =?us-ascii?Q?qC2Dhw5lAy1t8lXUkBPG/VY6MI62z1KF/QEy4pUT4xcDIP36e2t3KVQ3XfKj?=
 =?us-ascii?Q?vgFfgZ0LVObkEPPTStBJYycArD/X5uqmnst8kt82b8WDbPqqoFgLsXmMwO0i?=
 =?us-ascii?Q?heSKt6I+qnLvaU8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:30.1114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2921187c-9798-456c-76db-08dd611b6880
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250

Function cpupool_do_sysctl is designed for doing
cpupool related sysctl operations, and shall be
wrapped.

The following static functions are only called by cpupool_do_sysctl(), then
shall be wrapped too:
- cpupool_get_next_by_id
- cpupool_destroy
- cpupool_unassign_cpu_helper
- cpupool_unassign_cpu

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/sched/cpupool.c | 9 +++++++++
 xen/include/xen/sched.h    | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 3d02c7b706..0efd8a4591 100644
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
@@ -352,6 +354,8 @@ static struct cpupool *cpupool_create(unsigned int poolid,
 
     return ERR_PTR(ret);
 }
+
+#ifdef CONFIG_SYSCTL
 /*
  * destroys the given cpupool
  * returns 0 on success, 1 else
@@ -379,6 +383,7 @@ static int cpupool_destroy(struct cpupool *c)
     debugtrace_printk("cpupool_destroy(pool=%u)\n", c->cpupool_id);
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Move domain to another cpupool
@@ -568,6 +573,7 @@ static int cpupool_unassign_cpu_start(struct cpupool *c, unsigned int cpu)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 static long cf_check cpupool_unassign_cpu_helper(void *info)
 {
     struct cpupool *c = info;
@@ -633,6 +639,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     }
     return continue_hypercall_on_cpu(work_cpu, cpupool_unassign_cpu_helper, c);
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * add a new domain to a cpupool
@@ -810,6 +817,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
     rcu_read_unlock(&sched_res_rculock);
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * do cpupool related sysctl operations
  */
@@ -975,6 +983,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     return ret;
 }
+#endif /* CONFIG_SYSCTL */
 
 unsigned int cpupool_get_id(const struct domain *d)
 {
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 9bdeb85aa4..ea81832c50 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1259,7 +1259,14 @@ static always_inline bool is_cpufreq_controller(const struct domain *d)
 }
 
 int cpupool_move_domain(struct domain *d, struct cpupool *c);
+#ifdef CONFIG_SYSCTL
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
+#else
+static inline int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 unsigned int cpupool_get_id(const struct domain *d);
 const cpumask_t *cpupool_valid_cpus(const struct cpupool *pool);
 
-- 
2.34.1


