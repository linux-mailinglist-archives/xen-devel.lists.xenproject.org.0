Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513AA7104E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927136.1329949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpd-0000d8-Cj; Wed, 26 Mar 2025 06:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927136.1329949; Wed, 26 Mar 2025 06:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJpd-0000bJ-8W; Wed, 26 Mar 2025 06:01:41 +0000
Received: by outflank-mailman (input) for mailman id 927136;
 Wed, 26 Mar 2025 06:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJiY-00083W-A0
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:54:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2415::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2a207b8-0a06-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 06:54:21 +0100 (CET)
Received: from MW4P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::15)
 by SJ5PPFC41ACEE7B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:54:10 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:115:cafe::49) by MW4P220CA0010.outlook.office365.com
 (2603:10b6:303:115::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 05:54:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:54:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:54:06 -0500
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
X-Inumbo-ID: c2a207b8-0a06-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JF9QiQBLmAQMQLSVNqMebKMWrRctP8jvGggd3n8R+CU/GXhj+d1UhKPjJLBsuGQhCgqvMy/5qIMnkIP/fJZoZDkJOhH6sV1WA6ZeMt77/lGakZwSBib3Jk+9cPy0elEDE6+l6HQx2vlE5SNIvRTFM2dUlYL4Lfcz5/0DwtIirE/X9spqcspA1bL6002mhsTJ2e8Beu8SodaQwleN6AEwrXBkB8faGkd4WbvdZy1gYyWQ9Vw3/qD6PwzIBSQ5fXKuYEHSFlY4jRXEkan3b6NpQ4bA7vvA5tEl8nOFD8YHySe8aHSVX41bD6oay0eKVIhLBb97UyjdUDz2H3cOiR90Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLupjByiJ57ZhQoY7Kk9prb3LBq+7sgHpLsMgB0Rgx8=;
 b=wAFOEEeaNLtOSp2uT5biQPJwgkoiNPJmHoh4PPmSU34eUGXa8mJQ5bRWjSlCLN9/p/bNta3sMDYZFxbT3djqQiZEXYcIfrCVnfV9SMtJH9jTgNpEZBlhT1rVj/W7hufvi2ngmQL0Dqfo3xft/8kXzu3bQmPVsp8n9WFXTiOYu1w+Zy1jEbbngno+UcOYfORXOD8kFow5ilyzk1dp40kTyzs98Do/+NqcKh2AsCbm30A5ESuVtAIerYHnrzylcyQkSjEGqi1rDfKezZIyJ5rOjrKG72G2U3ehFw7YtPN9JQn2ParqsF3mGlXdfmRpF0n9ekK4w7RLGvczsuqwlsYzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLupjByiJ57ZhQoY7Kk9prb3LBq+7sgHpLsMgB0Rgx8=;
 b=ZkGz9txPaPeNSGrRUBpsGrRMfl3tpnVaX/erjik3mvImmTXnKVQp/3v79W/5dzozooBkrIPMx5sfnSEqmPTmUPGu7eCTv4GZm9M/Ci+0UgDSANIvrJfVqTDPTYvqYKusyE69IYeT9qcLXVErerj7UB4fAd8Qy6DpQ+Wp0oIVyqM=
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
Subject: [PATCH v2 17/19] xen/sysctl: make CONFIG_LIVEPATCH depend on CONFIG_SYSCTL
Date: Wed, 26 Mar 2025 13:50:51 +0800
Message-ID: <20250326055053.3313146-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|SJ5PPFC41ACEE7B:EE_
X-MS-Office365-Filtering-Correlation-Id: 440aea4b-ca4a-4751-970d-08dd6c2aa0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yc8aN+YD3HR5HnKwu/Jzg756T1PBAbq617QTAQcEwHwlRs+QbfumfbpSvgSA?=
 =?us-ascii?Q?fmNBgPo6GK5wCIWSqvwS3ihdgXhIYbWeaSF4mmS2Agd+Rso+DwYIpHMhINJq?=
 =?us-ascii?Q?rFzAp2XPrySRRjv8CqxzZjj149z41ZaqoUma7N8sqRjmncVgCQotBTqnQv4z?=
 =?us-ascii?Q?okkIW5HNUg4ROmHaDJQnkcm/jYf+9X0pBEEVqX9ocpkmWZt9bsy4JEeyphrL?=
 =?us-ascii?Q?sGnpK3lFjoU8ndLsLke0VUSSvRohmrhx3F0pUfP4jBYm6PehwGrJ8Q4cs7Yp?=
 =?us-ascii?Q?U+VCHY3337V36KqkfluLi3CB6pTqBtRiE7HHNbwwS/DXnfsydqBT+wGxvs3Y?=
 =?us-ascii?Q?5naPdaI0e9IEXHvgFGyjF72E0lVpbs/rDTMqICgXpsZ9O94yuKzufp2Mw8A0?=
 =?us-ascii?Q?crZQUee7WBH7pbjLj6zP9tNA149S5lMIdvzKeual7oVYdTVAd4Y0WygCPqEe?=
 =?us-ascii?Q?0CUqpLaSeCYz6lLiarcERPUhKCvb7B8cOT8HRusMBKrTS5sGfFAs6IeGhjTp?=
 =?us-ascii?Q?g5wwINtglofzh+kf4tBdh+2by3BNWC9Hnp+Sl6RfUWDuhHVOJb7jCb2l/ejN?=
 =?us-ascii?Q?0RptBg24o2rSCTNuj+8/0G96D5qOeZg0KWjJ0SlsFbk6DpuRhjVSgdRFlauy?=
 =?us-ascii?Q?Df4r7Ovk9ujrlA+OSdYeGgk+MlNe1r7EgXxO5Fg1LyrokvRUQ0mdmiQoTV6Q?=
 =?us-ascii?Q?h9XMBgd03vdlLRKM5pbPQNkFtdZuVm8udhGBf20UtJFnOrhDk+xAqbDAjIRH?=
 =?us-ascii?Q?rTo+hxCdlLY6bKTCKrbrco63q6gsGTnYd7pqIs1dMOJ5Lh/vmekyL9QaA9XW?=
 =?us-ascii?Q?sbXGY89/spRn0ZbNIjfMJ5eC7hijcFlZ1Orsy2oAfvOJ/Vl3piv+I9r2p4Hr?=
 =?us-ascii?Q?i2vVjzQZM8RDQq/gYhYv4IOeTlUOMK9uUyWmBzl+ggZcqWnYpubr+vTrxsr9?=
 =?us-ascii?Q?ES9uAkIINugVH1G76kge8EaARHiWQCuzgyHE/OuuZtG3Sl2xRf47Y7sJyBFP?=
 =?us-ascii?Q?nOR6IUqkE7Me4iQ5rNvxrWfM9S2ccQyCRUuShWSRyQ+6a/rARP9tspdHd/IP?=
 =?us-ascii?Q?XA2SUY4djoCush5Plau2V9aISam9ybNWLuE4uS9HYymAvr3xT/l0EIIfiOJi?=
 =?us-ascii?Q?DnkS4AxpodrI6NO30bzEG2PllDw0Lmz9izOqzBkeAdJ5J6H1GCfWSKXxgMXI?=
 =?us-ascii?Q?99wQ067sNC+yJFyKKjqUCYzbmitPiARG0U2RYWtNjAgvT4ZUGX2NVkRImN+L?=
 =?us-ascii?Q?VQ7+Q/tQ7U+Ucpn7tyA6PW2Rva0dvyZtw2LukByDG5NwkgKvsgTWs+9z0D/I?=
 =?us-ascii?Q?KV/ZC66EVWtk3fBQTea/k5eoYhh2ukVFg5Pj1dDeLRqzE4wu3OeXZlepXfqv?=
 =?us-ascii?Q?1jJg9+vHwrBFLG8GJAs5fkenxi7W7U00FJ4/geUQZrJA8c/YpN44pwZ9Ki7P?=
 =?us-ascii?Q?oTvBcOK5o35XTLyN5SQ3hzI2dZYJlXcbge1r3U4tmOIsCIP2WQ8XJy9c6nJd?=
 =?us-ascii?Q?hX6n5D7X7siW4J4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:54:09.6605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 440aea4b-ca4a-4751-970d-08dd6c2aa0c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41ACEE7B

LIVEPATCH mechanism relies on LIVEPATCH_SYSCTL hypercall, so CONFIG_LIVEPATCH
shall depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- commit message refactor
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 426fa8fcc2..a7e1147e8a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -421,7 +421,7 @@ config CRYPTO
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


