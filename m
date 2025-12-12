Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DDCB7D29
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184902.1507245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQc-0000iz-9e; Fri, 12 Dec 2025 04:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184902.1507245; Fri, 12 Dec 2025 04:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQc-0000g6-4q; Fri, 12 Dec 2025 04:06:50 +0000
Received: by outflank-mailman (input) for mailman id 1184902;
 Fri, 12 Dec 2025 04:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQa-0007Dl-Vv
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:48 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa09c7b2-d70f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:06:48 +0100 (CET)
Received: from BL0PR02CA0015.namprd02.prod.outlook.com (2603:10b6:207:3c::28)
 by LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 04:06:43 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:207:3c:cafe::9e) by BL0PR02CA0015.outlook.office365.com
 (2603:10b6:207:3c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Fri,
 12 Dec 2025 04:06:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:40 -0600
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
X-Inumbo-ID: fa09c7b2-d70f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGgh36HewgveIhSJU++TcdjVKNraelM3k76wzNfO8TBp0Ze3IEi8gmsaHHnNRk2hIfryPzJEfx3VRGabfwMniRtibZigKM03XwzTDZ4CqZWubcSZy/U2y/+gXbsoH4rhixRW7yLshNGTaQ9GqY1X5Q78VYyuhmiz0FSjvhkl4lVBHRzIJ0sKJ4aoMEsLveropRuZW39cZhu1H7MInPBTOTs7yUylAkcdXmmz7nDeBnYTjicyUal5mly4UQYQzZIVq0ywcYOQ2Gydlyf+ph8mPsbIwmqjz4bUyK5pVW3Io3I4EDFRNM4VyNoKZavGBwvsszTTSKSi0XZ+bVHL4uizBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSnQFrn0+BNHOUVlVgs7xAwawlO9+RHttRTFHT2TiAk=;
 b=FybDXFltopW2HQ0CAbfhsT/jfWTIipOmoNZEwiyhrXrM3FjCeK838nyPEE85yiyo6oszQjBw+yDWLg79G+RPV4oSgpijatynQk3ylMH+zbX3aIw5eP9UdAJ2BpWZCZIFxD0MK3ZNouFTYW4VjA2Kv8c4booXEcxZT3hIvkno6K3FXDjGJQYCvxpT28hL82tVwHWgqri3/FPX5A4UQMB5z6RI6Vgc8yCE4TWyaIw1FHKaUcEfpLrqfqKPlZJgl736f/AZUCFy8bz5IPYsDBtVsR2wIuP9A7JdJX1+kaPncLk2sUbPLY5QhL9o7jGizYOc+Bd84xDNMRbnr+5jIqcvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSnQFrn0+BNHOUVlVgs7xAwawlO9+RHttRTFHT2TiAk=;
 b=RaK6Kwizq+AaPl2RY3oggT0922Y0C/zu+BYVaekc1+X8rqtIbkEEG3/cnb0ofcSxnigrvgoaVCe6hnKSn0HTFB3/RoP4bPQJmUX53zh8lldGlCZ8j7CIhja3v8C6lDX6LQ2I7HXeWdh9ppKMmy/SZNF5zb0pmFX9mvsRjO/RbQ0=
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
Subject: [PATCH v5 07/24] xen/domctl: consolidate domain.c towards MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:01:52 +0800
Message-ID: <20251212040209.1970553-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 2feafb55-1327-4aaf-ff01-08de3933dc1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wDv1/wjajMPCINF+B1yiOk8U9MdJyDoyBjz7dhHpUTeapHVhnhQcw1qfUqcT?=
 =?us-ascii?Q?xloY6kPS2VXeVOX4zl3U3dqc9w3wipcLuGElQHtsSBMF9URL2AdHAXlxBmt5?=
 =?us-ascii?Q?YZkVo989kCV50q+fPVDwf26jiw7DXQ36fWPOWZRKqukat5KL2EMBTB6NRM+v?=
 =?us-ascii?Q?P/Yehx03m0fFj9giA/fY/6dv/v/WJCYjK4LKeJlFqu38Hz0gB3+q2C2hYpIF?=
 =?us-ascii?Q?kj8nNri5GIkdCZqBqC/XPzxaht8XqW9dDyerYL6lddc7pMeWsVuX0ufV4Bn/?=
 =?us-ascii?Q?0AALrgu6056YjH0YhytDgTv5QRH1/Ok/AUAAv3FMXecOsNoiRD42S8orjmTK?=
 =?us-ascii?Q?D3eR664HF9fGWyuxDrTU1Ib3XpSFKuyFKPk4lnKL4hAX5X7Wu3YmzU6TMUvq?=
 =?us-ascii?Q?eZZfnGl1DpEe7EqbtLF8ywtFKawsrY55zNP6s72Hg5OKr2aMQr0/0y8h1kDx?=
 =?us-ascii?Q?a4L4B9FnZ38szhko7H6IvtPrKMOA/l9YUkHCCZOYfZUGM5eWViYL0qCl92Dq?=
 =?us-ascii?Q?vFOL9Wbv4D8Mgl1cYVAY4L3l+Rzcs5vDLAGHfs+AYoR5eM8sW+m7gyUamR2L?=
 =?us-ascii?Q?74lhK59dyT2EWCIBOXViySi7MqxVPIO3yuoeRDthJFEUsb1pe17EN7P0R4f0?=
 =?us-ascii?Q?Mu7xwHAeQ4cURgKo7iufstRPnWE0qTPbW21EALiAFW1gmlw23UYb3AcGDCc7?=
 =?us-ascii?Q?ePrFOUwSsXNn424KvvmYpcunlckpBW15UL2b1mJAZg9uLaUWugHXjXud29QJ?=
 =?us-ascii?Q?YY6/xTheGStPVbtM6LEga930goP3goCFpU4Qdv2bYiHl3RSQq/g9Lz6g28Q+?=
 =?us-ascii?Q?vGhg7ZM/pHFw5Xi16z6PgNwrZ5rOYfxt0e3BW2/yXTvvQQxBLtkimZYUUXaV?=
 =?us-ascii?Q?ArYFeJ6OrPOB0Y5jy1GEG2uiErBB2GsCUdkPJON0jNlNExjTeLGLg2+zM3NO?=
 =?us-ascii?Q?O+IpPGr9nRZyUFELOoAja0Y7PBASoDpkyhKxda6tgAdONS+7c/M1WEYW/ijZ?=
 =?us-ascii?Q?/YhXh9p5VyYiVUV5A+0v2yom7QeP3DffAn+7prUYxIeDPgz3VQlwVxMIkt3B?=
 =?us-ascii?Q?UurJSgwXfWLwAZkvl0HU9h/w9eOsp+m1PTvWh943tx5JRBV2Z9bxVz06K8UQ?=
 =?us-ascii?Q?TK8HMSgXupAVBjcoqaDbq5VF4QfvhIYN6oCO6FdDsr2IqrsDL2K2BTz0Rv9a?=
 =?us-ascii?Q?c1UqFxz9T/Tk+/27/r8nrFFZrKt61UOB5RVUlk34mst6a5jzr7rTnpuKNtsI?=
 =?us-ascii?Q?XPhsf6LqHj9KxyymhGHecloPlxmqR8jALM2zhMSDfiRQQ5EqRGoRkGMRufmu?=
 =?us-ascii?Q?VhJYGv7wNJZd7kD/Y+7CXB0FRwJRItFBdhp2qna9TH2uKPc/LYlvakr5y3FS?=
 =?us-ascii?Q?BwLDFCk9oee3Y+zbwg8fOgPTp0+bOBh3IJ3DuZKjcKAG7jDN8gD/dBXI6DTI?=
 =?us-ascii?Q?3Kw/MDuuTU4UmKpldMLVybMkWBKpCv7N/yvMfQa+070Qh/gJgF6+DRHihGfi?=
 =?us-ascii?Q?A6uD0yxvG8fpzLxVv1tjpEq7MSf1ClC/8QLHMU1aW0BVxRMhGaATha+J5Bku?=
 =?us-ascii?Q?a8jnG4g6MPFhILJsLbo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:43.1849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2feafb55-1327-4aaf-ff01-08de3933dc1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437

The following functions, scattered in common/domain.c, and are only referenced
and responsible for domctl-op:
- domain_pause_by_systemcontroller
- domain_resume
- domain_set_node_affinity
So they shall be wrapped with CONFIG_MGMT_HYPERCALLS. Otherwise it will
become unreachable codes when MGMT_HYPERCALLS=n, and hence violating Misra
rule 2.1.
Move them together to avoid scattering #ifdef. And add a leading blank before
label to conform to ./CODING_STYLE.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 - v4:
- combine commit "xen/domctl: wrap domain_pause_by_systemcontroller() with MGMT_HYPERCALLS",
"xen/domctl: wrap domain_resume() with CONFIG_MGMT_HYPERCALLS", and
"xen/domctl: wrap domain_set_node_affinity() with CONFIG_MGMT_HYPERCALLS"
---
v4 -> v5:
- coding format correction and title refinement
---
 xen/common/domain.c | 114 ++++++++++++++++++++++----------------------
 1 file changed, 58 insertions(+), 56 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 93c71bc766..f24f3675aa 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1125,35 +1125,6 @@ void __init setup_system_domains(void)
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
@@ -1371,33 +1342,6 @@ int domain_shutdown(struct domain *d, u8 reason)
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
@@ -1626,10 +1570,68 @@ static int _domain_pause_by_systemcontroller(struct domain *d, bool sync)
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
+ out:
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


