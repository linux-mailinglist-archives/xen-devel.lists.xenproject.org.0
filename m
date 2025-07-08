Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BBDAFD628
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037106.1409788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCmO-0003zZ-69; Tue, 08 Jul 2025 18:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037106.1409788; Tue, 08 Jul 2025 18:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCmO-0003y0-39; Tue, 08 Jul 2025 18:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1037106;
 Tue, 08 Jul 2025 18:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjv-0005Uq-PK
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:08:23 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2412::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 874cc157-5c26-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:08:21 +0200 (CEST)
Received: from PH7P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::18)
 by CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 18:08:12 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::9) by PH7P222CA0003.outlook.office365.com
 (2603:10b6:510:33a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:08:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:08:12 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:08:06 -0500
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
X-Inumbo-ID: 874cc157-5c26-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QovpYgd9I33kZ94d8PlNBwwm9X1YJKmajIuLuGAPNpGJhGbk9bCnRWKQvt03O3mJF+tLyl8tRJHMktHXEAHv7RNxQvmPhNzQNSyHbj4uqJ42foa4xFPvIon5r0U221YHcUV7Muqzp6PrMZsy9Q8CqKtsyymoiLBF62y19q7IGn88cbT4527ptWR3CuU45jh/xMTeyVO1BIZ682tIk0cSU71D1PAwYpOR9jovb8jfZp8y4IN/yQAUEZ9xTTJYTrfCXgS3DlQ9M1Fe/400G4eiwxwd9gFbwzkKGYwcMLc/sXu6S4NEUn61k5dPcq4sNfb3m9K8WP1Y1f191/4xl2Cxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWgA6ZcAAgNHomu+hS5t/Jbt4vV9HHO7nNlAbbTffuo=;
 b=ct2SGmHlDXDn2h8G2EcknXg7SvqCYeEt5+Dja8WT2Gx33Ox+v4sav6kMxAI/zS88deeyRlx0XDUEfoEELEQ+SdJ6od1N1MxQArg5zwlk5gKcVd/yr0opmbaRCJnosHjW14TS1Tj0CiYIHg4+8lbuEDdA82yhBuUbYXfDUQEkRuH15Kkv56TUy+d1ng+/ExhLTXbgKA7KLYfr9cODcb5QRugHy2u/1kKfeOXYNRUuagHa4LKRvkTuJE5u9w2bX7KZzpMQsdJru4TQSePIDt0GZUaJyDEl3pTb8YFQVN/vHFCXcLSOGLXKxRpc4GwZpPzpWGni1ahzXKQisubtwjljLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWgA6ZcAAgNHomu+hS5t/Jbt4vV9HHO7nNlAbbTffuo=;
 b=B52PHA/d/HpBHSsgFVKd37p2AhlgasS5filpaZbV3hkCMCKtOja2wiGfVqSCu0lSAT2YjrhB9DujfXjtXh0ws75ZUlhYhJ1BTy/D31sWSalZqTu+NMS3rgPH4mCfqK43k9myQK+3R4wSiG5l2n0UljhJFQrxrODDcfkPWIxBXsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v6 11/11] xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to include device-tree/
Date: Tue, 8 Jul 2025 20:07:20 +0200
Message-ID: <20250708180721.2338036-12-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 72c2c111-f43f-43e3-0200-08ddbe4a671f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?it8xAxzjBIHfDdTBS2dihktmxd1FTmCAsf+N2NFtxmoaaN5FBBchXRFMcSvT?=
 =?us-ascii?Q?wDyKR2KyZMwDBvnQbz1fKt+3Yyst75BwjiTDfEZSIQoHPwUSAXJ99P0+xVcy?=
 =?us-ascii?Q?ta91Nx4L8LhcoAVg1qBNfP9ykQ2nDmr/tWQZWPztly4fEFCK2WJbyFgaH0Bd?=
 =?us-ascii?Q?Ggikn4GW16tZUq/RxXOOqQduZwcgEdKnOwsrbpi6NE16ZjTTv5PAmy1U1Mq1?=
 =?us-ascii?Q?6+9K7vNCqCqHfCQ2VbVuOW4GJP0X3H9f+mwujh08QfA6LFwfVfO+G5/Y1Fdn?=
 =?us-ascii?Q?WQwJELZzQ5EHG8b4bPUEctz8kUJqqn0dLoVFD3r0DuHdt7nwgc2Sc1DDgjOk?=
 =?us-ascii?Q?52lZTK67G1cNWmPZxuRo3n7wEc3UuaTdDoyCFQC+67lAUCDT8nI/QiGFCisj?=
 =?us-ascii?Q?HmjYaZzDFcxNJ3H6nT1nMjjIevxg7DPfJ/VWxRcTUMLWHLSIG2R9RGGm2gPO?=
 =?us-ascii?Q?NGQg5UHtIGi3a6l1i2t6wjKrexPwwHlid1/ZfKqkbGAEHAXQJJAGoTCPQJrW?=
 =?us-ascii?Q?8sfjmYIvvvWQisZqbkr4ugX5/m+1wIGp4BHp/BIE1Kzdd22DnxVRgAN0kjJc?=
 =?us-ascii?Q?p5fnWVL+T/yK2Vqg9PKaRHyeCc3+0PJi7NU/nZeyBSermf1UNrXHG0gAP4qe?=
 =?us-ascii?Q?nNVZLFoi/MbHnfhD4pLse84W59yDtfQDwrdnnLot4ATyAUbbAKVDwrsXRWZy?=
 =?us-ascii?Q?UCY/zYUazwLg1QJvxZRcvG9OsXXI65P1HhvKke95CvfOwT9OJFrQigaCh1le?=
 =?us-ascii?Q?eRlTHbqEqhv9pz6mmrmnLMEN2tJh90GH5PaKAD+TY2U9U1eES8WgfxodWC/a?=
 =?us-ascii?Q?0xdYA9E1TlfrGDxhX4UC8SKG+rN1Ve+roKd8TZog610593hsmEPBOjFD4Z7J?=
 =?us-ascii?Q?o3S8RtttXRDU18PCrbMwhLg7Ic8m8VqRmH0M6iU+7LzFAcZSuIR7GSHP6YAg?=
 =?us-ascii?Q?z9wA20cm5s1nhWDWZxXxbaNOeChUEV+tlUx9bv5EDhFJHFScIPiW4uJdXDyW?=
 =?us-ascii?Q?pQ4WBe9K7VVhe1sS3MCezdPFoj5mTEvY6feNc24sv0VlxyVogr/hvLoi5yhi?=
 =?us-ascii?Q?PrpDmQf5PDYtFbJwfiXb1WCUb7uNlg0FKtqI4etCi1Iqgi+L7JCvMLmrPfAu?=
 =?us-ascii?Q?ltk9KhHVgghTMugFfrKo3I4R/t45AgTyzNq4z7WxE3wyoCMTBz5WHpIGocd5?=
 =?us-ascii?Q?IBmUi/J2IgHir2b6SSFNRO0WmKhk2mbkE4MtY99tI9If9eL3MnCsWAIjW9l8?=
 =?us-ascii?Q?RMOU6ZDN0SvCn7+rshqIkGBAGaTQm8Cr3FBLz6LCnAX+dL717wFSbpZZ7lEa?=
 =?us-ascii?Q?irXFlNrFKxjJY10ebqT/nxELHCZvpiLbwOzO0C3y524FXDa2B4cREiydsyxo?=
 =?us-ascii?Q?LgSb7hQedhRgwAeDcSKrXl54VTBPBdsoxv5gl/nl/ubpbHIgLd9DTuKN0XQB?=
 =?us-ascii?Q?NwkZZDycZqqf8swidzNQb/9PSI3Ql7yCN+WbDifQdVoOGdmEGL+v8jEl0xq/?=
 =?us-ascii?Q?evLETc1zkE6P+3FvpxNhwHc+ljUbTle1FuCH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:08:12.2488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c2c111-f43f-43e3-0200-08ddbe4a671f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706

From: Alejandro Vallejo <agarciav@amd.com>

This allows bootfdt.c and device-tree.c to be usable without
CONFIG_HAS_DEVICE_TREE_DISCOVERY.

Gate everything else on CONFIG_HAS_DEVICE_TREE_DISCOVERY.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/Makefile             | 2 +-
 xen/common/device-tree/Makefile | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index 8abc069c4b..e399242cdf 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,11 +1,11 @@
 obj-y += bootfdt.init.o
-obj-y += bootinfo-fdt.init.o
-obj-y += bootinfo.init.o
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


