Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B9A5451F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903105.1311058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mQ-0003Xe-JS; Thu, 06 Mar 2025 08:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903105.1311058; Thu, 06 Mar 2025 08:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mQ-0003VN-Fz; Thu, 06 Mar 2025 08:40:34 +0000
Received: by outflank-mailman (input) for mailman id 903105;
 Thu, 06 Mar 2025 08:40:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mP-00031D-6E
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2415::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a913d509-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:31 +0100 (CET)
Received: from CH0PR03CA0311.namprd03.prod.outlook.com (2603:10b6:610:118::13)
 by MW4PR12MB6999.namprd12.prod.outlook.com (2603:10b6:303:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 08:40:25 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::3a) by CH0PR03CA0311.outlook.office365.com
 (2603:10b6:610:118::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 08:40:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:22 -0600
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
X-Inumbo-ID: a913d509-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZofWO5foWIK3EclMoDdCwM7Uox5RAOsjw44e5CbCXdT7TCZtAa5r4X4s9JEMj0qXOnAZvYHWqxQhWYzXE+Ubf4XujU1Sa0XYw/MG766DxFvFb2r0Mj4k1b6Eohgvebzs/piJDcKqXR3QLDHpTgAEm/uLmELx62zA2W1WSzwRwNxaxswvJ33jew/NwEpLXdbb8728Q5WYKkxKPoqi/QS/sDdk28ciiv2QZ/SMZN6mgxt3pivI3qvXK4dkMCXJYiXdlojMmkxc7xelE0Xvqx25Ko4Rc6DcrqkS6f96Tto0tVPtApuFoeUBuOedupOBoY/Zccfy5t+TtwFtj7+D1Qisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vUJg5LMMwbE6dMplBw9JQaR2FVtiWTtgPAfxAZ/n6U=;
 b=zDa7V0qbyz5WzVEGTBO/WjJwiQU9oTZMsf6FmFhU7sSOMhZDOzN2+Q/g5Rjhbus5vFBLb9eBLgH+Sl3SY2Vc0w/jwC+5v8UquBcYmVEjmSZ8Te5LfdCb7ya1M/UyAVTHpno/n7TeuKxLOv/SqwqHp7zRHVSBkYLpKBFwKF4imEued1EOyw368YOKc6v483OWN+TerWVSuWy/2T94ELBtKmdu/qxKB9OpeajZJC8dTe5pakNfCcE+eWm/gI1XdUGiNHfhF/TDBogOV8yfW9mC3bRIB/sVRugV+IevPHtR+NBy3WXqXPCnL5hZ4QlY7jm0DK+cB25lZxEN4bVhRe0Fkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vUJg5LMMwbE6dMplBw9JQaR2FVtiWTtgPAfxAZ/n6U=;
 b=uAWgqIFqaXDOq9HZVTWB2zRIItWkIa1urvjVR+mKXEe8GjAJ+qHVTS6w4NhjWIO21jMWyH8FS/g3RgXG51zuMTMKPz0Se1qipzUwwBYQrVJli+cpxZMyheJOMdLYgn0xOyhVUUUHZLbXDkEcoFZd1+zelOnglTjwQ2zKIOvkBlo=
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
Subject: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Date: Thu, 6 Mar 2025 16:39:37 +0800
Message-ID: <20250306083949.1503385-4-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|MW4PR12MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 42630372-63f1-4844-a246-08dd5c8a8a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Rj0tAHpUl9vJhmd+cx884nR002r/XSIIEAKqlr/ZGjp6gjvb70nO0EiMZwF?=
 =?us-ascii?Q?8EfuGRAWg7YpGGL7Uz5cLOOfH0u2YJ4Oxtu4Bl4iviH1cnFrCx5DCzwcPzLQ?=
 =?us-ascii?Q?ubYkEhA4lsrdMNVSA/lUTpOPwuXCr04lDLFTCv5SkXcGO7O0XxMSALWcAemG?=
 =?us-ascii?Q?yeFyQcbXL15no7I8/H74oRKxyvR1R9kC1eMABhLBWKfoSHeTbdnFXB/I8tgP?=
 =?us-ascii?Q?IT5taeNZx7pw1g/n+GsKYy5zEUQgwO3ZndVIcNsU6KA0Td+rGRvbhO7T2Wg7?=
 =?us-ascii?Q?mU4meolK2vPnI37aMZc3FJyLVIaNvJ7vJ8BuChPLqwff4rAGjZejFlPVZ3Y3?=
 =?us-ascii?Q?/Lz/PB7YXFZ/MrHMvv+yiVT9jUz8P7wRXUCphOsLnpE0zI879XO5OnAe/JHz?=
 =?us-ascii?Q?el72Y13FElhsNBtYJ/t3ki6FwtkyUzuEXzWrmqLG1mM3J0sbG8NWMN90SUpx?=
 =?us-ascii?Q?9+UdjaYp1S+qPOTGSTDL3cPSYxqFzcp3cOBKgNATyrkdeMvA5Zb3vuhJtKET?=
 =?us-ascii?Q?TthKj161A4bRM9iwv02Lr7SKOha/MIKYJfI7T4/Jx7XHxIVwC2fuV/j+jsaq?=
 =?us-ascii?Q?soyI2xbZOqVn8KH7/OfuMe4BYC5WPIFJn6gLGeoYZC91Mn5ZbKBQZslAg4tU?=
 =?us-ascii?Q?zxlGzjSe+kxerKZzAQtsWW/i8mLQ4osjJI0vhzoHRNkwMLKYt3cbbjMbVeOo?=
 =?us-ascii?Q?hwkN8ndS6F9uorOZjCuS9/l9rMaWDiPsG7aIeQ9qlaGnWLaD1zGjGD0oTMuE?=
 =?us-ascii?Q?dk7J7g0LN3g56OB0aJeghI+0nMqBcjmWdSeAyBTD6ck0Ksn0Q9huf0Yq6iEO?=
 =?us-ascii?Q?SyS1axiBbGKjHuWT2NUA8Td6OK/BitbRwE0hKFFKDVxu6Ip5RIRO/Ga8U2aL?=
 =?us-ascii?Q?qR4AK87ekwjrlvXWe1qdEzLNRWko+5+r8ffRfpTyjcBHL/PFq+Tptidb8Abr?=
 =?us-ascii?Q?WHY/3n9JCc+wiza7KEGAIZlzb0C2Yl775VeyXvRYX+Rk/hfnH0gkBgWNihvB?=
 =?us-ascii?Q?jfEtGg8em4L07ZxmKqYs6B5z6FEv63w3Ain3aOADyqH1uWqm1rsBXQZqYlNC?=
 =?us-ascii?Q?q0qfXdjxiQ91Sf9PHO+q0j4W6Wv7E0LCKJsdkxKB+dukQ+Q3j2g/FjwhsKMO?=
 =?us-ascii?Q?nT/cc4Di4O+r/lh0r9dpahkaRW8SSKrb3uFxlfFSigF0PQEfE4rv4bElCugA?=
 =?us-ascii?Q?kLNGxs0LD3NnK7odBKDgEzM74m6kT6KHCLDTCb/vsKI0eaDAIBfhdh5+m8kR?=
 =?us-ascii?Q?UwCAV2pETqcrPmOI0YaxcDZ0EdMTR6U5obeq5Bovd3fDDWskV1cnw5GoUBRe?=
 =?us-ascii?Q?Lxqlhj9/kzy1L3TAIBhHtMTEYPbCSflfhB6Z+oU5QISxBajs7ScpKqhVKbpk?=
 =?us-ascii?Q?K1eBjB5Uv5KaGBmxmTFNaRFYpPXgJ8cVDrEVRMX8R+MzM50HtyY5VasGEvPM?=
 =?us-ascii?Q?+dt1yVOX60mo7n9wxc85BcYl01TMK4pfElk171tzuY/miqr4O7W/4H21hTUP?=
 =?us-ascii?Q?AkggKjLwWtEE9pA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:25.1807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42630372-63f1-4844-a246-08dd5c8a8a55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6999

This commit includes the following modification:
- Introduce helper function cpufreq_cmdline_parse_xen and
cpufreq_cmdline_parse_hwp to tidy the different parsing path
- Add helper cpufreq_opts_contain to ignore user redundant setting,
like "cpufreq=hwp;hwp;xen"
- Doc refinement

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 docs/misc/xen-command-line.pandoc |  3 +-
 xen/drivers/cpufreq/cpufreq.c     | 64 ++++++++++++++++++++++---------
 2 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 0c6225391d..a440042471 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -535,7 +535,8 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
   processor to autonomously force physical package components into idle state.
   The default is enabled, but the option only applies when `hwp` is enabled.
 
-There is also support for `;`-separated fallback options:
+User could use `;`-separated options to support universal options which they
+would like to try on any agnostic platform, *but* under priority order, like
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
 unavailable.  Note: The `verbose` suboption is handled globally.  Setting it
 for either the primary or fallback option applies to both irrespective of where
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 894bafebaa..cfae16c15f 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -71,6 +71,46 @@ unsigned int __initdata cpufreq_xen_cnt = 1;
 
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
+static int __init cpufreq_cmdline_parse_xen(const char *arg, const char *end)
+{
+    int ret = 0;
+
+    xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+    cpufreq_controller = FREQCTL_xen;
+    cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
+    ret = 0;
+    if ( arg[0] && arg[1] )
+        ret = cpufreq_cmdline_parse(arg + 1, end);
+
+    return ret;
+}
+
+static int __init cpufreq_cmdline_parse_hwp(const char *arg, const char *end)
+{
+    int ret = 0;
+
+    xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+    cpufreq_controller = FREQCTL_xen;
+    cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
+    if ( arg[0] && arg[1] )
+        ret = hwp_cmdline_parse(arg + 1, end);
+
+    return ret;
+}
+
 static int __init cf_check setup_cpufreq_option(const char *str)
 {
     const char *arg = strpbrk(str, ",:;");
@@ -112,25 +152,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
         if ( cpufreq_xen_cnt == ARRAY_SIZE(cpufreq_xen_opts) )
             return -E2BIG;
 
-        if ( choice > 0 || !cmdline_strcmp(str, "xen") )
-        {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
-            ret = 0;
-            if ( arg[0] && arg[1] )
-                ret = cpufreq_cmdline_parse(arg + 1, end);
-        }
+        if ( (choice > 0 || !cmdline_strcmp(str, "xen")) &&
+             !cpufreq_opts_contain(CPUFREQ_xen) )
+            ret = cpufreq_cmdline_parse_xen(arg, end);
         else if ( IS_ENABLED(CONFIG_INTEL) && choice < 0 &&
-                  !cmdline_strcmp(str, "hwp") )
-        {
-            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-            cpufreq_controller = FREQCTL_xen;
-            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
-            ret = 0;
-            if ( arg[0] && arg[1] )
-                ret = hwp_cmdline_parse(arg + 1, end);
-        }
+                  !cmdline_strcmp(str, "hwp") &&
+                  !cpufreq_opts_contain(CPUFREQ_hwp) )
+            ret = cpufreq_cmdline_parse_hwp(arg, end);
         else
             ret = -EINVAL;
 
-- 
2.34.1


