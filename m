Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E4ADA89A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016660.1393610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hl-0003et-Pg; Mon, 16 Jun 2025 06:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016660.1393610; Mon, 16 Jun 2025 06:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3hl-0003aq-Lw; Mon, 16 Jun 2025 06:52:29 +0000
Received: by outflank-mailman (input) for mailman id 1016660;
 Mon, 16 Jun 2025 06:52:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Y9-0008OL-3f
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:33 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2416::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1325f776-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:31 +0200 (CEST)
Received: from DM6PR07CA0130.namprd07.prod.outlook.com (2603:10b6:5:330::22)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 06:42:27 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::c3) by DM6PR07CA0130.outlook.office365.com
 (2603:10b6:5:330::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.24 via Frontend Transport; Mon,
 16 Jun 2025 06:42:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:24 -0500
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
X-Inumbo-ID: 1325f776-4a7d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2RSQDnh23ayiLacUsiVdd0D6yfHBJ4n4kK8u7vMZuQIHgM1nEuSWFhUYBxclcaJkAA1IYIlprN6MsFi2i79p08eXQDQa29Kf8dcXF9zF/k3+ZgVA7JS6T5jG5GFdNoXfuTRz+amm6/0a1E88UMWZFkPFiReSTwG4RLqXIplG9pJb3j4W+F/6mj9dC+hkWX+xR2JnXR4YKkQ6lylShyX96FXP7eq1KW48l/C3Mnt9fe7HjuSf6DAUsWQ0QZIM62Kee96l9y8JPcwGwjlz3k9AhySYS4tLEPp0lt8Y+PJfyUB2N7uyxC9LktRFjSRCgahFl4lfb0xONTKFPNkuOmLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdgLxZJojMqTzA4uMqMuY2FrEHyVqR+LGLe1iCymvs4=;
 b=fwvtP2lwAJLF0jPayVMmPsFH4OvuDXDEvPZdDYIEYAH/2dBPLyFNmR0Ki7U228MWbcdfajeBViMtv1Ubc2iubjKtK5rWs0g1IM/1r85CYZzWiblbm8sRl+dZc1vNgcnLtzIhTmKU5eitvbBNLnw0oMlQcWPcZdVlKA0O8JKc/HnyepjNOBOJGDRosCxDO1P3NXv4W0mkEt7+zT8Zafuifglj8mSvTw77m202CZik8+UJiDd9N2WNPqtofpHxDPYASMVZaYFSOuq++Ulgu6yseSvH6takdD3ZDPT4V3E72/HP6b2PFNFmCNTMnDe7j6kJnfYm/ykUfKbBP6p7AFlxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdgLxZJojMqTzA4uMqMuY2FrEHyVqR+LGLe1iCymvs4=;
 b=iEw6oTT+nAEvpvNJ+dWwzji9G75ZHhRg3iCErln2PmtF5cvWdDGiZnCdcv0Tss8MUnZ5a6oPqXb6Sf3tx/zanRdzAuDQPjr1v0bySy44F43TH5BhWo0e6dwQe543qAykE7eJyK297oETcCXc7WYPqvw+/TJeuaCcKAs6iqYiZLw=
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
Subject: [PATCH v5 12/18] xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
Date: Mon, 16 Jun 2025 14:41:22 +0800
Message-ID: <20250616064128.581164-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|MW3PR12MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ac9b0a-e7e0-4a13-a6e1-08ddaca0f583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N7TrkZdxomMqq82l6RULfjzfDJ25xuBU194jIsNbKuCoFQeMa7a5FOwKrCQA?=
 =?us-ascii?Q?968QETWEA2f5J1hvbN+tzIHnz67EqzXwP20FDB3tty+Cnm0pjvzhv1ZBnDvl?=
 =?us-ascii?Q?TUOFCAk+c+lJFrsQ7V6PkNZ21/XfOjuHQtvRNi/TyPMLTtimUgdo9Z9l26dx?=
 =?us-ascii?Q?obKoFiJAAWwQqE8lRaovgygT0/R6FvIK5c+S1hx+h9e3arrhMsE5XeBrhKGd?=
 =?us-ascii?Q?lOluQDAj0ef/jdjE3dfC/Y5u75/wll1m+EikGgaVmoYC5rR4wfGc/7YdK71v?=
 =?us-ascii?Q?tnBTanHA2z2/Gt2xLhjSADb01lixN6dwlUZyV+68T7K7B334EgJkLgtAAHeA?=
 =?us-ascii?Q?96k4/eTqKtxtfmDmq51vTQdxoP5sHgMEHVCXOFQXHjYNDEc2j53/6cw3Bi/L?=
 =?us-ascii?Q?swXxlSaIEsBURPlsq8CVIC8C1wEvSRQjqBzLJnb7PgHN1dG1Xp2WAN2NQzmp?=
 =?us-ascii?Q?uM9qM5FvfFzB9LAew6zTwck8D38DPzXNjhjTLm6XAHz2GCfh3k34kykWzVXJ?=
 =?us-ascii?Q?fOpEWHFm3fihfLDFoAdJfFSNrNQZGh0HYXgdbuTruAKhnmmwyjGnp6JvHus1?=
 =?us-ascii?Q?ZWg1kh8KWxAnQs2y64wm6iB4AKQ5sidzhiJyV32vUOgiXJNQtDG/585pBd8h?=
 =?us-ascii?Q?QwZkro+KM8z4bNEQDWPVIZqro0SPzwyuLMfeF74tJ2xhZw2qEXH5oSjTLMI0?=
 =?us-ascii?Q?W4iNi5ajVXnZi1qOLJcu5hPpI/tUfSjqm6k9fEyUHQNuweTtTQvCzRJyQvul?=
 =?us-ascii?Q?hSU9ejDsfXHrIxMUTRzc+JIeSFLDfH0Z5XntJLtDBqBXCR4HhU+DfozJOr2d?=
 =?us-ascii?Q?3ZmBEq9dilG4VFd+99lLBTvMO3Rf4EFMHNI7pwMLyfhR7hrLzBGvstb4hfOe?=
 =?us-ascii?Q?3dQGvbMR7mvBlPOSMEejfbIF5ctI0oIUJenq0IvbFz2Qv7Rwu+xg9d3iIEAR?=
 =?us-ascii?Q?0UjjUx30tLJb8UCi3/5pPx5o/ChD341Hw6MtMH1/bbfnP+FPpq6o699Scln5?=
 =?us-ascii?Q?NnX++1uDUpR7LXEvRZ8VtIWkprgNOmP0JB3wc9wC8ZyBMpUPXrG7VW/Qv3ia?=
 =?us-ascii?Q?7czLdn//wPznf75uFZn+EUGxg9Qm6qdSITae6GubmnGp1tGEggLTeNDtxSBQ?=
 =?us-ascii?Q?NpDoipjna6G9yECpHbHOXb+aZvrZgkf/xAEvjuhzu7RnCXD0gNu7HqfI43MZ?=
 =?us-ascii?Q?9Uem3u+wk+GNdzRPKSPdTswby19XM7Wbl8OD6Vz9KtmpFG4BXbxCowjKt4TG?=
 =?us-ascii?Q?OOlEl54oaoIVN4VOrFlkJnygjYlus56Q3xxuZgcOPEmhmp6FdJAoxigb/HIL?=
 =?us-ascii?Q?YwKkxmgfpteVBAsTsQjm0dE+PuLQytkZfGYyZ4xRECSbHmqJZL0wvNSSHXG2?=
 =?us-ascii?Q?MLxyzb4EYaU7xcwfQ8tQzL4/yUt3g5sUpT6mCkrLadTBpDEQ+csEMbje2qBV?=
 =?us-ascii?Q?RiKISGYKgEOytlW+V26pdIcsHHfSxrDgpk8EShCt3fG9QIXey9vD8b4+XMxH?=
 =?us-ascii?Q?oUorZ0Y/BcjFiG87KfJ/90IG/Wo4EpqUSx27?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:26.9220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ac9b0a-e7e0-4a13-a6e1-08ddaca0f583
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394

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


