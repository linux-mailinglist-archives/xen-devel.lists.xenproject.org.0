Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47FAA94D6B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961168.1352802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmp-0006RG-Kg; Mon, 21 Apr 2025 07:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961168.1352802; Mon, 21 Apr 2025 07:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmp-0006L9-GA; Mon, 21 Apr 2025 07:41:51 +0000
Received: by outflank-mailman (input) for mailman id 961168;
 Mon, 21 Apr 2025 07:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljd-0007m8-8a
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2415::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bd363bf-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:26 +0200 (CEST)
Received: from BN9PR03CA0126.namprd03.prod.outlook.com (2603:10b6:408:fe::11)
 by CY3PR12MB9554.namprd12.prod.outlook.com (2603:10b6:930:109::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 07:38:21 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::7b) by BN9PR03CA0126.outlook.office365.com
 (2603:10b6:408:fe::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 07:38:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:21 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:18 -0500
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
X-Inumbo-ID: 9bd363bf-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDksez5OTh0pz65AQA4OHTzlX8+W4S5hgjzjik8KCOxxHPK4qoY17WHvhD6J3bbsq2M6OOkxuKy8kFTloXVZvFQSaZ27aZR2NxWrXfSNs6DgvslqC28XKR0a8YQfapUE89CRcbA0WGdpYnh+3vPdc4Vfv+2HXRXSC7FbNydFUWLQxyJ1LEQ/9FtamYtwBhPbBOnR/EujyHMIRC/Z99uEIQp0/Y59YnoaADfxrE4mLHcI7M778lXrJPuzKovJAli3YR3NqRe64H6+fsoapuLxmsGJ+ZUTGj4w9remxvCjSOnFU2/Evl6ZS7a6YeBiuolHyEPUf5H53dAQJsjhfrulbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQXcalj/v4jEH1lTcqQu1NCuh3EhcbUREvGNsTW+ECE=;
 b=GUPYiKt+CPeQa+NY/Z8urZCAH5UIgiUzPI8T0Gm3R7AwBzoPaX3S/wU5f5eaNRSLf517HgcLQaEtoWKDkQ6ea6Wvbal2SHIZnnHRpuLza6Cj94yk+n88NMGd87JlAEJWkWpIuFGu+WWlZbrKMfDw9OpP6mOAUjjz5ILaGiktFRxJurH28fD6nHht6bs+VIO8K8Ogssbb6htWdd6NlFqcFPqyAk/z/ZDHvFOtBvdlgmONqRi3285sY93mJFyNqjyCHTHNsAPS3Hp8YbObsn3iZyc6Iau+k+CeYziBjusWp65cuR1a1DY4+aYiNK8rRwd31lfIuLw1dsbOGiEhx/WaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQXcalj/v4jEH1lTcqQu1NCuh3EhcbUREvGNsTW+ECE=;
 b=1VaR4qp4aww5jnE7crnFVeVgOiC875b8y0OrN9CMarRtxF1eKBA0iTIN8K1jm/q5gqOR/oPfug6J6GhusAE1ahAj7dzeUZVK/S/brCncda1XfSEGkq2qbSY0OjfaqvshS9CrOuD0YjQmAa1mydPD4V6snXbHLWn8tfGaQwGfE0c=
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
Subject: [PATCH v3 13/20] xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
Date: Mon, 21 Apr 2025 15:37:16 +0800
Message-ID: <20250421073723.3863060-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|CY3PR12MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: efda5a8b-4ecd-4468-4781-08dd80a77dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3JKdo3qGvt3l4ag9jd2AByD/zb0aQh0ZFRiqRE1SfguxtPXAp03aCYZe8RN6?=
 =?us-ascii?Q?yveb/lL/xYfyPVxhpxatlsHo52w9jX9H2LfGL1xVwOjmpez+H1N2PzH6CR5W?=
 =?us-ascii?Q?slhuDClmkjSp6U16SoUOBOLH9U/xBh8ozKkihwg7hSx3XtJBmHirXLwxjSL9?=
 =?us-ascii?Q?RM6c+fiv6g7m2nSBJQPtPSz1nPmurexOy7Ghiu08uRNci99+5/USKGyxLSpI?=
 =?us-ascii?Q?3fIgU3GBVPedrGHL87T+JPvLj9yYmljeHBxBkYiup/MGPSN8nxUVv4NfjGVD?=
 =?us-ascii?Q?2gnera8v2Lcm/my2uZak0B1VfWhy5IegBu0VcOHBOg8l5ZS/02IOkLP1xg+h?=
 =?us-ascii?Q?DHFCP2yiOHy1bXdz14OjHPsSqFLKq4PolyP47EdmOGsYGji9J4uF49lEY6NM?=
 =?us-ascii?Q?sbAvyEQxFmf2KjWbf0uQjwMdkuhDJGGwLGsQv+IxIpF35na+juBCPUG7iLaH?=
 =?us-ascii?Q?jPEXV5P5xjnxBiIlI5pPDPgZ5v/CNfikY7GRc9mda7bIu2Eq+tFqULrXKOXG?=
 =?us-ascii?Q?8EsVRPhO+AsyLOl4ccGJYjPk71TOxiNd5XJd/7kWCsLldl++fO3hJVaWABrl?=
 =?us-ascii?Q?TcH92Bz6MuyrW0qi6MNNHyhJM+3bYnG9+rl7QAUkj5dUMMfyyC2JzZ+35p++?=
 =?us-ascii?Q?L3ItiYEsdmmxNQ4spmcZTrxWcgpCNZIEYPqXE+RtdHJs6+re2iOkdUHH1RIs?=
 =?us-ascii?Q?d+oMEuhC0BGY6Xye33RzJReXiyCufIkdPCxUACibi8DZjBFA261bJa7RvGHm?=
 =?us-ascii?Q?N//5feygHe6+M/e9jrpPA6H2D1RyHFA4+rMXT09KCT2YKVBryQ+IekHvNyY2?=
 =?us-ascii?Q?3PsXNWrcCBhjSz+kTEhtMIDJp7Tw9eVEHe53H55YyhZwEXWA7vV9MZFlhwAm?=
 =?us-ascii?Q?Zjfd6RTp3pBOXPth/SBSumN+YMH7mf+PNOy1ShFlbpOp/pBJOl+9TS7kt1fz?=
 =?us-ascii?Q?S9Ldhlf+hc2ZAa83yUhj4B3cBxsJ8SnDkR7/Cb22jUcPCShkOXuwOnnCKpzG?=
 =?us-ascii?Q?r6+ChsUXEditTX946GGnb32KRcOFBsUq6Lo4V7Upl40zsPpnHen3EnyA2KSH?=
 =?us-ascii?Q?hPfclQLbSNKzuAwx1yWBN+dUi68jS5Ha+NYY5G292pkuBmRhHszQeOVGMt9N?=
 =?us-ascii?Q?WsBDN3ZGj+iPdeK12LBV5yQlWGAcHKvfN2D5qBpc1e+01ZQ0bwC4rYkufsJI?=
 =?us-ascii?Q?y9Kqs2yNg6wLzTj2C4PP0JeDE6xMqeURa4bHtHju4VXnZV+aA3kt2Ki6oaul?=
 =?us-ascii?Q?zSX4MdThqEt1UoZ0MH18K40E7zp8UGTUrYzVKellE0IkU7ltUBhYKTvFbjsW?=
 =?us-ascii?Q?Qg/abXMY9hLp6xR3dSoCRihp4LNoocgAazRhK0QTv6/4IO5R6QInOF27zJ36?=
 =?us-ascii?Q?P1EsQoiiRoF7QpS0aQxEKqw7OzS5Ef3coMv51RjEZ1dzSXM4ad4D6Ut6XWBR?=
 =?us-ascii?Q?WgZnQ2fMZWLYugB6frF/4xJtCYk8d/iIDgkg0L8jtk0a+WMMQDSLQmPiazlB?=
 =?us-ascii?Q?WKxtR4LJM/37i/ybZNFm4vDVQBqoqfwtOALj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:21.4418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efda5a8b-4ecd-4468-4781-08dd80a77dcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9554

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
 xen/common/sched/cpupool.c | 8 ++++++++
 xen/common/sysctl.c        | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

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
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 504e3516c3..767e0b7389 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -252,11 +252,11 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         copyback = 0;
     }
     break;
-#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_cpupool_op:
         ret = cpupool_do_sysctl(&op->u.cpupool_op);
         break;
+#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_scheduler_op:
         ret = sched_adjust_global(&op->u.scheduler_op);
-- 
2.34.1


