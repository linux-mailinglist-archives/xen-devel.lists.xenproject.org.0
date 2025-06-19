Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E04DAE041F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020065.1396494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDfA-0007Yn-A0; Thu, 19 Jun 2025 11:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020065.1396494; Thu, 19 Jun 2025 11:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDfA-0007XM-6v; Thu, 19 Jun 2025 11:42:36 +0000
Received: by outflank-mailman (input) for mailman id 1020065;
 Thu, 19 Jun 2025 11:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOCd=ZC=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uSDf8-0007X1-T6
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:42:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2412::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bd1ef40-4d02-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:42:32 +0200 (CEST)
Received: from SN7P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::29)
 by CH1PPF93AB4E694.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::61b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 19 Jun
 2025 11:42:27 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::7a) by SN7P220CA0024.outlook.office365.com
 (2603:10b6:806:123::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 11:42:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025 11:42:25 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Jun
 2025 06:42:24 -0500
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
X-Inumbo-ID: 7bd1ef40-4d02-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evNbsyADLA/XXN8TreMBZFMBMxpBxPwSRQJK6zSTzgtovQrQKDwCAV8T4ojmN0BQk7+AcRTY2LB3c0WIp5AcPYEbPYMGtkHl1pxFrEwPPEDEpE6zv7dYK+aVJcmT9MHJ0eAy8s1pquG7w71rKPwSzhDNWCSyh8fkpHtcjiGl2+thLpZeG8N4ID30xI51wKyvADj/tLaEt78xezx8ibsqK81NfspvkjLHu+V3yXIkN924+Z5F+GcNAzw3dHU1+3cnBy62dSHmULtHySpwTLSHaYDtXfVudS06dI0Zwu2speCmEhuvx7vhWp0PDfnIXJ3IOdtGjQX3kdBdHqVvURZDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dR665VFbvpwICSNfqh1RtfMKzGOK1awE1bBpdQm4HdA=;
 b=XoRdmHTRMrmoxGYfgZViBtspdAoiSYZv5s32PHrpo9h6/S49kKPSKt507s2l7LxCyF2eceyYXzgRIHqdD3kTheqseujUqXW9/N1oCbCVvAp6Q76oPvgKMWPACYpa/TgbhFNH+roryZYHf8IU5kqVmVcpvLdVH12dPGSZiSAOqknZ9PEnPe4xEkh8YASV1WuuZTwXXkp7XjvCco3zgPMVL/T2Zlm3hWlUeyLg7d/HRSHycrn0RfoDAXNMA7qgwuUl2O2nFjdC9ApQPU7ba/LnIozfySBvDyOrMUHj69ZQWii77vBufNepperPZtdEIqxSy8tuaMoGIQQp/jtZNGhzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dR665VFbvpwICSNfqh1RtfMKzGOK1awE1bBpdQm4HdA=;
 b=yGNh8wepHvAFSoOvLlGZtzQ9ujeo/98KkqYD87bElJcIPr/KJSLt13QYKYdSfMzVn1YytCSlCDwKLs59V2L36tcIPsy6n/0oXeBuldXvRkfkrKeWptUMSYCFN7+QMlOo2bVTvYyRtH9OWqRlp04nxMO+UWWE2R0Uw0/YiothuyE=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3] xen/dt: Remove loop in dt_read_number()
Date: Thu, 19 Jun 2025 13:42:04 +0200
Message-ID: <20250619114206.1014-1-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH1PPF93AB4E694:EE_
X-MS-Office365-Filtering-Correlation-Id: 594bc3d3-18ab-4d83-b702-08ddaf265cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hpsQ/Xb5r38Lamg8SDBg/E3YokCuVo3rbGjz+LEtiP7frRuLpaHfLTOOFXvK?=
 =?us-ascii?Q?GBprAGGApyVHDso0qSt0L6kiSSnXQz/Xl0JkneKrQ8QVoRt7TrxITg5L6KRM?=
 =?us-ascii?Q?SsodtEWhiFTNVKc8ImlXj/MQ6whIYWhCa32FaWeE/tLHSfSIhxeRV4qHkVOW?=
 =?us-ascii?Q?R+CJeqNGoHwZE582yvVDqpzU86CUd/O+o59rP4ok2Y4a0zM9NMSFr6SXB+7r?=
 =?us-ascii?Q?1bWJIrrufOHDUMZDi2RQZAmnqEoR02xjFvKDFJLSIZfg3r4GazWEUvEgpNq3?=
 =?us-ascii?Q?A80JkVFfj7ps52oFnDw20z+ELwLY3Q1MTWVpBBlOcqwfjhLoYs/JQeykbu2N?=
 =?us-ascii?Q?R1BOG04qq21/k+YayP8zlkXjMCEbC7HY/kJI7F3EaDUT7tvlzXET0X2bMpWQ?=
 =?us-ascii?Q?AUvjxHiBPZ5Qf0V7/yLxss63GKIL2esyAS1nHwhJXUtlN8gk/rNMcUHb/mJF?=
 =?us-ascii?Q?NMC3upMpG2daQMojRIgRNzm/03HO87KnvkcSIH+ysZiDS+13NjWI1peMZSmd?=
 =?us-ascii?Q?vvEJOBkLr4GITOTanZ+dSBXRBsjihAJQthKt+i45r75n5+yi3WDqd61fpu6m?=
 =?us-ascii?Q?uOljm2Rafs3l76S4s7e2zFGylG73J9yaqR8vdQS9C+bRyVXs+yzORS4GXHJ1?=
 =?us-ascii?Q?m/JZRersXXIli/cVI+1yhPeN1Xnckuw/CkarS35nm8uErH4IRpy2Sg0stR5b?=
 =?us-ascii?Q?BRqnJVKnuVXhXewMWx2glyYIUMif7al9slSJZTL60QPXYmwEfH1xUTkhws11?=
 =?us-ascii?Q?KjTHYZJk2oKykqbUDZ//vtiwXslNqpKs/ebALrziPpGZ8wrj+XTADc7/hnrC?=
 =?us-ascii?Q?FViibV1sZPEZmpMPi0YpMBD5GImGAWOBjSG2F9pT/rBPJJHRUCH7RpI9Ew2U?=
 =?us-ascii?Q?mWCvwI+BJd46AgSRTsIjzvSkZRY/mTrJg9Kuf3kPy6yesgD3bdDtARQqcGSR?=
 =?us-ascii?Q?1MQlFsqTPcIVwhcrPvnFlkGW3So2ey2uWRHCnYvTuR2eRI1Ajeuv5ub7BeKr?=
 =?us-ascii?Q?+znpIiyjZ/wI1Pmoxf9YpBHV+I2JX6O+NsbssgByG3vO34nxV5mwyUNlg3Z0?=
 =?us-ascii?Q?LtHLoSGuzxQAGVDd5/2to/qwdN1vtuZgcdDNWnBk+tq+7uBLHdWirXgPxK7b?=
 =?us-ascii?Q?6mcxyi3wET3UZow8p/BUKA+biw8RW3qCFQWx5JXzGD6FzLa5RYmmwrg8e/8S?=
 =?us-ascii?Q?u8x5MuEaOnyIBV25w3usarocaczaB+vF5PuZNdfKBmwQXYjcO4SEGwGT/RSa?=
 =?us-ascii?Q?ihCB5tzNyOoiURkiRK0161h3KYUAny0WUViscz1vF3SHkMNN3lIdqhiv7Zs4?=
 =?us-ascii?Q?SjyLs+SkJe6qZqDRp3J1VE0f5ENaGjFCEfDGqWMRETTXitQO1tnDFRHkUVr8?=
 =?us-ascii?Q?DkVivL7EH0siTXKOs0QNSNZ/85ICFCgQ1KBBL4t7irox1KF+NJiHDXDEtBKr?=
 =?us-ascii?Q?egmbKLY2ljrZA6HwrdXjH12SC+3oVj0E24ssMzw4pfQ9f2/1aaGeTuWpdK9c?=
 =?us-ascii?Q?K5s+IAyiuAIurY6EbQoT6tRW4q5c2ZCKydo8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:42:25.8921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 594bc3d3-18ab-4d83-b702-08ddaf265cf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF93AB4E694

The DT spec declares only two number types for a property: u32 and u64,
as per Table 2.3 in Section 2.2.4. Remove unbounded loop and replace
with a switch statement. Default to a size of 1 cell in the nonsensical
size case, with a warning printed on the Xen console.

Suggested-by: Daniel P. Smith" <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
If there's any #address-size > 2 out there at least we'll know in debug builds.
It's not like this function can cope with them either way.

I haven't tested things past CI.

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1876848415

v3:
  * s/WARNING/ERR
  * //-style comment to /**/-style comment
  * break after ASSERT_UNREACHABLE() to please MISRA
---
 xen/include/xen/device_tree.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 75017e4266..d2de7c3a13 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -261,10 +261,22 @@ void intc_dt_preinit(void);
 /* Helper to read a big number; size is in cells (not bytes) */
 static inline u64 dt_read_number(const __be32 *cell, int size)
 {
-    u64 r = 0;
+    u64 r = be32_to_cpu(*cell);
+
+    switch ( size )
+    {
+    case 1:
+        break;
+    case 2:
+        r = (r << 32) | be32_to_cpu(cell[1]);
+        break;
+    default:
+        /* Nonsensical size. default to 1 */
+        printk(XENLOG_ERR "dt_read_number(,%d) bad size\n", size);
+        ASSERT_UNREACHABLE();
+        break;
+    };
 
-    while ( size-- )
-        r = (r << 32) | be32_to_cpu(*(cell++));
     return r;
 }
 

base-commit: 22650d6054625be10172fe0c78b9cadd1a39bd63
-- 
2.43.0


