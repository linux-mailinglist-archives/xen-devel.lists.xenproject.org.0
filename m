Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3163EA2A338
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882563.1292728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKP-0002QY-0O; Thu, 06 Feb 2025 08:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882563.1292728; Thu, 06 Feb 2025 08:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKO-0002L1-Pk; Thu, 06 Feb 2025 08:33:40 +0000
Received: by outflank-mailman (input) for mailman id 882563;
 Thu, 06 Feb 2025 08:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKN-0000gq-Ag
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2413::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f66cd4c-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:37 +0100 (CET)
Received: from BL1PR13CA0384.namprd13.prod.outlook.com (2603:10b6:208:2c0::29)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 08:33:33 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::6b) by BL1PR13CA0384.outlook.office365.com
 (2603:10b6:208:2c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.5 via Frontend Transport; Thu, 6
 Feb 2025 08:33:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:30 -0600
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
X-Inumbo-ID: 0f66cd4c-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEUvd/ezxKK8H31HLK0Ad+XXwvpErFIs2sPXPXt7Z5aujikeeAz1qlo0/nKgR60n+qIt8HfX7zBDW/MGPDF1XDvYf4IR2ERC/X0iqXqSS4ESQWmBdJGQTH5u6kjeBjHCDMdfojQZj1+Dm6FVw3K3S86E0ENt6LQMWLupgtqRgBokiwDhP7q5j4UrqjpPHX3sgzA7PZUGSAXXVa50gE0NqbsUtPgdUvlNULYy6Qa9DKhk9G2N8ERFv+rhtAglNcj1LFBfGsjo5tKIvxVCD1sYm2xF0p8xn2nVQmf2sZtEomkeS0GFEF01Og2dzZDQG9RVZi8u3gbwgf6jW8K84e0Q/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Hz1GEYLJa7vPQedcCPO8eM34ofnu1/QtlZnDuyk9HI=;
 b=JLNA201OofxvzS0fSSr7CT4gCXPIHAx/d/nWmAhFRLbWZ13ZSFarsrEO2Wsv+t3XFeTINnvTIijQumbfXSopY1Yx4pGW9wUNkdXZ8RyU2V5dsuZRm6u/p3ZBskZ0+tCQDhlmK2HAAHqcEkzAYAeqlb2W2DgiaQ7/6krcA0JqA2fV8Qu3QAB54PX9R9qTXfqKk80lhrotactXxjfGZqE7YNZt9Tdi3KK9Mn9uRSQocBWa+E30X+R1RI2zKNEeY+SdjF1kI5TmX3Bbs75a5GbFBrZDsZPw6+7xezJu0yhHrJ5TfVhZ5DNIGGpf9a2GKvyw2kyfTc9pMmAWJ4moIsHHQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Hz1GEYLJa7vPQedcCPO8eM34ofnu1/QtlZnDuyk9HI=;
 b=2R3xhx80JAcgD3/6wSQTp0Zjsh5YvhAB23n0WdBuWLP/vlm6aPU6ZYPI5nR08mrAqcNc38B9e7z1VbgzXwrnLD8pdsU9ck2C1ZHkURhYd56HqgOH5CiPILqe+PA8L3b2mOCEbHECWTNdz2x31YHT0m+x+E/AuaY8IXuwS+dJfHE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<penny.zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Penny Zheng
	<Penny.Zheng@amd.com>
Subject: [PATCH v2 06/11] xen/cpufreq: only set gov NULL when cpufreq_driver.setpolicy is NULL
Date: Thu, 6 Feb 2025 16:32:50 +0800
Message-ID: <20250206083255.1296363-7-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d80e51-d403-4a52-17c6-08dd4688f10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LcrjpeVUeOocP0gW2jXnvCYLPQnr3cCSRZCWukFmYRBoPh+b8+h6ZXJRYKvn?=
 =?us-ascii?Q?oLLLSv5TBh/jJ5TOQaZ5mBazMiLFX3zRRGoGGvEsL/uTjXntiAjB6aIY9V/s?=
 =?us-ascii?Q?n1/LMH59EmGAkItSvyB14czQRYE0Va/FLAU+3AaI/4u2kPshybcQclsK02Wr?=
 =?us-ascii?Q?c/kmTvoBgv5zJVnzCv4ZzC2j3e+37XFHYY3OhESf9J8+Gcec51rfjVfhO+RW?=
 =?us-ascii?Q?Y1hXTAuuqBadCwaESDZ1gzOM/EhlHUU+sf0Gq4g3seBUZHTulOXBuaqgDarp?=
 =?us-ascii?Q?HhyWEpexWUghGP1gLonTjElit0nXkCOJHUzNOBtEGC2HAeyY/WBZrjNhrih7?=
 =?us-ascii?Q?YTR9Fox1TDkInI8uImVMdz/qaVsJv+k5qIgsiZNAS2Pm2mAxMzEMAdk5L3ys?=
 =?us-ascii?Q?3ou1sOauXSyQRXrVfnxCXLiWD+EgcuVYSWo0t8VjINE6IB4ZsftKvfLxFl4D?=
 =?us-ascii?Q?31AH8njfnYrgMGCvm2dYAeQTPdOF4QV7bzY4mJR8YEUAYg9E9PP9oY+TZ9vZ?=
 =?us-ascii?Q?kqHnYQmfguEJRlJk+hZw099aUOlrxXPBvuaAZawWAgr71Sb3g5729BXJs3yr?=
 =?us-ascii?Q?2Hb50sTMZCYutBULQkRZIjCLkYNsh8Zilnfi4pwaaKHe/qc27slIfSqgkD5u?=
 =?us-ascii?Q?QOe1GRXXuxvkK7+rtJtecUGUZ0I6uEVgsG3IIjBA55HeOhFdUxRyA8bI2+s+?=
 =?us-ascii?Q?0+OWKkSw4+S8k290/F27iuHeWJn7KXOd+JqFWk8MZ/Gym1LYSry/oRKOUE8X?=
 =?us-ascii?Q?ItqUThiDnpqIemGVg+O+94ACJikREjGLryvbUHPnL3OZcah5wW75+K3Xymc+?=
 =?us-ascii?Q?F4ICSTocTagc+3SlAUcQpljyVdyiTYOF0GQjFSddn0oDUw0qer1LeXB3uE9g?=
 =?us-ascii?Q?Jnm254O4icCWMKhD2PbXJAwgsIpppPyRNSc8JE+TR1MCWO4WSYVTsLK0pzvh?=
 =?us-ascii?Q?ziRSqB/eYEJtODm75aw6cUU961oiz02YDIQC6HqcpJVmBMngLgZCBrYbfnBe?=
 =?us-ascii?Q?zI2zvreRLUUAp8nRnYHNsRmjYs0vsSCERHP3lvNr+cLrY+T8uaxUlu5pdJgm?=
 =?us-ascii?Q?NnWSXdxKbG+3ycngKAvHvtl9508idYh/9E/wx58K6182KQ03hV3aO7wdksA4?=
 =?us-ascii?Q?5HZFjG5Q5vgwX8Rrd4xuyDwAW7eoZUSTECc3KzHiSybNDnu2KBHwiTbTnIwI?=
 =?us-ascii?Q?iU5Ff6/4hCFTRQ+UrMIXrdSTP7ZJ0MuS3ajrfMkrymAFxKefVE0rqBBp6ev6?=
 =?us-ascii?Q?ElLsLbJ01iqN4Z8Lft956BktZ9PDe0rjDTyETlgf6HJfENozX/QSh0xbhT8p?=
 =?us-ascii?Q?JmSZ2cEZq3SHbVIPcbl+0HPgSRYajAJf644BvDrqP+79kDuSpU9g8H6vVXox?=
 =?us-ascii?Q?4VuyM6rtd6drUIDASD5TkICTRtFDXEQbwdJRgnas2Vx45NCuer3XNo+Ofl7S?=
 =?us-ascii?Q?AvfjWKze1hxHfxEGERhA4MAjI7JXgDer/l50kgz8cpVe79zYl3+hXgWC3QCa?=
 =?us-ascii?Q?0URVMc67Zyr1MaA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:32.9648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d80e51-d403-4a52-17c6-08dd4688f10f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030

From: Penny Zheng <penny.zheng@amd.com>

amd-cppc on active mode bypasses the scaling governor layer, and
provides its own P-state selection algorithms in hardware. Consequently,
when it is used, the driver's -> setpolicy() callback is invoked
to register per-CPU utilization update callbacks, not the ->target()
callback.

So, only when cpufreq_driver.setpolicy is NULL, we need to deliberately
set old gov as NULL to trigger the according gov starting.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Change condition check to .setpolicy being NULL
---
 xen/drivers/cpufreq/cpufreq.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index c0c6dc4c42..860ae32c8a 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -317,7 +317,13 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
                    perf->domain_info.num_processors)) {
         memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-        policy->governor = NULL;
+
+       /*
+        * Only when cpufreq_driver.setpolicy == NULL, we need to deliberately
+        * set old gov as NULL to trigger the according gov starting.
+        */
+       if ( cpufreq_driver.setpolicy == NULL )
+            policy->governor = NULL;
 
         cpufreq_cmdline_common_para(&new_policy);
 
-- 
2.34.1


