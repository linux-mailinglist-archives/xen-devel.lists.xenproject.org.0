Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24051A5D505
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:11:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909816.1316739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQm-0008Ds-Pi; Wed, 12 Mar 2025 04:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909816.1316739; Wed, 12 Mar 2025 04:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQm-00089P-Dg; Wed, 12 Mar 2025 04:10:56 +0000
Received: by outflank-mailman (input) for mailman id 909816;
 Wed, 12 Mar 2025 04:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNo-0006o2-Tn
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:52 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2414::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9062ab4a-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:51 +0100 (CET)
Received: from BN9PR03CA0361.namprd03.prod.outlook.com (2603:10b6:408:f7::6)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 04:07:46 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::db) by BN9PR03CA0361.outlook.office365.com
 (2603:10b6:408:f7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 04:07:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:42 -0500
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
X-Inumbo-ID: 9062ab4a-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOsqF6UC6X57fVCQgGZpubmq+H30LMlWGVEWWZZyElh/9Cap18RJVpR7nMb5UsaWDp3BGjN0yTHq+RO0WYZwEQ37evWl6vbT+UvqXtPgM2nKqcH6EKBApb27BR2gHQCFHjoHJPJCla/eAuyDCefIv0Hm/c5IHa6YcRc192qWrBnXaHWvbDnRqO3m5jhm8Vms3zAbzDuGmcvaE46pVhVXNkNLixgauGRDAtIZIH7geFOvfp7pBYigv1feaLtKMzVChNS+aGw9WVUKosIXIoy6qcYUPOPqdgukhfAW7vVYNRYtokI9w8FO18elFeicUCKlIh8rivuUMRaCBShgHvP8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVnJIwjzp8eKC2WhS+HCVSb2Ww3dYbUW05dij3RYcXo=;
 b=MPeEfwnO3pi5hqHnknU7qmMiPLyO7tfrCWB7NdpJz9pFr2zAvTtCQUL7gQLd/HapfpVdd0RTjMJEDeo4Yg/Hhmj3v5D02cfM5WOfyM5o7/hUQip/+u+P9W8hgrNUN/WYMKtouzkAzPoAt7PCrj3zPNEeVEYY5xKkHcA8pNFOe9YoIkunIC78ouhql95q9tF7x0yAIHgqqkHpGNIz1mjOHWlFxC145QCplFm51ubkJ01zTj3bwfGkAxY6pGMacyQqRqYkGgnTZ5EaQ5t0V3S/nCTNJF8nORJZMLL1z5L0ERy10/OX2dcbgJbEwI2S8++VvnDZmHh6rYIhveO6HhnQiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVnJIwjzp8eKC2WhS+HCVSb2Ww3dYbUW05dij3RYcXo=;
 b=YTwXDA7BVGeHme0qgSeXfY+M8A0Pi0s/e0aGO7hxotBWAmnSW0VD6crVjd8Btmqm5tQA9Lmr2d4ggEZrBQcb1ngSqSBJS+yQtFh0mdSM2PLibeJU1SVjvCubh88x8bkhZYJyD7hjcrB8AvJKhuCl9WIGtIrsu1GRMT+I5G/QmYA=
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
Subject: [PATCH v1 17/19] xen/sysctl: wrap around XEN_SYSCTL_livepatch_op
Date: Wed, 12 Mar 2025 12:06:30 +0800
Message-ID: <20250312040632.2853485-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|MN2PR12MB4334:EE_
X-MS-Office365-Filtering-Correlation-Id: 901924a6-dca0-4df1-6347-08dd611b71ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4ArMTVDNvrQcShxGUJaEBePHrjgR5xbev+kERd90kzByRUBs3meDbKXnTiVs?=
 =?us-ascii?Q?IPLztgV0fDk6ETa+n+ZZkyuYmY8+PFmxfEHpJzNroZOZ8H18dL29GVopZ62M?=
 =?us-ascii?Q?rSqRkOJPIaOOa+nXUEfNDczpDs7L469jkzCgo2iEfddNsyzQ6vyLKyXWA0PM?=
 =?us-ascii?Q?lBW0nCjYswslKFFuUSrL+f44T4kgYVRrHqjKAtXpavhJV2UkeXv14D3+7Rwh?=
 =?us-ascii?Q?rdTXwRIkBmQVS2HLTS7uShyYTcR+l/37zz74BRf0pgbFJn5+HrCnBUK6agMJ?=
 =?us-ascii?Q?kAzfEo6T43mWrvlCfQWiP5eQZRuEA7afwMNC+UmszUHsrrqUoMuVRxg0MvBl?=
 =?us-ascii?Q?o08N88G44sgVHBJd5Efcc+uD6KSuo1ztCzsbDH5UVwY8+xVEizTdEz0KP1bS?=
 =?us-ascii?Q?0saBBzF3x49Ph0Z9lDEh6UWN0YGUiyGJDUAFISVWh6c5U6iL+94u4pF6hLxN?=
 =?us-ascii?Q?syHWztjw1q+LYk5MRaNjwUUWg4tP3pIuYAAYtA1rAGRQiWV9OuKI86zI3Ikg?=
 =?us-ascii?Q?bwJe3fku9tTPSp3MaRgHQKAxPJGFSeyK30nJc31h3mgTN/Kg8InR+ZShvQHR?=
 =?us-ascii?Q?9HJcBWQwp0wVs+Cb+mtkeGtt5UHQY5rsD+6sRdq0tOllXNBNAteiKpv2HDFG?=
 =?us-ascii?Q?3ZDNWnWx9lDSErubb7slqMD/TwuNr//MiL71pK0M35J4smBxm4BmjYg2rZ4R?=
 =?us-ascii?Q?PsNrlW3cb+5wGMlgQRwAsCni4LcvIMxNIHPcaByYLbz5QhlZ+SgNZeiIS+1v?=
 =?us-ascii?Q?zzhNMV59QhoBxjjF4SQI6TLrfesADigTftTEtUcyYrDiAKBe+WzSAy1Juf6s?=
 =?us-ascii?Q?Dw8cGw3ILb/ZB/XxWtSXRibV1Vbl6WhWMlHDxxQsIPF42JS7xT5huXYpdb56?=
 =?us-ascii?Q?+4YJ8bucgwK99UR+rTLcZRyhwUUd72XChEiFS9L27hptxQp2vSh+2LlQzBe7?=
 =?us-ascii?Q?NcNZ9Vu+yyO1PQ9Qy5ZgYLbPl/Bt0ZGbAjG0wWsOYWrWBkhYOkUhSAHmmIif?=
 =?us-ascii?Q?sy6mW8yY01egF7wY3xixVxYUQrAJI7nfypgrPDSt1JgugfuKUd2TArQVsH8Z?=
 =?us-ascii?Q?VRnDAtZhv2Lemi/wwqYVp0KIBn0XFz1/r1h2EblsMz8U8s44tskTJcz7bAG4?=
 =?us-ascii?Q?2kdy5vf47a5EZgZ044Lf2bqxbcsZqfblQT4G5AS/1i49f6kWJckJw2Q8nSwD?=
 =?us-ascii?Q?+Wo+1glHkI2n9SPsQkorwYSAknauVyBPyaEyTi8PzY2VDhNPUP9OsRKJTRKG?=
 =?us-ascii?Q?6ss0JjXXlMK8TBeT4VqLpCI/nxmrdiv3Sj7RgN/97mfkrOpJhEHQ+X9wfsJp?=
 =?us-ascii?Q?9/UJlUksWBHxM77XJ6MBzLIJklSqQvtXIPT2M0nYab+MmyYwMnN5pZ346uZ/?=
 =?us-ascii?Q?3lBsoGLtgfdCOWTi5cBumIHGPu4xXWzDU4nqqvSHEWgTDVkRYWeSPuIsMQM5?=
 =?us-ascii?Q?jzn4o4DwBW+tJZCvjfPbFRvu5KppvxxJtH4fiNfLQG3slwgpQjj6oIePX8ny?=
 =?us-ascii?Q?Usuke4nXRhrNCI0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:45.9182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 901924a6-dca0-4df1-6347-08dd611b71ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334

LIVEPATCH mechanism relies on LIVEPATCH_SYSCTL hypercall, so CONFIG_LIVEPATCH
shall depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index fbaca097ff..583972f7e3 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -426,7 +426,7 @@ config CRYPTO
 config LIVEPATCH
 	bool "Live patching support"
 	default X86
-	depends on "$(XEN_HAS_BUILD_ID)" = "y"
+	depends on "$(XEN_HAS_BUILD_ID)" = "y" && SYSCTL
 	select CC_SPLIT_SECTIONS
 	help
 	  Allows a running Xen hypervisor to be dynamically patched using
-- 
2.34.1


