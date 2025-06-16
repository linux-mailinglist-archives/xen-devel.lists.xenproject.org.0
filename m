Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6FAADA867
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016510.1393406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xk-0008Rg-UN; Mon, 16 Jun 2025 06:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016510.1393406; Mon, 16 Jun 2025 06:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xk-0008Oe-Qt; Mon, 16 Jun 2025 06:42:08 +0000
Received: by outflank-mailman (input) for mailman id 1016510;
 Mon, 16 Jun 2025 06:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xj-0008OL-Lc
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2412::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 034e3134-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:05 +0200 (CEST)
Received: from DS7PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:3bb::31)
 by SJ1PR12MB6316.namprd12.prod.outlook.com (2603:10b6:a03:455::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 16 Jun
 2025 06:41:59 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::d) by DS7PR03CA0086.outlook.office365.com
 (2603:10b6:5:3bb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 16 Jun 2025 06:41:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:41:58 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:41:55 -0500
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
X-Inumbo-ID: 034e3134-4a7d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7jlSTNVfEByUaKRmV0UjO86HvUKcxE6TEwmciQS8kctlbLywGe3vrYYhqCQ06hLK4jdPW79gMK7aQ+2RXkc8ekoJyerHfcFqHbP1lK8BNSeHKfTNL20ppSo7iZ4xQRkifzoUmGRoc+dAGHKPMcbVg7YeVEyjoNaKmnKlwB2uHB4a2v3ciueb/dGqZdffIfxBJ1ypz6KnosGley7DPD56jND0iOBDbIKLShyHkYap5uiziJUQB1b1Jd9w+iOaD/FZqEg1VKu80vgiTKk2GslOC8XHS/ZhmUTye0n9p6H0T1PkGuVSMQ4rgTxDgQW6pb9vhT180kA9iFlBoiKwP3sOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfxBvcM7kPRYtD82sxFFBc0FTulWEdHkRvG/HEviTvM=;
 b=jRCGbGgzwXHW+DpJvwaN3jydTaB5bWbd3DMRZktHXyJFA1IhPhVSx5VY6xEdNQW0ZMWgbPGMWpTvypLEJ0LEp83qi4kI1qgEPkjOraMABvX4aIchoGA7BjMsNxWYtdYFJ57cMw4mBmOvsWBeqn8IrifaFCjZ+TGzV6GJ+PC1NTK+kTJlGE85WWbyc2cMk0AsZrEXLQeKIqjiLHWJWROQF+7fFmJodI+qNwh9dZ6g6e/FD+1SEpVLZ+o4TnCcPb27IYab3IuYuMW1r2aYfUXnqxk6pJrkjAn3QWd/lJRqnp/lExL9E7Gjgge868jdcFmtgPGNR+cWot1sfrdOVByiHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfxBvcM7kPRYtD82sxFFBc0FTulWEdHkRvG/HEviTvM=;
 b=o7RzxhebHduJlqlWRusYbKsQzAlB6hAlDpp3RwB6/pYpNNHA/g+vDYY4LOLu3N8janVBz27Gb0xflLbmYpwqpX99OZ9ZGKMkBf1fyiiC3F7NW5tZzkFs9mQJxH0aps6cO9sbzO7FiVPCUunE8xm7EIeka58xaCfsTf0Ll282AgA=
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
Subject: [PATCH v5 01/18] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Date: Mon, 16 Jun 2025 14:41:11 +0800
Message-ID: <20250616064128.581164-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SJ1PR12MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbe2dd2-33a5-4cdc-d8c1-08ddaca0e48f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yc32FitU5tfYIt/PR9nOkTfe+1UpVC8xz4XJwbSy/1TUNmVwwgyJ89lEGZPP?=
 =?us-ascii?Q?9TDEepouumlvBVTno+ONEbxtcrsyxdyFbLMrtpBsPNvSDcVVI+3ZvFxBTgBS?=
 =?us-ascii?Q?hSXzq+sxHmN6pdHRjNjLysd6QjI7IzpaJruWG1jxHrQdDN4VbSlsL1W2IDb0?=
 =?us-ascii?Q?r92CM+iXHcOQUcahq7MMFO7P/Tlma8FhTY05Hj/t32CwMTu1HOd8KFX9Zt4K?=
 =?us-ascii?Q?w6sfoNupnlVz+IHWXFSc0wVyrrzToMgMe9MTGN4d71RxVjSFSo5V0/boOZpS?=
 =?us-ascii?Q?MNJ1QxDCNYW6Ta4igwmh+NZZE9Ilh/Iy/56AhAFOlHsBHCgVjfICbL6Px4aW?=
 =?us-ascii?Q?zgE2u7hSkffoh+8G7eENIUHbW1lddvCu3XXKtnVwzJc4VAI6LKSTLoPAgxQz?=
 =?us-ascii?Q?yQoKuZ2HjsnsG7P6Fx0y8msOcSZWGe0u3lcxE2Gmnf0MTxbiRjDxh4OJVC/2?=
 =?us-ascii?Q?pKiymIuU7HTTYoht4zlNfb+qYSDtcaabjQaYt4YZ+ag244aS4fB6lGwXrj9R?=
 =?us-ascii?Q?UvEpMJXc5oIzZ6V/LHTHAUet1kgz7ugrf8LJVJ217alwNJ+CwPmGx+obA59o?=
 =?us-ascii?Q?sT0VcY+y3NJLG+LjyZg47tjKYm2vYwU70AErOw0vk4i+S0r9OMwS3kHmKeI9?=
 =?us-ascii?Q?HuOjcYy4J10srNfuzYxnTfE0WNn6+Cm9Dhpt1oi8rTsVm1wNCeYN08n/0Tit?=
 =?us-ascii?Q?SbFiN9+jJ8KMpFtjXDV8fFg54GxJ0q6Bz96UQNwuIBzLay4MvrPQZeNDsZSy?=
 =?us-ascii?Q?B7LMGvyevZyxCEHh3u5QVlNXa7dbfnO0DR2wIVMObSP7iW/tFm5DIG3p5JXv?=
 =?us-ascii?Q?NvUA+F4ArJIsce9Fa9dqyJAfmAhw2kgTslL/0jO7jHzuy4gZNPyPLWKd/7qC?=
 =?us-ascii?Q?GIUecfEn+I6GlrIKN9FaxNTI5mSpNKwJBGA2hgw6OWkVl4MixNbk7gWVWOM4?=
 =?us-ascii?Q?hqYGjXDCFBOkJ7KWLAAX5LwtEfLYVyXdfYlu761w+4TNFfWwWeh3Zx69XvEB?=
 =?us-ascii?Q?kbgvQz4RBEKO1xqkYfM68DidYSTclyEqQmrVY11QamUfJj6d2eUjcow9XfUe?=
 =?us-ascii?Q?YQzjelICqAbHCUS77EUgEz6GaERVNUGMNvOSipBZQwEKdDS/6Qc03VwaPdKd?=
 =?us-ascii?Q?gdb2kPcDWwoy5dEgUF1WsSRhnaaQV5ATFkjs8XWqQ9+bu8sIFwTiTRHUHH9G?=
 =?us-ascii?Q?y524L7OqSNkTZOk9vBlwV/Wa9koliYZmURhbCGcb0f+mRq6/M+95LochSKaJ?=
 =?us-ascii?Q?nt3pcBpMBlg3hs94RXdQcyZftBrRac7FqtdfldynJPCbsGXLHJ6L9hpbF+t9?=
 =?us-ascii?Q?YSGimKgKuGkhSciCRZXg7pjr7FcHiZXSVDfRSiqMQZIk6wlwEMMbq39dAu4l?=
 =?us-ascii?Q?8wDfxLeaYA0yMR8wBayzXChYFWqRNl2sLpuLgbWAOinQqs58u69vxzQBe7fi?=
 =?us-ascii?Q?aYbJEM/wH+yxCXHRnuBW2ItUkaOrxNzwI24ENCEXEifAem/0tUzsB0CAVNWF?=
 =?us-ascii?Q?lUFbsILXOii/qR++OP0mPHsQ3Eay8xdgbv8L?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:41:58.4860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbe2dd2-33a5-4cdc-d8c1-08ddaca0e48f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6316

Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
equivalent "if !...") in Kconfig file, since negative dependancy will badly
affect allyesconfig.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- remove comment for PV_SHIM_EXCLUSIVE
---
v3 -> v4:
- explicitly state "CONFIG_xxx is not set" in "pvshim_defconfig"
- Add "default y" for SHADOW_PAGING and TBOOT
- refactor commit message
---
v4 -> v5:
- For not breaking allyesconfig, changes to defaults are actually not needed.
So remove them all
- Leave one blank lines
---
 xen/arch/x86/Kconfig      | 4 ----
 xen/arch/x86/hvm/Kconfig  | 1 -
 xen/drivers/video/Kconfig | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 752d5141bb..b45f17a16e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -289,8 +289,6 @@ config PV_SHIM_EXCLUSIVE
 
 	  If unsure, say N.
 
-if !PV_SHIM_EXCLUSIVE
-
 config HYPERV_GUEST
 	bool "Hyper-V Guest"
 	select GUEST
@@ -299,8 +297,6 @@ config HYPERV_GUEST
 
 	  If unsure, say N.
 
-endif
-
 config REQUIRE_NX
 	bool "Require NX (No eXecute) support"
 	help
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
index 245030beea..0a51e87eb2 100644
--- a/xen/drivers/video/Kconfig
+++ b/xen/drivers/video/Kconfig
@@ -3,7 +3,7 @@ config VIDEO
 	bool
 
 config VGA
-	bool "VGA support" if !PV_SHIM_EXCLUSIVE
+	bool "VGA support"
 	select VIDEO
 	depends on X86
 	default y if !PV_SHIM_EXCLUSIVE
-- 
2.34.1


