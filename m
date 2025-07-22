Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1717B0D8C0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052395.1421105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfg-0005Ob-6Z; Tue, 22 Jul 2025 12:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052395.1421105; Tue, 22 Jul 2025 12:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfg-0005L4-1M; Tue, 22 Jul 2025 12:00:36 +0000
Received: by outflank-mailman (input) for mailman id 1052395;
 Tue, 22 Jul 2025 12:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfe-0003QN-FG
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2412::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7804f3cb-66f3-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:00:33 +0200 (CEST)
Received: from MW3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:303:2b::16)
 by BY5PR12MB4162.namprd12.prod.outlook.com (2603:10b6:a03:201::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:00:30 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::90) by MW3PR05CA0011.outlook.office365.com
 (2603:10b6:303:2b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 12:00:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:28 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:26 -0500
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
X-Inumbo-ID: 7804f3cb-66f3-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvij6Wz0sEdlZlUq6TI5Lo0zqyBLZqctoQvuzKD/3ofqKv2gs+OYnxP4Vz3N2QuMZ67ALnVv3xPjXHs7fC/w2cxfHQ2JTaLdTFTJXuSujlgmNn8QyfyskPkuNtZbHAE0s1vs9+6/Ce4/omBZagyD7u1I1AdRxOY6SV//HdQZF1HlYTbqj5S6Z5/9skcH8a8SlTXMSebGcGLfe1RRo/W+dEagQrjM7ji9QBB8ONlHjwUvvv2S0FrNGC7utvhMuprRXkTSTF/4nc8WL7AVMd6s8plEKsVHPBw4q9F5AQ41MaGPo6+jKvRljxQJsUmFOFtsiZgtFl2Tn/Yzn6tPFtA8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc7Hsv3ngtfDZ1Ud/TSeBZjKVCTZPo3lEUHnZ4z78mA=;
 b=A2F9rBEgtO3Iws1vpv4D2MjPjMG+jPJMIyhnsJDV9oqHi6PGyPDfmId+md2NactQc0B6B98FL7DdM05lHiO9YGbrRl02X8kihXmtzHQVrLZvlC0YK2aPLRiz8YNDDsiyJDd+TSP8jJSdZfaqHU9S+g1WuvBA6c8CAdYHXdtxRuLnIgKtikgQpTA2vmhm/4Ygs3N4Fcw+DqcNTYIxbEAuWd8hloyYUKQ1X6jNltkm/eDSlE5lPKjSj+2ByT19Zl75a0dephk2Fu2lCTIIOKiw82AmtXRtCRd1zqe5OeRhg24AifX5L7+uE3d2XdfFscbVUpchqmWhke8bnqHqKEyNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bc7Hsv3ngtfDZ1Ud/TSeBZjKVCTZPo3lEUHnZ4z78mA=;
 b=XEftuWtUcXYmenP3cFON8NrPSWc3prXNFlhVZcBbq1jYIrKfDN8H8Jr2wGImlvX7B+7sQemw4PhAHXsUEcbQUUWdU9+xeEKubQUpm1rY5WTlxMiAA8fOXVR6hoXzM//aPpKTgv9DR7at+EWNDWai+4UgQmjfXsql2MSwCmuLs70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 09/10] dom0less: Reinitialise all variables on each loop iteration
Date: Tue, 22 Jul 2025 13:59:49 +0200
Message-ID: <20250722115955.57167-10-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|BY5PR12MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cc6a09-a27b-448f-6aaa-08ddc91759da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AmezNGhNPQp/zdYmvlWvEdc9I4nju+E4jrjTzPgSGJjR/mKBp70omQ4361J2?=
 =?us-ascii?Q?buqNQrL9drsgGAcggindS2pqAbXNXhS4OKxywuPzsjm/nrFUbnpM9pKLBnqD?=
 =?us-ascii?Q?8VT8bVMOPvML51+SF1bWXpD2Z8ZI86bLYllJS+MkLOXHcLxu79rFKCBUUo6i?=
 =?us-ascii?Q?HG8+agmhGCdcaf6gqnovyw1hgUKwlaSeuenSoiSmYbkYCMMpT2/d2jt005xy?=
 =?us-ascii?Q?9Ozk9dqKThksS/g1dX5/4QTKGOOEtTzL2UiGGO1sNe6bH7hDSkxvo0u+s3I5?=
 =?us-ascii?Q?OjIXRjAYWNYcnh4be2pOFl3nc350KeUMUhaE/UMi2NuTGsANiHhZ2a56l/3+?=
 =?us-ascii?Q?iJJ1e0vooDdZoaCthNXqPgzE0dbvkbXPnk0ry6+E0o7N+aIWLzMVrvi1heOT?=
 =?us-ascii?Q?mE/ujltqAfX0xR6VAHozEHgvOnKEVuZljGl87r3TEkl2OG4bAaGvkFPA4DMH?=
 =?us-ascii?Q?eyVEEhzWNsmj18Pf1XcTx1af9NxajQhs25JhyZVnLYD638MSJVNJCE8ol6il?=
 =?us-ascii?Q?yTxMiqBnscTozxsX0QLp+FnXVbeJk45Nh3/UnivU6Dn1yPr6e5dMxBSKvKTX?=
 =?us-ascii?Q?YBuD0tF7MKkP2pdk7uWWQaQpPF8EbnvrQsHNdBO6in0FnXjpTNhyBLr0j8r1?=
 =?us-ascii?Q?2hstSsvw7UKku34OD2FZuBoVr3G0m2EXSf7tykQiRs+SuFX8RDAj4HVKE5HK?=
 =?us-ascii?Q?kXsz8ELl0t4d4eqaLN6rNjIE6lMwcQqjltXSUQtU8vjjuwXH6HG6zM2XnzGz?=
 =?us-ascii?Q?R508j46O6sSmTwDRBOwCpbu1RX4YCEEZ6MFFeJJwLgov07ChPJyUlkeJaAQx?=
 =?us-ascii?Q?pOFDxoLy6qzek0/qSss4f0bNss0jZnj8MIG5d/8fiT3evpMKgb3hgcF/Mjf8?=
 =?us-ascii?Q?5OqU5hjrSroUSZUKYYIoBZMGc7xxcL37pnfEMePSOrRf/1CDEO7UJ4y2BENJ?=
 =?us-ascii?Q?6hllj69QrXzKiPtNs35xu3QfcNocIjUZosmK7ZE529N7mg5K/ZsMrFaOMrOX?=
 =?us-ascii?Q?QV3opuOeRTt6lAjTvY6tEDUCWh3c4o0+HPJke7WhNUCv49JDE/sGhrqCJw/r?=
 =?us-ascii?Q?7ybHl2YEqFZnn5DJARUslV5uVuCWlUsr1nXpdJPRt15dxtYNAXGrvh4oHXJ5?=
 =?us-ascii?Q?x6wQhG/iTN6xwYS5XUM9dy94sTlFPzZVDAw1haLuImmLGNttwtU9VE0W7jp5?=
 =?us-ascii?Q?nKiCuPMjGv+kB0wEUVfBK9VjVFeSf++lRWruqLMn9oyqqWpSkng+MRXigQUV?=
 =?us-ascii?Q?jlRM+qTVa+7TfzDZWfHQDaEiFyBkcVLEjvK/I6rIW9+ehoMdUl7TZwbVNcJJ?=
 =?us-ascii?Q?3lslpflfcVmU97+1BmDC3EfZK8VC8BaHjtdlMGK9tLhYcjCZFg5v1p8dkXwp?=
 =?us-ascii?Q?8+1KBBshoJFfqNdMp69oTTKuaaKaTQ0dmG65fkH+VJnz8S00sy/19sgZSn5t?=
 =?us-ascii?Q?nyg5bPAwezuxd+0+Erge0AcvWGlufT/0gGoNYTFLil7Qz4l17z4fEb/VGk6u?=
 =?us-ascii?Q?68tMhs0eokj6+KSKUfXRvT3b5mZLoDdDGyB/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:28.4067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cc6a09-a27b-448f-6aaa-08ddc91759da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4162

Reduce the scope of every variable so they are reinitialised. "iommu",
for instance, isn't being cleared, so the wrong flags may make it to
domains that should not have them.

Fixes: 1d2b4f3049fd("xen/arm, doc: Add a DT property to specify...")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
This is implicitly fixed in the next patch, but I'm sending this
standalone so it can be backported where relevant.
---
 xen/common/device-tree/dom0less-build.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index ef4b095d97..676a3317cf 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -826,14 +826,14 @@ static int __init construct_domU(struct kernel_info *kinfo,
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
-    const char *dom0less_iommu;
-    bool iommu = false;
-    const struct dt_device_node *cpupool_node,
-                                *chosen = dt_find_node_by_path("/chosen");
+    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
     {
+        const char *dom0less_iommu;
+        bool iommu = false;
+        const struct dt_device_node *cpupool_node;
         struct kernel_info ki = KERNEL_INFO_INIT;
         struct xen_domctl_createdomain *d_cfg = &ki.bd.create_cfg;
         unsigned int *flags = &ki.bd.create_flags;
-- 
2.43.0


