Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F3B0D8BA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052382.1421021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfU-0003DO-G2; Tue, 22 Jul 2025 12:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052382.1421021; Tue, 22 Jul 2025 12:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfU-0003Bx-CV; Tue, 22 Jul 2025 12:00:24 +0000
Received: by outflank-mailman (input) for mailman id 1052382;
 Tue, 22 Jul 2025 12:00:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfS-0003BS-U3
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 706e2a4d-66f3-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:00:20 +0200 (CEST)
Received: from BYAPR06CA0019.namprd06.prod.outlook.com (2603:10b6:a03:d4::32)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 12:00:16 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::d) by BYAPR06CA0019.outlook.office365.com
 (2603:10b6:a03:d4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:00:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:15 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:08 -0500
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
X-Inumbo-ID: 706e2a4d-66f3-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlVaa6sVrefQWY3sLqJXPoJu4DMq3HxR8+5KA5txhJ8JPaA7F3oGMKBjUQxl1LG/+gl0EQ83Ms7FFkwDjvpDwReuZPLhpyeSDGr0q8CyeJ6ofGmupWZwPXUXUepD6ZSRbt1qXQsVKahLssn1pKB4Hja27UysF6xnvNG3MLJMtyvmlmjcmry7/K80vubVIwRoZAzx17piCOErkKedE5hNAZhwlYFRGU9Qz25uoAiv2y4dtTlZ2boGxiVn8ilZOJkI13SOqvl7A+ASaIvE89fIMAvimED72uDsPazjQLaaSo4vv0oPl6tljuYiyt7hB4381KGgRALAOvo45nUioM9rsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVnpg9+LEl8N+08r7xK/Ve2NQdYTLIPaAdbOLPN5xB8=;
 b=DlK/EEjw2ILaag96o9ZrXdDchB+KvRNCImTo5lCOARC3Jcd2O6I74EpOyASsrhZgrqAPAZzVsafKqhrn6346SEETR34FLlr9Fg1SFD8D6WeiwZnuFIk5Qab7O4VoXbkG9plLiHKXkvHPBQ/X67EIJZavX0pES3yd6MOdzK1JIkPNXaCPVsLvwCg7U6sZw4UnPclHPhH3UlHQnr5HOmb76gqVr0QvZtAm1d0yMzgHMiSYUdFglZOgk0OcD3dGQr6lc6paJA1YyRKjWPBeG9qtctJ5n092HYS609+7c9u+WcqCRIbsHckI7Fq9n/CKSYw25mWWaurwE59XQUiffMubpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVnpg9+LEl8N+08r7xK/Ve2NQdYTLIPaAdbOLPN5xB8=;
 b=xhqeMoB8uSZKnhWRsn28/swiXcKQiAlAqubVueFwfNZ9W4zhc5LPqEQYFigz8LR6q/OcA3KumqL7Q5co3p1OY4EeYQPhew4nRDoPLjEiuH6go24h8pr1Alnj0qBaddEgrpGpap8FoUrkF1ojeMZaNYCl8orW9O01rJJy99qjdvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 01/10] static-evtchn: Add missing include
Date: Tue, 22 Jul 2025 13:59:41 +0200
Message-ID: <20250722115955.57167-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: b7f68dcf-3922-4f49-9a8a-08ddc9175218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VKOuLG+T+4hjDGKM2prrs4RU7dUX9jLUnjTjeLaeeoFhkIqmv7aYsBVlIVJR?=
 =?us-ascii?Q?Zz/lYyNB+7oh0O4HPgy+lns/4iwpXmxMxVEf96gxQ0xnlRk3TzSxt52ddm3s?=
 =?us-ascii?Q?lEOkGs229B3lYa8sYZC7ogF/RRLGoLe7ZBihJP+JZVokgLhTiDVPbYLiFDLs?=
 =?us-ascii?Q?o/a7vncYGaAyFeEdSJHeycsXN0h4e7UtJWHDDjJ/iBjue9S+ysq2tIlNu4a8?=
 =?us-ascii?Q?j0HuPXeS91o4yxjnO53fZXfd7h4u4I2jttSqGZcfbKxjIYkvK4Fhx3uPqsuL?=
 =?us-ascii?Q?lWUgQ9Uv/Zg3+LlecV1itfBbP0+Cl5oCvoc2jjt1moV12pW5Alj7EsOYGo3/?=
 =?us-ascii?Q?0ykNLPTKEtMTPiR3pdxag1PbMPwtaPWTGZSwiCdHBXAb+pYQtBhCr6SMEKS3?=
 =?us-ascii?Q?le3D2Kr8CjeUb5VtmlY2TJEl3Z5zeHXfiQBtgoEWkGDfOl3DOuFe4O+toEsP?=
 =?us-ascii?Q?gR/Mq0dC1f2IdfIrGWSwVsxnz/7IYsQz8tUsibYIC+r8SqWPWwmh4BKfo0Zn?=
 =?us-ascii?Q?wn9B75oMPyNKtl+vKFKIn0NROotUFumX/530wHxQW+ZqtUSDyEdMpyJ0J5Ta?=
 =?us-ascii?Q?LrdQGWmYLMofxIU0vy8i+iuz2UV//EpQfVEghi+uZFGSxs8yEyuxhOJHHIIk?=
 =?us-ascii?Q?r0lnKl55btIo2J+Purbcx+Z1PSQXdarLEnQtFz/GWVTfwubpetwNlIYEIGmX?=
 =?us-ascii?Q?W1bvR1gT1EjKqJm6wt0rH4yol1lsLyaNZjplVUEPQsq5cVL9oAZ9j9wv95FW?=
 =?us-ascii?Q?FrMy6yrPtITwMfJg39tUwAdZl4yfcSyxfUdqUUCQl/TnePalUmPmawCTQ61U?=
 =?us-ascii?Q?qQpCFuw7t8Xw+AjE5KZrXY57im+BGe6eLSGvG844itUmcg9hzMc6A6r/sasP?=
 =?us-ascii?Q?0x7NkWpepptMJExX3DxzfdltCteoL8HRKodKbnxs4ERN3Gff2FbCXPE6+6J9?=
 =?us-ascii?Q?kStjnJmEIMKQnu59Yi8xp5XZ5PVjK5w5wYBpcDYbj0VrbdWL/XSyRgFEpP6D?=
 =?us-ascii?Q?TrJcT4tmdhAR36u7dpogQSkWcG0lrLV8vZdYwjU866WIsA4lgQorslmbcjZi?=
 =?us-ascii?Q?uz9zlnvV7juGgmXkcM0wmc4nCImkdgjZQe5ELymd5vXDjAEbSfL2EUUOm22i?=
 =?us-ascii?Q?eyM7eQ8/TrpH0kS3k0i7Pr1HVUONUwhBQw8RcYEjYcFsbzVaHvg7oGIZ4nhq?=
 =?us-ascii?Q?6gXPWyVf0LYx6dYwSaDl/RVGwBoc9NtOQwnPJPGVHpltxb9zGiTPjCddEdd9?=
 =?us-ascii?Q?qVrOM3O82YXWgRD62nEhxBpcUeoctLDxlj2pZG+yVCaGavSis5g7iFp+m+eB?=
 =?us-ascii?Q?t/awWH8Vt1p5JFub/eALZaeeh18WqyQt85VnC73XNEAI2R50EXfxIWHOWP20?=
 =?us-ascii?Q?X0hDZKoS4Goh2QCOyVO+5TnG6wpL8kiV2Hw4xbmJU8Ie9blcwaGDgZ2AVvns?=
 =?us-ascii?Q?vnkmaS0KbyAfHKExuXpFL7frXdnugJcRL3mqzqOZHrYKOjNBC72enNN7YsNR?=
 =?us-ascii?Q?5EgOysQduDJVS/O1xWrpH+nM5RDr2/HGr8Ov?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:15.4479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f68dcf-3922-4f49-9a8a-08ddc9175218
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201

From: Alejandro Vallejo <agarciav@amd.com>

When later on x86 starts using this file in later patches it won't find
device_tree.h because it's only transitively included by arm.

Make it explicit.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/device-tree/static-evtchn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/device-tree/static-evtchn.c b/xen/common/device-tree/static-evtchn.c
index 88342b44a1..45cdd664e4 100644
--- a/xen/common/device-tree/static-evtchn.c
+++ b/xen/common/device-tree/static-evtchn.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/bootfdt.h>
+#include <xen/device_tree.h>
 #include <xen/event.h>
 #include <xen/static-evtchn.h>
 
-- 
2.43.0


