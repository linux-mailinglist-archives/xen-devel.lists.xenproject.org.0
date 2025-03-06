Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F367AA5458E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903200.1311157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq72h-0003yi-Eb; Thu, 06 Mar 2025 08:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903200.1311157; Thu, 06 Mar 2025 08:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq72h-0003wk-BO; Thu, 06 Mar 2025 08:57:23 +0000
Received: by outflank-mailman (input) for mailman id 903200;
 Thu, 06 Mar 2025 08:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mj-0002me-SR
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:53 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2413::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6149447-fa66-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:40:53 +0100 (CET)
Received: from CH2PR10CA0029.namprd10.prod.outlook.com (2603:10b6:610:4c::39)
 by CH3PR12MB8258.namprd12.prod.outlook.com (2603:10b6:610:128::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 08:40:49 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::b9) by CH2PR10CA0029.outlook.office365.com
 (2603:10b6:610:4c::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 08:40:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:48 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:46 -0600
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
X-Inumbo-ID: b6149447-fa66-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LT/5xWA1Km9riaW9+IaHawkUQGc2z4uz8JUpPdP7mN742lbF/YkYCyMG3RfWYAJUiC86hRiWpjTN92LZulb67p0ncKrsXhSFpoy+8zBKliCogQYT89fI7T/KCIoh/ejQ+L3gKYibBsEyqGpJv2N66uSoXqb0bWsPXTMHsWJifwJGFjSMztwblFotBKp6XtnbQE+xjwfAF3PbI2Ffjn4ke9RQAEebJn51bpc/do+U/oDpMKDvCMNgY9FVNC6BmjEwGaAww5vdxSolu7TgxHzg6QzyvbKvvhBic+OmlAvng2/ek+xkJ7rjoIK6QKPv1s8ZkLh0uxw95thuiNSINK/D7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYDVLpHYY1dKVUItM7B0Aj/SePLS+Y9cVbRvGpBLd50=;
 b=ncxK/MzmN/KOxQNsCqLxVia15Uj8661kHnf/SNQFUywZymV8pZCOwxGF/+TeO+VIYwL1HiYB2xpt5m/GLygNfyvt1+8h7xZ5DH3U+DxzEr267lTUdC0YNL5i/z9TzxIFdw2+e76t+ZwdWVNJZrQz7FMHQTBHmv23qcYJaUNRuXtxFeEM/r08RjihAiVop6rDtib05rcur+YWEcMQFeTxkcTv519T1Spw/PkocFlowEszhfLH0mYSTrAKFoxPpYkU47a0YSUgReUWugQaouF2J5+G9QRLpEYfI5XkE532MohddjNF6SAhUSlKrpon4TzqEZ33milBlHq7+xlWvgjGQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYDVLpHYY1dKVUItM7B0Aj/SePLS+Y9cVbRvGpBLd50=;
 b=vqvyEa+hHk4ITREVwMOJ8bfU64r1h8uoRjhUOyALRguUuDGXDZlbpClmIWJ6qnzAXoMmk7HQGBKty+PJaIwKT7gmc7/aG5Fn9tbfjIqTGrP6acRLwGjHs1B8XZjLBT3UFMn3nJerOzLRKy1AoLsgr+N8Z14yCpvOtzryAa85i88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <penny.zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3 13/15] tools/xenpm: Print CPPC parameters for amd-cppc driver
Date: Thu, 6 Mar 2025 16:39:47 +0800
Message-ID: <20250306083949.1503385-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CH3PR12MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7c550a-b964-4bea-3885-08dd5c8a980a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?heEp8E86HtctDSoWBoDtaEiaBoyYlw+cUsESGOcihFBuk7N1BxeaklWGy6/G?=
 =?us-ascii?Q?W20Mm1vMdnxWxRhncQKTOpcZoPBR9qIjuYiAhIaPmorLGL4f4Kmy4ahZDyuE?=
 =?us-ascii?Q?99x3bGtECioauCcQEf/uex6/stGOpYQznaEHDvr5lnm1mY68xtLBzyUoMJcL?=
 =?us-ascii?Q?Bf+fdnCk8pM1IFATJcofayL1BQQkN7KwFXhWmnBfHHMeK03fOssBPM3BdQ/D?=
 =?us-ascii?Q?cMeU+y1RUEGg924RnND3/GJQYGBaX4SECVqZWdA7L91AnoPyNuEw9w6KmNb2?=
 =?us-ascii?Q?qRaDXjRoHH9zB3W+L/hFAagMwenOGuYCx09xTy6hREXS834j1vZmRNX5orZn?=
 =?us-ascii?Q?HHDvL283iT7sZ+B7/m88cAsNmqdq6OmYaTrHMO5ICylrLN1ahhGoCIKKGT7X?=
 =?us-ascii?Q?OOc9Vc96UKPYM8VyMnc9l6jewv37bK9qGPPHkyd/Vi4ANZzjhSycZ2M5rAow?=
 =?us-ascii?Q?tVq5f0sizKXR2I3tv0DZJU3ZxXuDFDRNzqULiXEvqhH60wkSycQpBICW4zgs?=
 =?us-ascii?Q?ieJhWo3Dk/Em/KYhAJzYu6+HVYtVvmS/0xnyzYNAwbpOjgTx7Gu6t2UsnDf5?=
 =?us-ascii?Q?Zqd7BRU2Oujxeq7b1EBFF+/qRvJClTGbWRRmJ3Xdj3vCyEdj8jSt5AzrT5Gw?=
 =?us-ascii?Q?HPdgIxJ3FGlv5Y7a6AJzgAUQgrhB0cRlIBdPLJGBJi94xqiBBkQb1VX7gE5/?=
 =?us-ascii?Q?7f/bv1AMfblhohnaKtyegOBiw3EL8O0W4URCBn65jiZSX0c3eyTSbAwdf0lN?=
 =?us-ascii?Q?eiVSOjhPRGbunJBbUNkOOiBcxeBt9AzSfFE1G7+XW17Y/duEZrtzNtYvRp/g?=
 =?us-ascii?Q?sGvtk8Xgn8MTFRdNvTTN9X6yvTtENOBezOMeWJ2t1KYYuio6RyKSLzFN2Y1O?=
 =?us-ascii?Q?Rwipb7WiaDJ86H5YJ6Twk0xdq+Bcw1KPd5hhOy84QWcwKw0ungSZD2VUWuKD?=
 =?us-ascii?Q?DDS2T/Rvr6nr59qeFBA4vFCiH5fYZu8YUZXpPg9N+Lo72ed5L73oBDBPWQPJ?=
 =?us-ascii?Q?Z0jjsc5wO8HPMmcdxi6lIFslIOAJugCx8zFvqgEM9MG++gy0chbeWQciEsiX?=
 =?us-ascii?Q?byKYJ2K3F4OedKiiXX7IaBo86RvZcLmWrU9PAXZl+AZLjCav4scH1+MVbuWj?=
 =?us-ascii?Q?5xEFVV/YR6k8M8z5CV760e5aQPun311osCWFABQ/9qu2jCjbgiGQddqV3pck?=
 =?us-ascii?Q?pRyAooOivEpj1JM9UthL/JfhqWuNtHU2jqx8PrtlkatAzTzeqFLWcWXqC97V?=
 =?us-ascii?Q?PdQQQVW/ByTh/DO1oZ5XoIT3AyWabdj+4LixnD1XpjWnkFLcP5ICCbQiU7Il?=
 =?us-ascii?Q?cQM/Npd5Bs3IB704H96Of/PGUmepTcHA4Ip+0UcNcIEi/vY1wBOC/vfZwfGm?=
 =?us-ascii?Q?b1Myk5VYFWw5DeiVmig/5gtwlw6UicHBB5eo7pA7atvKDdpIB82alNLSE16E?=
 =?us-ascii?Q?+4FwI4zjJPZgg1awhViFvSTjdGnNS3e0DSW7jI1k2dUXluKAONZoMRk2wFNu?=
 =?us-ascii?Q?iTdKiQ5XILFlCHg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:48.1746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7c550a-b964-4bea-3885-08dd5c8a980a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8258

From: Penny Zheng <penny.zheng@amd.com>

HWP, amd-cppc, amd-cppc-epp are all the implementation
of ACPI CPPC (Collaborative Processor Performace Control),
so we introduce cppc_mode flag to print CPPC-related para.

And HWP and amd-cppc-epp are both governor-less driver,
so we introduce hw_auto flag to bypass governor-related print.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 tools/misc/xenpm.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 336d246346..a7aeaea35e 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -790,9 +790,18 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
+    bool cppc_mode = false, hw_auto = false;
     int i;
 
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        cppc_mode = true;
+
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        hw_auto = true;
+
     printf("cpu id               : %d\n", cpuid);
 
     printf("affected_cpus        :");
@@ -800,7 +809,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if ( hwp )
+    if ( hw_auto )
         printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
                p_cpufreq->cpuinfo_min_freq,
                p_cpufreq->cpuinfo_max_freq);
@@ -812,7 +821,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( hwp )
+    if ( cppc_mode )
     {
         const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
 
@@ -838,7 +847,8 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                cppc->desired,
                cppc->desired ? "" : " hw autonomous");
     }
-    else
+
+    if ( !hw_auto )
     {
         printf("scaling_avail_gov    : %s\n",
                p_cpufreq->scaling_available_governors);
-- 
2.34.1


