Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C389A5D4F3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909680.1316617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNG-0008QE-GU; Wed, 12 Mar 2025 04:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909680.1316617; Wed, 12 Mar 2025 04:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDNG-0008K3-BF; Wed, 12 Mar 2025 04:07:18 +0000
Received: by outflank-mailman (input) for mailman id 909680;
 Wed, 12 Mar 2025 04:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNE-0007Fd-B8
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:16 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2405::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b97dc72-fef7-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:07:15 +0100 (CET)
Received: from BN9PR03CA0363.namprd03.prod.outlook.com (2603:10b6:408:f7::8)
 by PH7PR12MB8121.namprd12.prod.outlook.com (2603:10b6:510:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:12 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::b8) by BN9PR03CA0363.outlook.office365.com
 (2603:10b6:408:f7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 04:07:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:12 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:08 -0500
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
X-Inumbo-ID: 7b97dc72-fef7-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+nRQqk8sw2WC0ItO7u1bW/llpoRYZFir+vc9LCvTKxwOzvYoc7tGIGDgWTQlzYpYWfNg9pAG7SgzmiKRXTp59cOOFcikOB+G44YFCHW5N5Loh6LDFS9+xUxmWKdkeW2CykEcFC1r4eQg3U+Or/mWiz9lVUsMT1iUUaA1gxbNcGoIdpWC3WvVCAV60YXKTahcb3TObGH1azT7BJSCkPu1qKnMKZ3Ze1xK5gPxLNrRZ2zQzufv37jeXQy0QD0708jd2/Fr1cNFv1ECFAbLeNUhR3Gl7K9J6ryoGS3bZk2GoD5yLm6oIYJhymMa4L6ChUQZHLyswroCCdDQSXnSpgYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNDtLuo2qdkeW1r6yrP9PILXWa6wrDrvqRmSKOwNmtI=;
 b=zV11JAtrlyBvsnmrQwdzZQZ/H8Y9JlPVJGYWYYVDy3+ZYuP9aNghZjCqdhYkasNJxut/jB0idPU3i2zEEwkWc68H0FRRz9byyjxfEUdw05syvAwJChQJJ9Pbdg6nMfFYMzfMsHpOpfOYsQf6wHSwFTUs2i6S5d2MNgnvh1XeKeVnHQJ/q0tTBYXgxywvDoByNlRr7vMXUzvGG75hCSahGokaGjgLHobKmW4k+34bWfEjoF+/YCc1Emy6SB4No9H1eE4YwVzW+xQceIXt1SBS5ppvIb2LFxvU2Mcts5drq08VimnkDtvFJj1AS5H3YXosq9QGfJb8rm44Cb8xb5qFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNDtLuo2qdkeW1r6yrP9PILXWa6wrDrvqRmSKOwNmtI=;
 b=JtVfyFPjNg04KNEqrA50mwP22xafpMCWXGZVL+vfJVV4TCmLQbNUGeQG/Wl/EOopTI/5ONxQSlpj3EB/E9cWeQP4o4LyyyLsuoE+cnZkAKQA++equCOwy65w25T+44t0mK0uTe5EUVUS+OEXIWsX7isyVofAdFpqlYdFKi1wU2Q=
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
Subject: [PATCH v1 06/19] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
Date: Wed, 12 Mar 2025 12:06:19 +0800
Message-ID: <20250312040632.2853485-7-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|PH7PR12MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d98f80-361e-4160-a611-08dd611b5dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V5p1JWh/VUiA4M/I41vYkOq82kT5UOGm70I1Qux7pgQh4S8NdoCG9HcK4bD5?=
 =?us-ascii?Q?uXOIcB1PnL3doQaDq88jmddeaIXBCSlUGUR32mecymuO59xJ1wrxfJPxrNwX?=
 =?us-ascii?Q?Oxj6XuL4HkS3jJqbG9lhih7cgyt3Oh91HHtkpu7M0CWXl2froMhghYhrD4vt?=
 =?us-ascii?Q?gx/vsgaPyKxTYNh3WogP4+6QHTjtzaS/N5ll2IjjJUVq0bCraJZYtsfSg+Uf?=
 =?us-ascii?Q?i7k56+1aS0LtFBSa52fbvGMw+ynjdZaUQHvj3mL7Q+AeOPDCNfej5ADlk/Ph?=
 =?us-ascii?Q?N+kt6oOAo5eFiVG77mSIJbHQHEGgKTzu6EI5pEB60dozM6w9NXDR7XqytkQs?=
 =?us-ascii?Q?K5fy6AA6owNOSmaXbSN6F/Hy1msIfHoV3hO0hCYA44L6joWc11o9sYDsdprC?=
 =?us-ascii?Q?0Z7KeWj0UnOUJvhN4f6D2fLBZMcUo73BzqD54hrDVPk3rP2tTlZiftslCRa5?=
 =?us-ascii?Q?B0UkjMdYkba7V+lY7yWf4g4Kahqngs2HvTgXor0JmGTn5l52FpYFA/r1oFfh?=
 =?us-ascii?Q?ef0IpwEPefNmodT2sylj4Cq6bFsjS7T75FgJI71yJayzkXRrDTzYE0+lf/Ya?=
 =?us-ascii?Q?WKJsBPIMxlqvk/cVZZ72Td5fJGSi3NlyeW9EjNWpuWg64bKghny/6HOYFoP5?=
 =?us-ascii?Q?iJ9hsEW486+Pa0BCTLS8SJpeM4ohehGDB0DHt6EyGnr99FUeQ3cV8haYHRhI?=
 =?us-ascii?Q?ZPIeB5mk/P8BFxY+IL8gSqGTPlR5ruDXwcM0kRKbbjlhtbmYAdCvtXNOb1EJ?=
 =?us-ascii?Q?+eqfvm7auwBDmAfhKQzF1qVJHrFN2ccvlxyHw9+ZPBmeSykcB6JR9N6u79FI?=
 =?us-ascii?Q?5JWY/X9AO7kOHa7xsQY52wYT2uErPhvH+NXK19A/3eu8UeJbKAiBQ0FtCnBO?=
 =?us-ascii?Q?zY0O34LRVvnFDalf9Bhgjr6TwnzoPGnJKD6Iq+W7O6yQR0H5FOAdSyBNXW0R?=
 =?us-ascii?Q?485SjHPiiKRofl+u6+2S3qTt86eLdtKdR5G17RJCmKfT4zsozl1R/Ft6HXff?=
 =?us-ascii?Q?wdAUJYNZcfNWGezQaicKNKhQGslNa5qU6amL0JKdvVl7e2ae6uyMQXmNPk/L?=
 =?us-ascii?Q?/98zB4M6VekTiQIenkVQzufnyCLsuZ7mBib/pSM18HvmLnI2JLFvjIyeXepI?=
 =?us-ascii?Q?KxWnCe5xQv94a5UtgXvSCCY4+AniewHyLbqHwWU/pW8ioJWViqxM2Fh8albl?=
 =?us-ascii?Q?i7T4mUD7PqAqDSqR9PHOp1fvA8R5/YuBL4gSnZKu8Jruo5zDrd+FgV9V+GI3?=
 =?us-ascii?Q?kILRSWWJSzAePRtYAXUPfnixlf7c4Me0v88jzRBOokRvQEA4S2Vgvj0lkOz6?=
 =?us-ascii?Q?j01xcEnXTGhfFCahiNqafG1ngfuksZXQeIAANL6gd3a1DA2e5DJHHC79tDGV?=
 =?us-ascii?Q?2eCD1euQJvECb00mJiY1ioI0QQwlDLDZciVMmwumuFJWCbRVe2yWd2wBlyZY?=
 =?us-ascii?Q?mgS2YNFjmVktWYEJbvt800p2iz3lNfD96s8tKkhQ4XT4zSDgg/9Vl+4eEbyi?=
 =?us-ascii?Q?Mgy7azUOld7juWM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:12.2303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d98f80-361e-4160-a611-08dd611b5dd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8121

perfc_control() and perfc_copy_info() are responsible for providing control
of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/perfc.c      | 2 ++
 xen/include/xen/perfc.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 8302b7cf6d..0f3b89af2c 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -149,6 +149,7 @@ void cf_check perfc_reset(unsigned char key)
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
 static xen_sysctl_perfc_val_t *perfc_vals;
 static unsigned int      perfc_nbr_vals;
@@ -265,6 +266,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
index bf0eb032f7..6cc8af12d5 100644
--- a/xen/include/xen/perfc.h
+++ b/xen/include/xen/perfc.h
@@ -5,6 +5,7 @@
 
 #include <xen/macros.h>
 #include <xen/percpu.h>
+#include <xen/errno.h>
 
 /*
  * NOTE: new counters must be defined in perfc_defn.h
@@ -92,7 +93,14 @@ DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
 #endif
 
 struct xen_sysctl_perfc_op;
+#ifdef CONFIG_SYSCTL
 int perfc_control(struct xen_sysctl_perfc_op *pc);
+#else
+static inline int perfc_control(struct xen_sysctl_perfc_op *pc)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 
 extern void cf_check perfc_printall(unsigned char key);
 extern void cf_check perfc_reset(unsigned char key);
-- 
2.34.1


