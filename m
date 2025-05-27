Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146FAC4AA1
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997943.1378746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzy-0003HW-RQ; Tue, 27 May 2025 08:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997943.1378746; Tue, 27 May 2025 08:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzy-0003EL-O4; Tue, 27 May 2025 08:49:26 +0000
Received: by outflank-mailman (input) for mailman id 997943;
 Tue, 27 May 2025 08:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJpzw-0002ks-UW
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2412::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78a08d85-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:18 +0200 (CEST)
Received: from MW4PR04CA0155.namprd04.prod.outlook.com (2603:10b6:303:85::10)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 08:49:15 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::55) by MW4PR04CA0155.outlook.office365.com
 (2603:10b6:303:85::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 27 May 2025 08:49:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:14 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:09 -0500
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
X-Inumbo-ID: 78a08d85-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY/VuKhGIY2Cjxz6Qe0YYIWYqJzIp+UMHZvjmDpHVNr33Le8UQUHgmZ7FS3KBD9ReAv46PGwH2Vj4HuHbV+YfT4UO2FKVAXy4rG7Acy7Lj5T3/hveOutHuTrmq6UDyTfFZmRuHX9jxMPPAlJS649tnODzn2dCJHZ3cI/s1IBabhNF00NMsTl/XDkIJA1awi+RCXR3UdOD3SQEioivr5ivEqCUBZm7vjrCX45duWWVEVmaRFGeMthPzwcgJfppRbdlI82kXuVKx9EBd9M+nf4b7wKI5utt3lxLPFyD6edkPjWHyRWbMrggF+S0AfqzGQGtTIzmd1+XJINOmBH4fMFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GM8OZuCvDFaV06J9Gzt1WwF6Tfxsr646qNHeVMRmifA=;
 b=ehVusa4wf7oNcsLdZM3n3cAHASPCh/eGANM9bFBF0dzVgr/haOpDMhryL18ZfrufyRbFwY/9SGONsxVtiCAU/z2inhw2SKq2aJJ40l15u2CTZdEXVC3Yl5iwkfKDZoElf8G6W8C5qCKXiAQ5rQsQw/AsRqmZYEiqetLH5+YJmSIiBQbvuAOZX7WUDrkBpUeusPycCldIPiJazBEulkcn0MZIEZHSftvzCZSkRapRNDzG5wA3MUI3azKpqovr0AkfUUnkqQxGSKsvlCitMmL978WF0a6VQdswoMpDDvex7Ta2iSPWZI1iES7EfLVxeDdJP+IeE3ezSn9rz4eql+YnWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GM8OZuCvDFaV06J9Gzt1WwF6Tfxsr646qNHeVMRmifA=;
 b=YCqE/ruBk0VGbR9WnEbaYlFpMKvcmxiCwF5k6lUff0iFff/4g08hUIcVbozc3e3KISrqvzLXDwtOOMvVZ9nMYvpbP3hgzxJYNytWXdfNqqhuUsnXuaWyNzrcsGiUKJ1cO7V29XHSoiGkhU1cWJ/NgDgeoIC8yG6lqbQ5C1bh58E=
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
Subject: [PATCH v5 01/18] xen/pmstat: guard perf.states[] access with XEN_PX_INIT
Date: Tue, 27 May 2025 16:48:16 +0800
Message-ID: <20250527084833.338427-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf9b58e-c9eb-4852-bbc0-08dd9cfb5be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i7MnWAohelBN//pyrp9s1twi4DqIhkVlXGAWuJLyKzDmNiSbrbnUv4lAiNjJ?=
 =?us-ascii?Q?+C158nMOcy5tu9oa8+/daHIvRiLF/gbqcMZ/ioU+NlS8ebC1xmc1iEQ3Itmg?=
 =?us-ascii?Q?AQhFACE3syFflzS3PIblNng8U9DrnpP7gkT4XD+6x/kIrp7BArhYNA+Phq0L?=
 =?us-ascii?Q?oajVkrIa6PCqzBiV1u1mZ3H6Ts+SjRO0JrYyUqvOA5EJ5cw9tAcjTtJvGItv?=
 =?us-ascii?Q?KtDqsxfLGu8aAMjBBIdpNiI/LjoZUfmfg45yUg5pVjFd/Hmn6s1u11TvQSjU?=
 =?us-ascii?Q?FswAK8XWEaXNF38Ev3el8P9TyiZfz9Jat8KLv0bIbZ3x80K3GQw23hrt7VeA?=
 =?us-ascii?Q?1mFkQ/jxC9xX0bAHRgHwjsY3V9yr9US9dV6imh+xjQokZ+PtodpEGAzYW1Ks?=
 =?us-ascii?Q?Lc9M0WRX03GA5Rb/rUrEluw7lRlx0tmdmWmEwjxGg3u9f08F5rNzaQwb7ysT?=
 =?us-ascii?Q?N6VDMgdqmzY1B2axky1aVUeDGk9iavgcNgqE2JXkktkJ+mjVgCklAabZtg+V?=
 =?us-ascii?Q?ELSDN8jWK7cHykAYYnzV5by/7YaAnKFO0pZnxRBHPQEXgkxAvrYN0708nEmv?=
 =?us-ascii?Q?biQ5jxk11+TeR9PYNMkSAX/LCDYR9EeiNk0rvUhknDDBkpn2VukZkzh4YoWL?=
 =?us-ascii?Q?OMxjFDlLB9RqdeMGh79dMXYKzGW3+mfr9daQeJzqWQnD+u1wk8m7Jbs2+c2i?=
 =?us-ascii?Q?kJ8cjXCTwnfGVCwSr7LAxSOOKJkJ5v29D3oqW2DP5OkJZbdJo93nJTyA2Gx7?=
 =?us-ascii?Q?SA7Z+dRlQxK+v8fqrcKBuym1IceL2Kj4bapIwoGWLspfMPjmlSZ2Sht38puq?=
 =?us-ascii?Q?dsQPIAT7DLDKWlOvZ+stFUsO9n2V3WduZyASbHYFKfyhelUkIBoCJaHMPd1T?=
 =?us-ascii?Q?ZHisVQKw1BXhChAW9J3KIPM1HP0nDMGh9xC3+KpqXlgniOPFdlCbZrDWOHJs?=
 =?us-ascii?Q?AFmuUozhtDPVyciOwez9jH0m3kBifbrA7/P/PrNLdIreCBxxV6cp/60gN0Yr?=
 =?us-ascii?Q?r1HoLooJzqgAT/Mj2974IJWrFHU1s+RLtmAYoI0kFMvi9nTD5GkimyWD9ZZr?=
 =?us-ascii?Q?PsNMazTzCbdy4gGYJmH1Mrqe9DYgMtorG4mwJD8PBxIJ1bt8AhVHFk/B1aUS?=
 =?us-ascii?Q?HjDO0uLbSqDYd/PeFZamE4B5OvggqNfyOcijWzOvptq9zTiGFd8Z6q+KEQDe?=
 =?us-ascii?Q?ho+RlxY6wdfVNPYc+PTCCi3i2BzT3qR6SmnmJjiESoDERuPXYgtkjwmGPxuZ?=
 =?us-ascii?Q?Ykm9CXaYNmpXnzQouURMJAIftRhz2JPLnVZHIitNtr+Hn/xFA+LsVxTuPORH?=
 =?us-ascii?Q?j7nqfdjX9azvVp3GQMFP8/xk9T1gU7WaunoaSqVGCTlKvsiB1Bmx9N/12qtJ?=
 =?us-ascii?Q?7mFqSTDcf4rr/S6s8HYgWOd24Fbt48aWZeYFxdaVXN8Eh9LhIyCh/nM4Hqcm?=
 =?us-ascii?Q?SWoFE4/nFxQtluZ0G7b74mXuoAUePdVyPhYSCCweVXCG5Rv3T+1S8VPvddC3?=
 =?us-ascii?Q?nDkCY4N1Im9pF1J1Nj5q1ek9DByjLhoAE1PY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:14.7514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf9b58e-c9eb-4852-bbc0-08dd9cfb5be3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026

Accessing to perf.states[] array shall not be only guarded with user-defined
hypercall input, so we add XEN_PX_INIT check to gain safety.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- new commit
---
 xen/drivers/acpi/pmstat.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index c51b9ca358..b7fcc02db9 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -228,10 +228,13 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     ret = copy_to_guest(op->u.get_para.affected_cpus,
                         data, op->u.get_para.cpu_num);
 
-    for ( i = 0; i < op->u.get_para.freq_num; i++ )
-        data[i] = pmpt->perf.states[i].core_frequency * 1000;
-    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
-                         data, op->u.get_para.freq_num);
+    if ( pmpt->perf.init & XEN_PX_INIT )
+    {
+        for ( i = 0; i < op->u.get_para.freq_num; i++ )
+            data[i] = pmpt->perf.states[i].core_frequency * 1000;
+        ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
+                             data, op->u.get_para.freq_num);
+    }
 
     xfree(data);
     if ( ret )
-- 
2.34.1


