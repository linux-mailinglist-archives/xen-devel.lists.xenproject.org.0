Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8ADB50FE3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117712.1463840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFX6-0007Cc-Lz; Wed, 10 Sep 2025 07:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117712.1463840; Wed, 10 Sep 2025 07:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFX6-00074G-67; Wed, 10 Sep 2025 07:46:24 +0000
Received: by outflank-mailman (input) for mailman id 1117712;
 Wed, 10 Sep 2025 07:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQh-0005yo-BN
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2414::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52390e34-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:45 +0200 (CEST)
Received: from BYAPR02CA0060.namprd02.prod.outlook.com (2603:10b6:a03:54::37)
 by BN5PR12MB9512.namprd12.prod.outlook.com (2603:10b6:408:2ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:40 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:a03:54:cafe::99) by BYAPR02CA0060.outlook.office365.com
 (2603:10b6:a03:54::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:30 -0700
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
X-Inumbo-ID: 52390e34-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0IADLjTF2hQNtbP7VLUexv8SFMDBIEj57AGL6nctRjYqJ4xFe+voGhXP4br57CJdpfM26s8eKpVL+tdJUjGvHP5TLfUyrZpjoJGoL3y2xPfR/VBzuAZ1dfSXNrWG8xM9YishBQaieDMOl2lwq3pAH1pCHAfOk7PGApCDOKu2vHUPZE3qvPjZZno+++64l1YuvBNMwRhky3lnJsMlKg6UO3NJ62n2Gdz4bTwzA3RGdYUswUsZY7XtAI6kGQjBCEnqeg7OAx1m5qdIYf33hiN7yzC0mYfLkVBfsaZ6NwqC1/ExvAGa9Y0v6haBBVuAugapdrNHDKDEzEU9r7z3dP9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsGNmKsA7MnLndfkk3jVWl+tKOtl00t7vTpYsq/iVrE=;
 b=igr2VSw/S59+HvmSF0YJ+TuYKPHn0aoAaWn+6QUbpTLgmkXjgfv/VjhK6UYhFbth72gKPO4NvxDrDSU+Js4ywMQEV7XD9CDLl011F9af9uJtcP3JMsC8Y32XNDB1SI03DSzq7rqDxFjuIOTSOMvtvvNG92YUoAaHQPxJnxsETPXGnz+zmH8L9dA8dFtHgPz9lWal2D4Cx3mneE+E8DbfwgvN9zk38lvJeQzy13cIkhfZu9oysuILJzxIngSEhhYg2ny9L23UE8eJFJs5KMFXZnsbxLi5Pc3sI+krVsbhVksOe2vL4LIAbJV9SrBL2ZHErknEDi7n9IOC1Lm8xGT8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsGNmKsA7MnLndfkk3jVWl+tKOtl00t7vTpYsq/iVrE=;
 b=5VBvpJ4KoHWlsFVZgm6lza9h6TzsACHvn4GnALNJvmRMXr8509gwTVusK97CR7ZwIQndTYalhczdQ8IBHgSjMZ10Tc28SGmAqVLfd+TrhrXfj/8Ma5B69ZjbZg86l/dNA0m7L8p9v2y4TT1uuLuQZo3Zo4OkLitwXrV1Rh+Ony4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 12/26] xen/domctl: wrap vcpu_affinity_domctl() with CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:13 +0800
Message-ID: <20250910073827.3622177-13-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|BN5PR12MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 41560ebf-acfc-47c9-df87-08ddf03d32b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qWWIPjdjrt1VFiauJmjTEZNX66fkHHxdG3VYx5ceRn2/FyyxAfPP6Z/c6bf7?=
 =?us-ascii?Q?9tbe7mcLOJFaebMfw8nmzeCb2vKJn5d1+TsjH5+dPnzD2HN2zZc+37jbj6RS?=
 =?us-ascii?Q?wq+R1uMhLSN6VZYwtXorm56Bj3EEP23hBW7EI7v5djWY0JyWkcqDowLe+Fuu?=
 =?us-ascii?Q?vRTHwZJ+2doVQXioanEdUL2r6BnnIORAHlk1UoWxH7SxRM3TJPFnVELkg/K9?=
 =?us-ascii?Q?6ol3IjV6Y6eVfLbJ2okwnoY8ZctWzibfb1TiPPloKdNq0zQhxtn7sZPwJ9Lf?=
 =?us-ascii?Q?pW8Wnf5wPUUKxe6e6Jd/kzuM7n06+RUN8KPdtLdwQgeSLzfER9+c3qwl44yZ?=
 =?us-ascii?Q?xzEr+78gXD75Xft7d9M5q9pAWwNMf3kYY2rrJodsbbFMvZQ4BSM/pYYjDSQM?=
 =?us-ascii?Q?nEUREymbBvho++xChpWA555+4491OcZW658NOZ+HFfZ8MeOy/QfXzUMxxqR7?=
 =?us-ascii?Q?qjhspg7F3ejsP9oIpTFP9nH7c21HqeMyCKhoxd5ExH8PymAJitTzxZtDF+Nz?=
 =?us-ascii?Q?ehOJWpktpQfk1KMiLqYED75n20DLRBLMdFW32NRR80QvtdYmTdyi5XUl6cs8?=
 =?us-ascii?Q?AIgr6UEISc5PjIdfo+l20oblyQh9Y/PNJB4j2G5UPuc4KELDy+SjPiC6bUY2?=
 =?us-ascii?Q?/3+acWyUYlXSIi3GD/G6M7lFt8k3JA4cCpsD5nduC8RNE3zSz20DIrB6Payv?=
 =?us-ascii?Q?ezcXugfZlprOl6PLIk+UVy5yCwt8PQmbpzl2jT6hTCy/A+nnTHSv9+v+ywbO?=
 =?us-ascii?Q?GacdVCeyEvOycXZMkYAReC0AKhCBwrCwT8h/XMDvUqv8c6A/PnXzJFSbYolY?=
 =?us-ascii?Q?WokNhb3m4k4iCY623I8mAX0RoVWMqDuBJtzuPCY/aY3JwMYHMiDsm0PyiEY4?=
 =?us-ascii?Q?PgDipwMAy4y/qZq+zIvYCJIMXoLTDcH9aa3lej/sI3LPGahRf0BPjBq65Zww?=
 =?us-ascii?Q?0/zZi0pQKWFR7qUbL8+1Gl5MhU392O3Rdy2I+5lGzjJ9j+3nDp3UKRg94p22?=
 =?us-ascii?Q?UnF996kzvNzuKVdEZwNl6vZzWOS2onae2JP00qcXwlSzD3r2CHOJiq/Pfoaw?=
 =?us-ascii?Q?+xxE7DVTw3SgsMdlr4IAu6RFjBRagFZB/Pw98zJdky8Pwk9vYpL3s4qhm2FE?=
 =?us-ascii?Q?0ksK52/czavVqz8bSUUtZnxENk0yXf6Xl4Dx1i1d61A//2DnWXDRwSA4JEgq?=
 =?us-ascii?Q?nP2ys/7DrNRKKsnR8vBW8TgPvYhOHdzv2+is40pR4rqzzLOa0eSM0Ta1dtOP?=
 =?us-ascii?Q?j8NOroyt/ygsLNgVrpECHaoncVWESx546VGcb39BCTrJKBKS3Apf5B0wtpO4?=
 =?us-ascii?Q?FnzAk3o3voC3QI1xfxQ+glnoMk9ttXOyyIwGS9FNICs+YaoHpD4R7Rt3razQ?=
 =?us-ascii?Q?GEDOsxwP14hSTNN6oDDUSu6k4kr2uHkktqLWNF8FD118TNBiRot7DiVznJcB?=
 =?us-ascii?Q?Mv33G92zbbuYLuHbU+3XlmWZu0DkPYkBwPNKpGkXaUA7hVztG/YtVA4akalm?=
 =?us-ascii?Q?WEWtXqOdUVwCcFiVCQ1fEw4n76jGZWAVTOW9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:39.0195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41560ebf-acfc-47c9-df87-08ddf03d32b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9512

Function vcpu_affinity_domctl() is responsible for
XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity} domctl-op, and shall be
wrapped with CONFIG_MGMT_HYPERCALLS.
Tracking its calling chain, the following function shall be wrapped with
CONFIG_MGMT_HYPERCALLS too:
- vcpu_set_soft_affinity
Wrap XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity}-case transiently with
CONFIG_MGMT_HYPERCALLS, and it will be removed when introducing
CONFIG_MGMT_HYPERCALLS on the common/domctl.c in the last.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_{getvcpuaffinity,setvcpuaffinity}-case transiently
---
 xen/common/domctl.c     | 2 ++
 xen/common/sched/core.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index fb6fe90888..4a35c17060 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -515,10 +515,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                                         &d->node_affinity);
         break;
 
+#ifdef CONFIG_MGMT_HYPERCALLS
     case XEN_DOMCTL_setvcpuaffinity:
     case XEN_DOMCTL_getvcpuaffinity:
         ret = vcpu_affinity_domctl(d, op->cmd, &op->u.vcpuaffinity);
         break;
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
     case XEN_DOMCTL_scheduler_op:
         ret = sched_adjust(d, &op->u.scheduler_op);
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a0faddcb92..69972147db 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1402,10 +1402,12 @@ int vcpu_set_hard_affinity(struct vcpu *v, const cpumask_t *affinity)
     return vcpu_set_affinity(v, affinity, v->sched_unit->cpu_hard_affinity);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 static int vcpu_set_soft_affinity(struct vcpu *v, const cpumask_t *affinity)
 {
     return vcpu_set_affinity(v, affinity, v->sched_unit->cpu_soft_affinity);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* Block the currently-executing domain until a pertinent event occurs. */
 void vcpu_block(void)
@@ -1693,6 +1695,7 @@ int vcpuaffinity_params_invalid(const struct xen_domctl_vcpuaffinity *vcpuaff)
             guest_handle_is_null(vcpuaff->cpumap_soft.bitmap));
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
                          struct xen_domctl_vcpuaffinity *vcpuaff)
 {
@@ -1802,6 +1805,7 @@ int vcpu_affinity_domctl(struct domain *d, uint32_t cmd,
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 bool alloc_affinity_masks(struct affinity_masks *affinity)
 {
-- 
2.34.1


