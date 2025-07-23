Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A9B0EB06
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053319.1422074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTMa-0000Ot-W4; Wed, 23 Jul 2025 06:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053319.1422074; Wed, 23 Jul 2025 06:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTMa-0000NS-Sd; Wed, 23 Jul 2025 06:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1053319;
 Wed, 23 Jul 2025 06:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ad9G=2E=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ueTMZ-0000NK-Vq
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:54:03 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2415::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0706c93-6791-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 08:54:02 +0200 (CEST)
Received: from BYAPR05CA0097.namprd05.prod.outlook.com (2603:10b6:a03:e0::38)
 by DS0PR12MB9728.namprd12.prod.outlook.com (2603:10b6:8:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 06:53:58 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::39) by BYAPR05CA0097.outlook.office365.com
 (2603:10b6:a03:e0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:53:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:53:57 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Jul 2025 01:53:53 -0500
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
X-Inumbo-ID: d0706c93-6791-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKZhfkW6szCBbKr/BW2zjuYLqwWYWZoUplaNv4I3mgfDNs/cKCKUrix1IZ5mRGPr3KjsI/Pr2oaPiDnOdv0r/TGNGMeRAWQ7DirSxHbaqTMnLs6SwLVTpdQJQILI5jEobqGegAA6pDTDkxbQpvDHFYXQ//cJkrVCOpCsoiJ3BS+gRbcwq2G6Gio3+Z2w4qg1kVGKyIPVmi0Mh12PXBeY1PK61gCY4lof4PUjUqg4zYJmVnB9oWKLMH1dqW1rvBP1wfdb5hY9S/Boo4gF3Fn0ZtB+Z2Q0Hddxtyj6OSY5ipE5LEbtz77XrNlzeqYQAK73Ah++wG9anwPPp6NH7s7FcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyMEOiDAC6cTdjm1z7YemfcJPrj4nzyhzLEJWpy3Ks8=;
 b=ff6VLQmBAqaUH7SFrLqrdWMoicZLYdbqby0bEM6xyBK3cNH5juIiHtJW7FQBMBK8ulnbZbTWJZto57la935LMCouul2ORTu4y7rN/y6XHbqeI4W4mupoQeZXjezt0mMNis1oFLXvkmRMdl/0yNSL9sZlrfWXM+v2az13U6HKj5b3aJygGhamhmxhk46X0VvBrER0MNrzLutcZz+1WxMhMmXRsNf07JOwT0Ime32mcg/Q8LD87+9093yHeV32DaHYCCJLUTwKalG7EdzyFezwPhdgb+I6Zo5E5iRksN6AoZZVHTId3vfQKXtLI/7EQoW47G2J8yMTTuNUKV5UVG27Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyMEOiDAC6cTdjm1z7YemfcJPrj4nzyhzLEJWpy3Ks8=;
 b=hSFJ60k40iUuQEor5T/Ag0aF5hDWyiI41N2uN5knjSM6rdH5YAHiCcQDoRV3AArZHlDGO+mDB5EWLsd4Cnthv8eRfE9JvNb8m2yWM5FcjnQzgiqRn+3qMkgQK8ezXkW2OCejGBTOTw4YtM7oovJThCq1ltL+kBYcaSmAm911rXw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1] xen/domctl: make domctl_lock generic
Date: Wed, 23 Jul 2025 14:53:25 +0800
Message-ID: <20250723065325.1452007-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|DS0PR12MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: 05eed4aa-fa7f-499f-c62f-08ddc9b5b22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vQLYLq5TI3GiFu+JDmjKKUXaPJY6IYXTOlCU72QkN+B1uWzw9F5xJRzEy932?=
 =?us-ascii?Q?HA2U3g17NWOkjCRCFAFrC9/RFuoO3Ql4zPA6mOP5Td71yxrsLR/vzvUC1XbX?=
 =?us-ascii?Q?KC0bgr+QJclw+6hzoo1ePhIdtIL+6y/zu+RLrvqo5B7+as6oaSJIaDH7TI1x?=
 =?us-ascii?Q?rLJDLtFULhbzfWVzM3AM7+M332iImiW4myG+noz+xP5sJwJzaGwjIQQL9+el?=
 =?us-ascii?Q?oROTG5jhWCx530Cu1DSc/T4M3vj5MqfYaug07VNTeB9VOEiT4u1pk7Vq6q3H?=
 =?us-ascii?Q?2+7IhN+KUrVszog9jdpGbSpcgcuMQkaCPUnVM4JqP8yfOnzpmkbZxnu+58dB?=
 =?us-ascii?Q?woTZn3dFzj7pkpyDnr+kZ8YazTbKF+JRMbrHYIANd+6V/xL9PUcxFHReGLIR?=
 =?us-ascii?Q?yWs/YKOtSVyIcdtpPdz2RpOVNHWTC9wgceGPJ7SN19iOSKY1rtiO1vUW48lH?=
 =?us-ascii?Q?/kyWb1qh7tUEFEukdFY+UgFdmyinrfLHcCxIY/ST8fr8kl10TOTzGsnRqOOj?=
 =?us-ascii?Q?OPlN+rESQe10zkPIlIrFcR3Sd2Nb1Hvb/d5Y7lCWO2YuNsBjc2nBW2w8Zkfj?=
 =?us-ascii?Q?CtCkO8Z02bVxbrsxo/Su5JonKRzrOx38NgFw1ZeRhuVlWC8PCVCIxR4xg+bC?=
 =?us-ascii?Q?6yxBL9Z7/UNjthTMeIVbjqiWnrXeW0LmKD+k/Et6VtS6hs1UrO4gQu7sk5ev?=
 =?us-ascii?Q?E7edoWOKIZgCCKoa/ue3Or1UUs2vfcOANLt9AZQzhlOis/F5lIIiQYui/dYa?=
 =?us-ascii?Q?qgdvz+qM/YY4DAKhP3Wwt/qDI08ohPG3KBcNKNMhYOGPG+N/e3i05j4juZEm?=
 =?us-ascii?Q?fRs2AuG56vzelwZQ57DHxKEWrSLhlHj7Cq5pG+mNXOu/Q4srQHaRv43wlwGl?=
 =?us-ascii?Q?/gLRAiCIXsnXcKzX1hkN74Cu+/kVqfojrY1R66CXaRUwmec91HWQ6skA/WjA?=
 =?us-ascii?Q?b3r5hbCq9tYF/O1OOZtGuqNAhwTgxTaHqG+u7Gr+5SHrBt/0xXoKRAtDvnzk?=
 =?us-ascii?Q?NkPcSCykOBp9PziAMFt3KdhlPXg3/6HEmQbSJ0nSa70/T1U7i7BTh9aYRjod?=
 =?us-ascii?Q?zh1qz6opC+Lm9vw3leH1LwRLhADAYRlYRKPIEikzG5xyP/e8eA0bD3MLdK/R?=
 =?us-ascii?Q?b9w48badg/cDYW7cuWoYK2dv/0LKp9T4BtGAwYr9OHfgn+nOyUgPLeHS8+Qp?=
 =?us-ascii?Q?jlc+bTbToOonNG5BdsPDn+wT1efT/doPF0RTEzExTJwV9k5suXyKsPPkczM5?=
 =?us-ascii?Q?MOOcX2HqUgCIdZS1JIaAvgPML95V8EwcppHzISW5nDenY1l306GU86LD6itG?=
 =?us-ascii?Q?GptwEIL3HUn3qpxrqJfdsLUEYlhda0z6w6tvN3BPHXj466wFwQRPolDihs8z?=
 =?us-ascii?Q?pMHkmwMdPjBbbRmfR3ge/8As8x5xbSN2rKjkOpJISxC6G3lwst3FWYjiGB4J?=
 =?us-ascii?Q?5TvCxASBT4gKy6TDp4LQXCexU0FHdELfo3UITyeguCpJvruXWnFDIz+/ip4W?=
 =?us-ascii?Q?tS2RrenxksjRylvGQ3Pstp55FLYUebp7WEZ+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:53:57.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05eed4aa-fa7f-499f-c62f-08ddc9b5b22c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9728

Not only domctl-op could do foreign updates to guest state, some hypercall,
like HVMOP_set_param, could also do, and they all need domctl_lock for
syncronization.
Later, we will introduce CONFIG_DOMCTL to wrap domctl.c. In order to
continue using domctl_lock when CONFIG_DOMCTL not defined, we'd like to move
domctl_lock_acquire/release() out of domctl.c, and into more common space,
domain.c
The movement could also fix CI error of a randconfig picking both
PV_SHIM_EXCLUSIVE=y and HVM=y results in hvm.c being built, but
domctl.c not being built, which leaves domctl_lock_acquire/release()
undefined, causing linking to fail.

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/domain.c | 29 +++++++++++++++++++++++++++++
 xen/common/domctl.c | 29 -----------------------------
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index b74d4c7549..6145071e55 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -66,6 +66,35 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
 
+static DEFINE_SPINLOCK(domctl_lock);
+
+bool domctl_lock_acquire(void)
+{
+    /*
+     * Caller may try to pause its own VCPUs. We must prevent deadlock
+     * against other non-domctl routines which try to do the same.
+     */
+    if ( !spin_trylock(&current->domain->hypercall_deadlock_mutex) )
+        return 0;
+
+    /*
+     * Trylock here is paranoia if we have multiple privileged domains. Then
+     * we could have one domain trying to pause another which is spinning
+     * on domctl_lock -- results in deadlock.
+     */
+    if ( spin_trylock(&domctl_lock) )
+        return 1;
+
+    spin_unlock(&current->domain->hypercall_deadlock_mutex);
+    return 0;
+}
+
+void domctl_lock_release(void)
+{
+    spin_unlock(&domctl_lock);
+    spin_unlock(&current->domain->hypercall_deadlock_mutex);
+}
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be looked
  * up by domid, and therefore to be the subject of hypercalls/etc.
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 99de77380f..455fbc5160 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -35,8 +35,6 @@
 #include <public/domctl.h>
 #include <xsm/xsm.h>
 
-static DEFINE_SPINLOCK(domctl_lock);
-
 static int nodemask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_nodemap,
                                      const nodemask_t *nodemask)
 {
@@ -65,33 +63,6 @@ static inline int is_free_domid(domid_t dom)
     return 0;
 }
 
-bool domctl_lock_acquire(void)
-{
-    /*
-     * Caller may try to pause its own VCPUs. We must prevent deadlock
-     * against other non-domctl routines which try to do the same.
-     */
-    if ( !spin_trylock(&current->domain->hypercall_deadlock_mutex) )
-        return 0;
-
-    /*
-     * Trylock here is paranoia if we have multiple privileged domains. Then
-     * we could have one domain trying to pause another which is spinning
-     * on domctl_lock -- results in deadlock.
-     */
-    if ( spin_trylock(&domctl_lock) )
-        return 1;
-
-    spin_unlock(&current->domain->hypercall_deadlock_mutex);
-    return 0;
-}
-
-void domctl_lock_release(void)
-{
-    spin_unlock(&domctl_lock);
-    spin_unlock(&current->domain->hypercall_deadlock_mutex);
-}
-
 void vnuma_destroy(struct vnuma_info *vnuma)
 {
     if ( vnuma )
-- 
2.34.1


