Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D1A2A369
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882637.1292778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxSF-0007w3-IR; Thu, 06 Feb 2025 08:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882637.1292778; Thu, 06 Feb 2025 08:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxSF-0007sB-Ek; Thu, 06 Feb 2025 08:41:47 +0000
Received: by outflank-mailman (input) for mailman id 882637;
 Thu, 06 Feb 2025 08:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKd-0000gq-KL
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:200a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 185e2128-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:54 +0100 (CET)
Received: from BN0PR04CA0206.namprd04.prod.outlook.com (2603:10b6:408:e9::31)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 08:33:44 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:e9:cafe::e7) by BN0PR04CA0206.outlook.office365.com
 (2603:10b6:408:e9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 08:33:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:43 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:41 -0600
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
X-Inumbo-ID: 185e2128-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftnL4KHRf3JX1LWPlDGQoM1ZUrT+Uu5gzj6tO+mXUY4YXnDPWAwPgvonJhDisAgKVEOuE3iRFAzRuu6vvsJl3w4nlLKJoPJFYYXgKlaWs1uG6U/gKsxh7SpjIa3mbACYP7x/dUgtHt5o2yRyatpu/GsShJgaaB/PbjT3r3mVpg0MiNmobDSY3YQ48VKlS5KadsAH8pNTnGABq1txwFJ1n+qjCq+zvkM65hicTbnLMSjUWyBXObjIIfPRjEVy85DJhl/+YaaMSoFUTlTBV8k/bJuNxW6yETD9vTLoEt809VibFC8qXlW3V//E+Rl3y3f/4ZrK98qiPO4oopnLhZ8ViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYDVLpHYY1dKVUItM7B0Aj/SePLS+Y9cVbRvGpBLd50=;
 b=YOekTgCoTzEK7HlhLsV3ZlCsmFvXAdgJMXFfD3QGctCm4rXtufFzO9m8SLtlZvkVG4tbHxe2RXyNEwna3YK+ArePPC1wfmTaOOCNkq9FbR1h2wy3hXycUMcbAdXvMGgh0qS2iyUhbcTNkgFqqHyaea+BiWbtzALOdJqYDUDLC81Myl75pQ7cBO22KnZNdP/OpAoaiTaen4MJqIxvWtHrNWzeFp2zL9C50LuZA+AMBvzD9yXAmJM/NQP/bUFKqRApAjBp0C9mIwCjDy3yYEJxuqBH1pkZTuhRiCL/6u4a+AIRqbJCAIiQOFPVYwRzbWLNE32Bs2xGTTMRMD82LQdG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYDVLpHYY1dKVUItM7B0Aj/SePLS+Y9cVbRvGpBLd50=;
 b=pc8LpcqMlSP2MDsb/NFXDbOFLRk2hJAegV3ZzivaTsN4OcoGKS5YpWCGVcBnDku41qWLMblVUWrO720J69+4Z6dD1XLtz9yXtwCxTPdaM3VTC9sCFsDqKLr5Te9xcOzunz5G+aTWIUcQQCRavr7dz67eB8mfX6gxzO5CPWZXJVs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<penny.zheng@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Penny
 Zheng" <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 10/11] tools/xenpm: Print CPPC parameters for amd-cppc driver
Date: Thu, 6 Feb 2025 16:32:54 +0800
Message-ID: <20250206083255.1296363-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: f5835a08-4070-4871-cd88-08dd4688f76a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FA5GLDkXoMz3nrEuYbmR0joZwEVXgrxyu6YrR58pMfpNhv/ern2j6FlfyDzB?=
 =?us-ascii?Q?/DXBWCdrMRGuDkhMDF810xgvrsMtqHQ6OaLTW7MyqUOcyX4DwwcChb07+okp?=
 =?us-ascii?Q?HI5tKlxwwCRer5q+PD8U41f3gplhL26/kxqF53CU+u+ZAQpWwi8oVP+v59l9?=
 =?us-ascii?Q?iSsM0ZSANiqT7LQ69IYSSe2eOspjPuAc7r+GLSz4z2jVJLnW7WZr12QjgNYA?=
 =?us-ascii?Q?2+UK6H32DNKs/zA3FPeg1Ynwt/mY/ACHZ8LEvjdDbHBsEGrqbNOEpqfMo4/B?=
 =?us-ascii?Q?sdCW0jr7x5ZmH/eto/3ZYhoJVVpN9FF3X7ub2E83g+cZTaMpbYoQIlNARP+3?=
 =?us-ascii?Q?fv/xV2Jy4NIMsemXSBUg+rrm+3jPISFlaN8PBM3557rOUZceZAAtq/gVpkwi?=
 =?us-ascii?Q?ey5keCl25x5ikX+fZlFQy2bPFHh3Bmhq7NQeYLqgrvW1fEsEYK/QY4nGpolX?=
 =?us-ascii?Q?xRrfzrjhaOQLMQCLq9w+GRoyFZDn8WH5I58LocIY5tG/2Q4sWQvtYoiGFcBV?=
 =?us-ascii?Q?0bCGhRS7ZquAsaD5poDTLqVIQLxSQg3arRm4v0PJrbZV1JkDomYfBE0oSliB?=
 =?us-ascii?Q?ub0iYQ0tgT1hX8J5NbFqlI5NeLJwXKNSINGvgL6Zo/UFYBgm6+FUzKHOCnOG?=
 =?us-ascii?Q?vLLSOqBE5q5l8580POgqEtBTSg3/kP/uemsscCud7prNWeglinoS7vf0pHgf?=
 =?us-ascii?Q?JwdfLFTsvI2t3F1E+YG9rJIdY6aCN37C0zF+ye/OpVY8Xbh6F1cpxQPwMZdV?=
 =?us-ascii?Q?raqHhjK4G1AT3DxfcFgV8bMu5qGe6FPoXTjJZaJ3m8d3Suo6wynpymZhLD/p?=
 =?us-ascii?Q?WMUF1B4I/ZoTKTmsV/vuJwDzHqyiuZIjdGa+6V4BX1OynmUmzi1vmHQCIUVf?=
 =?us-ascii?Q?FDziJIYJ8SR8kapvdJihFW80LjZ0TSaaylf7RT0eEeXUNaWir5TKLV949IFS?=
 =?us-ascii?Q?YMQBngDQyAhloJDy7ze3+b8vKmPxQdwN1xpsiQUQb3ZJUZhhA2d+U1i1GlMR?=
 =?us-ascii?Q?LKxWK2c6Q70TY2fXDrm7/7+IAPyMRp6IN8BbF7BnQHkgF1C7KFrJYLdgicsf?=
 =?us-ascii?Q?XSz8YWpU5riNwwYl5QDYmHBZ3cEBij53FLN9iWWKWHog4f6/V2PCtqX28rQR?=
 =?us-ascii?Q?RM1yZ+PabAn84yxBOpORFQWCoO91Q7lGBXzv0MZVke52TbyRmuIZm6dAGSBO?=
 =?us-ascii?Q?dAeyWSswuoZ3yzzVSnQvmoIixrV/dffWyYM4N5joFvqSiO/TK0wqjOlKimCc?=
 =?us-ascii?Q?GGQt1j84sB+1+FUe3NKMKYHfEwtEEqhFdcrPXzOFld1Oj50zIc8Q7z0DDIdi?=
 =?us-ascii?Q?pBmuxLdRsljOugCQbp8kMajxyiwjNMIXtvY5dgvLfFilrXkzbTO+YceNjx6S?=
 =?us-ascii?Q?sLlA9sG/2YPe91nWS9zHVBc78rOqWr0CC8DK4u2gOqeT9nnnPbmsdSezDcXg?=
 =?us-ascii?Q?IOD9WFH1jejmpuzyRYVDAU20TQwZ0/uPWXNU1rw1SLFf0BOJkJP+VRTazysF?=
 =?us-ascii?Q?QklQMXztNQwZiCc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:43.6321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5835a08-4070-4871-cd88-08dd4688f76a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315

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


