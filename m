Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED55ACF863
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007531.1386855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGcS-0002L6-JO; Thu, 05 Jun 2025 19:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007531.1386855; Thu, 05 Jun 2025 19:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGcS-0002HU-Bn; Thu, 05 Jun 2025 19:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1007531;
 Thu, 05 Jun 2025 19:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGat-0002tD-TO
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:49:43 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2414::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39378f82-4246-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 21:49:43 +0200 (CEST)
Received: from BN9PR03CA0349.namprd03.prod.outlook.com (2603:10b6:408:f6::24)
 by IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 19:49:38 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::2b) by BN9PR03CA0349.outlook.office365.com
 (2603:10b6:408:f6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Thu,
 5 Jun 2025 19:49:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:49:38 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:49:06 -0500
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
X-Inumbo-ID: 39378f82-4246-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8938yO0mVKFuKWFi7rxf9enYJSyo2gaPVFbb63KOvXODb5GiFQDyUvP6kx6afgJoP+REP6BpR71ros2PPqiSHO0hVpsF7B4fvngyA3eBojqxtXiKYaN6xOo3rve8HGTCO9LJ08uJ3UzhEt8O6VvFo9jm1AxqgvvtQSOezLcY9hgwCdz6RBMlRxOkwh8pl4U5hvgAeuHdnB8j/tH5kFx8FYkCexkHidt9bzmWCbxolMo0fuf+mt1zj6/Nvie8ZXzdzpgeCPYBkR076CXCJAQBl3Uo7WKfluzRWWXF5LlbUYvkLm3HmSTZVNEKawTpHcvPcV9diKGQxn6xhsk0QCsGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdndZEIM1HxoHu9OMJDmh4wFBWnq69aZLgl89O7wXQ8=;
 b=gpbOMfTauuQiv6AUE7+ljh1bmECDN8eQqgqv1qRaSX+SSujkXAqtvWsFYoQqRTy/coO908dGZV7ytOQdckLjfe1a/2jsT2+A4wjV0aOIWa354NC59YD+CoIakRgMzCzW1T8Ro3lmYJcqKd75Sj4WkRb4Ttg47QIHi0LR0HWLrg+A6PpU+Soe/TyP3LN+jGAJSC3ufu0SFSl8mfh/LX5t1dn2cssm0dNpj4DFs1elvawIU3aIJRLgNwMbyxrVPxcdt2+2P+oJbVXzPQPCENI9uaOWOKV+b3NSYrOkcrGUADrbEWjcWDyiCsn39Ygoy+oyKng6fqLb5CvfNhLrmX3hpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdndZEIM1HxoHu9OMJDmh4wFBWnq69aZLgl89O7wXQ8=;
 b=ZJ4jUrHeHkz2O3HBl0xvbdZf/ChwqPas1rOjb0SU11xVTf63cSOndKs40VIXK+3Xbi1/AdbYyUPsgyrD9Lm1C9P2YlON/9c7eo3xphMJ8Dbkxois5oMwrIpokjnf8NPGeM7p9oLfGEOMdhrjl35oO2IiHkFmajYpB1mbM7AIp+k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 14/15] xen/dt: Allow CONFIG_DOM0LESS_BOOT to include device-tree/
Date: Thu, 5 Jun 2025 21:48:06 +0200
Message-ID: <20250605194810.2782031-15-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: b99fce7d-d344-409b-2887-08dda46a1b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T/loZNKjtCnzwQmmvvxW34ZQfZoIIfAM711B7nVMHRAWVzcyNzyApAvX39aw?=
 =?us-ascii?Q?nGSPJ0OZR044qBhJCIFoGUKI7nen+dHGfe8VCsuiZ39EqvBHEU5jWZC3bQ9h?=
 =?us-ascii?Q?CFPJUc8FBBiVc7krjYbxo2egPAwZqaikQc8V6OAHqWs5qBwiEA2cdHtktmpg?=
 =?us-ascii?Q?f0asplYIraHhME8ZhwYiqQjHAQ2RoZDqaVs/pI7Ia7LOVfJrlHkNDXmFr+3N?=
 =?us-ascii?Q?/wy2UO9uinJKpVniEOlZ8AsBz7YEaePCPwuVWFyA8HzU8VmZIXmZjTb1FqFv?=
 =?us-ascii?Q?cdmKMvMdvSrbm9KHd8Ck1D1oIhD6KjefMcTts7NYmICQpt+d9uFtlQd4Fv16?=
 =?us-ascii?Q?RjXVtdWsa6J3oxkW43K+WsBSlVjLOF8kq8uk0EdTfoqN/BjcUWt4U9yb3n48?=
 =?us-ascii?Q?3wzepptsnsxcINoEoZ3eVr+YXj1X9fRHIIMCXSlLQnJkhflerW3HwGPyS96E?=
 =?us-ascii?Q?00iMBcO7lYvWCsaChXUdCa0WI36bghIdUlXqLC+KipbdAg5hVo+eyIWKHCdx?=
 =?us-ascii?Q?idIJnoQUV764jic/FLZcskUg3cdIBvJ6Yyfhd3nvKLDBPnfs7KpcRE2qDL5A?=
 =?us-ascii?Q?mnzGPcYlItCrZ5RtxX2zwhgL11jcP6y1eOQldQ81liyQXDpGqNc2N+42zRtc?=
 =?us-ascii?Q?MFoMh6xUV7hupYvsEYOe/EzQLwkFCNGrSihhImwtRE1RzZIMqS+vEqqLquu5?=
 =?us-ascii?Q?D3w2CHDdUwkm6zsG3aQtoGmK3Zs6HqCV4dFmT033KvhlXn5fbv0eCHAxumxO?=
 =?us-ascii?Q?V50TEjpiOsFf/rubkL3RPGJTWzCJCslsm617AAo48SsLuyVmf8YKSaOpTPaH?=
 =?us-ascii?Q?lFYC48k6e1rxtn1bWU8IajKDA+Dn1ywWN4Ve/pmdcFof/+XBTkEQO6aFzI2Q?=
 =?us-ascii?Q?8sC2P91M2l5PUBuXKGSS7Cz6Jjl625dWtapGtLdEmw2VCUQtuP12M7FufSSH?=
 =?us-ascii?Q?NjpvXdMetStevct7CIkl4dH6PhBgr6sK5AMDWud+jpqo4ze5XIyFRFU5QzKM?=
 =?us-ascii?Q?GsJC/raDFFjm13QY75K68lwcvBnu+vNOc1sr6+I7zbtXmYLSjYsqGnMDiHKj?=
 =?us-ascii?Q?/xfG4zlny1ePo0Mt/fqsnzuxANLEWyidxo1VZ7weWV6kaZbGmvYAwT1vryU/?=
 =?us-ascii?Q?xQZLSKMtNwCT4C4GzDyy94tKMItDQ3pxyk6KdIchuIWyi09pR9uRR/h/zE/4?=
 =?us-ascii?Q?Al708fxuN9t7Jm9VBYcdNv9mETY5dhqmiO5jEn5r9S32aoOy+l8kuNFG2U1z?=
 =?us-ascii?Q?RArnJxCcDYX6Czi0m77fjTO430ZtC+0JltsE6+iMsQiM5E2MjFXyxIneR4PL?=
 =?us-ascii?Q?RSgh5tqs1sejxNfAIl1B8KjeVFzLmPZ92viNC5eo9/CkgRZtWlRA2zRqAZ9v?=
 =?us-ascii?Q?IdVQuMbER4Vz34/FPUm/BPPHALQnC+EG2qNYl0FBe0yJiRiyW47l6Ydrtpl9?=
 =?us-ascii?Q?uE6kKZG9XqkikGCQMgg8aydBlnvDH3VewOQIPOFxY6Mw5sQNTb15smzmQt3b?=
 =?us-ascii?Q?tHKHk7P1cdfVgTnVsGk2N8JrDH3kCEbdOK0/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:49:38.8622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b99fce7d-d344-409b-2887-08dda46a1b5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650

... without CONFIG_HAS_DEVICE_TREE

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/Kconfig              | 1 +
 xen/common/Makefile             | 2 +-
 xen/common/device-tree/Makefile | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index eece1370a3..5353874e87 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -14,6 +14,7 @@ config CORE_PARKING
 
 config DOM0LESS_BOOT
 	bool "Dom0less boot support" if EXPERT
+	select LIBFDT
 	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
 	default y
 	help
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..2717c81f9c 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -8,7 +8,7 @@ obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
-obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
+obj-$(firstword $(CONFIG_HAS_DEVICE_TREE) $(CONFIG_DOM0LESS_BOOT)) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 8abc069c4b..cc56f42df9 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,11 +1,11 @@
 obj-y += bootfdt.init.o
-obj-y += bootinfo-fdt.init.o
-obj-y += bootinfo.init.o
-obj-y += device-tree.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += bootinfo-fdt.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += bootinfo.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
-obj-y += intc.o
+obj-$(CONFIG_HAS_DEVICE_TREE) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
-- 
2.43.0


