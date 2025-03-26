Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA8A71041
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 06:54:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927003.1329799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhj-00086h-JW; Wed, 26 Mar 2025 05:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927003.1329799; Wed, 26 Mar 2025 05:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJhj-00083c-DA; Wed, 26 Mar 2025 05:53:31 +0000
Received: by outflank-mailman (input) for mailman id 927003;
 Wed, 26 Mar 2025 05:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJhi-00083W-8F
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:53:30 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:2417::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2d20c6e-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:53:27 +0100 (CET)
Received: from MW4PR03CA0319.namprd03.prod.outlook.com (2603:10b6:303:dd::24)
 by SA1PR12MB9003.namprd12.prod.outlook.com (2603:10b6:806:389::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:53:24 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::9b) by MW4PR03CA0319.outlook.office365.com
 (2603:10b6:303:dd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Wed,
 26 Mar 2025 05:53:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:53:23 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:53:20 -0500
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
X-Inumbo-ID: a2d20c6e-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlNlGhFxyHq+1TKPB/v9OE/kqYS+LdXBSgsGrafM0LfZLDsV+lFgb4i005zzg85PgeATD3Xst/KAD/fzy6oFvj5kWCCRz8lPNMky3wUap0Xe+qTpGt1c11VZuAfnejE3/OdRbVvZTyYEYII6oIyAKRanclEM7ucqsrTSsk4Es0eUAxqlIiyW2MAYIAvSJoWBDnHNohx6lWpCSSCzgiyyuf9Uslea6ThyhK7flKL0hnJxfi/O+QoJd9c+on04wrA4zNp8wbcfINlO2zISYW54TC5Pi7S1TEwjSyvPDJb4Hx01Lpr3Gz6MR+jKP1tASEHsamdhmYGWo4DZG8BFVBsVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEUNrZ24fL1X6hFJd6qKufpxkZa+ZPL+BfQnNJ7pegc=;
 b=DM379p/Gd/ofjGG0NnVWIUPI0vTxeTBwLUlee/AYobb9oz+bxdEPDfwsF5faJS4GAoVRj1y2vQYQF5f61VGmCLWw+dHycF5j1t1zkyKis/aFmeWeuwK0s0i/B+f/Mdy6wNZ8WMoi1Cgg5jg/nL5ir39wn1LKMuCbri1Ie/bYieIkkKnJXmh5lR/e88vKj3V9m1wqfHw8is82rbb0A7gih785Wv+GFYHmbIQbK5gPR5Q43UnmEpfswL/VhgC97KHALEVAktboGWxl4rIKTt8Rv1boGa6y7Fp2WQ92RlYAeqLbc7glCuHw0vkBcV0sYDE0k42XZMWZiInM2ki6tgV3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEUNrZ24fL1X6hFJd6qKufpxkZa+ZPL+BfQnNJ7pegc=;
 b=WNKpJWA2XQh/AK0v2NeTsHd/5vivnUCeRImVwHCbzaROFo0vu8jDAoQvXqeU3a7o2hz2lX48SpXZkQUzupMeDHbM0vYLJnq4edvs2MenfGr6ZnItRiPASaK/mI9UZQhiN8rSX385NKnVvyrPajx8bYEx5pgTCZARfXXzWjhVed0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 01/19] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Date: Wed, 26 Mar 2025 13:50:35 +0800
Message-ID: <20250326055053.3313146-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|SA1PR12MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9dbe34-ba53-4195-df8d-08dd6c2a856f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iqTELoYUCl12nII7u79c6OFqw5jK7hMRG4XrADzzQtC3oF/xvH+ztTvC++wX?=
 =?us-ascii?Q?ZchI1PS/LzIn+QcvifvDSg+ca0oqkYNXfBF2tCCrzRKWFBc6Pi3BWyuKD2XB?=
 =?us-ascii?Q?Y+yAdJX7f+OKdCVVceqyN/mOx2xQOkdJjIS3vfICKweq8ZIpjT2E+fybfhfp?=
 =?us-ascii?Q?RigB6UP1f8U+luQyY7zgI3zpc0mie7Wx5hyk8WUtVSKmofCxsztpWd1qRg6P?=
 =?us-ascii?Q?4TOGfUg0XnBvtTELB8OUW1RGM3zxFuALDzSvEjCzY7Lssn/oGLUPbtjqK5Go?=
 =?us-ascii?Q?/MBFXXE4nZSS852SeY391cFEjgqklPaBnLPQZzqhTkDA5BYAY1hMns1gWAiM?=
 =?us-ascii?Q?yLFt2gULnG0Zgx4W8wFxbgFfxkwGAbod9ZkEN5/scwd79aZ39bo5Pe7g8spC?=
 =?us-ascii?Q?3iN9+NsztHw3p9u3N5OJ0Rc26bk7k8CqMxNX98BzJSv4kSUbsgy2OvYWGZJj?=
 =?us-ascii?Q?bRuIcbvrwxw8qiIbsfuDxLliEBQD7aq2x9MFIs2cCMCWmHlnoUJuzImfCyGm?=
 =?us-ascii?Q?N8Lxmo5BOz5Zi5JuOpOC9HKIc74/DJoIbyg4ORFwb3xc7FGNAfglMexgBqtj?=
 =?us-ascii?Q?RHwecmlv1nsyn2RheqOeihjwkz2SI3kAq8x1pTiepwxbiUOy1lk4wAaQ2U2O?=
 =?us-ascii?Q?UeZ8RaB7PwEPVtKs29jZotK+nqr9EVFG3lDYwT164lMy2Xa1VjW1g/IFqjsU?=
 =?us-ascii?Q?d4ufa8ze19s4Wy5g03U9VXquSZTpjDVf1dcmSDfYqRYpKG9fjOiafVjdx9nf?=
 =?us-ascii?Q?CDcqpKFFpLaQqeQn+7MO+S38mILAeY433oy0H7dLKErwoxgeKt+YxfO1EZXE?=
 =?us-ascii?Q?78ZM62VxN1QUr72XaATEcJhA9O8I1vyHGIggauby82PO5t1QIVwXjpIqC7TL?=
 =?us-ascii?Q?PKzMTJx6zkfUTIEIixkNaJK0PWDfcy+GDsk187JL13LB1qOCOw8Zd1hx+PLQ?=
 =?us-ascii?Q?kFxvYItGDUMkLYWbT5ToqHZXIatpfyEFaOlayVb50AtEVS6sBxL9C/KFj8UY?=
 =?us-ascii?Q?AjPkkYnVeB3lU9zuM8C94I6WNnXx+dR7a/6NHxWq00uUTOGAfDA0qkTbdkkX?=
 =?us-ascii?Q?7ZuRgYdNXCDZKllSIzmCPTDlvWWrtV5WVgV7um8Ewnq1DanMB0/47lnbDL32?=
 =?us-ascii?Q?A4eBxls7LbMNOjE1+i+8XOw97peoHrE3m0bRLisa3eFgUaLBYGeYvfOb3Vv7?=
 =?us-ascii?Q?U7TsjBEiuv/JbXXNgJ9qCfGwV0SoTvsbWmmYSkreVG2kbvPyqbr6nJ5YdAZX?=
 =?us-ascii?Q?jUXoMBJX9sh7hf/CdYMYD9cdz8avrnjwWZLDuv60cRByiA0ShcfTdXFv9HT+?=
 =?us-ascii?Q?H6JlrrjdPVaUmgacRfXcqb44uQgoUXl0bR3u9IyJ5ub7TxO4Kk/M/C02/6os?=
 =?us-ascii?Q?ey3++/pRowy3zzVQyHVILxCGfgO1QO8P5CjUw5nSuvZf7hwlHdTO+WQogRE5?=
 =?us-ascii?Q?4m5BQa0CHi8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:53:23.8356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9dbe34-ba53-4195-df8d-08dd6c2a856f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9003

We intend to remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
equivalent "if !...") in Kconfig file, since negative dependancy will badly
affect allyesconfig.
This commit is based on "x86: provide an inverted Kconfig control for
shim-exclusive mode"[1]

[1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/Kconfig      | 6 ++----
 xen/arch/x86/hvm/Kconfig  | 1 -
 xen/drivers/video/Kconfig | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 18efdb2e31..1e5df84b25 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -137,7 +137,6 @@ config XEN_IBT
 
 config SHADOW_PAGING
 	bool "Shadow Paging"
-	default !PV_SHIM_EXCLUSIVE
 	depends on PV || HVM
 	help
 
@@ -169,7 +168,6 @@ config BIGMEM
 config TBOOT
 	bool "Xen tboot support (UNSUPPORTED)"
 	depends on INTEL && UNSUPPORTED
-	default !PV_SHIM_EXCLUSIVE
 	select CRYPTO
 	help
 	  Allows support for Trusted Boot using the Intel(R) Trusted Execution
@@ -279,10 +277,11 @@ config PV_SHIM_EXCLUSIVE
 	  Build Xen in a way which unconditionally assumes PV_SHIM mode.  This
 	  option is only intended for use when building a dedicated PV Shim
 	  firmware, and will not function correctly in other scenarios.
+	  Features, like tboot, shadow page, VGA, HVM, Hyper-V Guest, etc,
+	  are unavailable in shim-exclusive mode.
 
 	  If unsure, say N.
 
-if !PV_SHIM_EXCLUSIVE
 
 config HYPERV_GUEST
 	bool "Hyper-V Guest"
@@ -292,7 +291,6 @@ config HYPERV_GUEST
 
 	  If unsure, say N.
 
-endif
 
 config REQUIRE_NX
 	bool "Require NX (No eXecute) support"
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 2def0f98e2..b903764bda 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -1,6 +1,5 @@
 menuconfig HVM
 	bool "HVM support"
-	depends on !PV_SHIM_EXCLUSIVE
 	default !PV_SHIM
 	select COMPAT
 	select IOREQ_SERVER
diff --git a/xen/drivers/video/Kconfig b/xen/drivers/video/Kconfig
index 245030beea..66ee1e7c9c 100644
--- a/xen/drivers/video/Kconfig
+++ b/xen/drivers/video/Kconfig
@@ -3,10 +3,10 @@ config VIDEO
 	bool
 
 config VGA
-	bool "VGA support" if !PV_SHIM_EXCLUSIVE
+	bool "VGA support"
 	select VIDEO
 	depends on X86
-	default y if !PV_SHIM_EXCLUSIVE
+	default y
 	help
 	  Enable VGA output for the Xen hypervisor.
 
-- 
2.34.1


