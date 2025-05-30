Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EEDAC8D5C
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000797.1381028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyZs-0006lN-UK; Fri, 30 May 2025 12:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000797.1381028; Fri, 30 May 2025 12:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKyZs-0006jh-RP; Fri, 30 May 2025 12:11:12 +0000
Received: by outflank-mailman (input) for mailman id 1000797;
 Fri, 30 May 2025 12:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySS-00076q-0M
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:32 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2412::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 193936b2-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:30 +0200 (CEST)
Received: from CH0PR04CA0095.namprd04.prod.outlook.com (2603:10b6:610:75::10)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Fri, 30 May
 2025 12:03:23 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::ca) by CH0PR04CA0095.outlook.office365.com
 (2603:10b6:610:75::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 30 May 2025 12:03:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:22 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:21 -0500
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
X-Inumbo-ID: 193936b2-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCZSPjqqpRWyN9AqgalFKOiDTrWOp9gdaU+mL0xcic30zYJAxgY1SDtslm1vOgBwwTTqe8McCjGuWaib6L3sogSHpcvnGwlz34rLSHWg2gNgBv3E4GI/xOqhY/Y/mGdfTe43w1EF2ejwudMJXf+wrhhlKBmVSW5cUNDy3lrGlIr2QOjhpp8YEblbekJASo2M6atZsGJnS5BPyina6DFOFItJLvqw8csQPEMUKlr/EwHeagKAqLjwcS1D3s5WPnjt9bkc2+J0cCmu6B43BnZzy7+mdW0CUZM5guslNgkTONYBTI7mG/rdtoZmofNvzc8cYKMF6a9XmBXYsDMdh0LG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lh7ewCrrIM0zkU9a/iiqTktsuVi4TxAGs/l1EJ0Ddg0=;
 b=Ph2+vlCWzso3pIY6FJ+HoxeDfCP1K1/v7ij2wEvs1SAPLPcOK7hLzD8Py4S1UVhmUd2YBaNiLsfqyyKKUYqxAgzBAfr1Mikwzhgyqqwq9CU5UcdeIz9HUk9giYPGuOTJcfw4XBhfNTBHkkLy7wvswwfJiyc4m4SPK8LFM6h++ZBfvjndJ/HP6+6aOrRunYZQWr/V5/cVAc/Q/0ZYKjlPBGALH4HKbrppP+rWru7T8CqWnELImKiNHYmNXr5r5iWnJdzg3skcI9M+2/49bHR36A+K7bzyMAJjkSsitPxlfBz0RYkZc9mr4anriTlxl3he1wXVJVR3QHPaYs0hvK0Pdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lh7ewCrrIM0zkU9a/iiqTktsuVi4TxAGs/l1EJ0Ddg0=;
 b=sYUruGK+bR0evDJhEaylVN28UR32S5Zm+sDPnWSGXaahDTFqNObpWMz8Ci4YleKEvKOSdVqIJfLrX2M/9h4hYP3BZTnVRxQ8digMvH4VGyVx1nZit/jOZFTq7Ow16Sqc8iqMrHqqQDRFewh6WoDAXTA3rPyfHKWojKzzb9nj1J4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 08/19] xen/dt: Add BOOTMOD_MICROCODE
Date: Fri, 30 May 2025 14:02:16 +0200
Message-ID: <20250530120242.39398-9-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be31408-4e36-45d6-c202-08dd9f71f9ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zn8Ghrk/oI+ejLkPnT38dxN4FTvByaAlfvaW/6k+uJe7B20oc4Vy+oTWiUE1?=
 =?us-ascii?Q?AV+YPYoDLd0RpnPTFIl7vkLjTqUVns0n2eDd85RuQ/ApRHllaqPM0bDgswG9?=
 =?us-ascii?Q?HVVlI4x/bvltDNVfSqVZbe4LJxTWsZJEdPrtu6zagq/wzmDSTlQCnQoBtIbb?=
 =?us-ascii?Q?tZdfIMQvqXlsVOEx4bHfRZZk6mdBrr2paXH+1Zf/T3m3f29AgarHWpCX8WG2?=
 =?us-ascii?Q?aFXQva62v+5AWJSYiqGtt6L1sdyU/4n9i78mFFvU26DvHbRyuIXuKPQapSu+?=
 =?us-ascii?Q?0CrnBNlRfAlnATf4Cncl+SfPYxoMEFg9YyWMtk4YMQBCJj1ePd9WTJky/qwq?=
 =?us-ascii?Q?JYNkPtaUE5H2zzmhgucrdRqeTfA5ciUqpuDdFqYGxOFl2dnK/rVDYmXAW5dy?=
 =?us-ascii?Q?WuzVzUxL8f/8gGBcW3bcZWiGOc7Sb176aq2B20OTENJgWkahS57jc4+qpRWX?=
 =?us-ascii?Q?ZtOQPIcw1WrplCTRQCkGlAmNdd5am71LfGvfma4Dzqiagucy5LJ1O0JQVAWm?=
 =?us-ascii?Q?Ly/h/sLQYtK15WITjJ6yHhET7FV+5Zcf7cXOQ56xYcH9lYaC/cCa46VC0+eg?=
 =?us-ascii?Q?HHv2tAAsJYFtxV4DOPDnDQTSTKMeCb1IsyL3OlzZ7JRVnEJoVICwv5orguxZ?=
 =?us-ascii?Q?4VywKZSE7GVFGAN4diXxRJPeWTqU5D1J22wsKxi0CQvFfF/JyPfVrU/6mr9v?=
 =?us-ascii?Q?NvALq2Ux4FvHsmYLrxhaQlRjOvpETq19yMle37esAZqLnhcgadr+jpipmny6?=
 =?us-ascii?Q?REllA1j/lUiF9h+bgs1qS8q6lS04DAF4Q2BLeWyG7RtrnjKTm+kKPhAO6xZ8?=
 =?us-ascii?Q?0fJA6YP3RYhISYHjnw5ZmckljRczEQyKKrivXZ+swPiHgMxeG2V+RHDehPy7?=
 =?us-ascii?Q?UM1ZeXs+rqDYPfd9Rwyb2jQ9YF5i1RltljfyE6zvh2ccC3khXT0aVHU9Rk33?=
 =?us-ascii?Q?i2ShIs3rvKThJMBrUl64LAMeys5WDxjugtyX+cgGuIWkAKrpL6Big9lemFqO?=
 =?us-ascii?Q?B8KunivM0zyfCjah3cwO+vyA3kyNTRnYttqmjbGfOAwVMElZI827a8bXkdvl?=
 =?us-ascii?Q?8BHdZNYVsMijFkUEbnetvTy0a3x1z/ALaw/+ppGZbyH82s3pXbRSvU2nPqkb?=
 =?us-ascii?Q?lC6pxXvvfoQ5MW5G1jwRr1FkEfN1QnvE+omCtxCqQ+OnEGIgV0p3eRq0Eg7+?=
 =?us-ascii?Q?y/cGgd1cCSmUtMit9vMI2Yma7hAGe+DfyBL2RyvhVr0qn9IFpwNOBzD1Ehyb?=
 =?us-ascii?Q?AruwgZ7UijzR7SDqa8TLTkLNWSrlurPNzo2DCHyKEzE/D8ZWDbzPpHHYq6XD?=
 =?us-ascii?Q?/ThK/ztATCJ1rh9d5JuEw77sfvprA02fc84c5Ut5C962LgDG/jf5HyypQF7f?=
 =?us-ascii?Q?GbVLkWH9MB9JqbgWQIoQ4RJ7YEqcNcdvVZx9LahflkhtheSIw3Ekf8e86LU4?=
 =?us-ascii?Q?JXux6EaSEKaQl5aaoDRFe5IADaGLN1MSmXGJSw+jrm8ikACf3eklGb0gipy3?=
 =?us-ascii?Q?aQjMmgMwQ0CSZNniipICN3LREaYf1B97qc7J?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:22.9279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be31408-4e36-45d6-c202-08dd9f71f9ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180

In preparation for x86 to start using bootmodule instead of boot_module

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/device-tree/bootinfo.c | 1 +
 xen/include/xen/bootfdt.h         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index 76d652c0de..717cfa0962 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -31,6 +31,7 @@ const char * __init boot_module_kind_as_string(bootmodule_kind kind)
     case BOOTMOD_RAMDISK: return "Ramdisk";
     case BOOTMOD_XSM:     return "XSM";
     case BOOTMOD_GUEST_DTB:     return "DTB";
+    case BOOTMOD_MICROCODE:     return "Microcode";
     case BOOTMOD_UNKNOWN: return "Unknown";
     default: BUG();
     }
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 847f019559..d503d1bd4b 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -21,6 +21,7 @@ typedef enum {
     BOOTMOD_RAMDISK,
     BOOTMOD_XSM,
     BOOTMOD_GUEST_DTB,
+    BOOTMOD_MICROCODE,
     BOOTMOD_UNKNOWN
 }  bootmodule_kind;
 
-- 
2.43.0


