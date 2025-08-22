Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E0DB315D1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089855.1447358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPOA-0000ft-G3; Fri, 22 Aug 2025 10:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089855.1447358; Fri, 22 Aug 2025 10:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPOA-0000e0-B3; Fri, 22 Aug 2025 10:52:54 +0000
Received: by outflank-mailman (input) for mailman id 1089855;
 Fri, 22 Aug 2025 10:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPO8-00083s-Fn
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:52:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:200a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b228d7-7f46-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 12:52:50 +0200 (CEST)
Received: from BN0PR07CA0022.namprd07.prod.outlook.com (2603:10b6:408:141::14)
 by BN5PR12MB9510.namprd12.prod.outlook.com (2603:10b6:408:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 10:52:46 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::ae) by BN0PR07CA0022.outlook.office365.com
 (2603:10b6:408:141::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.18 via Frontend Transport; Fri,
 22 Aug 2025 10:52:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:44 -0500
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
X-Inumbo-ID: 25b228d7-7f46-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLCkSb2lujBBME2a0xHV/vMaovh0k496xZQGdS4Jy1kwbkqrL0T/KndqpjQm8EKnQZKTw4qonw1rdIa09W7le+G5O40OgsnBUuflFlgihp+zoBlN5baci4lWFkv4pBA9tBybjiPr/W7JD6fGsODE8fual3yYksg4E+zJGMHtH/goeSmpsMvCdhbBJmnvKxSVljyTZLbegT/9v+SyhERmT8ZpXWqMcfPiPgihoW33PZZs9lZOC/wx3GSKYLgXEWNCCqy6L1/smUY1UgxJp+d0xZNrYMTU5lS5WvnQGEP3SOy/TPPqLM6XJXjMiFQJP3+znkuM4RNabVKXgFbh/8Wkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2XK2lTZ2SBex3RziRQL8HeksHeSo3yOclpXyhaZDEU=;
 b=x08bx9z73OwhAwkmYu4CE5j9CZPX+SRU5bN/Q4WYoRCEiqWW28HEmrfo9pGaB9Fq0Ztuz7qMpfDvY3SyBvb0BXvVga/xUxW9wOiUhnnWiZ5PP2DUdJ8X4LrlNTc7EtLLVA39s9V8BK2tP58xFs+gmCgFVH4ij5+JWUqYzk2uMrBIbCnBO3D0wtSAZj182HMLMhVhSdpZYOcyUCbn12V0hdrHpwORF9iIK5eA9CUjeWigY6XaxMqWsgndlnyLbtZqw/aHj2wH+3mQ6J4zLmf2l4N9TSjdWLJvIzv6arombk9vxTIBKzBlRsZzUBTdzN+F/24lN0/o4QIvUE8TpS2RmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2XK2lTZ2SBex3RziRQL8HeksHeSo3yOclpXyhaZDEU=;
 b=HU+yZi8klrOUFy9TmiJMhvX+tX1U0WgisgcJMdDg9ZRdbOOh4kgh9IKGLIbfaTIbLfDXOu0EIVYfRAzOIn03LXOMcUpJLlcJYD8QRLK7tU2SnzYA04YD8xd67JyycVHi5yRpJ0h7fHpX/pnOQZJ6AqXjz9kK0C2OxATW/kIC+/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v7 05/13] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Date: Fri, 22 Aug 2025 18:52:10 +0800
Message-ID: <20250822105218.3601273-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822105218.3601273-1-Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|BN5PR12MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: dd32c5e6-0779-4709-5739-08dde16a0773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mQu4Z371crSqK/+0ZkgpBKGVTX2tkTzqkNwoQoWurI4pDC9JOCnzizvNSz78?=
 =?us-ascii?Q?bXI18/+onbRKTBiPghdVlfu41CgYu56jTv5M9B6lnCjKTn66w/DrI0uYVRGX?=
 =?us-ascii?Q?jzQXvA0COd5ijFmScaa7HfKEKXToKR0bdy+LIzjXOXHlkpSPZJmX69ie37QW?=
 =?us-ascii?Q?n8i/MjrOkiy5KV/pdFp/6bTqsziCvIxeHrlrsMl0wz7GPJJ7T6rPYuNTtn9q?=
 =?us-ascii?Q?GQNNx525+lAqQ901vB0wjdPw2Nc02KPQitSQK4p1Nyc7gwabJ+6lCKdRk3/D?=
 =?us-ascii?Q?xMFkdpnhG/0dYeKMre30mqVrTFOnZCwqUX+jZaeHBCMlvJIgJVd7f8NBRxTb?=
 =?us-ascii?Q?dWmHbKynJIaSWd368IzzENpYTcmgwPYeMwE1ST9IzFVa/kyamP6pqaXOCwpe?=
 =?us-ascii?Q?Fhtk1u6C93T4XnsxxZgwJ9dKn+C5Gpe2jc7Tzlrl3MFnKhEG+BAjVLEsbHbH?=
 =?us-ascii?Q?vTLgTgskZj2XGjeJurfjZant8oyexB7CbJ5sQouiskzUZ1Uvrabw/7GCQNlj?=
 =?us-ascii?Q?QDh03SvS9+WJoH4CKWLAGlrpkYv85qWqbiqA9EjKbnVgpsPniYjNzMkxdk4B?=
 =?us-ascii?Q?YCT2O4e0OwmbBzR6GdBLrUh1LTpXDXzRNdYTKIPYIKxVkiNhLkvklCdEtB4P?=
 =?us-ascii?Q?V28clFX8/IWkIPCm3WYDsX/EuQBim4L8Z1LiXFhA7S1VevsJmFzzV5AvZuqG?=
 =?us-ascii?Q?AIseUNoIaePlbFRwb2rbyhzr41MnRk4hppFkunnG4T+wU4mJnkCqbcMxvomD?=
 =?us-ascii?Q?4OUgvHb0tVXefK5xAsf/u6P+Lwrd/oC+7BX79woumbxH74fQBbOJvhyz7fUF?=
 =?us-ascii?Q?CalCtiIAjQW+mP1M/dd0hTVEndz94K9j+Nz1wY9khIxzrqNTShrtM9xaAS0I?=
 =?us-ascii?Q?nyiSTmKXEYvPRxPsVjagP+h0hxxL6+bCKMR9/VmtBvZNmrvpefC/Fch/L29V?=
 =?us-ascii?Q?M8QYhjzXgjdALD3an3ccqrgbf9jrcCqxikQWlkUDjTtZvTQgQuV6tVKbLuY6?=
 =?us-ascii?Q?HnEfGB2rxJdeFQZQCedF+EqttkFeVcHZkWDr1+9Xssillz3mWrfNRQorqIaA?=
 =?us-ascii?Q?wVzCYnv8JpsKHVXImi60n4wMWSct8Hv75TQdOf6z6zK1HoNLvlTIh73MNJVt?=
 =?us-ascii?Q?EcAOdScUyltQDPTG22Qff4KrEWKci8FtbDR0bGpWC2LjO4ze0c1Zg9796Sei?=
 =?us-ascii?Q?xi3+ro4N4ffJFFmtBIVBLC/fzW022fM2EX5i7goJsAJac9oO82jMIPAMZFv6?=
 =?us-ascii?Q?Khgz/RyDyLZec2Pc83I3S815fbmQSVp9Tp3Ry3RcdQSLNk6lg7iPM9VbEH4u?=
 =?us-ascii?Q?is24ulsHjhGF3ksAwrhuszMAjEDUHJ8cPTlYEkd3BZb5oq7Q14ySy5WXhXXY?=
 =?us-ascii?Q?mAUyIW5WRTIQeuBzWx6BwnObUdctiOJl7gHJ5ePPMjb/+IJWAYu2kg0I3grv?=
 =?us-ascii?Q?CQ5wvNORy2cUqTScutQROs565kNO+1oEK0Ha6Gc711774GVKgKsx88JkP6Bh?=
 =?us-ascii?Q?PGD/A+id/H4lqhHPWIS2DEGb2bBegIte1O/9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:46.3841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd32c5e6-0779-4709-5739-08dde16a0773
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9510

A helper function handle_cpufreq_cmdline() is introduced to tidy different
handling pathes.
We also add a new helper cpufreq_opts_contain() to ignore redundant setting,
like "cpufreq=hwp;hwp;xen"
As only slot 0 of cpufreq_xen_opts[] needs explicit initializing with
non-zero CPUFREQ_xen, dropping full array initializer could avoid touching
initializer every time it grows

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
v3 -> v4:
- add one single helper to do the tidy work
- ignore and warn user redundant setting
---
v4 -> v5:
- make "cpufreq_opts_str" static and the string literals end up in
  .init.rodata.
- use "CPUFREQ_xxx" as array slot index
- blank line between non-fall-through case blocks
---
v5 -> v6:
- change to "while ( count-- )"
- remove unnecessary warning
- add an assertion to ensure not overruning the array
- add ASSERT_UNREACHABLE()
- check ret of handle_cpufreq_cmdline() and error out
---
v6 -> v7:
- remove overrun assertion as we already have check in setup_cpufreq_option()
- drop full array initializer
---
 xen/drivers/cpufreq/cpufreq.c | 55 +++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index efba141418..de17e53708 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -64,12 +64,49 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 /* set xen as default cpufreq */
 enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
 
-enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
-                                                        CPUFREQ_none };
+enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen };
 unsigned int __initdata cpufreq_xen_cnt = 1;
 
 static int __init cpufreq_cmdline_parse(const char *s, const char *e);
 
+static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
+{
+    unsigned int count = cpufreq_xen_cnt;
+
+    while ( count-- )
+    {
+        if ( cpufreq_xen_opts[count] == option )
+            return true;
+    }
+
+    return false;
+}
+
+static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
+{
+    int ret = 0;
+
+    if ( cpufreq_opts_contain(option) )
+        return 0;
+
+    cpufreq_controller = FREQCTL_xen;
+    cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
+    switch ( option )
+    {
+    case CPUFREQ_hwp:
+    case CPUFREQ_xen:
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        ret = -EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
 static int __init cf_check setup_cpufreq_option(const char *str)
 {
     const char *arg = strpbrk(str, ",:;");
@@ -113,21 +150,15 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 
         if ( choice > 0 || !cmdline_strcmp(str, "xen") )
         {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
-            ret = 0;
-            if ( arg[0] && arg[1] )
+            ret = handle_cpufreq_cmdline(CPUFREQ_xen);
+            if ( !ret && arg[0] && arg[1] )
                 ret = cpufreq_cmdline_parse(arg + 1, end);
         }
         else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
                   !cmdline_strcmp(str, "hwp") )
         {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
-            ret = 0;
-            if ( arg[0] && arg[1] )
+            ret = handle_cpufreq_cmdline(CPUFREQ_hwp);
+            if ( !ret && arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
         else
-- 
2.34.1


