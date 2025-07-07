Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F21AFAA15
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035086.1407368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJX-0001zG-Ud; Mon, 07 Jul 2025 03:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035086.1407368; Mon, 07 Jul 2025 03:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJX-0001te-OG; Mon, 07 Jul 2025 03:14:43 +0000
Received: by outflank-mailman (input) for mailman id 1035086;
 Mon, 07 Jul 2025 03:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJW-0007mT-Lg
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2417::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 851f2a38-5ae0-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 05:14:41 +0200 (CEST)
Received: from BY5PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:1e0::26)
 by CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 7 Jul
 2025 03:14:38 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::15) by BY5PR03CA0016.outlook.office365.com
 (2603:10b6:a03:1e0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:33 -0500
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
X-Inumbo-ID: 851f2a38-5ae0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9sh/t4tziq4DB/Ko8P2Dbht7DdhXZJ+0qNmmhO1UGd9e4C9W4bu4i7uFRnk6X9djh4fNufcKvBozEIsr3b3yi5NgeRs7qskp2ECr24puKtFVyKHXeB61IzENkm7KjU/3NRxtD0/tqo1eZvvYlxQa5JgYYOdgKssrRtyIDD+y6DPn2tcxaaPpqIa6rBmqDSfMx+VPX/yiLxi4EEatNUqC3GaCnkRokMhc2XBpmcvtiJi5e6pLG3T64+EEKbqy3WG9xraKpjbO1lvvbn5lcyg8ue8mVfQZ6nw37XDPoTk5zNlB4U0OipjrytFBzuSSnptMcqT1UQnckJhdzwjidXJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJ0yWQQ3+ezfc84j0CJ2nrRzdn7Cpfu7Pu0S/BuaQIE=;
 b=FFa/DUGkluWVgzSOt8NvVeKgwaGbIUCDQ1JS77cTNYn8BRoCfhK2or69FQPaPniFOp/4+VGZjeUpreKJFyGyTX3kaUw5UUZBaenyBK1GfN35HDq0jE4Pkl48epC1zOzt67VoXMAVtFBKKoT0MKT56z/2V9TSsc6l1siai5olNXc3ItSXBCh8E9ZAdxLGx+eBkj/BniveQPs6vz9AXqc8I79a9KxZvXrExYKLzS6pYn+3igwwJf5HpCZIYGJ50e0LvONEl9npQwl0Q19cAlWJmeYMOzm1q0udj471l9tY/3LC0v9h++ZIY1xzz7GbHIlmu9aevFt25gqYijtW02ZXrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJ0yWQQ3+ezfc84j0CJ2nrRzdn7Cpfu7Pu0S/BuaQIE=;
 b=Jh2XC/3tSeIKB0AlNPfV7vFHa4pbrNj0ccOT1HEPVQq7xbm3sEQ4mpRk1QEGUX0dlcBDRyDVKTvu6ySXgn16Xq+LniRDlWVUdZVVkp228mzwi+HHOuIUwS/qAKPbr8nFvYX0X5SR5oyiTRENQJ9xsuZGU88blC2ypIYeTxroQ4Y=
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
Subject: [PATCH 10/11] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
Date: Mon, 7 Jul 2025 11:13:45 +0800
Message-ID: <20250707031346.901567-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b9dbbf-1c35-4cbc-28cf-08ddbd04675a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jXLQ7e4oqagfkGBf3fwPUhk5Pa9KDV2oOo0aLonWpSGw/44DqgI/AiBTqJIw?=
 =?us-ascii?Q?EfHPHaW6dwD1a7kZQ2AzsZYowapIh5FWVXX0n+8rNsKNN70G8BCW1lqfJwOB?=
 =?us-ascii?Q?FPZVqX2yYd6MAJ1Mxp7bKt+ShndCO5X7rtg16Q8NFU2Fq/RlETukvFuKinHo?=
 =?us-ascii?Q?mpM1Qzkz7zwdevpNoFCWsE5Lwclj+GraQHxGw8Jzojpj1CAEfGkxhkFNCpBT?=
 =?us-ascii?Q?CgcvKxkp6YRraCMzpVEgC194umWDK208bEki3xDVzePNEeX1S5dB6XpV3QVZ?=
 =?us-ascii?Q?aV1iVSuQ0McInI4UcxYYBUlmSWUTHHgg1RdrHjWx2JcVoFcmy3amN3r7Xtml?=
 =?us-ascii?Q?p2tmJ7VpLdujdh9oEoqNKcZQV78cy3Etf5yFdVNR8AVgV4SFKjmeZLpSkWES?=
 =?us-ascii?Q?y59UnOmzRAY8Pghqn1GlSBIWEIAXuYXvJ+lZtWokSlP9kDlTL6n7jwqmzjpd?=
 =?us-ascii?Q?I+lDPXgNgbxZcAwz8nyT0QsGulLZ2NkuV+mDOcqJiYZFDzRdOpyhpZPzOZ2a?=
 =?us-ascii?Q?UEA429M0xjqo1iyOmiBaIdVqXlGZ8ZJ6VJujHhZQLMhxQGOABvjekBNwbS5D?=
 =?us-ascii?Q?Af8Iot1BniIH+o/ufA9cBhL8D5zK29VoUD2A3EHERZjuEa4YhAhqVcCmwkib?=
 =?us-ascii?Q?K/0i/TBRYjx9RhcxNDzPRNtnfJjsLhzuygyFXflkdeVaYwHifbid384IzOrL?=
 =?us-ascii?Q?CgnbXQR3mXq8zZqc1iC/k4k1KDHpUgeR+35Xh9H56inSc/o48nLwP6szM4r9?=
 =?us-ascii?Q?irzE84E3lghnpLHTTi8/AQYESa2bVPmaDZFsiYOPZ7stumYlV0Zyk/Vys4Nv?=
 =?us-ascii?Q?lQFsT21R1UQ6HBEFy+M2jjeJN9VEririM4pAbfELwLP/0j/UAnHQv5pSMsmA?=
 =?us-ascii?Q?wYmLs4syIpOHHuFkR9oPZRcpgwhY1kNfYsxx5qnl6yWoKeKAtGenXvlzwMod?=
 =?us-ascii?Q?NpDNNZOiy99IEsHx0bmmBXK5Xx6hYpewWvagfJ89cCEaVxooL5jillgOmBXM?=
 =?us-ascii?Q?2rz4UNvIpvz0kh7c4It87jM2l5Gfx4KN9uhsIe5QFg3pMZLl3KaVKDzgil/0?=
 =?us-ascii?Q?r6PEhQZ1Go7gH2a8rRr9sDBJfCMS6ceLaYuui49DudYgaI3saQrhOmLPFOT1?=
 =?us-ascii?Q?D9GIPkvtU9kY6S7uqBWYjZ58ZoSCtBdy6lQ/NwrBugaAQ013HrchnVN9BIZK?=
 =?us-ascii?Q?VdrmrJ4nxrIZC2rOJwWDcRJ7RXxwRr2TTpGfoHWuHH8V5GZCDEdEwuWDejEA?=
 =?us-ascii?Q?nyhWt813sqoXrzQv284Lt0FgyU/zU9/zQ09pGJHawb+7M0QcH6B3EfQ4E9kp?=
 =?us-ascii?Q?7X+kgOoS1yxeD6j9nuju8shikiFRX67kiXeyP5+xAQIKj564ELzD+N31BL/m?=
 =?us-ascii?Q?UGRi1bKMXFQyfGWukVrqRAVZ8eZqCb3kMIwFfd4YvtHtLSRJhCwrHxc8U8Za?=
 =?us-ascii?Q?DqGf3sFBXgLxZPGi6NuVxmlgyAprn3HROEgmp7yPywyf89qIjRUp0/tlA2Ll?=
 =?us-ascii?Q?jKymu5WWVtaphHe5sj9pTx5nQ9b1DXx2Fiqz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:36.6606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b9dbbf-1c35-4cbc-28cf-08ddbd04675a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311

Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
equivalent "if !...") in Kconfig file, since negative dependancy will badly
affect allyesconfig. Although "if !PV_SHIM_EXCLUSIVE" for CONFIG_VGA is not
truly a dependency, setting PV_SHIM_EXCLUSIVE y still makes it unconfigurable.
So we remove it here too

Add "#CONFIG_xxx is not set" for above options in presets for x86 PV shim, as
the explicit declaration is to ephasize setting for the shim is different
from the general default.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This commit shall be commited together with the next one, which is also the
last commit.
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
v5 -> v6
- add description for change: removing "if !PV_SHIM_EXCLUSIVE" for CONFIG_VGA
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


