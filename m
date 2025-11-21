Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E69C78968
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168581.1494600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqs-0000hP-Aj; Fri, 21 Nov 2025 10:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168581.1494600; Fri, 21 Nov 2025 10:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqs-0000ex-38; Fri, 21 Nov 2025 10:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1168581;
 Fri, 21 Nov 2025 10:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqq-0007TB-0L
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:52 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fb1e2fa-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:58:51 +0100 (CET)
Received: from SA9PR03CA0027.namprd03.prod.outlook.com (2603:10b6:806:20::32)
 by MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 10:58:46 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:20:cafe::8e) by SA9PR03CA0027.outlook.office365.com
 (2603:10b6:806:20::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:58:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:42 -0800
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
X-Inumbo-ID: 0fb1e2fa-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nr4I0SUGm+PIpXxucBhOrlwRKHcEbUermOaMdC9SCVKLY6ghjctC5D5Wy/DVIRvQtzUMGz7rRzvJgso8cJ40b/zPO1sw1xLBwHO5IR2UwBh9ATdEhpma3/kz/7wCc+on8MLU7xHgu4vy8QB5LArzsJx+11kN03SkaKzm7UTK27iiW8DQX+Sf0r98uXtUqzcnKf5Rl1uvDLA346iN6eTDORGHTM6kDWvIKQhYPcS9gQfB85nnB9NHnxgznJLFd4DQ7e7OuRJN+5i4G50wRpu+XBjbLaYGfmsG57hWjl6NsHlaO1y2h7phwL7QeAZp7xaajXr934AP/WjzGuPtjYHzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igofeiLvOI2W8jum6hpl+MDDJaVYQ3ySBjvbKhyR/NY=;
 b=DpbZ2Xa5pE4Nmod+8kCkVAXSXAkO8hA6s4uglFeuCCc5OhuJARW8gKMn2RUIDAx8G1NRLfqKPDCqrh1nKhuDziGU5AAPe4/qycqtnDkBbCTSImJXbnpxzvq9/943t3FHtfkJiaiMWNO33+RpE5XN8f0a47eY8efpR0ZLYxR3cnef6ahaLRMfmP5Qk60VHyhegGXiYunAxhAZkEYbbdpdg7Jkpeo5M1/3CBZ+ZyjULT1cws2NG6cIPb1AbilSte54XbEvnNwGwejpau9rFGsrgMDJbtCJ+XRV4XP72NZh+Q7EFrwHEGs5BjYfX/Dd4k3tIhW2mDI8r1tuxx25iJwTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igofeiLvOI2W8jum6hpl+MDDJaVYQ3ySBjvbKhyR/NY=;
 b=l4yyS4DAG5qrb7wGzugdk0xeciDC2GfyQEkjqdzJc7M5LWgdfER8dQ0WBiZjD1UH7HNHqHfKq2IB2X2sEVW4UClBPTL+C/Y/uyu0aO1WcxoukJwR/Hfit3d9Ex8uYk89tTihOJAcGXq3ge6RLUIXr8O2GAzPCQLZG7d9hHCgEBA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v4 06/24] xen/domctl: consolidate domain.c with MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:43 +0800
Message-ID: <20251121105801.1251262-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|MW3PR12MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a29c23d-3e30-4776-1af7-08de28ecf10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1fg78zdKCoPnFHRLh7/gsnqC5xeBA8BaBZIvoOPLpjZeniQQdd7RMC9R/IBG?=
 =?us-ascii?Q?vbFW+d3pWFRfbqdgWvcdbImBeze0Nsmn1KFnKSiaCADdO2E1RBfTKp1000M/?=
 =?us-ascii?Q?GiiLBZU0Q2fVEEoGitPdUPaY7iJXNTmzJdMm1dw+VzfpfG3K7+zmGn82Z+VW?=
 =?us-ascii?Q?y8ksCXm5E8szdgatUTLL9yZLbyq2uiPa0l1XOqiFEHCcohzXnL10hl7cqojR?=
 =?us-ascii?Q?pMyy5v1D5LNPqmeW+rObLeYApsrev6yxC+lWGrjs8YRVDAr9UaorijlMQ02e?=
 =?us-ascii?Q?Q8zOuY0RE7Mq9xNpim1ulO4fn6E+Eu2DXmvZayX9leubvBojpnf7cGrM35oF?=
 =?us-ascii?Q?3Y3x5tZ8tK08J/8s8LH0WqiiZm+WQl5RuDoDTdlrPhELc/2A0HL58Vl0X0bb?=
 =?us-ascii?Q?4y+KxocKowREm025AwuvY8wIEnFDVtCLqlaleoz01x//z74BOKrWq6n+TZ1R?=
 =?us-ascii?Q?bh6VGuHJRxuUyWz/GRYuIGCBl19/dgVQEW1jRtKbNiASMXiZSSrosnTYGbNF?=
 =?us-ascii?Q?n/6Tkfd3CI/WQ0Jeu1x/G27uZJWo9SLtxHKlR4G+V2dgGX0O+ThT1P91RvhY?=
 =?us-ascii?Q?PgQYOpe3TA3ox0qt9pkxg0zrzZls1tWJmO0bo+FB3u8wl5OQcuzO3TFs3RAi?=
 =?us-ascii?Q?j5bP3oM3BGdYvGhe904cSjIKJa/6jqjqvPZjfkxZo01Ms75YcaL7ICsa0nJy?=
 =?us-ascii?Q?Q1vZT82v1THVSK/LxVxS4T+eWR6vQCkYm78xKvMW13oKLPlV40c/M50LucA/?=
 =?us-ascii?Q?1hkR4QaHu8iJA/SsQu/2gJskB8gBqvFmkx91W/rv6PXYmIY4MJk0frsUKKqo?=
 =?us-ascii?Q?qhzMjxpdC5vGfXRASsejNXhF5mYsqNltXtAkoSkuiYL1FPYOmyW7lFjXBZ1q?=
 =?us-ascii?Q?l0z6ltdiyyhWZGPtqd8s0HJ1WZYkXRVZSUbTBC4TL7x6em30ZeT8W4JOiGWf?=
 =?us-ascii?Q?owZHB5i97tBoyCPMuHIDZAIY5Zal/6IYzJwmWJ/Q5yFyy2CIRmm436G2AJSp?=
 =?us-ascii?Q?2WElimyNwXKV+qXCuR/9XYjh34AIrD0rVuyvj2cB/HZX/nUI0WFDYSaKyc3C?=
 =?us-ascii?Q?pF8pj9/q+dMDd+6vLg+DPj3reYxCONHCBWW/W1bm8S+lUFv2Pw4Rgz8OYJ7k?=
 =?us-ascii?Q?KA4vyVGPURbF83jc/RdnYmcXSr+5BPFlZxCg4YRpfoExoM7zkqoJKJsznmBA?=
 =?us-ascii?Q?VeR5dgg+5XQKcITrYHAhex/IkFjvjNODEozwJXjEIRlg+4XZEyD8rBAYgYUE?=
 =?us-ascii?Q?przvyoatIl8Fs1W6bL3XKEh92mrDzCz8lovyf4fqBPYeDG3prZKDDX9kpchd?=
 =?us-ascii?Q?smGjVf+ufnpI42Ardm0Emvl4XpFJjHsDj/a1d0CntSSiAZNFjiG9kf8Xi0aG?=
 =?us-ascii?Q?w6oujdjvp1dsZiGoydtzH93lUpn4uI7dK8S1id/uBBfwm7okpDvbubJoZ0OS?=
 =?us-ascii?Q?Qlld28xt/bKAEHWKSk/rexEGxkK0rzSGvRWx63yuw21ciWn4xZ6rORD+MGvd?=
 =?us-ascii?Q?wVGLaZIEfSAJ50nSbNv3F8z3RTdmwmw2TosTj8YaLB8xpC5KVz7PevXDHs+a?=
 =?us-ascii?Q?EqtEcTbOKmtEGZTb7cg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:45.4114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a29c23d-3e30-4776-1af7-08de28ecf10e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492

The following functions, scattered in common/domain.c, and are only referenced
and responsible for domctl-op:
- domain_pause_by_systemcontroller
- domain_resume
- domain_set_node_affinity
So they shall be wrapped with CONFIG_MGMT_HYPERCALLS. Otherwise it will
become unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra
rule 2.1.
Move them together to avoid scattering #ifdef.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 - v4:
- combine commit "xen/domctl: wrap domain_pause_by_systemcontroller() with MGMT_HYPERCALLS",
"xen/domctl: wrap domain_resume() with CONFIG_MGMT_HYPERCALLS", and
"xen/domctl: wrap domain_set_node_affinity() with CONFIG_MGMT_HYPERCALLS"
---
 xen/common/domain.c | 114 ++++++++++++++++++++++----------------------
 1 file changed, 58 insertions(+), 56 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6935b7d5e8..c6b0f931dc 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1115,35 +1115,6 @@ void __init setup_system_domains(void)
 #endif
 }
 
-int domain_set_node_affinity(struct domain *d, const nodemask_t *affinity)
-{
-    /* Being disjoint with the system is just wrong. */
-    if ( !nodes_intersects(*affinity, node_online_map) )
-        return -EINVAL;
-
-    spin_lock(&d->node_affinity_lock);
-
-    /*
-     * Being/becoming explicitly affine to all nodes is not particularly
-     * useful. Let's take it as the `reset node affinity` command.
-     */
-    if ( nodes_full(*affinity) )
-    {
-        d->auto_node_affinity = 1;
-        goto out;
-    }
-
-    d->auto_node_affinity = 0;
-    d->node_affinity = *affinity;
-
-out:
-    spin_unlock(&d->node_affinity_lock);
-
-    domain_update_node_affinity(d);
-
-    return 0;
-}
-
 /* rcu_read_lock(&domlist_read_lock) must be held. */
 static struct domain *domid_to_domain(domid_t dom)
 {
@@ -1361,33 +1332,6 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
 
-void domain_resume(struct domain *d)
-{
-    struct vcpu *v;
-
-    /*
-     * Some code paths assume that shutdown status does not get reset under
-     * their feet (e.g., some assertions make this assumption).
-     */
-    domain_pause(d);
-
-    spin_lock(&d->shutdown_lock);
-
-    d->is_shutting_down = d->is_shut_down = 0;
-    d->shutdown_code = SHUTDOWN_CODE_INVALID;
-
-    for_each_vcpu ( d, v )
-    {
-        if ( v->paused_for_shutdown )
-            vcpu_unpause(v);
-        v->paused_for_shutdown = 0;
-    }
-
-    spin_unlock(&d->shutdown_lock);
-
-    domain_unpause(d);
-}
-
 int vcpu_start_shutdown_deferral(struct vcpu *v)
 {
     if ( v->defer_shutdown )
@@ -1616,10 +1560,68 @@ static int _domain_pause_by_systemcontroller(struct domain *d, bool sync)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
+int domain_set_node_affinity(struct domain *d, const nodemask_t *affinity)
+{
+    /* Being disjoint with the system is just wrong. */
+    if ( !nodes_intersects(*affinity, node_online_map) )
+        return -EINVAL;
+
+    spin_lock(&d->node_affinity_lock);
+
+    /*
+     * Being/becoming explicitly affine to all nodes is not particularly
+     * useful. Let's take it as the `reset node affinity` command.
+     */
+    if ( nodes_full(*affinity) )
+    {
+        d->auto_node_affinity = 1;
+        goto out;
+    }
+
+    d->auto_node_affinity = 0;
+    d->node_affinity = *affinity;
+
+out:
+    spin_unlock(&d->node_affinity_lock);
+
+    domain_update_node_affinity(d);
+
+    return 0;
+}
+
+void domain_resume(struct domain *d)
+{
+    struct vcpu *v;
+
+    /*
+     * Some code paths assume that shutdown status does not get reset under
+     * their feet (e.g., some assertions make this assumption).
+     */
+    domain_pause(d);
+
+    spin_lock(&d->shutdown_lock);
+
+    d->is_shutting_down = d->is_shut_down = 0;
+    d->shutdown_code = SHUTDOWN_CODE_INVALID;
+
+    for_each_vcpu ( d, v )
+    {
+        if ( v->paused_for_shutdown )
+            vcpu_unpause(v);
+        v->paused_for_shutdown = 0;
+    }
+
+    spin_unlock(&d->shutdown_lock);
+
+    domain_unpause(d);
+}
+
 int domain_pause_by_systemcontroller(struct domain *d)
 {
     return _domain_pause_by_systemcontroller(d, true /* sync */);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int domain_pause_by_systemcontroller_nosync(struct domain *d)
 {
-- 
2.34.1


