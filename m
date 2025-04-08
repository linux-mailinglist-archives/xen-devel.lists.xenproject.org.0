Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA95A81195
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942784.1341894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BX2-0006Z3-Ko; Tue, 08 Apr 2025 16:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942784.1341894; Tue, 08 Apr 2025 16:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BX2-0006Vx-I7; Tue, 08 Apr 2025 16:10:36 +0000
Received: by outflank-mailman (input) for mailman id 942784;
 Tue, 08 Apr 2025 16:10:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVe-0000a6-UD
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:10 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2418::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdc17917-1493-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:09:10 +0200 (CEST)
Received: from BL1P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::35)
 by DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 16:09:05 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::46) by BL1P222CA0030.outlook.office365.com
 (2603:10b6:208:2c7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 16:09:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:05 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:03 -0500
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
X-Inumbo-ID: cdc17917-1493-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/tnOfkI3kiJBebYNjMhCJbJJPaGPYM5ntz3/E6ssWTNw0KXV3LKOX8TgXlS1DKn0cH8Nrl8yNoQVlipE7NIRw1cCQP1K0PKhiAcddVyixcSn0ppVc5Baj8PIzJIA+ShcJ3XbJ1SMOdTPKzWDAc/chbfk++mE7N4oXU0eDRjxKcJ+qOPDnL5knlzgRJ318/mRCjGtWAHj1J6V7vA/lTMaW8a44fAQaXx9gK0ZCVEhkvTepfixxpm99NyvH6cWUUF5kKOjAIsIoSFEBPMczPA+6ESOYJsFylYkow1h3T4TSbjtM9lgyr5ytSNyBjFUtQTBGXLp4sfPpixmwpKgq5lwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEwRiBF5EEuyNhZaJK9NgqTmDdKtu/qhdxHFkSWjIjY=;
 b=cAaJe5t2v5Njo/uJthgv5iMkfNomo8KJDEzDInTPHtVigGZSKuPugaTzFwhANXLush4rVP9CqfAqSaZwGEpRQxz1aBD+Gc5aipbuj6+Kw7ZCe3jUkmrpLC5ibbuJH7dd4OI4pguj2+NUVZQMdCQFV/r1s9Ba+vlrXF8LAHPAs8bqe37nz5laHeEFLt06WNPVi5Ko43lgy9Gx5H0TOJeyEkcxk9sc0XJ8ioOINbiz20TzLrMUp5AZGnwbyDQ2fzqAZy2b4ZYKanlCKVrDoI+1INxUXLZEe8rdUUZObaxriRBv0PQm0sQGZdvA2Y2RqnCebX74QigwWb3vtCJwVcscPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEwRiBF5EEuyNhZaJK9NgqTmDdKtu/qhdxHFkSWjIjY=;
 b=Hx+r1VO4O6tAMBFBf5xeYKB//Ymk5D4cV4lBsqQr5CjR2j2f7eD1RqlLBZVNJHiBkzvILLzNd3vzQkfU0tVdr5jiznEEz5F2JZUMBlZ0+rv7hwlmhbC0hEDg4jMzmaF3xg0xYe0jJpw2VT4Ogzr50fFHeqQrfo/BrgtiwaY4K54=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 05/16] kconfig: introduce domain builder config option
Date: Tue, 8 Apr 2025 17:07:27 +0100
Message-ID: <20250408160802.49870-6-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c88989f-380f-4e36-965c-08dd76b7af77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ax3ue7Ha9sftU37v/Of1ciIA2S0GfnxJsxv8z3DvkX5KIh+LdDhWusVa+kOJ?=
 =?us-ascii?Q?/gSTcTj7Rie+34pYi0MoZjGIbzk8k0kgg5ZRlGOhRa5zhszP+1qUj3x/fCIP?=
 =?us-ascii?Q?CD5kgQjb4UhVe0fb/nKCQ2XbW2J8i448S8VaTlefWskwAE32K4BNbLP0c9it?=
 =?us-ascii?Q?JNotMTgieavd/naTcjr4XmRbPmYuJ7SVRz65YFFbt8USpqsw/qlf724N9YLm?=
 =?us-ascii?Q?vuoWTCGePUcX1k422PJPWlQHWuQNrSgX1oqdWBqGfSow/N6QuqDGtr9NZ/FG?=
 =?us-ascii?Q?d3vbTdpyDrSJrtGJXvBnyW6vHpuA45wn8g5b9pilNMgV/8Efh86Ps8Dhl0vq?=
 =?us-ascii?Q?TYT6eevcP/f21yCb992QErh+WjLv9Jke3sszp8eZOYhVMUzYI3i7YVG1qcX9?=
 =?us-ascii?Q?AKADfKwQb1/D88LKrfxWuQGLO42XfKlABA1AOeWkQCchPui8dhT5xjDy3ZkV?=
 =?us-ascii?Q?mVgR6aMr2lomIXtLVhlG3Gp6wF9F6LsxHsBMPv68RG19vMyTbHcQ1KObcMy+?=
 =?us-ascii?Q?YkMqiA9buCn3ehmQrwmaTc+hlKBxXHoVsvnCgQtqIj/xLb2wGBI+GF6Wqf+q?=
 =?us-ascii?Q?K8nq8pzsuASVP8eHykpEPNSi7wThHjBSy2oJfclu9HfQe8vqceRZb87Bti2I?=
 =?us-ascii?Q?4epDtlUV0PiP4BHFWduB4hTI0VKh6j6WlwJUu4WGuQ29tpyDeTuISFw26EdD?=
 =?us-ascii?Q?C+UVnyefcwo3EeNj8FGb5JkKlMQxiWHeBU62GkCT7ascgyOUhQaNcJjXdNeG?=
 =?us-ascii?Q?h96N2adwgEFu7q8RF7pSgYrCwOlOWwcWAGc5ep/CJcDi3tHBjkmQXIOMGY7D?=
 =?us-ascii?Q?I11+woSBugTXZrk+T6d/c05YunqqrfaLIxEvaFdOMlSIoGhaf4r5h4Ht+eWH?=
 =?us-ascii?Q?QKYW/gIdxmzWgYfo+sHZ1xnPXqktBovgpQFmDw+EDLUPioMokkt0t7KZ+XHR?=
 =?us-ascii?Q?/d6vscka2IpxIJz7eJc8JdkSTX4hB1jI3tWMWhxempdV9HYPDWBRUxUnRCAn?=
 =?us-ascii?Q?ZGMSj55lQrxvu7/0MU91weJEXdbojAuDItZMXdu80cyQLeklnyvRFrlcTXrO?=
 =?us-ascii?Q?yk75we6hRNrQbMDpgWdYbOUvTdjRzHsyRlWcWDtFxCxnUwYD/vRCFZJ/APGl?=
 =?us-ascii?Q?JX8/F5NWXzmXNiKCN+Z6sv+s2Gz/MBEDnd+idBISplFErENpykaIv+nVRXVN?=
 =?us-ascii?Q?30SjGho2OcSCbzj+o5jz3XowBS2+X6SHih9TAaqLZl80YwMlHxA1e2lvVE2A?=
 =?us-ascii?Q?WoB07ZwkId7VBd4meb/HRFUqZVvPBRVvpuOqvw0daYUM8l+v/KvCE94elwdI?=
 =?us-ascii?Q?E+kWSrIsJbxJsHDgnOAG/cIOtwogTo7+gA6FUUBbqpC6SLltV0NXc9AKFm7v?=
 =?us-ascii?Q?+Ii9nVEHjRhZ2ldWQeICukaA0c3WKszk0xUZVUJIOEkIMthCN7iFdXAeWX2Q?=
 =?us-ascii?Q?l/pCWwGfX/TuOFHdzaIsWHKUgIM6tcO+JSDC39qJEb4sM/ECRsOBpQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:05.1108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c88989f-380f-4e36-965c-08dd76b7af77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Hyperlaunch domain builder will be the consolidated boot time domain
building logic framework. Introduces the config option to enable this
domain builder to eventually turn on the ability to load the domain
configuration via a flattened device tree.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
    * Minor s/_/-/ in the "source" line
---
 xen/arch/x86/Kconfig                |  2 ++
 xen/arch/x86/domain-builder/Kconfig | 15 +++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 xen/arch/x86/domain-builder/Kconfig

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index de2fa37f08..a31002324e 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -321,6 +321,8 @@ config UCODE_SCAN_DEFAULT
 	  Enable if you have a Linux-based dom0 with microcode attached to the
 	  initramfs.
 
+source "arch/x86/domain-builder/Kconfig"
+
 endmenu
 
 source "common/Kconfig"
diff --git a/xen/arch/x86/domain-builder/Kconfig b/xen/arch/x86/domain-builder/Kconfig
new file mode 100644
index 0000000000..8ed493c3b5
--- /dev/null
+++ b/xen/arch/x86/domain-builder/Kconfig
@@ -0,0 +1,15 @@
+
+menu "Domain Builder Features"
+
+config DOMAIN_BUILDER
+	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
+	select LIB_DEVICE_TREE
+	help
+	  Enables the domain builder capability to configure boot domain
+	  construction using a flattened device tree.
+
+	  This feature is currently experimental.
+
+	  If unsure, say N.
+
+endmenu
-- 
2.43.0


