Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EDFA5D504
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909810.1316734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQm-00089j-DB; Wed, 12 Mar 2025 04:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909810.1316734; Wed, 12 Mar 2025 04:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQm-00083d-2L; Wed, 12 Mar 2025 04:10:56 +0000
Received: by outflank-mailman (input) for mailman id 909810;
 Wed, 12 Mar 2025 04:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNu-0006o2-K9
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:58 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2009::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9431c930-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:57 +0100 (CET)
Received: from BN9PR03CA0529.namprd03.prod.outlook.com (2603:10b6:408:131::24)
 by SA3PR12MB7831.namprd12.prod.outlook.com (2603:10b6:806:311::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:53 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::45) by BN9PR03CA0529.outlook.office365.com
 (2603:10b6:408:131::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Wed,
 12 Mar 2025 04:07:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:53 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:49 -0500
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
X-Inumbo-ID: 9431c930-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDCe7DGg//SkeTom5Gbu4Nv2O1deWN5N+hxoHva+v3OpebklJ16KJcarPX1cKwlsxo9oyeHc0Y8NZS2zyciPsVnsVTm+rbjzrpfetQPMMpByOrfy6Cp9LZ45JmFKwWCO11YrkfMVVFXldVKCI9LTbFnBtVdppTVb8WjQYvMFUPjN9DY8F3yHT4SKqSbEwMHm5sRcXu7KY02AU4id3s0KweM/Ul5nEP8v+KWHc3tU/5lXW0u8RkL6YRHT70yG5Zn11+d/UzMv7KfVhljBm0JHowPxNSlFHY9zAVaolkprbq/BJZFGRFP2zOIKZwyBIioBZRhOP1bi5+G67ekWGTIRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Co/A6LtKil8nD0o6Nvn8J3GZ2QcSnUMY5PdPvBScsC0=;
 b=xcsoTaFATxn+TAoYBVlaHEuEFv71/s5yhJ2rdE5EiAr3CtSWt2GcB12ck/OAegRz/9jXznguvJW9MlsQPXzomwaWLQ9n3iihzHsVjPeEJGBXu6OB/7wYk3XaTdDbYTKQgI4ii8HEvWttIbzxDVdpFrLEr14/jrVEjOmjB4WKjiv3YXiZ4+3njKVVomeyp+MzROJTL4nuptKH2zyAZRL9pLk9jywJE2T3xGShW3LDl1HEQXo/cw6ZYmRvDBxQwn722j947TJxBNgKZt+TyDGIQJv/GLcsbNuclVifFiWxBVgTX0KQUPQS5sD1CyFcOUCq21bWY8ZRUzkPfbHQD3Jt9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co/A6LtKil8nD0o6Nvn8J3GZ2QcSnUMY5PdPvBScsC0=;
 b=O9+y4+wqwNGTfpl8h4Nm8p0kuLktFR9MEOiYlANCuHiX4hozbfNUzH7/zUVbby4lVEMk2UV03fG+p9CQz8ToaAmJwg+CnYNmEU7xm+EoJPx41gzS1IySe82AhYOEDE19qpIcSDhzGAcezvY8HoWpboB+uMDaDF+VlTy3sDJi/wE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v1 19/19] xen/sysctl: wrap around sysctl hypercall
Date: Wed, 12 Mar 2025 12:06:32 +0800
Message-ID: <20250312040632.2853485-20-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SA3PR12MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f7b02a-01c9-45f9-9295-08dd611b7631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9hXgPN/92uI7cIKx5iidzWZht0smU5DC7mPvKacYRf35KmqRP5FAO00oBOAt?=
 =?us-ascii?Q?JhiD+0e3eccQOBWanLTrWtdgOm59Koh3qywL3+dX4T/B+ahQkJFgOhgsqeaZ?=
 =?us-ascii?Q?Mip5vt63uk4XR9Zeyu9eD/9dBulHH2P5xitbqIbXSB7VO6JSe9nHa09M63Oq?=
 =?us-ascii?Q?ePlaV8PJimo2Wn76OEXF06BSfJaGrvF+0PkOGl6YFRXYDGEjEz9TF8GKRiVg?=
 =?us-ascii?Q?mtUhVZisKOX1U7QqvfSY8Yq/z1DOnArkVsVpkLedHqywql1Mh5jLLPQ4I1Ek?=
 =?us-ascii?Q?J/YYbVBIksvbUxByHtFfykF408hR9Qd5QnKyUFxG7myNjG0avzJz5O1UomXr?=
 =?us-ascii?Q?+uOGQu1udLQYGV+TOkOPZ4gVEt7a1e9nWacktsy9BtqtOTZnCaL7YXRy9BH0?=
 =?us-ascii?Q?8JDParUSUmEWYIG0d2ziJ/th8hPwqNME+h3SFFz7VXd5R0nTiWPJAZh2+Lzi?=
 =?us-ascii?Q?ai9SObRVRdO+zhd1hW4IQL7rDn7rKlHp6uh9yvZxeAKCESfsLYz+Z7VZnI1N?=
 =?us-ascii?Q?gEqDtoDaisO4yC0pVqGudbv9FdkhwNyTUQ8PurC40zZ2uPeO6xC90VSplpRX?=
 =?us-ascii?Q?pIlW3P+yf1mVorXq6CJJNlA1T6MoRFofsQbIGzNDA5GRHycs6wVJ3crU0Ou9?=
 =?us-ascii?Q?uqjCPgMWTqtraOBWirxkGRKboG8BCN1IfmqlD9OlnQYAGLn4Sd8yKNqoooTR?=
 =?us-ascii?Q?SOFkOV2aRsM0QAMvEGDkoo2mqP8A5OZW0Ib8mvRmY/+OsaMnu042k/QhXH6T?=
 =?us-ascii?Q?qw8XxEuaD8L6XwXqV50vp87hqL07AEyKPPRPHeIMKNQHhwi3RLjbs8TFmtvk?=
 =?us-ascii?Q?VC2QIY0CxnzemgvoP5tjFJCGlAoRgLDq/VeNFvp6NzEmKYX53HofIBwJq7OU?=
 =?us-ascii?Q?HjFoWIZv66mSFRa+DYR4sW+UOKDAIPiI4n+2O2vHpMuHgBQ8l/issoBfgEf8?=
 =?us-ascii?Q?vHNyu7822rcWKJIJfxZ91cBttBHWV7YM2YcYiGbEI3Ddpso5u9/zBN1NIZME?=
 =?us-ascii?Q?JqkCV3O6GKKHMrwakeZ0DjfoESauLvjlrhk7UlGCjPSIBKg4SlsY4Efb2cbe?=
 =?us-ascii?Q?ghwM2TQShf3cBf0NQpOFcEgSrqaFskowHsAQ/LZ2T+J4wY1+gkxiqKDvwY/i?=
 =?us-ascii?Q?6d6KspWa0fbnlLe67OcLaQHHje/e+4sHtIVUgZ5PQr9RXSrvW4yay4mKzSF9?=
 =?us-ascii?Q?KLhCIXYsqqRYohQlNfGhXf2ftmr6ASFls251Q8vYdQ6WXlYI76zYuCvuBjJz?=
 =?us-ascii?Q?emlhQmMXFRbPQ4hO8hE4+vZaT7ZQn7dru7ZvSZo3HEjdZLT/+hw8/woWnEvr?=
 =?us-ascii?Q?oUk3qpH2XYLbNb4i98yn2xxkRJgDmd45d/hhjbmOAm8fi1o9RQOQtgE2yUVl?=
 =?us-ascii?Q?twUGQW4j+khCWvOX4mTv9yw23yc4CrvAwS0fdYx9XQgs2aHJfJBo24BKSogq?=
 =?us-ascii?Q?a2YwZP7jAYEpzcf7FIg5zpxbFrBDCagNAM0pgjzgusc/OfchFBOnlhEWi18I?=
 =?us-ascii?Q?aFyRvPqE3NpSWbU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:53.0825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f7b02a-01c9-45f9-9295-08dd611b7631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7831

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/Makefile          | 2 +-
 xen/include/hypercall-defs.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index cba3b32733..31c6fb1b71 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -69,7 +69,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 obj-y += monitor.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 endif
 
 extra-y := symbols-dummy.o
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 7720a29ade..b2118e9adb 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -195,7 +195,9 @@ kexec_op(unsigned long op, void *uarg)
 dm_op(domid_t domid, unsigned int nr_bufs, xen_dm_op_buf_t *bufs)
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl(xen_sysctl_t *u_sysctl)
+#endif
 domctl(xen_domctl_t *u_domctl)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 platform_op(xen_platform_op_t *u_xenpf_op)
@@ -274,7 +276,9 @@ physdev_op                         compat   do       hvm      hvm      do_arm
 hvm_op                             do       do       do       do       do
 #endif
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
+#ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
+#endif
 domctl                             do       do       do       do       do
 #endif
 #ifdef CONFIG_KEXEC
-- 
2.34.1


