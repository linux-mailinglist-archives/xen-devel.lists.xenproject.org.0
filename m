Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5D7A8792B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949115.1345753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERl-0000Nm-Tu; Mon, 14 Apr 2025 07:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949115.1345753; Mon, 14 Apr 2025 07:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERl-0000Ld-O4; Mon, 14 Apr 2025 07:41:37 +0000
Received: by outflank-mailman (input) for mailman id 949115;
 Mon, 14 Apr 2025 07:41:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERj-0008Gw-NE
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:35 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2413::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e242d72c-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:33 +0200 (CEST)
Received: from CH2PR10CA0016.namprd10.prod.outlook.com (2603:10b6:610:4c::26)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 07:41:30 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::6) by CH2PR10CA0016.outlook.office365.com
 (2603:10b6:610:4c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 07:41:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:29 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:27 -0500
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
X-Inumbo-ID: e242d72c-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMQMu38ef+sUX4uH3SVGRPk8KF+aIz8AL5ydZDYcRG1e63/CckF2LfKaZYnNQWa/DoD5eISD0zl1GYXlkxIsxa2zEzsvjt17mn4MUbvtSIdRvn77fDTtltA1LDayO6wthUgHDImBM3Fz22LqumwsleH9or73oG0iOlqtipvA2/m2wPE9mdeZaZQoKULn3vyaeLcvAnQm3T4TegSOS8GTeRMsmE3WN/vc/Bakt20/oVw0sPiJAVI/0oe+rsxHJH/5fB+u2qwkHmTSwGvHoSF4fPL8Qv0whiUJijx//EJVBV7982EjgsAxFRzAYqQaPKqfjdO1AWnAqqfP9IDZrdW+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLUcq/TmN6jDuYZQqVsZv1XniSM+qayZPJdduzw5/xc=;
 b=L/1bKH9x4e/9mAd7mymfkowk3W9j0dYy4S+QY4L6Xgf8u/3fbifBiPbpXGigzH9CHq2Lo7DRi5kHg+igKy4rRXb3vDbk0hdP9jJ9s4h8bcKe9tYAyHw21O/kiFIY1baJEdDXJ+w5TGH1//DnVnIpeTpawlYR78HNT/EqEoz2CQLhKO+p5TJcOwHDRvaV/BNsz84nGpQu/nNMN3F4pJuYeVhh00GJX/I8kdDsOBmPUv2nO8/qAtqZ6gEtKpwXnmsw7ycSi3LCel4afMEtgBOHO4LE7xAay9f6tpt8XxBh7YJbX6CXQCAK5H+4+wzMhjQiDJokFBZX1g+pR7zTbLFkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLUcq/TmN6jDuYZQqVsZv1XniSM+qayZPJdduzw5/xc=;
 b=WYchlDRPdNUbzNhm5f/Vv2OyCE1/A41f7UnWsaIwteExQmJ0obdS3XfTW7p1YIoKCa1yKcY0bobsa1D+pIiZJ8neXDTzzT/Xk58GiYI4p/OgrJEyfX/cI2VotAIe5RA9BVrpuIGMjPdz24y04++2lZyczADh7Fl7mdmnQENX6+o=
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
Subject: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Date: Mon, 14 Apr 2025 15:40:45 +0800
Message-ID: <20250414074056.3696888-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: aaef0c1a-0ca1-4adf-e9c3-08dd7b27c4fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uYB/yuBNk1lEBknlLnzYnz4hAIIM2Zi0BMI7AcyLIsoqi3rKvFBmzNALsdsm?=
 =?us-ascii?Q?obOzVnhBTxByzyL59ZQxroacBBLKUXI0WHAiNOBJx+DVrNGqez3xiCZbd6tA?=
 =?us-ascii?Q?hzDinkLXZPBG5VjkyOSDbZjsNPQ1RaAf75v9NW5gQ0AVbt7h9Yr6Cd0zlWWo?=
 =?us-ascii?Q?9BtdnH/42W99m+GN4VahKX0AkxOESO6U9tx6U0ODrCfsqljA+7UJlybg+vHW?=
 =?us-ascii?Q?0LMygegxrXqT7NtCHP4SoTZ2e7iYtUIoxX2hIVnJsdZS/vAQZcrEtma/6+2n?=
 =?us-ascii?Q?QfOnT5NW7L6eN9wjBj1Bciw4VYBWO4yHwNzmezdnEE9z95gYbj3n1hjds4yc?=
 =?us-ascii?Q?okyyix2q3XRpwMkWbiY3p/2lKgs6CwAnmGoniuQUUpK9rg7UvSXiyamRab0Z?=
 =?us-ascii?Q?Gr4xTpqkYP21TXp4ETcuxBQl7H7i/P1O0HG67uWToBXj4a7oQltxxV7S/g8M?=
 =?us-ascii?Q?NORd39uqIHLdz0J8WLKGAe+ERB+M948B/o/KeCbQPm9bsVOJTHT5OhFqalX5?=
 =?us-ascii?Q?QXp2YqdQNg4ADhU+/7YIZaXekcVY06We+xEhKBSPDe76hmJgd3bjRg6y75AF?=
 =?us-ascii?Q?51GLqF1DeL0AcJILY5G8q2LE/g44xVrpb0LVnqVrdfiRBvT7kPUmib6k7gyC?=
 =?us-ascii?Q?PTE5vwtt24Polt0jfsN7IvdHGPGEta6cC1chgQ4ysqsyTD+daYRObFrO7HEW?=
 =?us-ascii?Q?RWCkiybdscGMKY7I7tboyJPo5VB/pY1o/fP03WLrdmXfU4mi9m544NaFzV0U?=
 =?us-ascii?Q?u2S77/y96qtCb0pbVw8RO0KMnZTRjAFg0OHzOZ5YiMCdDrwnxlA46gy2i/xy?=
 =?us-ascii?Q?ixDHxPl8Oi5v9bqXirso+/uWkKTxITwXPQN4u3MSwngGUfiK5uQvpW6ggije?=
 =?us-ascii?Q?uK+zRmnEkw6T6m14s51zIM0cQVh4FLheoNVIJvJ4OuTqucnBf0vewZg1IyDf?=
 =?us-ascii?Q?kRFbsOLLcY99c/FezFc7osU+jL7qCr/wWQPBcr7LjBaY8A0Ov3kHOR/XZKXo?=
 =?us-ascii?Q?8IPwRy5d/NQ2TrfQg1/uCtoZMtn1xfDHrprpFHywgTy3paxPAU4MkGbGIGWq?=
 =?us-ascii?Q?MHRKWp1j5lvTwUmCVszCQ8GERqHL+hrKD43sxvWRC/9uePqSMHRLLEkBlsSs?=
 =?us-ascii?Q?JODYM3fVbgtcVbXDsFtsN5bduV43njYs7JYVsVG/tteVayf/jfF1Hglhw7J6?=
 =?us-ascii?Q?Yo23bevWCp+3Ai9hj0XTTqvo0scTHMpLVnjOGtb6Op5xwXBrH4wEi//G6ULC?=
 =?us-ascii?Q?GdV9K0r5VqVxKzDv5a04pZH8FYHoI1rJK/pySnAayvueazT8KAH6OJYWz4lP?=
 =?us-ascii?Q?a9WrxATRn1+o3BvE7rkQL1dW8u2RllqjwrGRgKdCpQrOQOUJH+u826x+sQz+?=
 =?us-ascii?Q?DuaBlLY8j99aqeCdIqxXe4eQZ9w3t6FsMPROKodEFfAhbRdKss8NwadwX3l2?=
 =?us-ascii?Q?mKrpQkKrwh5ztX6loYDbBmRs4doSXsrlALO5niDEiPap2cjg66uJMoVVnU/6?=
 =?us-ascii?Q?bIgcLXOn6khEr/T97J4r0Uzb/9OTuTQWYVj6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:29.4638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaef0c1a-0ca1-4adf-e9c3-08dd7b27c4fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955

A helper function handle_cpufreq_cmdline() is introduced to tidy different
handling pathes.
We also add a new helper cpufreq_opts_contain() to ignore and warn user
redundant setting, like "cpufreq=hwp;hwp;xen"

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
v3 -> v4:
- add one single helper to do the tidy work
- ignore and warn user redundant setting
---
 xen/drivers/cpufreq/cpufreq.c | 53 +++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index e01acc0c2d..79c6444116 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -71,6 +71,49 @@ unsigned int __initdata cpufreq_xen_cnt = 1;
 
 static int __init cpufreq_cmdline_parse(const char *s, const char *e);
 
+static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
+{
+    unsigned int count = cpufreq_xen_cnt;
+
+    while ( count )
+    {
+        if ( cpufreq_xen_opts[--count] == option )
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
+    {
+        const char *cpufreq_opts_str[] = { "CPUFREQ_xen", "CPUFREQ_hwp" };
+
+        printk(XENLOG_WARNING
+               "Duplicate cpufreq driver option: %s",
+               cpufreq_opts_str[option - 1]);
+        return 0;
+    }
+
+    cpufreq_controller = FREQCTL_xen;
+    cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
+    switch ( option )
+    {
+    case CPUFREQ_hwp:
+    case CPUFREQ_xen:
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+        break;
+    default:
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
@@ -114,20 +157,14 @@ static int __init cf_check setup_cpufreq_option(const char *str)
 
         if ( choice > 0 || !cmdline_strcmp(str, "xen") )
         {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
-            ret = 0;
+            ret = handle_cpufreq_cmdline(CPUFREQ_xen);
             if ( arg[0] && arg[1] )
                 ret = cpufreq_cmdline_parse(arg + 1, end);
         }
         else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
                   !cmdline_strcmp(str, "hwp") )
         {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
-            ret = 0;
+            ret = handle_cpufreq_cmdline(CPUFREQ_hwp);
             if ( arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
-- 
2.34.1


