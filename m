Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DAFAC65A1
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999153.1379908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyH-00015R-8m; Wed, 28 May 2025 09:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999153.1379908; Wed, 28 May 2025 09:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCyH-00012X-5Z; Wed, 28 May 2025 09:21:13 +0000
Received: by outflank-mailman (input) for mailman id 999153;
 Wed, 28 May 2025 09:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvt-0001jE-VA
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2412::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c091df84-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:18:44 +0200 (CEST)
Received: from SN7P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::14)
 by CY3PR12MB9553.namprd12.prod.outlook.com (2603:10b6:930:109::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 09:18:39 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::bf) by SN7P220CA0009.outlook.office365.com
 (2603:10b6:806:123::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Wed,
 28 May 2025 09:18:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:34 -0500
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
X-Inumbo-ID: c091df84-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q50e1AzrIjvo3HCLlv0fr+21eXnJqcm6mNwEEMg2xlgMjzzj89BVtoOBpXt2oK4qkIpa2wFrE/ivYsKpPz7F058rsEkmhSIs4pjEVfqtf0RP3IBqKn89plRm7LXdZxJJ9uw4X3wJrVECfUXbFxyNPEgh10PgU8RlZWvHKwHlr9UKu2seNoBEfWjM1eG6PptCDlN38VpPzGu84HI4YGX82eGJOa3DhrAbhgY9STHtxAUdYkcwsZ1JW3kDh/Mccbq2N+uhYLp4qqS6CjfFUiIH+R7qi8V+WNhO5Qep+KFUFjNHqzz4v5z6vCOGB5PP/LoFtKzbekbfFFHwCSCkk4c01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OgIGJyIT/gZNe8sCFDPW5ddcNiwIXM6H4cqzDnIpR8=;
 b=J5LOtIPiWDsM+Pk9gFWLfe7ewMFgFc8WaN2qYq8F820hcfCFC8iHWRnf1Jx22FXEzQJrJ5mY2MA1kptDlwnBc3K88fLOR7xayrTS/v3zvmwboEODFbk6qEyMOm3MsQ+VctL2Ok0aflDILwqb45ZpSgitwocmfAf2MbN5f+Ffp6Ebe1tQaM4QfkZlLq2tYU9lAbsxRohS8suMPOSh8BvZ4xUuGqiQv9FlXFmuIK81Zu3aw4tes4Pl7+oWsAE/sIfATNyKTte20/P/BnKlOpCwYRCP19uyYON8I0lvJdLoAk+Ez8M3UKYm9ZkduzA05UMj51tZ/1c5SShXN8BACQih4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OgIGJyIT/gZNe8sCFDPW5ddcNiwIXM6H4cqzDnIpR8=;
 b=rET9iuTxcodOnYBSNkIWLFfQBnc7VmKaa7dpSyRQmUQka5prBz97JH+NIEQ+T2FjWde1XqAZd4iJ3a0h4PKj8ny3xZMlj0vsV1pGBqRBZm+JagvbIHiMqBSvx44x1zNNrpJcZYC/0GHbIsJzf+xPmIh/NaVpAVklTP1cOPxCkZs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v4 20/20] xen/sysctl: wrap around sysctl hypercall
Date: Wed, 28 May 2025 17:17:08 +0800
Message-ID: <20250528091708.390767-21-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CY3PR12MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: e57dbc44-e75f-4220-35c5-08dd9dc8a0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bTbkueuAhXjEcqwdaTjt461Fpz1wE8rmzHQLjXzDhL/YJgsJBI7gqMRi8cag?=
 =?us-ascii?Q?Kx5Jel6Alwp7t/YyjZswjXhINCFGl5RmCzWFlXUO23OJF29bEo7mLIgcdMQD?=
 =?us-ascii?Q?gqGcCXWR+n1PVScx8kpgrebUCzH/8bFlsWVg5hDhzt9KnbnCYZWaXqxEFmrQ?=
 =?us-ascii?Q?rQyolkwCK3vJS2Xc54vjM+LWzptvQphzTl/5VV7/Va4gXuljZtcvtFms3rMN?=
 =?us-ascii?Q?HMgiNpHArJbV+gX9+aqurf0GWdFIDcz/VYpl69Oox3FRWouisT0tO3iDs+EC?=
 =?us-ascii?Q?RgqhIOxaERY4FTKVeyft40rajyrqPW+UPixN10/3mqeoxBNM9ens5bYGwM9n?=
 =?us-ascii?Q?sRR77/bsOSvzscsLbnxy7kB/nO8LNgUko0/p8arR0UkbnIUHl2z90f3tJLkg?=
 =?us-ascii?Q?UKn/RPludy3Zq8MJ4m7FU9pPrYzqcByPKYGRhnzpoG0hHns+imEJF5a5Ai2s?=
 =?us-ascii?Q?ujTyA3IvmZYonDznLkIeXHoDv7mstzF+kS2vJatulqZHE3yYWvMhGQ3z0fs3?=
 =?us-ascii?Q?oh8hwGjWSlvGPHRLly2jFjx/k81O6+SwpVu2YrGLHniSoMwTNxWtB10uSN3d?=
 =?us-ascii?Q?uL7jGnvP93Q/6fmIn+a+lyRmF/pkHeHq1fxOcEco/djk8Bq/NRdy5oRDTM1D?=
 =?us-ascii?Q?doiZFkB6GHLnaukloNAUQlCz0uM9INirscl7gSUsceCUVga6om7ItcEI9LQD?=
 =?us-ascii?Q?qv9wSpxrO5cQ3rpT4bp38h4pKozvZP+mGnEC5uDsxVc7HR/f6FQOe8TeRDHM?=
 =?us-ascii?Q?3U/vDcx/xxaiRQjwOTtKZtjBOnwOOIgijKSQ3Bf7Vc116HwCDQ2pttMZPbNf?=
 =?us-ascii?Q?4gHZNHOG1d3byincY5CEuK38cZECNV49hgzcR1KfG/3+4HlirVd4ug9fUCfk?=
 =?us-ascii?Q?sur+VQd/iom2mSAOzC8Sy2uwkxjSfjBNfT2ryXPSY4VznQY/mXFzWEyfO/ba?=
 =?us-ascii?Q?z6CFQ498e6OH9dEZkEdiTaVdOq2NYBkt72MzlmyALIrcEBphdS4igzjsyh55?=
 =?us-ascii?Q?Zx7QmJXLddunD8/rQIfguVo6aVUEC39G5pGxcLvELwMevhBZTCImc+GIM2gz?=
 =?us-ascii?Q?EG7bpJgxJcVstG7SsbSqt//KbYhMhUWtJoTbX7Da3+VQgmJWrGHj9xIXptpN?=
 =?us-ascii?Q?OmehUSQdZ9MRJQDDYaPEUegjnjgtSC6XGfYoDIbJsI75MYblrcEQv6dOLxPF?=
 =?us-ascii?Q?x69LcVEqTD0r/Bhm5I95w9tfEioI8n6rlvLRYj+L38zyC90kozCAtZeQBcC0?=
 =?us-ascii?Q?mNZBHR4J20/AVPWOFYsky3nvs733SS1BPq/1yLdsnvcHn12iiMqrIsHKgNdg?=
 =?us-ascii?Q?Agh9TJ3f6lkoOpzgqt7TDW6AzolFe2zLh+6vaj9PEXpH0l7lOD7ALxr26c01?=
 =?us-ascii?Q?mVTKIs01BeYX/eq2s2BtG9x3hrS8OZd0MIKQhWJVSLwptJV9+3794Tn0tTlJ?=
 =?us-ascii?Q?tAMg1xeiBIVwfKj2Mn2NGNe/jO1sWnMLWji63Gw04McWArZzc8q25LURRJv9?=
 =?us-ascii?Q?6Erf3jW50ozpuzGWDwEdKtb7F8qWQtLGmd4D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:37.4358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e57dbc44-e75f-4220-35c5-08dd9dc8a0e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553

From: Stefano Stabellini <sstabellini@kernel.org>

Wrap sysctl hypercall def and sysctl.o with CONFIG_SYSCTL, and since
PV_SHIM_EXCLUSIVE needs sorting in the future, we move them out of
PV_SHIM_EXCLUSIVE condition at the same time.

We need to make SYSCTL with prompt back and state unsetting SYSCTL in
pvshim_defconfig to explicitly make it unavailable for PV shim.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- remove all transient "#ifdef CONFIG_SYSCTL"-s in sysctl.c
---
v2 -> v3:
- move out of CONFIG_PV_SHIM_EXCLUSIVE condition
---
v3 -> v4:
- make SYSCTL with prompt
- state unsetting SYSCTL in pvshim_defconfig
---
 xen/arch/x86/configs/pvshim_defconfig | 1 +
 xen/common/Kconfig                    | 2 +-
 xen/common/Makefile                   | 2 +-
 xen/include/hypercall-defs.c          | 8 ++++++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 6f652e145e..7d0cd45493 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -31,3 +31,4 @@ CONFIG_EXPERT=y
 # HYPERV_HYPERV_GUEST is not set
 # CONFIG_HVM is not set
 # CONFIG_VGA is not set
+# CONFIG_SYSCTL is not set
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index e3b6fd6ec4..f85593a9db 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -585,7 +585,7 @@ menu "Supported hypercall interfaces"
 
 config SYSCTL
 	bool "Enable sysctl hypercall"
-	def_bool y
+	default y
 	help
 	  This option shall only be disabled on some dom0less systems,
 	  to reduce Xen footprint.
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


