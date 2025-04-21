Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC85A94D5F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961055.1352705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lls-0005xj-MB; Mon, 21 Apr 2025 07:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961055.1352705; Mon, 21 Apr 2025 07:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lls-0005vY-IN; Mon, 21 Apr 2025 07:40:52 +0000
Received: by outflank-mailman (input) for mailman id 961055;
 Mon, 21 Apr 2025 07:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljv-0007m8-IQ
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2414::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa83b2ef-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:50 +0200 (CEST)
Received: from BN0PR10CA0005.namprd10.prod.outlook.com (2603:10b6:408:143::19)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 07:38:45 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::5b) by BN0PR10CA0005.outlook.office365.com
 (2603:10b6:408:143::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 07:38:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:42 -0500
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
X-Inumbo-ID: aa83b2ef-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWfluo6nysMMOpwDbLL8MWabMVj3oZJwOs/FcIjOzKNISCH+IEGaYFsuySXZcrcMF6VYBzfCzPBocYswpP4+HXjSSvonMFn+CaL7qsY2MisqwxnaMaRAL7LO94YXx93nuWS4r6VpUDgT/kBfM61hiWS6HAi57opZB5CKwgwyVYLKMWmd10ATpNdIzCV6eQmQ7/akkVevXQHnta+HvK1RRZPTfIMHLRo28491wMeRIDn1A8lexrg3qunT2Dn0aNWnVLcLiP/1IM8Zaxvgn3yZRCRSjotY2wk5pL+heKBV8m1QywjNe9kWt3lz4OcgxWBim4S3Ct+2N9mMzkEubFv3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYj3NqbBx+0ow/uBVXY339j3B712DE1MxpwDgkbl8mU=;
 b=kokUlbEeK7YosUUK6Hye8ruzMNSSCwF1Lp9JzWBbn13XXX2VwXKyfLLuy/OqcjwRqQQmv8jdjaFLI6rfhUBkXko6C9bNEYyLYYgubQa3nESdM1dGX5f2L5K5dOKWPjlQfG2TMwiMKSM52As4mwwj3KaIyvSWWCNSte9zo334xE3DiBIuj0KpA9+inQ6NBS1GQ5ccciF8XbaYHZqN6t/Exl7Ynzq6PCLdvpiXMdtzXj6NeoGLPElkeuCIz8Bnqxp92n3cgTTfwUlM907P2KF1sMZcHdPePaRATjLYgWAtiytH0jZxNYNg1tsD9ehtzwKGqr/gQdSCTau+G+bmsylPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYj3NqbBx+0ow/uBVXY339j3B712DE1MxpwDgkbl8mU=;
 b=DsG+pF12LOZ+qYY9M0KVT2QCR8yR71r29z8u2WQASSfsQ543fgUYxqnyW5l+wyl/NUXmBB9R6BX60gwm06eLlosNrP/aZb4sfuIHYgsNcpGncr3rTssvfCupfY/qqR7egDM2tUGYMr+aUt2uBm5n8i5r98oULG5w8+pXpqARJVo=
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
Subject: [PATCH v3 20/20] xen/sysctl: wrap around sysctl hypercall
Date: Mon, 21 Apr 2025 15:37:23 +0800
Message-ID: <20250421073723.3863060-21-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbd242a-5e59-4a35-f68e-08dd80a78c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2A+1s7RxTFS988xkHiAILteWDobbnfTEasITg2w9vgncR0bhzhVp5EOBY12L?=
 =?us-ascii?Q?chc5H8aO7IaJ1o/8VgwtZBhOsQsM4ixoBRbg9tXjqgn8M4oF/ZVwS4F+JSQF?=
 =?us-ascii?Q?CcOXVogGb8IzrDmv1yR9B1gScaj9CGHZPIzjFiflTJs8CFjJp3+ra+9omCwj?=
 =?us-ascii?Q?GILjrK80IDMZal6n2XffnCYNQFQgRjkqbBLRLZlDeKJ9FzjzVFQYBz6cwhfp?=
 =?us-ascii?Q?WUsTdJCX8NNS29xzq1iZJA1Or4xunwBXZ9wmZ/v6ImOxKg+ZwxBcsGpy1lnK?=
 =?us-ascii?Q?kLPXoWeSu3FkASMqjvLrVAZALe5xvTf1RAwX9e1NuTeHDZjzXu7i5XiusUN8?=
 =?us-ascii?Q?cZ03ZuHUk664QxARquYLzctiCEIoep71ro3WnalCLDh2x05e/BQn+sCzfFXf?=
 =?us-ascii?Q?IDLKfgshQf3WbsBNPvMIWvJhVX0i01GcdBKxjAI8FcPPBkvO10iY0r7sh4Rv?=
 =?us-ascii?Q?asLIq7/EaWGJwOsp+od1OQD6HJu5/7KIre4h4WqUf3HzMZLDZWfUz1dpJr84?=
 =?us-ascii?Q?hM0UJ0t8+ewvB6dmT/+bz+5b4G5vwt0QgNUp2oB5JasHe+akfD6RZ5XSwGKS?=
 =?us-ascii?Q?hB+M8tBq17OghXfy1Iw/Ueo7cI+V74YXOozw0cPfvM0R78dgcjccB2CNhRX+?=
 =?us-ascii?Q?YPxsMyNLKRi58s+7+yt1BVdUzv3keN0aproPemXZVp4eIWE3Fe9SezzYtSkn?=
 =?us-ascii?Q?nwByPPnrZWCXymEjJ4khvHZMnQmSMbHQ7NlYPCq0qjMuiFVdIDcsc4VnTCXJ?=
 =?us-ascii?Q?Ls3MceFWw5Z4I+nrnoaB/MYCoCspJ99smOP35K4nJA72uWrforKvL4n/j/z4?=
 =?us-ascii?Q?ZJuBo+zKkNwRVERgrdCHquS4OVc7Cb348F5l539YVBYqqRpB04wPYuWIZVy8?=
 =?us-ascii?Q?Eh8PdXY0rj4H0OGP+qMUPLotttnn8aU36VZmCohvI8YBkxVRtnbasFZPt68X?=
 =?us-ascii?Q?kfhFSZdM6xPx0CDizJTA7nSdDihP7Ddvsln8hUzE5QgqS/iQzMiMfyXCYHqs?=
 =?us-ascii?Q?jRRAM85PqAi3IEOapoDoyRRSAo7fAdpYma3Ja8woc5fIx5OY+iT6lV+yNSH6?=
 =?us-ascii?Q?aqloJ0WRKQqhklHVi9OJIDzVqWDFIkfRxkRiz6XBjs7Xhg3ItIfTZtYMebyH?=
 =?us-ascii?Q?ibjFfBLUI+ZjGu6VvRfUqmuD3Bb7zAyc4geqoefZyFLdkZdaW9oqcPZmE0yt?=
 =?us-ascii?Q?yABL/WEgolVTXWHHtP7gg3J7FIUKgWvIuvpRy2Iq0IWFeEi0xiy7Pqrz9tk3?=
 =?us-ascii?Q?zEgcv6itt3pG468ylPWw/VPYUIXfA3ELQ3JWsw1SuVQLlMchbLXmxkf5Rokw?=
 =?us-ascii?Q?v022+2kONXMMemwbJy4iFMQWXDRSGASlO4+qKSJKLOppWJiBf/HoeeKaiUsH?=
 =?us-ascii?Q?3Bstpj5vME05IV6w/bgcCgbYx+WcuiChYyaIzymJ10dhifEmCco4JixfuyV2?=
 =?us-ascii?Q?q2fl7w4La6yFh/jGQb3QYcUubbVdykXCOtnch1AJ6hmRg/98OZde96zu+BNn?=
 =?us-ascii?Q?T3oQWw4bgln3Nqs6ji/VqVpDNSnlrIXTL9ti?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:45.5184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbd242a-5e59-4a35-f68e-08dd80a78c24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

From: Stefano Stabellini <stefano.stabellini@amd.com>

Wrap sysctl hypercall def and sysctl.o with CONFIG_SYSCTL, and since
PV_SHIM_EXCLUSIVE needs sorting as a prereq in the future, we move
them out of PV_SHIM_EXCLUSIVE condition at the same time.

We also need to remove all transient "#ifdef CONFIG_SYSCTL"-s in sysctl.c.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove all transient "#ifdef CONFIG_SYSCTL"-s in sysctl.c
---
v2 -> v3:
- move out of CONFIG_PV_SHIM_EXCLUSIVE condition
---
 xen/common/Makefile          |  2 +-
 xen/common/sysctl.c          | 12 ------------
 xen/include/hypercall-defs.c |  8 ++++++--
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..15ab048244 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -49,6 +49,7 @@ obj-y += spinlock.o
 obj-$(CONFIG_STACK_PROTECTOR) += stack-protector.o
 obj-y += stop_machine.o
 obj-y += symbols.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += tasklet.o
 obj-y += time.o
 obj-y += timer.o
@@ -70,7 +71,6 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
-obj-y += sysctl.o
 endif
 
 extra-y := symbols-dummy.o
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 85a1adacdd..08174a924d 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -58,7 +58,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 
     switch ( op->cmd )
     {
-#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_readconsole:
         ret = xsm_readconsole(XSM_HOOK, op->u.readconsole.clear);
         if ( ret )
@@ -66,17 +65,14 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 
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
@@ -191,7 +185,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 #endif /* CONFIG_PM_OP */
 
-#ifdef CONFIG_SYSCTL
     case XEN_SYSCTL_page_offline_op:
     {
         uint32_t *status, *ptr;
@@ -302,7 +295,6 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
             ret = -EFAULT;
     }
     break;
-#endif /* CONFIG_SYSCTL */
 
     case XEN_SYSCTL_numainfo:
     {
@@ -493,11 +485,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 
     default:
-#ifdef CONFIG_SYSCTL
         ret = arch_do_sysctl(op, u_sysctl);
-#else
-        ret = -EOPNOTSUPP;
-#endif
         copyback = 0;
         break;
     }
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 7720a29ade..c1081d87a2 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -194,8 +194,10 @@ kexec_op(unsigned long op, void *uarg)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 platform_op(xen_platform_op_t *u_xenpf_op)
@@ -273,8 +275,10 @@ physdev_op                         compat   do       hvm      hvm      do_arm
 #ifdef CONFIG_HVM
 hvm_op                             do       do       do       do       do
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
+#endif
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
 #endif
 #ifdef CONFIG_KEXEC
-- 
2.34.1


