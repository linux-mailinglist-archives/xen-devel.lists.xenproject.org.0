Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838FB0D8C4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052390.1421082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfd-0004n3-F2; Tue, 22 Jul 2025 12:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052390.1421082; Tue, 22 Jul 2025 12:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfd-0004hs-6O; Tue, 22 Jul 2025 12:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1052390;
 Tue, 22 Jul 2025 12:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfb-0003BS-5Q
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:31 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20624.outbound.protection.outlook.com
 [2a01:111:f403:2405::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7563d586-66f3-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:00:29 +0200 (CEST)
Received: from SJ0PR03CA0247.namprd03.prod.outlook.com (2603:10b6:a03:3a0::12)
 by CH8PR12MB9744.namprd12.prod.outlook.com (2603:10b6:610:27a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 12:00:24 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::f4) by SJ0PR03CA0247.outlook.office365.com
 (2603:10b6:a03:3a0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:00:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:23 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:21 -0500
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
X-Inumbo-ID: 7563d586-66f3-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLwqj8LQZ78rXtxnjjQL2nCq6bqEXT1cclQCgPycTOlhxfaLw7TM63EteBpqtxtL5gxBG36wMgPPI8EEpi1afkLM8/KdoWvHmM/7D/hGoKxmv5OszBfenKPyD/PPwqod1swpGgviUUvprDJiCxUPJtpoUHKXJoCo5RC35dESUrDb0ICMdzVpOPPKKJTWlo51MWUpN6Ac+moUSyiNLTqcQYX0GOws62wvcWWg2Wi/zcsfPgPBw5vakmV3+efxPT9pdmsXnIItRExLtcSc2O3MVhyzwLuFIqk5vV5EN7qTVoVNud5WGwDlqvE+2rV2TXqs463cgcjOyFP3tKSMPuBhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30I35MrvL2cyCpeRQGHbELhQPOaqm7vu8acc/h9pO2o=;
 b=xIqEJjwXzzQNq2cy2QkBueSU+To/jjoNkjTXntNVWUFmlxUT++2DZkHG7Tljr71q0PYJon5GcEnmQn4jZIRMicCwYTaEtYqev+6nUM3p7nKsgMtl5pdd5ShqtNafyyVqTIvODW7S3POXthuj+MeiYKnjxuuEYc4AwH0ZAAO3JP5WNqnv6XqHXGW5vyFuQ5smzGdk6WPFTJha9E92axTFZ8kQsLMUd7kQLFOUYAsEzam3sD8fqMiG7EmLrs20ghBcFDEBeBvHHMIDhTSY0jzJD54teTW+EYfiqFKaF5mxU6gH70n28NuZqPZWJyXp77KciYKWRN/iUgnT0d6qkzZJtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30I35MrvL2cyCpeRQGHbELhQPOaqm7vu8acc/h9pO2o=;
 b=NLQYh37doSGEcvNNTebRX0JPnT7gYfTOGKdoO1+vJHnpIxB/4/Hp+beH+gzIf9ecOERrsb0wry0hlAa8wFSF+K4dMlor3GRWuCEbHdeISaFGRW4YGbQV4OtLiqqgB49vJIRkV+/t7Ipht8aMC/K2epoXm1eS0B2rd/cqu/rbibs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 07/10] dom0less: Turn arch_create_domUs into arch_parse_dom0less_node()
Date: Tue, 22 Jul 2025 13:59:47 +0200
Message-ID: <20250722115955.57167-8-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|CH8PR12MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6966b0d2-cbb7-4ad8-cab3-08ddc9175722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E1JZA+4Qn0tIsIp6oZzDSKFKpVQHjxeUUgBcGbEy/gktX4GYZi0sggtbGIUg?=
 =?us-ascii?Q?fuO63n1D/dgeiXjmSpRGu0vM+iTLBHNIhUJxnQzQNFB5MnYSP679CujKMIB6?=
 =?us-ascii?Q?iqdY1vDvxlsdmLG2vUJtK/s6FnOFhUcDMAU+ofqVLKcWliGr9bGsb9l6P5r6?=
 =?us-ascii?Q?eKBVCVF5OWjncOwA+5C+lCvONL4FQCH/pVHoTgxC/JAiPhmdvrXciwlXajG5?=
 =?us-ascii?Q?I66FG53I5xe5pHRt1FPjblcd8gvyRMI8r5TwQehsUd2QhA90fSCaqi+nLYO1?=
 =?us-ascii?Q?r0yMC29uTRJj0tDNf0lhWbXpvrzDAiedWhT0DiCVsBSqWx4DWkQqWbAtGTgb?=
 =?us-ascii?Q?0JR2sl7VJydDdum6+xoPwobaJ7sC9taftD4cI1ikWXmrYIWYLUb1nlJ7hq+P?=
 =?us-ascii?Q?jJ6MOdFypTu7nIO4K9HtHyShBd7ILFxJpkj/kLRMdH5Try6fzPF+R1YVBYmE?=
 =?us-ascii?Q?ORKmHZfqfdA1MUJs8YuAF8Mn2LBavUNwCw7CcKUIj/3py/xF9FhB1U7od9QC?=
 =?us-ascii?Q?aJaXkdVvTnbitUUAtpcEpMJmZvkT0iBpTmXnB6jMo7+mvAcKvIDiPjs8l2VV?=
 =?us-ascii?Q?4nTZoDfTskAv8c6H0fmQLVpObnLFQcHr7wlDs+G0WQDGk5pkk4SVMN+ohxWq?=
 =?us-ascii?Q?mtvg9xu9VT7VtH2XHQZOsvKvi9EuWt5Tl3Kp5rcxnVQkgjjrmAfim5Q6tc6P?=
 =?us-ascii?Q?hRuB+r4lQKyj9rc42QoDIrX5BdfnyfDYE7QFGg5v36C2J9EFgeEldJCTCUN5?=
 =?us-ascii?Q?pRAFJAjIszWk+iu00TAVchErHAbRmFv7pscIkkkiVTfAZJ65c0HtzhPUK7L5?=
 =?us-ascii?Q?OwslrhTFTifRbS3OWkjIlLLl/7AZkCJ8FNNUCrOnG4cvO/1YQ4/qyOt9JgUK?=
 =?us-ascii?Q?FPYOpbFNo4XYMMG9eEIOzJqttLsMeyazAIa2BSAo8BwxUuCI/sZ9samk8uTO?=
 =?us-ascii?Q?zDoUtn13fJ70mNMQN4dVR7cxE/uJfRkDHcY82MsuwckAyzUWeTkZOP/2CCZe?=
 =?us-ascii?Q?jR2h6zPneVL0IZ/ToltLLc6LE2l7EpPTgUcOFlSLOT1HWpQZpIDVbn1baYwQ?=
 =?us-ascii?Q?OWSfGXJDG08bZFXizYR1xk3bcdpdwj0yz5HR3AZHm/Ol3LDrOPMqpf6Be1Yn?=
 =?us-ascii?Q?JKe/uKiY6xHuPdqUleNupNw7SEBVvCVt1hvGsyHiCjVwQgAqGgzSav5xuEc3?=
 =?us-ascii?Q?dJLQpfhO18rN3Y9YQDlq9EOxJWeI0d+dGpE8jtxrvgGcihDwAjRISdYPiMfH?=
 =?us-ascii?Q?uyDHXzaUdtAkm6IrBrLXWzViJMefCEgIJBitW1ycT+2aAJtdePfkcdcNlgH3?=
 =?us-ascii?Q?YnPJdz4sC5Xva0iBi3azLhfSW055L/lAdv39VKo2IvhzJZ70K4Zg4QFV9ZpS?=
 =?us-ascii?Q?eTYFMCdquFCGowTIr2ZxWrz/Jeia32eXXBHHBrHa5GQ5/tzx9La+TodTU03v?=
 =?us-ascii?Q?Ys0SBTstxt2srO9KvmEacMLMqawu6hzZ6CwATwSsNtCaMTemTpUh75KNGlhC?=
 =?us-ascii?Q?zIF3tG1TSE6fWTBy2wF5sLq9XXZtxfPg8GvX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:23.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6966b0d2-cbb7-4ad8-cab3-08ddc9175722
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9744

It deals with a single domain, and will be called on a later patch
by a new function parse_dom0less_node(), so the new name is apt.

Also, pass parameters using boot_domain instead as the plan is to use it
as dumping gound for all the extracted information from the bindings.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/arm/dom0less-build.c           | 7 ++++---
 xen/common/device-tree/dom0less-build.c | 2 +-
 xen/include/xen/dom0less-build.h        | 5 ++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 286557fafd..3dea56dc76 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -272,10 +272,11 @@ int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
     return rc;
 }
 
-void __init arch_create_domUs(struct dt_device_node *node,
-                       struct xen_domctl_createdomain *d_cfg,
-                       unsigned int flags)
+void __init arch_parse_dom0less_node(struct dt_device_node *node,
+                                     struct boot_domain *bd)
 {
+    struct xen_domctl_createdomain *d_cfg = &bd->create_cfg;
+    unsigned int flags = bd->create_flags;
     uint32_t val;
 
     d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index e1d723c796..8caceb9f6b 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -960,7 +960,7 @@ void __init create_domUs(void)
             panic("'llc-colors' found, but LLC coloring is disabled\n");
 #endif
 
-        arch_create_domUs(node, d_cfg, *flags);
+        arch_parse_dom0less_node(node, &ki.bd);
 
         /*
          * The variable max_init_domid is initialized with zero, so here it's
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
index 34b9884cc7..8f3f90ae2a 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -45,9 +45,8 @@ void create_domUs(void);
 bool is_dom0less_mode(void);
 void set_xs_domain(struct domain *d);
 
-void arch_create_domUs(struct dt_device_node *node,
-                       struct xen_domctl_createdomain *d_cfg,
-                       unsigned int flags);
+void arch_parse_dom0less_node(struct dt_device_node *node,
+                              struct boot_domain *bd);
 
 int init_vuart(struct domain *d, struct kernel_info *kinfo,
                const struct dt_device_node *node);
-- 
2.43.0


