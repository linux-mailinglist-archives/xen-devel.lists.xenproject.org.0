Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE2ADA868
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016518.1393460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xw-0001On-Uh; Mon, 16 Jun 2025 06:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016518.1393460; Mon, 16 Jun 2025 06:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xw-0001M3-PL; Mon, 16 Jun 2025 06:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1016518;
 Mon, 16 Jun 2025 06:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xv-0008OL-FG
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:2417::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b16c8f8-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:17 +0200 (CEST)
Received: from CY5P221CA0107.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::34) by
 SA1PR12MB8644.namprd12.prod.outlook.com (2603:10b6:806:384::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 16 Jun
 2025 06:42:10 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:9:cafe::a0) by CY5P221CA0107.outlook.office365.com
 (2603:10b6:930:9::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 06:42:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:10 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:05 -0500
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
X-Inumbo-ID: 0b16c8f8-4a7d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHP8c6xltoivktzM5tyfbrozM1fc2rRGKmKhQj/FrNXXRllundcAnT25XAGa8gXWh2Rj6wKOyqh1vdtxaJODJKGeaarRB7rrPXr77ajClmLa8kY0qg2FsX6c/kpz+QvFOk2QnKfm64tSimRjFFMMcXoRCzIYueqm6s9UE7A+JLW/vomekJbqDivuluja/p0+iH+O7/vFVaBU88ckNmiqrXWUCCFUn3wVIGBXLZ5MGhSOlP3QvAPbSI9odQF9U/RACUALVLG7bMpKPDrA3Yu+ZzMiyNCcPxOpggsMNSrueczawJgUqDAD0z8byeAF5jIwpLl59F4Tor7iJ7M/dgBPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30rk0j5lpGbWOdYBsFmDDdDPGEoAQD+DekB96/2T3ls=;
 b=b9iXDyeWayOphPyIBZFuMP4jAW9pxmeh5YddyZuwqjQGuGvgyhzM3w9DJ5NZQCEnhh/brLn29JDU+gAEP9AU3iplNOCGJ4+7Yp0aaWFag9hZD4unv8O3ZxOtMY+emA/W4N6Niw1370m600Ls6xMDa3aPsaQ2C8a0GIVaPlPZbc/y2O8SmOpfMS76X8txnzYFEV9cGHmQX8OumpDiD9dPtX3+jle/qOdyDmIBRwCGi/gMGd2BpVLjklnmYjMPxxub2VdMdj9tNj0vEU+aTuuGjz2xgdqOmo1aMRsPk9LCBM0xbJ8XXHGGIayBPQOPi0rari5lTDZhlg16JpkWvtRqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30rk0j5lpGbWOdYBsFmDDdDPGEoAQD+DekB96/2T3ls=;
 b=IumSwuNJ99fQgcEkL5r40ziOqYDaVH+yPh3YryDSr+EE216tRUYDAaLC0NDnyU9x8NNFXcE/ondlAGOQXFfXET9YtfUwBua8no20HErDZfxDGvgAVi0nm42qDm1H3woCSqSiWQzOp6BGA6upZ3TOLY7v6IOyR6lXQBpFEv5h9kk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 05/18] xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
Date: Mon, 16 Jun 2025 14:41:15 +0800
Message-ID: <20250616064128.581164-6-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|SA1PR12MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: ca12a660-5509-4571-f80e-08ddaca0eb75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Auf/xhgScYdJ5B4hyxUV9bPsc3Rsqz0tC3vemEsk70ZyQ3pxguxOZc6j3kd3?=
 =?us-ascii?Q?v3rt9QzfaUkT0jXnrrgBLP1aTqq9qZZjmO2m1m8+Qv5DB4rZ65W2PZu99gkT?=
 =?us-ascii?Q?qX37ZifUKAIn+zWRwmo2cAJa0CDgoPWccAOujYpNLWL5uv9hH947Qe0GoMIK?=
 =?us-ascii?Q?EsVctk6YfzJM4saC5OISyktCgu6B6D/BbZzwqN2tGyDP5VFXzWLX7eHkOpHL?=
 =?us-ascii?Q?u6SYWeNphPac0HSu3LvsbClitEmW6TJijmbnwhyaQt+Z6QBvRQd8ckDDU1+r?=
 =?us-ascii?Q?9reeDyHJo5tHlIz3Oj0IlQdYe9mmJD/9XSx8c3PIxAUn0EmAWpTX7Y4G94qq?=
 =?us-ascii?Q?cQ4HrgvJf3h3m4E9wsP7Z1faClToYFrYshtpI93S8foyQ2Yqap3Na4skBhth?=
 =?us-ascii?Q?O4jYTyqI8D5jKbjhHOA5yUjBEwWoQKkxgvEMLt++3+FFkswsP94fmt61mFEa?=
 =?us-ascii?Q?PGL/UZ27a1DUvxHzAwIC8oXZZZbHk4don8vZG1UTF6oz/oAZLw1fS8UJFd0Q?=
 =?us-ascii?Q?xmJ2/9pZZCf/D4kq3Y0Im5qSoGMhO2Rl442YQ9xXgM0cxjxBDGvYFgfFnp4I?=
 =?us-ascii?Q?JfvxJzOf7F3BPzV1fQwrlCb2YJPhA9oUhGVH9RYCoqPF4/9jy+dM0ltkZQ/8?=
 =?us-ascii?Q?i8t95hnSI0hf4SxmTiqB/BnwFk9diE9nu40CO0Y52UR+efljPn7Kct+J6TLF?=
 =?us-ascii?Q?9QqK49WvncBSlb11k/fgjNSBr1pMFl/5hQsM5E0YfjaVBtEMrDCRGUq1eJQo?=
 =?us-ascii?Q?/acQ6p1QNBQW3X+p9AKVb8hA8XfxWRnKGG08/CPwmSK7hh8fc1rykbfpDUx0?=
 =?us-ascii?Q?XUFOiZVPyN/bMjsUAMoxTwZUg4ZifDf+dIwig/SfecrGZQnBRIYf+WAG4PUF?=
 =?us-ascii?Q?B2CvKVaU+93pG4j6L2w4sOgdCtAnmw1B3Uhz1h8XYDHXOrt7n5LquTCl23Cb?=
 =?us-ascii?Q?JQn4GFA+HYyndpSffCW7WvOIqBsQzVYBhpaCbL9LPDRi5H/o8XeWr0n7A+MP?=
 =?us-ascii?Q?A2fFWdlKuJ4NHBYOF1BKZho51YpsYqAjmmUiPKtIVKpg7v196giFATcy6Eq0?=
 =?us-ascii?Q?Vo6VAgLw8ZNNB4CzxzsLqE+RPeb1ov516lI8olaU0rqVjtcZq4PLhvLhLVpc?=
 =?us-ascii?Q?lgYxS5oA2rW/N8GitVwoSOPEqUkFsbpThUphocETcSF0lzlhRs+qMaI3Xnhu?=
 =?us-ascii?Q?CO+CYCmm6TQMVZrz/SGZIw3ieeTccfxVSNyPrCdJ+CFenvImxZfHn52WSan0?=
 =?us-ascii?Q?c9SEIqMO0LX0OnEbDznN2vwQ55QPJeTBR8hJbYD4ory0mHjPV9sJ3AJBFS2f?=
 =?us-ascii?Q?jTcV5sA4qZd/k15IMBMtFFoaU+p1vymqB/ehaUJd5wIkFGpOIAimBY0sdqWM?=
 =?us-ascii?Q?KFLeJARP/PRCwSPvzcwCVaMAQ+mE9sFHoIervu71u3MVtZT4OwucclvHYSsu?=
 =?us-ascii?Q?wqX6XwKBoRkRG7Wgh2aap31aeabey62n+b5ngIVzLfqd4U15Yeraur9fNoIw?=
 =?us-ascii?Q?3vQzSR4MmHdVJEd2Oc7VX8Qj1tXbUx0m5aPM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:10.0558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca12a660-5509-4571-f80e-08ddaca0eb75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8644

Users could only access trace buffers via hypercall XEN_SYSCTL_tbuf_op,
so we shall make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index fb5c60517a..dbd9747d1f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -564,6 +564,7 @@ config DTB_FILE
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
+	depends on SYSCTL
 	help
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
 	  This will allow live information about Xen's execution and performance
-- 
2.34.1


