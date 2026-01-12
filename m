Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F25BD13030
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 15:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200315.1516280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfIbZ-0006cJ-Kr; Mon, 12 Jan 2026 14:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200315.1516280; Mon, 12 Jan 2026 14:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfIbZ-0006Zz-HX; Mon, 12 Jan 2026 14:09:13 +0000
Received: by outflank-mailman (input) for mailman id 1200315;
 Mon, 12 Jan 2026 14:09:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1UP=7R=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfIbY-0006Ze-ET
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 14:09:12 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43a1d22a-efc0-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 15:09:10 +0100 (CET)
Received: from MN2PR11CA0014.namprd11.prod.outlook.com (2603:10b6:208:23b::19)
 by IA0PPFAF4999BF6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:09:06 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::9a) by MN2PR11CA0014.outlook.office365.com
 (2603:10b6:208:23b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 14:08:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 14:09:05 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 12 Jan
 2026 08:09:03 -0600
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
X-Inumbo-ID: 43a1d22a-efc0-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lg5o7Hqbux9j/KCvQ5kgjekaDgyi709z8o9SBGAJyEADr+uElrQcZ12NtbNFYR/19JDmTGJydyjtxkuuj0gWUI/VXGHOVNSMCfDHFa/5OqzFVwywbpSVJZyLITAGwfUwNvndJS8pMFxZenm0sThxb75iTWV37Gx7cyNdKAqGOJkUJKb1wpZCLEv8Ae0GlT+I0ZhA5RFWyBXMG3tKvtHS/PZKQ+frdk0HUFhcHRRVfBx2Ni3y1r+Jljc3/B1eQmONFY2GSBR81eCJfkzRhf7MEFCbpEEnQObVB3zz3fx2SXoRg9bQGeEkp/Yyvh6uAlEeBEnIN+m9TQ9US5VSNxi/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3pxIqWYN/jIUsRS+Yl3k11oyQPxieIYHxnURhwQgLs=;
 b=u/ifNzNDWp3Q3nGEcLEoLGDtfAEOWgU5rJl+6r0Bgjz5C4FwIHwbS8Ve8Y0WC1D1lI0//oh9yb2+ZLpTbUkA+mnM8flcQJsV5Vc+r/beD26Z5pw6qSRDZObwQaXjxbZSnB9WuJEPX/+4saGKRmkfijNdpXuzZ2zmlR5nwDGsFICaLC9PufiZ0/BdgPxGczbbHUbpjk+B6vVgfmRL4rfRswSRyrc89TldjcAlIQx77mK1aTRhNnr5VLuuk64+GdMrqNEcY4lt/uKrtSsnyZcpg1JuO3u/9hokaplYOzquH/+w8kp+Sm3ipXvKVZP/wMcw26xYa/4k37Z03sQZKNa8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3pxIqWYN/jIUsRS+Yl3k11oyQPxieIYHxnURhwQgLs=;
 b=k06SBM3V+doJ2WFna3r+NP0PsLX1u7ve8mzSkRDXZaOHwTaUt5h8gY8OL/mdEp9qWIPE9T9nWWA5yyj/vJdAlXjp4FYM5y4LNLvVaH3esh0bU6O/jIfDpm+rfAyns8Zwuq0qpadjruxtMgpEvTw2RmvNkmVIpdo9rm2HR3MpmuY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH] x86: Add Kconfig option to use a 32bit TLB clock on debug
Date: Mon, 12 Jan 2026 15:08:44 +0100
Message-ID: <20260112140851.55590-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|IA0PPFAF4999BF6:EE_
X-MS-Office365-Filtering-Correlation-Id: e87d31a5-6de5-4e84-571b-08de51e42553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4lz40WER0M99L8gwkIHu4aA5k5X4gMNKAASuC40HOJwaSjRSUSed64uuhPA9?=
 =?us-ascii?Q?prhk5j+9+2lw4LrlV4QYoDEBhjhzqnvyTt6Lb2LMQE+fA1afq6WqquYeQP5d?=
 =?us-ascii?Q?iVBNdMtUecMmcf5knpJTPuVuyFb3jinE4l2UJixJdZJQvZGKN9DhkKNVtzL4?=
 =?us-ascii?Q?U6b5tq+8Ysz/hXUsndBa4rmtEPbNkuL04nBVj5RufCnHksQXBTrYXz3Y6kiJ?=
 =?us-ascii?Q?1gXVNOCyjMbW32te4iFjOb2GlN25T4U4rlLnhiTQ4asPNEzSiTQi60AtxRIH?=
 =?us-ascii?Q?OP8cJw5rWxURpEIBl84742jQrS3ZBY7ml15JuEEj+BUgEg1eShaDBYi8KxqO?=
 =?us-ascii?Q?+y3lYHdC3JhGN2zcmMERP3jDZ7PV2KO2/DQFM/h1ihdvo6s7e4Yq5XT2btmc?=
 =?us-ascii?Q?b42l92vxrBTmRbI48rTa90GqFcULsSJDHty/675mkTU8tCmCERz843Gxqx/P?=
 =?us-ascii?Q?49EbDptR99v1sxC8hhJQqmfdQCVrJSxlAmamTBL8DLGWiLBL2XC75P56FJuV?=
 =?us-ascii?Q?dEhDHNC1XMloYv8WWiTVHtkmqr1BIpUPIjlzOau58UJp08/KAWNgzE8SayUY?=
 =?us-ascii?Q?d8FnEd0mDysKBGeAi+ZHnVtdBO77UMfhf6OQlGnLyqseeOdVTF3f9IrBIRK1?=
 =?us-ascii?Q?U9ZZ/QkRrNroga8tWBTsuotvCCtWd+/vh17t/ddyL1jIVWnMYV3MxlgDfAUG?=
 =?us-ascii?Q?fChiLlcWbpYxFMaRUlLKUFgmnbGKjPCo05pwRPdGVAj6xwwQx13EbHrHZuDX?=
 =?us-ascii?Q?vp582pcKutJ65NyjAcBeVWtRkTyxSKm81+2niv6iP7s0V7ZYvw5NZ1iG+mH0?=
 =?us-ascii?Q?sNJBjKkUNA6eaYH8+gcqCdLj+rTE8ti6EzGEs0vEl7vPxV4WC21WymXgxLXx?=
 =?us-ascii?Q?Wb/7Ynr+IXiC4TLZfdT07olkA51ZuE2pCDmZOm1koE8LhUmOq+huJjMPuYyN?=
 =?us-ascii?Q?4OXGy1UJlU+5SCeMjkK5Yq4g+ydIIXnsBnWrzMdyYILmpsay5skht91rQAJ1?=
 =?us-ascii?Q?rXudiezFUCRcGKZCfK7mkQqLfbOnzXOkoFo4j1HgvGmjmvBGoLm6OAH02jOJ?=
 =?us-ascii?Q?KyHWvG55pJHVf6BFB9WiRU4mUW3ulaNkPn5iMYzt+djUlvu/QZXzMGJ7OrQm?=
 =?us-ascii?Q?KL0g9UyJhCz42SiYiKVH2a91H6x4c0IOp3COdwLHOi/epi6yUJQlUiOPy4nx?=
 =?us-ascii?Q?HGA5PeqGTWx0qq+wqNnGd1HVP1OA9VXSN3DZX+mGPNjQtQtt9CcHEYZlgV1Y?=
 =?us-ascii?Q?T0Z1AwVIxA9vSYr4qce6ceHJucOAOhvmgxk9DBypoEpzBo+4qeAlf+6fW0ky?=
 =?us-ascii?Q?5I6Pg/zSBcSurJWjNsaFzhLEtNz6FesBYXjfuEBVmncnMXlnU5WPY9RH2P9x?=
 =?us-ascii?Q?qABctdhdtbZ/C0btglX+8/Y+XBgb6uBbdl4/F+pCP8CKkqGHaJ3lY4ZlJ6iQ?=
 =?us-ascii?Q?tyGRfS4MgjMcPlyxPBdhdK7I09XZ2cbiKuBmhxJsQp88aTb69zbV3VIkXDHl?=
 =?us-ascii?Q?Jk+Rse2ca80p2hh9chx/uxMxhJkLBH/ytAcbDeIFinkzlgMoNzC89ncwbqfZ?=
 =?us-ascii?Q?m1LKjc9largGpIJjbMw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:09:05.3365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e87d31a5-6de5-4e84-571b-08de51e42553
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF4999BF6

Debug builds stress the wrapping logic of the TLB clock by narrowing it
down to 10 bits. This is inconvenient to test real time workloads on
such builds.

Add Kconfig option to be able to selectively use the non-stressed
behaviour on debug.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/Kconfig.debug | 8 ++++++++
 xen/arch/x86/flushtlb.c    | 6 +-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/Kconfig.debug b/xen/arch/x86/Kconfig.debug
index e69de29bb2..ecf5aa4336 100644
--- a/xen/arch/x86/Kconfig.debug
+++ b/xen/arch/x86/Kconfig.debug
@@ -0,0 +1,8 @@
+config DEBUG_TLB_CLK
+	bool "TLB clock stressing"
+	default DEBUG
+	help
+	  Stress the TLB clock wrapping logic by narrowing down the counter to
+	  just a few bits. On wrap-around a global TLB shootdown takes place.
+
+	  Disable to run real-time workloads more reliably on debug builds.
diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 09e676c151..0d788047c5 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -20,11 +20,7 @@
 #include <asm/spec_ctrl.h>
 
 /* Debug builds: Wrap frequently to stress-test the wrap logic. */
-#ifdef NDEBUG
-#define WRAP_MASK (0xFFFFFFFFU)
-#else
-#define WRAP_MASK (0x000003FFU)
-#endif
+#define WRAP_MASK (IS_ENABLED(CONFIG_DEBUG_TLB_CLK) ? 0x3FFU : UINT32_MAX)
 
 #ifndef CONFIG_PV
 # undef X86_CR4_PCIDE

base-commit: 6238c97ea430706cb4a959b1474ad40a57ed1033
-- 
2.43.0


