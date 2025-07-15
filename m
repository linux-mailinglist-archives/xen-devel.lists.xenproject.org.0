Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FA5B06464
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044597.1414720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiae-0006JD-L3; Tue, 15 Jul 2025 16:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044597.1414720; Tue, 15 Jul 2025 16:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiae-0006Gh-Hb; Tue, 15 Jul 2025 16:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1044597;
 Tue, 15 Jul 2025 16:33:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiG9-0005t5-AI
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:12:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2414::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6df8c794-6196-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 18:11:57 +0200 (CEST)
Received: from MW4P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::22)
 by IA4PR12MB9785.namprd12.prod.outlook.com (2603:10b6:208:55b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 16:11:55 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::64) by MW4P220CA0017.outlook.office365.com
 (2603:10b6:303:115::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Tue,
 15 Jul 2025 16:11:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:54 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:51 -0500
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
X-Inumbo-ID: 6df8c794-6196-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JO51kvlWCaVkpvXGx54RL20BgWtLwTNCcLfLV4eaD66nAF4swfeSsaCttBv0Vc64UMYiZ77S8LejbBdpKBuNAcAsfeZLhC5Tubjt1zdUzkzr/yMr5Gy96HWks+/X/fijNuWlAP1ItniclXM98jW4Ng0XGjHN+Mt4MGC2xPCwoQfXRVLagNdj4WcMG2XmYKhEEVNr0mzA3gwPQ6cdWXiz5+mQmZ3PLcyg4diPrkwg4Rt1AtNCK+1X04ii2JCfLRjHhkT3XLbxdnIXhCVjFzVd4A6DDKIGrUVakL5PqKiVRqfqXdajAOVI8Frzmt1ACigqZeurS5wgP3PWjTpXToLg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNVDBZczNBRoqWRYyqps8aS4iDKHYKUWvTxtQixG1P8=;
 b=B8Xoeuo1qdNG1W7jDIZ1dEKi9VJWVC9G6Iag11jOE07zMKF2Td691iiLnUVdg/Bzjsgplhc/4+uSaERV6BItRpKGzfqv5eb6pftN6i+w+Aw2YzVgA+zCGDShM6pXGtyLgYMvGcekn7r5uOx9fpigdpyr72KWojku0IdYJ1E6YgA5ci2VszB0nJOKkYwCAQiM4N9FIrnzxlUWgZuJAU63VdzlE7mAOYtVc9vFDb5JNlGb+UbnPtP/IvfVquQLGzQPqTiNYh28UDdgJaxTAyBoJCOVIjFEi3ZE9d2X+zxVo4JesV5gLKCVV68BNB0Dre1SZ2PaL8vkGdi08s0ki5HC7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNVDBZczNBRoqWRYyqps8aS4iDKHYKUWvTxtQixG1P8=;
 b=emaEWjXImhrWSrx48C8OYxB4lt3kepzEck8+PtDSpilSNMVeG0x7fpxjpPAiQo/yNa27E2n7zYN2nheKu5NcxCkeTI0vM9Dj8/9o+Ee1ZVXtsiIdo47WrR0dikD+3PX+xfIQgoqssdvhhmxxh9fIvp62XjK2b/Hd+Nxwzp66CC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v7 11/11] xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to include device-tree/
Date: Tue, 15 Jul 2025 18:11:06 +0200
Message-ID: <20250715161108.141126-12-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|IA4PR12MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5627f7-e4e7-429e-44dd-08ddc3ba50c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LRPERG+KV77EjDKnsJwuyikELSJhzsrwIW1SrjkrcskLjs8bXx32Gbq+u+3d?=
 =?us-ascii?Q?UEaHFX8Dv2t/eGi2YNO6hkwIBKvH1XSMY5oQSuCin1EDZvmxI1+L3srb7HsM?=
 =?us-ascii?Q?z+BbqLFJSJVMy+8mQe9mxqrE2tl1HD8MMGG041yIEbS1LbLkRYoedRzcEXrI?=
 =?us-ascii?Q?Y8vDPmETR52ZoLG0AYP26O4v6EfKajvNbmUMnwzodm03P6W42euU06+ylxFe?=
 =?us-ascii?Q?qjlT1GygpTWR0sd6LkqJpli2Wut9BmhrVkGip/hYypZ72zYu9QlDcJry+TOX?=
 =?us-ascii?Q?LFoKpo8cu4+0+Bx30dbrBFXTaPefh/JcGzIk3i7NkHuPijR5LIOgBQJhurSP?=
 =?us-ascii?Q?ixBOOzz/YkXvKyLyiknKoL2NgQIFy+un1Hp7RC3hyECpWB8HgemuNZdrLPaa?=
 =?us-ascii?Q?Uiw+bEL28JRyitG+gd5IBViWGZk4GUtDYXr2eir/y4qNiOO+NDpGgQP7u02U?=
 =?us-ascii?Q?XodG7mzVJ4bYhQ5J0x791xmQ9rgxggpjv5qXFi6XUN5/uaZ15damZ174S/Xn?=
 =?us-ascii?Q?Pcw66cCGcwHd0CYWrGqCisCCK5azWzvBK8VDsC37ZOWO53DrhKUhg4iAMG3X?=
 =?us-ascii?Q?W0MU2ygb5NybTaB1a6D0x0Mv67PYxH+1QU+PXtFLP2XUHBVADUVSPEsay76F?=
 =?us-ascii?Q?5S92cUYosbm7pFKK6SdgTyGlhEwKlTAtCDRIIxVeLzJ0BVaz+X5Xm3KPlJTD?=
 =?us-ascii?Q?328QzUFEQ+qiRpEPqnr8pvtcmWCe7cK+yO+T6cFL1PhKpFbUDBsNOcGlcFjU?=
 =?us-ascii?Q?v+6d92oQEsBS6k/xx7LNZ27ppU98oc0gMt5/Dvygoj6jKrrvQN59YWDWQ4Tp?=
 =?us-ascii?Q?tzuq4deCRXcB+t6tnUIAKgmt15nhC6eGx4kyvZnpS7o05G/+qc1nFKph/vX2?=
 =?us-ascii?Q?+bvB2l/8iSgw4q/oN3qkvapSJdJU36D9okKtipE6QZ71ZIlXM/iAhzZN5/8f?=
 =?us-ascii?Q?uT5p7nECpkfFJ+MeEJFwdrVEPMjus4TwU9UgYdgwk1T+PHaHy0eQnpTzhqNg?=
 =?us-ascii?Q?W3+2GoNhcZ9GvRFPzoxD6JaK6GsyUbTJeb6jJk7IZtxvG+7MhvVQQvTClUL7?=
 =?us-ascii?Q?7TUgEguKFiBGrZspQ0vPhS4ucDzKKCaZSD1LHhlpsoOO0cAOb9grW4WBBlot?=
 =?us-ascii?Q?jeoHsVI8JHQ18OFSn/YQueU6A+zcg2gt262iAXX4BdZaVOXr5UeqERxUGv1X?=
 =?us-ascii?Q?UQT4r8TJ0jcv3kZoC2y41JojkrCB8meThF38iFjgY52CawVoN9RObiasVmgj?=
 =?us-ascii?Q?u3hCFrrSO1UEMnMLHhqk6Ti/5LuHUoCLJlGADXqSwLcoy86Q1+FTZ3z1o4VV?=
 =?us-ascii?Q?Fk6eKUgWhxa6YWqMI30Kow+W3wNAvAO81JdETKf/jGGwmYoViXbhkUsj6npD?=
 =?us-ascii?Q?gUIRoesqedhLLWjqclnT/QPWBuESnM9qOZ8vQQ6T5PiPvZcVNeOo+Z2ggyfO?=
 =?us-ascii?Q?0wP2pGgrYiSjKBv147ORS+CvbFTZ9B5CT8AHqmrjkKllciqoSvhidOjaoZ7s?=
 =?us-ascii?Q?ATzNn/4Q9w9GCBASrxjcLCMFXSPpsreIuinn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:54.1620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5627f7-e4e7-429e-44dd-08ddc3ba50c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9785

This allows bootfdt.c and device-tree.c to be usable without
CONFIG_HAS_DEVICE_TREE_DISCOVERY.

Gate everything else on CONFIG_HAS_DEVICE_TREE_DISCOVERY.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/common/Makefile             | 2 +-
 xen/common/device-tree/Makefile | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index d541fbcf49..265468d751 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -8,7 +8,7 @@ obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
-obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/
+obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 8abc069c4b..1459e63c85 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,11 +1,13 @@
 obj-y += bootfdt.init.o
 obj-y += bootinfo-fdt.init.o
 obj-y += bootinfo.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
-obj-y += intc.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
-- 
2.43.0


