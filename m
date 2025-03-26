Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B752AA71046
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927051.1329885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJoh-0005Dp-J0; Wed, 26 Mar 2025 06:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927051.1329885; Wed, 26 Mar 2025 06:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJoh-00059n-DQ; Wed, 26 Mar 2025 06:00:43 +0000
Received: by outflank-mailman (input) for mailman id 927051;
 Wed, 26 Mar 2025 06:00:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJia-0008HQ-Q1
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:54:24 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:240a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c355996f-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:54:22 +0100 (CET)
Received: from MW3PR05CA0015.namprd05.prod.outlook.com (2603:10b6:303:2b::20)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:54:18 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::81) by MW3PR05CA0015.outlook.office365.com
 (2603:10b6:303:2b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:54:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:54:17 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:54:13 -0500
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
X-Inumbo-ID: c355996f-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCceUlYjnHpbA8W4g01S2OWlFq68u6+fYt5wo2j+wzeX/RbJWBESsJvsdPCnvcIgZLjAwBf7hjazgrpGcqoV/uMV6Wa81bl2VdZo3oUUD5UaZHkNtf/iTcG8QaFTtFt9E1oViF+OPyl6W7LiDtxivWASChGm3H3IdzPEhqpE2Px45OGRD3gIoDZ8VYZQNMGuOOHdu0Ww4QOSQ1Q2pFrs22aKJyPA4I7sNJNe5ZmFm1566WvnSLEi0Hj5fLs666MDATrBGLvalVz70f0WP3kkVZ2KOrQAlr/DaJrEUSqoZnNO2Y1SST/hpESMRBlN7DfQEd9/dtuXXVdqs3S57Kv+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8MPf0x6OdT8+nJ6fBz2zA9OxP0+BJ0rh/tuxbi05co=;
 b=tUpPysRkztT0B68nlg2ZdHb9kGG1+3WxZdx9qcSmX1vxhMoLrH5XL82AeZLW/StdO6lPMPOjYRaFGEJf0Ggj+clWG96c1Nxz0lBrIqRNihTcj5K2woqC1AXhAb+XZAbnkd302eEYUCKJu4/LY7IfxiUdSyXTbgxkVMayw6vmRGZV8z+Pa1+vSuO5T7kTCmOtPj40h0sh1CL6/uZ71gEYbD1Bgk0/KXlv4yImQlfIXRQAPfmfjr9Q4EkahfiyVdfWkcVoOIhC55FIFctEhncM4Kc/GuIMP5Chav7O8Eg1KhZztadLl4KqcoMKfyEK/jpUzscqDJ66tyGI9/H+OVIY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8MPf0x6OdT8+nJ6fBz2zA9OxP0+BJ0rh/tuxbi05co=;
 b=jXovIAjHagOQnw1g0WpA8PniPhINeFQg/GKoLEXm9P7sCH66YNsxV44FvBa6D/uN4EKGkKNIgt4d8urOysOy4zAhJBJoXlpH55WCJVkxTsnC3NP7qnECFIHajMPF/Iu5NvwgbE2F7L9G4P/uEjenYGD9RI/NgnVyJesNxR9pwkA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v2 19/19] xen/sysctl: wrap around sysctl hypercall
Date: Wed, 26 Mar 2025 13:50:53 +0800
Message-ID: <20250326055053.3313146-20-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|MN0PR12MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: 244b3b3a-4207-44d6-b0ad-08dd6c2aa55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?skzT9pFq23cY9jgQqQD50Uh6z9X2yKH9S7Y2AiZ45+fYfwvUmqbKEZsH31l8?=
 =?us-ascii?Q?RJCBqZuYgZVM3WY++E19p1sg2TuIx80ItD4rKNpT6o49FeisGpuO9C6KWL49?=
 =?us-ascii?Q?Q0kOhj7W3oGZcR1ewnoyDbetzowQTzdUQYHIEQJnSzuEF8MGbf4MpgB5WbQ+?=
 =?us-ascii?Q?jyra4JNbLNAKEevhf6cziTb4KCf3Ueryn8xUJMdsxfiF5rvQ0KfKrB1zkEhe?=
 =?us-ascii?Q?yKqrlS6QdZfhlQJbnpIfZbrruDZeiQAU5xM+/F1ui7Om2NKilVEQpfmxXmu/?=
 =?us-ascii?Q?2TWPtWWqAWZCF+O0OI043/46HHYpJwuxHkqQkB1Ti4soM4FbQATNfuVPkvPt?=
 =?us-ascii?Q?WP1MyyIj6e1Ln3cHsL8qCy/yROmfKb6Nkhnig3/nsrLZ0R2I5YM5jwsVobEC?=
 =?us-ascii?Q?CJ7kOpjz8+erBhUJ+z063QA+lsnmeWufeJMsa2yjT7Zhy5tIsKcTfyNdWU/W?=
 =?us-ascii?Q?cfQCFbU89xq6EfqDxBuGE5PitQC2OGcFQhkCD8D9NS7hW0fL1yf9RhGpVrWE?=
 =?us-ascii?Q?VpEJK/mr2LtcQRLUS533e+vt13W1JEq8NJse6yh/ZocFsbnLGHJ+yDI03JSf?=
 =?us-ascii?Q?VN9l0WvyudT4Vu9nN3gwL2J184yIYjWgM8BwuUezPgcKH1YGURzeUrluq1PW?=
 =?us-ascii?Q?p6ujXabY3pkRXlmrUIISaa0eY3iB2SJPA8wtLPT1WqQDcFIWyJ2uYMtVnBev?=
 =?us-ascii?Q?H7soJBCj/l/rNvJ2ndvUeizumazhgmSW7hY8X/jL3rQ0LprLuGL2MNYFQ6Ap?=
 =?us-ascii?Q?6Z3aSCfAtXpOZWddpN+MjtqreETKitpzLqroCoLuWjIyGWz4fpsZ/MZIO+0e?=
 =?us-ascii?Q?hfo5CDsmNZjANuWHUrcXdiiXhSQVUNNvBjYBP4nWfrMoNWmLGPQ4u+lspFMS?=
 =?us-ascii?Q?JF8Ro7OTvS6px6lpn15SFEt55aW086eMuqBcFY9PlXCkfhkoJDQOJiZjAO2/?=
 =?us-ascii?Q?6+B8u3rp4mQZ1jItifSYO78lPEdsDQ2U/qa9EAPQp5GvbwMCww/RahS4gipB?=
 =?us-ascii?Q?CTvu6BQAEdSUDe5KSAeCHCT826BGPsYsQh7uYwxolpoKwsOdmNdqZmXt3ziO?=
 =?us-ascii?Q?5OLjNCW5CdB6+h2C6W335lcArOXD2HX3tKjSkjIdn+jB+yQXNJsHnCNZ2ghk?=
 =?us-ascii?Q?XfCYWGC2y4bS0nHvnLW6QNsY8qyBycZicvlKMjRksC3h9oHn2l2ZqDbiq+Zr?=
 =?us-ascii?Q?JhqP3HsCCL3OcIK3McstT9NvXMqeFVMzhv2yoLz4BlcWRo1oMeNkYUondjBc?=
 =?us-ascii?Q?UkhHhhAiV3FDguZfSu5bC3jySXFeBF/Yx609BtId5Zk23W0w/x/88H1UBYIY?=
 =?us-ascii?Q?2OfEhaIh/KaVT9HlsYJ5odX8gg7vYL1sFWt02NIHi8j3Oxd99pRm6eQRTjTq?=
 =?us-ascii?Q?Dx0GLpMsZHiQx0wH4SY15rWIp7ZA4PrHwcsKnXldqn8sWNKLyQ8H1i5SUc4Y?=
 =?us-ascii?Q?r54JhgV74JZny4xniaeh57FSkiSgQZq4G8U3CPkNaX4JkDrotqY6qUWWiTwP?=
 =?us-ascii?Q?5awrQI6qzFfJNJ8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:54:17.4010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 244b3b3a-4207-44d6-b0ad-08dd6c2aa55f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930

From: Stefano Stabellini <stefano.stabellini@amd.com>

We intend to wrap around sysctl hypercall, and also correct the order
alphabetically
We also need to removes all transient "#ifdef CONFIG_SYSCTL"-s in sysctl.c.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove all transient "#ifdef CONFIG_SYSCTL"-s in sysctl.c
---
 xen/common/Makefile          |  2 +-
 xen/common/sysctl.c          | 10 ----------
 xen/include/hypercall-defs.c |  8 ++++++--
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index ac23120d7d..d45dfeb5b6 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -69,7 +69,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 endif
 
 extra-y := symbols-dummy.o
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index b0e2e43c7e..ba8c5e2266 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -58,7 +58,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 
     switch ( op->cmd )
     {
-#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_readconsole:
         ret = xsm_readconsole(XSM_HOOK, op->u.readconsole.clear);
         if ( ret )
@@ -67,17 +66,14 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = read_console_ring(&op->u.readconsole);
         break;
 
-#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_tbuf_op:
         ret = tb_control(&op->u.tbuf_op);
         break;
 
-#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_sched_id:
         op->u.sched_id.sched_id = scheduler_id();
         break;
 
-#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_getdomaininfolist:
     { 
         struct domain *d;
@@ -117,7 +113,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     }
     break;
 
-#ifdef CONFIG_SYSCTL
 #ifdef CONFIG_PERF_COUNTERS
     case XEN_SYSCTL_perfc_op:
         ret = perfc_control(&op->u.perfc_op);
@@ -129,7 +124,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         ret = spinlock_profile_control(&op->u.lockprof_op);
         break;
 #endif
-#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_debug_keys:
     {
         char c;
@@ -188,7 +182,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 #endif /* CONFIG_PM_STATS */
 
-#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_page_offline_op:
     {
         uint32_t *status, *ptr;
@@ -300,7 +293,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     }
     break;
 
-#endif /* CONFIG_SYSCTL */
     case XEN_SYSCTL_numainfo:
     {
         unsigned int i, j, num_nodes;
@@ -490,10 +482,8 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 
     default:
-#ifdef CONFIG_SYSCTL
         ret = arch_do_sysctl(op, u_sysctl);
         copyback = 0;
-#endif
         break;
     }
 
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 7720a29ade..322aa6eb09 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -195,10 +195,12 @@ kexec_op(unsigned long op, void *uarg)
 dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
-sysctl(xen_sysctl_t *u_sysctl)
 domctl(xen_domctl_t *u_domctl)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 platform_op(xen_platform_op_t *u_xenpf_op)
+#ifdef CONFIG_SYSCTL
+sysctl(xen_sysctl_t *u_sysctl)
+#endif
 #endif
 #ifdef CONFIG_HVM
 hvm_op(unsigned long op, void *arg)
@@ -274,8 +276,10 @@ physdev_op                         compat   do       hvm      hvm      do_arm
 hvm_op                             do       do       do       do       do
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
-sysctl                             do       do       do       do       do
 domctl                             do       do       do       do       do
+#ifdef CONFIG_SYSCTL
+sysctl                             do       do       do       do       do
+#endif
 #endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
-- 
2.34.1


