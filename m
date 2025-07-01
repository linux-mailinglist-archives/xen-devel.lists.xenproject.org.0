Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECBAEF5FC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 13:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029576.1403368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYjt-0000WQ-6v; Tue, 01 Jul 2025 11:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029576.1403368; Tue, 01 Jul 2025 11:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYjt-0000U9-49; Tue, 01 Jul 2025 11:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1029576;
 Tue, 01 Jul 2025 11:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lih=ZO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWYgU-0002hE-GZ
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:57:54 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2407::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c7efa3d-566a-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 12:57:53 +0200 (CEST)
Received: from BL0PR02CA0120.namprd02.prod.outlook.com (2603:10b6:208:35::25)
 by LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 10:57:50 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::97) by BL0PR02CA0120.outlook.office365.com
 (2603:10b6:208:35::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 10:57:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 10:57:49 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 05:57:46 -0500
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
X-Inumbo-ID: 3c7efa3d-566a-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJqr+6Rg+GVrv4uM073oeLERo3AWOL1CTbO4WL/P8L1YAhmGYVcNlAgdACnCM64K5EMUFtMb8q64xZZ15yfD/O45eaaw51sA8rQKdRzwKxoTo19RWQAXgNjAOnTG5G1/88V3Vxdw6xd/zucD4jrjJtO6oM3/TToSkQEg24K7FaL+E5/S7sBw9r8Nue+dG3mNJDVzWHFhw9jEUH/X4CH1HCCut9c0hVDkq+ioJXNWMbraOaVfTZ10bWO44b0ivADezZph1jP9t6SuBqIXgcjA/9ESFRAkeaSJ1xmcJ93wRJQ4ItYHlTs6cuMhMhr6WPH6UDJdWVZlI5tOJgzjopiysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D3EzT/oj4KFimtajf3Jv4n8dk1VuE6ptlYhwqGVnrk=;
 b=DfkCG0zcFxVyos41r60OLpL1k4JReyVkZqjoiYprVqnkDvjvDIrJ/BkFaeAzkx/WgKu4QQ6elX/p49qwgEWASpdolJkT2vBlzn7L4aqfioKTzhvObrLFjFG1/pcpB/ZQutKIN50wHv6DWEV++85cuXR7awKmpHbV+qjOPDR6EmDoJGSgSD0eIHF1fUsiPNbzSdowjnAyNhUquZUPfoRRPpiyeZG9jWPICwFstxyPtMpV/j9u80AYnJ7BrMIGIf3G/xO2BNtDSX7csx6P1h+wkWuJqBEhM65NVRZuWZWbUGmagnbrf9tcIvnyXkHA+BGnK+q/ydarZSkfCEbgHcLM+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D3EzT/oj4KFimtajf3Jv4n8dk1VuE6ptlYhwqGVnrk=;
 b=C96idvL0BGHpoBndJGpiWG4YXsaHltKEIEt4w88HIWHJJV2mOhXsMdItVtg/we8LcFklFUgOEvCdDV/9tpnM2yvmdR/TqITGcEIDCpEODfHoJf5wmjNlTE1uaQ/80yJ78qHcoTDp2KaNUbv1OFPnpR6iZXdHgFWmb0I1YrGdpLE=
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
Subject: [PATCH v5 10/10] xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to include device-tree/
Date: Tue, 1 Jul 2025 12:57:04 +0200
Message-ID: <20250701105706.86133-11-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701105706.86133-1-agarciav@amd.com>
References: <20250701105706.86133-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|LV2PR12MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: c16886f1-c114-41dc-3180-08ddb88e1e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l60/3Cist5nvfD2qUC4E+JTIHoBjE85gBku9koLHN08rxbGjb+p3A1Q5heZk?=
 =?us-ascii?Q?xCc70ntVj6Fq3e/s/EWSWH7dSGEdZ0MX1CvYlqMaXOnfWlLidT1ZrCtEnhN+?=
 =?us-ascii?Q?l65oychHe+y8PJP7QO/C0H0bJ5yJRpNOLwyoTA/015w19LPy+cwtA/KVUSQr?=
 =?us-ascii?Q?LdFF/ooiFtKUmQ0KzNFczBr+TrCQ7vgl5/asy/UdXJANhjbfk4mKHLG73YJj?=
 =?us-ascii?Q?L40RnLf8KKaY6Es2/Gmx/UiSwnzzSTdRDM42hLRqmGlD3knO+n18fFLkBlRP?=
 =?us-ascii?Q?I2fo+RFQ7g21ToCM9+U5XX2TJ5AAc4Jlj+LiBvvwnEaN8vTcciRd50evQUd5?=
 =?us-ascii?Q?xLM9YfDbITaBzmcHFRAIqV1CJNQfPqvg4ul9cECqWt/2MPsBqCn+hagFpd3S?=
 =?us-ascii?Q?9+uV19SIXqZICUHWNaVFHQOgJKM/l/hfF7od392K2t41Qjo/DT5pluEdWixL?=
 =?us-ascii?Q?lOtMuT1esYsP92P221JeozYe5fcVKVBvA+yzrWtj6f4KPYIz198k6rAEBpXO?=
 =?us-ascii?Q?w92VuIZId2mOjnK27LkJSCNneUy+osIDszUsNzDDrB1WMd2z2AUcTQFCWacP?=
 =?us-ascii?Q?ZUzyBWSn9nXl5bRIXSzpO1IzvvU65U/p4wZ541eUJZpwpUjDD9bgQEkOPZoZ?=
 =?us-ascii?Q?aU6B2gLs+LYI9SH9F8yQblVzOMZdurIaYj/K3XPBmLMNAc/TK8pb85zCchNC?=
 =?us-ascii?Q?aB2J2zFKCC0suYlal7m1oWqko5QaDLmK0c8HXF1+tQPLC2ZCNmLs6L7pxNob?=
 =?us-ascii?Q?UBh1Uua++bM/Wd9f+wlKI+AjTT4xDjpKPGgu4d9cfDJ+jdqB/ggCg8gUMuuJ?=
 =?us-ascii?Q?gmjkRukE1Rr5ht2JSAwng2qV7oxMqr9k+Lr6exkG68iAjp1hppHl/UmtdOjB?=
 =?us-ascii?Q?ComopVS1VPsECNwbjS2inmr2FAHeZCFnXcgwzhw16dlJdYyrE6bTLPafgvWq?=
 =?us-ascii?Q?OjqsmzyWZ6DH5UiVPa70JFhrxBfpI3QKqyJ0KHhmMscOLtfyMwg7wdwKdNlw?=
 =?us-ascii?Q?R1WN/VchnUVGr5Tp4RnMtS3OBbSdZNt1I5PLDYYcCddFdC/BP1BJtu7odNxn?=
 =?us-ascii?Q?8mFjKx45ePNvppw/geeck4DJKbQ3w+0he0gFsN9OwlH2h7fG7BvffcUSbIL5?=
 =?us-ascii?Q?H2G7KPE1e/6Ozke5yeyWXNwKQx0jjBFoV5HgZ73ogrc89fXpO5UDZ6YygHOf?=
 =?us-ascii?Q?66H7JLl3Ma1fhLq4j2bDd/i/eg4JbbYurZfyPuKIByF1rtZ0MjZnSgejyVxB?=
 =?us-ascii?Q?T/I4bxgD/j3oQsAhatpR5f+6C9z4zasy/jdQGt/mIRCmUtDYRf4KyfH00s4z?=
 =?us-ascii?Q?ME8CCl9Xps3GUau4Yc+b5isnYvj7XVggNE5Ilwo6Gwap999ckUDri2RlVCKH?=
 =?us-ascii?Q?i8xUmUT5Q/FcL+PK+Ov1T9CakM7qe/JxEUeRrk/FNlzEqSSkFGL6/LigIS2J?=
 =?us-ascii?Q?3zQGPWEMNkZP65NvekZ7wsbAYj29HLnH7lafmnPKHf+A1RraWAcQ/MR2L0rr?=
 =?us-ascii?Q?oyI4dZJNK7SgSwNMztigCwOm9mG3FALoAJ7R?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:57:49.3940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c16886f1-c114-41dc-3180-08ddb88e1e94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5798

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


