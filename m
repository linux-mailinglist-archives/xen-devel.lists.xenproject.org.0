Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4374FAE2263
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 20:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021175.1397231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSggF-000590-8I; Fri, 20 Jun 2025 18:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021175.1397231; Fri, 20 Jun 2025 18:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSggF-00054L-2o; Fri, 20 Jun 2025 18:41:39 +0000
Received: by outflank-mailman (input) for mailman id 1021175;
 Fri, 20 Jun 2025 18:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPYt=ZD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSgWB-00057I-Dx
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 18:31:15 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2407::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bef0dc77-4e04-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 20:31:14 +0200 (CEST)
Received: from BLAPR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:36e::10)
 by PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 18:31:11 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::e1) by BLAPR05CA0003.outlook.office365.com
 (2603:10b6:208:36e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.13 via Frontend Transport; Fri,
 20 Jun 2025 18:31:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 18:31:10 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 13:31:04 -0500
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
X-Inumbo-ID: bef0dc77-4e04-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOuYhSWJzkdOQCjpsYOTL/Z4TtVTCF/m6u4Qs+T8DlNUNxXfkEu+QSyn9TwVYZUw3BTsLFqS5pynogxh+sYfIYX9FQRyoRyoYLFPlsJBD6eUdjsLzJi7xDPL9OKIQbHkg4B/+Httlyj7YVmZes4w5/vRYV+d1B9ts+hfcqvPi0EL6nqWo41X5HWgfb67kqkgWfrV6B6cwhlAXNSTmLEiPfha57XRarGROvdPXToEYPydHS0FdUshSf3HOa0lEA+rbfhdCbXUqTGOU6uG80ge5bFeZlHomqIxEQ2c3oQfNvw+meZuqNBDnQ/xpJ4Bhc1P4th0/tS1mqmJxhldpzhtsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdFpjspBLXF09Dh8dXIg7wVUrR+4cy9u7XozgkJTdVo=;
 b=N8XLJsehOvwA0GFGe5oZn76SwEzxfsTBr98X+OAVVa5LUhNmeCRWYWxMI+VhjI8PHscUzoiicrkgajOHuXqKC7L2SPbT0CTaUOExj3etAtDLMY6Dx/AMfvgRsztDzKs9Ucr9i33kM9TgcEv9eHuIIVF45UtkNjNtCrrV//RWKa+1M6vUHfAG/AzInTDAcGcqmIksc8yytuWNwR9tTQuLiuMWfNxp/3lV7jab3jlJLajMIa32Nlkyybu5iiYlkVQ/eMnecD05TncFRv1rEeOZ10iu4m4TPFdj9cEdtUBvPLKHcwVPUOxv/frSJZViwUlplbay48HiPiKQ5zBTr2Lo8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdFpjspBLXF09Dh8dXIg7wVUrR+4cy9u7XozgkJTdVo=;
 b=dB/ORJh1r3S35LnQ3ffHLEGTCkaqAMXWfqW4eWfEx8ik/LauvYGkEBacAnW1S3m5aKtsc29/dYFifw4jFAg7AhvpKTbAXiZTmoIMCNQeQYdCkhyYeliezGVj58Qt3NQeHPr4h54JQanp1eIM/grMSciQQWP9/gIXvpb4hidDfRg=
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
	"Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH v4 12/12] xen/dt: Remove DOM0LESS_BOOT's requirement on HAS_DEVICE_TREE_DISCOVERY
Date: Fri, 20 Jun 2025 20:28:58 +0200
Message-ID: <20250620182859.23378-13-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620182859.23378-1-agarciav@amd.com>
References: <20250620182859.23378-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7486d6-ee33-4b5c-1034-08ddb028a155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ky2oK1WFKZBB83Xj4T617U2yS2c+uZYcT0dXbxo+YohCBeLdsopT9S55F28q?=
 =?us-ascii?Q?RMLMWOhltWgUuXLrUra3uf6OC0JVjCWhF22x7FuHLfVsrxkv87BGnphikGKY?=
 =?us-ascii?Q?W7E+PF1bSxTSjLnDh1fGeAQBB74eXO5By005wv2tERYJxilb2/5qOm9XJsLL?=
 =?us-ascii?Q?bUZXFSuczP0yxl6/BYOzHEdT5MreFHqOVdfKQ//9uicS6GgrUlZeZaHpeuDk?=
 =?us-ascii?Q?I8C2f6mfa/+x3fQ6bB4ppyxD2caGZ5yHFZQ7nT2fnLSm+NBFvgrwYBWx0b2D?=
 =?us-ascii?Q?dVmMVrTEFh5RudEpxf2qHw68y9CocStr+xq+yeLTVP4lJ62hRRUPEr2PBr+T?=
 =?us-ascii?Q?RVlVWg4jWC9PJD5kjXj5KmWQqGkFd+fMtd+i/AtqQnYtAoecrSRD2TQ6STRE?=
 =?us-ascii?Q?h5xzS2pV9pt3u7FyhoFet1xKeFSWa3zvhGdw7qhS+wHJwF6ahk2o/N6ksUZc?=
 =?us-ascii?Q?1SIKCVJkBZIaGt/Tns06vH60wo68fd8V0wnwCcm9hTDdwhPVnx+VDXV52gm9?=
 =?us-ascii?Q?Njq0RKK460oC75pSIN/xBm7SmeRUbyUAS1Cid474vyYKFn7xqGVxXvFHp3Lt?=
 =?us-ascii?Q?YM/lL18dDpoz8Gw1YrF0jx9rGXU62EldfRj3uLoQLfi7sNd9PFWYZK8EpKu9?=
 =?us-ascii?Q?7vV6zsZ8mjcSlq7Hz07OLgnYo32Ww/Ww1N/qnX3XkbHQHhSEPtTH2m+6sz5z?=
 =?us-ascii?Q?LHsDjf/LV7DhuFcYtgwNjHvDMy4l+nKkwU6T5L3koVljKOhpNNaPCKl94ecJ?=
 =?us-ascii?Q?59Hr39M+UXJl/omsk8szdV9iBAhLoyND0XSx7JnqavR5OcHh4PPO7Pr/sYpj?=
 =?us-ascii?Q?rHjCLRBrzF3elDNjrplzDo9fcSMN0E053CnjTdcukqOSYOOrjXflQ3otDgWi?=
 =?us-ascii?Q?jrwr2/0GnAAPqLeLI87qduexLGeWqkdQmtzj033yq/Frva+eYvjb8TCkTSrM?=
 =?us-ascii?Q?rzhpGn8yQpoZLp9AGXA2rab+9SxUsRZMIk41WQ5B2JdFYEcRw5lQwl6SzJr2?=
 =?us-ascii?Q?80XUNFuu+c9w2lFWc756gXohTI+0Ahs5b/5CRxUJxfDXYHuBqwVTLPgG+L5V?=
 =?us-ascii?Q?6uJLB03mgFcm5J0csdKir6TWJ8sNlQi+dVaGgd8+mohvPfLjnLY70whf43Td?=
 =?us-ascii?Q?EZNyzlNCszMx/s6QuUgNZI8RrazH/4AFSJt1Dbmsw9rF20o+VHJTX42NMFbQ?=
 =?us-ascii?Q?JXE1IABBTJ+0vruRJ8+lyvTcYLwaRmLU4x2V9rhYobf1jbECEJ8zTlDhjBYA?=
 =?us-ascii?Q?ma7ds4zEvlqu/dP34IctN7qGWkwshmcSFWIGROCdEaqF1roHw9U4MHwvlffP?=
 =?us-ascii?Q?XSvmZhwVZ5RdHa7+7/97wUlfPGs05BaNOnW24SVBJaUhPSm+MosjEOJkSOY+?=
 =?us-ascii?Q?NMkJncfpzT6O9OWpZjyFGK27raNVIc0xNAPjlKnuxKBWjsqmAbL1n4r3F7qm?=
 =?us-ascii?Q?ezzU1lxUrA6PktVBo5Qu4q8NWImz1iL0QRc5R14M90Uu2aaQ3+ckgrnZZr8F?=
 =?us-ascii?Q?eWTayfeaNlg+fL/2HuJ5Oo8ZEgIDh5MLEu0g?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:31:10.7951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7486d6-ee33-4b5c-1034-08ddb028a155
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831

This effectively means that DOM0LESS_BOOT on platforms without
HAS_DEVICE_TREE_DISCOVERY (i.e: x86) acts as a selector for a
stripped-down version of DT code.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/Kconfig.debug               | 2 +-
 xen/common/Kconfig              | 3 ++-
 xen/common/Makefile             | 1 +
 xen/common/device-tree/Makefile | 8 ++++----
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 9192d593a7..89b0af53a2 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -92,7 +92,7 @@ config VERBOSE_DEBUG
 
 config DEVICE_TREE_DEBUG
 	bool "Device tree debug messages"
-	depends on HAS_DEVICE_TREE_DISCOVERY
+	depends on DOM0LESS_BOOT || HAS_DEVICE_TREE_DISCOVERY
 	help
 	  Device tree parsing and DOM0 device tree building messages are
 	  logged in the Xen ring buffer.
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6294cd7939..1ac28a4e78 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -14,7 +14,8 @@ config CORE_PARKING
 
 config DOM0LESS_BOOT
 	bool "Dom0less boot support" if EXPERT
-	depends on HAS_DOM0LESS && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_HELPERS
+	select LIBFDT
+	depends on HAS_DOM0LESS && DOMAIN_BUILD_HELPERS
 	default y
 	help
 	  Dom0less boot support enables Xen to create and start domU guests during
diff --git a/xen/common/Makefile b/xen/common/Makefile
index d541fbcf49..19d6ff7a90 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/
+obj-$(CONFIG_DOM0LESS_BOOT) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 8abc069c4b..4a10b0508f 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,11 +1,11 @@
 obj-y += bootfdt.init.o
-obj-y += bootinfo-fdt.init.o
-obj-y += bootinfo.init.o
-obj-y += device-tree.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree.o
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


