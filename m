Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C8CAD910E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014503.1392639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6Cy-0006uG-DZ; Fri, 13 Jun 2025 15:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014503.1392639; Fri, 13 Jun 2025 15:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6Cy-0006so-B0; Fri, 13 Jun 2025 15:20:44 +0000
Received: by outflank-mailman (input) for mailman id 1014503;
 Fri, 13 Jun 2025 15:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ69T-0001Mm-7I
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:17:07 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2407::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 766527aa-4869-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:17:05 +0200 (CEST)
Received: from DM5PR07CA0063.namprd07.prod.outlook.com (2603:10b6:4:ad::28) by
 SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 15:17:00 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::8e) by DM5PR07CA0063.outlook.office365.com
 (2603:10b6:4:ad::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 13 Jun 2025 15:17:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:17:00 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:57 -0500
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
X-Inumbo-ID: 766527aa-4869-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pu3FzaIpM6PYMA+ZjlLKL/Ip5GxQuQ0CKklQGUEpTbyiEvtpObzgKlqs9/l6QVrO4ePgBnzKP3lLKvBq8moupwTwleQFmwFfuD4k/4XgQawiy15KXwLq8mdS8VAtdPupOgrvmWKaNaVKxvhetvLfqEPn3LwpjOIB3ZvgwmOgvf+TUdEFc7SP3Regptg8eOmzcT7Ezt3E42TlmkCmbiRQoJKAV79i5SK9ro2p4UDfH+4r7KS+EddbPT7Y8tKtfbrwHKpzP8oJAnZoZ026/4Qv/6GKCWQBTZCkMKd9XVHaqfF/IMkQaN+7vjFS7NYt8rnrcCMFjnVHKwORveVtB5zc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsYGQY7MHoojqL5zzyE/X5IQNTzAfHic3tkVjdKkdKc=;
 b=mWohS9rRl3um1solLXQBm3ds831+SOINu6lCwropNP0zlyCiEhQL92B90d9z2yi3uJJ0BVZ/+BAVcvmc3iOkECwKN8bj5vHxlJ/DArHeKaQ65v8oenY14czkzfwgl8yrkWs6MxT1yMxNEn8Y+GmOIletCboz5On/1vTeMhmB2xW//PbJ/RznH5IjBj1OLxArKmF+pJA9/chL+yY+iHYkWvH8PetJDvAECDEwSoeXVyv2bpzO+aqaJ5oJJDJNIS1yCTMg3l6GFOkEFleR+P9hwVn2VoYWKs1EMMqVl+/e9I1sTVA0e8WQOmF9zj0dF+4sNM5roq9kp17xTeHpfOlmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsYGQY7MHoojqL5zzyE/X5IQNTzAfHic3tkVjdKkdKc=;
 b=imVfSdBssbUVGp/OX2dKJn52x0KuxX8q6wi2aq/qfgBaiNPhB9GC76ojUqegQJJLsrOOKgq6eHT9x8zFvgRay4NujslX1B2p+21eBV5qxH0+vcvkagqbIjQ8rxDICQkcTj9/zRmxJ3nENlbnlT+kFyu2fDvT9CQDAk1Q/NtAhoE=
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
Subject: [PATCH v3 13/14] xen/dt: Allow CONFIG_DOM0LESS_BOOT to include device-tree/
Date: Fri, 13 Jun 2025 17:13:22 +0200
Message-ID: <20250613151612.754222-14-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 72202148-acec-47b6-943c-08ddaa8d585b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ehy15L41VzN+4PYgXOqSluhYhKp7gyk2YqGOld6kBkTbOi6/JyRt0xBsikbt?=
 =?us-ascii?Q?vOTP9Wo74im/PL7omU3twlnoDC+diYTWuAOreWjULQZBvqIN/o5qD7Pgo2/Z?=
 =?us-ascii?Q?zp5/G1GorLpOBF1gdmUZ+VXsaA25eng9Dak801+KHF0kGSfBhBNT2uKA9Ovk?=
 =?us-ascii?Q?3mot+9qVIAJwb4X5+JjmX1v/wZWVZ0xPIyME7eGoZhDVOYK1XZz8BRIEi6gJ?=
 =?us-ascii?Q?ZjkD8dWomb2ccQDBNb4yEPv+MMl6BwJv4tOZRKavJ4ujJSP4+JRY8cHM6Lxp?=
 =?us-ascii?Q?nCmT3OOapgfvFFhPk3cu1m8ls53Pw1m8F7lBk1+DZqzpOSzsqZN9F/B1tZAN?=
 =?us-ascii?Q?STkcc4ZGjfijLpHKAwxFvc7L140qvfjMEnz1zbzn46dzLqAjXHdE6V1IOgzP?=
 =?us-ascii?Q?zmB5erHFSIOZE9S9vT4jEBv8zpmN2WuOKoUYvV97tHO4k4DQ/0JM+ENDB1jz?=
 =?us-ascii?Q?BN7fp+W1R/cpbK0DtTFfbeu+yal4/QRQBunwb0fN1JmmOM1djbsaHTtIGBym?=
 =?us-ascii?Q?wCYYz+OvhOoYb9O+lI+nj+WyjWRySypSS5UlLepcEMVCY1pm0i67TGuJ/iBH?=
 =?us-ascii?Q?QNmJTPQdvxY1r2Z8Eu2snGL28NMEjc3OxVGxDtUCBFNoK+8dEz7ztfDW/9zf?=
 =?us-ascii?Q?7bY6PhOtGdTd403uKfLmeP7qY0lcUI4mpSB0w118Uvf+un4VMFB2SXUMbxTF?=
 =?us-ascii?Q?yU+HMfoeqSjBmexYMblwFN2j4xiFI1nS1HwDwb8ZwLaSZ5a1T5aEVgmqCDgn?=
 =?us-ascii?Q?jLAJvGLIQUjkdl+aPZmhWLb4n68vUTYOBSpH+G3S0foft59auKKUKz0Z9LaQ?=
 =?us-ascii?Q?+2eN99KAaEHiQsvuGl6si/+aNnoaV8ys0kb5wxBKiB1yAqzgMvCqFM+g+SWy?=
 =?us-ascii?Q?BUHii7nnQSiNeHK5X47G2WYm7lN8RFpAwYRnSjVsBIVp6MONUOANqoOawqjS?=
 =?us-ascii?Q?OjyDzMuIjnM89YdQi0hzX09M6MtdzEc7HNm28O0Vwo+EWRZxcuH80y21UiBn?=
 =?us-ascii?Q?sYcLb1yGlCZBtlxRC+7O0gw0EA3nFQ2tBnj3lGwSUZtllsztH72veyFhLvIR?=
 =?us-ascii?Q?TX9JKiXkz/OISe+v4qM5I5wDux1b4BQ7P+MJIFYLQq139TkOsMWSMLYChWBq?=
 =?us-ascii?Q?uYpQR15ygzb01UqZoS2Fs87dp/fwX+2SImkZ6AICK9wBEtY3L2FF4hhHNCjc?=
 =?us-ascii?Q?1fKqvEjuAEE+Y16affFckkaUoXC0+9B2oTbAWma5g3/KjJi23ubBdFL04zv3?=
 =?us-ascii?Q?i+DCJNlwtpu4SpLVUDT26gYEmAua8NWzC8AwvXim3SwBASvPbLe9EZ7PgC4F?=
 =?us-ascii?Q?m1V57vMG6x16Mflr+crp4M1L5tl5BUl32HwVGkzPtnmQr19aR9paoYfJhPjU?=
 =?us-ascii?Q?enlD6oxjPh++zCaMBTryLQMBxsBbmaiqxX0w34n02aHQHDXlagXk0eH24Nwi?=
 =?us-ascii?Q?XMrlfSdubt1mgBsdlol4z+yAMsAD7qyaQDa6f2ZFnsolvWH5V3n4+hLoc+VW?=
 =?us-ascii?Q?RLNjL+2+AORxU7UxE4jmoiW8C8gJgDwPR6x1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:17:00.5180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72202148-acec-47b6-943c-08ddaa8d585b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100

... without CONFIG_HAS_DEVICE_TREE

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/Kconfig              | 1 +
 xen/common/Makefile             | 2 +-
 xen/common/device-tree/Makefile | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 867710134a..2baa4221fd 100644
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


