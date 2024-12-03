Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2E9E15E2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:36:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847446.1262531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIONr-0008U9-9n; Tue, 03 Dec 2024 08:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847446.1262531; Tue, 03 Dec 2024 08:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIONr-0008RL-6l; Tue, 03 Dec 2024 08:35:51 +0000
Received: by outflank-mailman (input) for mailman id 847446;
 Tue, 03 Dec 2024 08:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIONp-0008RD-96
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:35:49 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2412::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 967d32f5-b151-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 09:35:46 +0100 (CET)
Received: from DS7P220CA0058.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::22) by
 DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Tue, 3 Dec 2024 08:35:39 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:224:cafe::66) by DS7P220CA0058.outlook.office365.com
 (2603:10b6:8:224::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:35:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:35:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:33:43 -0600
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
X-Inumbo-ID: 967d32f5-b151-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGUnxo5t0m9NqVOFemeqC81wDB5Iw45KtrjSJl63SuK8e+IZBWm68kijv1HZ4p7eemMgzuVO3weDd5tC41xM8xZGhRWdyh2W/aXrPddGwSQo9vbu1cJUQyb1u0zH8Svhe6oR302AKLReoX26lZrWual5vV/XyhOh4ekPKDk8xXUzo6IKpVXROj2Dn+5OLdZJ+6BCM7RQXFbbzWm9NxQYb8fpipWSrV+2IpJy68leN6134P56IpdZdQNCw3qp0q4vlDENYH3GNsnMq+q0rko05VtAHIKufwZ1lL/GoTTRvFrCQhI22xTe1sxMKTZh62zzNDG3uOUYCOHL8rdkdtTVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXdS+5gaEuT5scthbVrK+h/Gd+9a+0HPlHnCGnSwq/E=;
 b=vqV0RyrduVTjgNNgd9fjpRhcPZP9q+/4M7tsvszpHCD1iACvmy5bUvJAmL6TfdAS96J6jgDzzpStHJfe8fZ4OWYks0Wt/6WmNRwNqbhRmroF79clup3cNlp8E7RvcYNJ+4AS0yAo2Y/YlChWwDkuwaNnJRpP9/Y1q1RAdQI4S2SoTP/2k5yhGHsI2NhuEacJA2H1doWXU+dFpGBuko2Wuqm48PZJRWwuMwjIXKwmOacSkx0bG+USe/eFYSdZvp+/uz1Zt0A/wEoxS1C37nWvypg2G+gV+FOIN4X5iao0JfasGTN4R+uM83e7u+uJ5OOGLTgUYR7HVGfV8Rf1T9Ltxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXdS+5gaEuT5scthbVrK+h/Gd+9a+0HPlHnCGnSwq/E=;
 b=AZdFeWFe2zoEjkYmFPvvdNlxuezqLCaYrVHh9e3nnxEYfkBUASRuCq1kWtyLJao9YQ6Ck+70w1mQEiDHsvikE3CwfFJx+9aFQMB5hJbKru9/FfiYHFBOlfjFkKUzP8HMHY0/eIH3Y1+yzrXvwZI9BavbdCrgPG90DqRDOgOOGy4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v1 10/11] tools/xenpm: Print CPPC parameters for amd-pstate driver
Date: Tue, 3 Dec 2024 16:33:15 +0800
Message-ID: <20241203083315.463511-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 1184c72a-67e5-475c-5353-08dd13757761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oIPySKemX3NZx+HcqNpbWK34Pcxt4njji39RwInifQUwb7lMcpqrFDJhM0WA?=
 =?us-ascii?Q?W1BHXwHANgRAMFZAXi+XQuhsiGcUFejOFamASqAof6+aw1t2/23cP2+EgLEY?=
 =?us-ascii?Q?eA/6MwV9bcXjixaV7LrOQZ8wwojEoOPK623MOsIVNmvNobysjzFV5GRQyi0Y?=
 =?us-ascii?Q?yS99Z36XchKRZP6AL7em0Lh5zXd8/d+KEVrQk2X9IlsFX+na29GDXcLgnFDZ?=
 =?us-ascii?Q?rXQCzjJCHVGBytYR4ge+z0lnUD033dXv8/UwLUJ4YqrJ6cmozB2Py4fXJfWH?=
 =?us-ascii?Q?TU4mIjCFdgNYZJux4G/EbhDWOrAEHc5HQawMyxkL+4z9UIfXCN6t+asuUN8J?=
 =?us-ascii?Q?vitob1AeBf923vZSQ8taI5Wgd5HDtmn6iWsV8VXi8dArU8jWYtgMTmQmkgBR?=
 =?us-ascii?Q?gUtn3DJzf0q4Eo9qIN1tFI15+tq0RkDfNoM28BrVNRe2AUKWxxug8FAdQEtK?=
 =?us-ascii?Q?pIA+jf7QtY3XLwYTUifn2A0fk+uYDSdwfAJ9EROIzLBBwWB39uICPBnSAXgN?=
 =?us-ascii?Q?sGgPmEVyY1ULIQfMokbBLuvQBuFbqvb++qJhGhPo1M1ICD9/qxDdVdKUs2Mf?=
 =?us-ascii?Q?PJBPEXakDioqIkITMUGcywy9DrBMMIUrQ88L5FhhKH3OcYo3cBBQM78K+IZI?=
 =?us-ascii?Q?GdQsQIXaHnaJVEsmhz+a7B57S7Xic1QXa57MnkhT7HlpkBAXeBxXr0LwRjZU?=
 =?us-ascii?Q?tgOOPmkXEe2ESMQOzjGF48QWoG0kGkEooiJlxNNSnhoNR99i3vYoQ1WAvqpE?=
 =?us-ascii?Q?DNBBpUcEDkMVDDcyNijpZVv3w0VGezS5WTi2IrHoakhHwcNidSryBTOchRhH?=
 =?us-ascii?Q?XIFov2ASIvhKowVl5281fP+WV/DbbsRfpkMt0+difRwgh+Ravm2QbB+0MK9Q?=
 =?us-ascii?Q?DpiO8WIePChAW9mVInSChjzZTZdzRs2/f6F6dcXsUk5Ce/jlZbg3c4wGNT67?=
 =?us-ascii?Q?WQiOUopVGYXP5qoS3RsOSrHVxjqp3fONJnw41VH1nk9fqdC3xBUqLsj1WCDm?=
 =?us-ascii?Q?HX1JGOM9J0PNPpgN3ua6PGMoOBRS5alUmeHPN0jz5ezVutTZBh/38a2J9If8?=
 =?us-ascii?Q?d4Y4hd0oaHof0wjIMeHt1W2XtWZRrZw3Vp1Lft/JDWY4WU7zzZsIjc6dYA0c?=
 =?us-ascii?Q?uGpBLupDdu6q+SQfSTcVGvTyprMdH+VIv9s9AJXJ4VqQNHH+33fhVUXJ1I2D?=
 =?us-ascii?Q?kMmNZr9nhOoTaQgSiZLtSJTobpIv+y5LLjK7kXRUE1fL2P17MK+6K/y8/CQt?=
 =?us-ascii?Q?NrIdiyLRvN1RVpYgCS2ndbvbLtMMUOXc5IqxgNvaxTZHy1KLOnqtDE/mQqLW?=
 =?us-ascii?Q?GKhWawXj8f9eP+nhaz/araN1q83sskqUzPQT34L7n9j8CrK8Kq4ml+3caoQO?=
 =?us-ascii?Q?Jnc6wnLBdbKoQ6ZO5/zJEoaigTF4SqU7fIYoYTgzI4+NE8VJIb8yqUWHg21K?=
 =?us-ascii?Q?/FwaSD6X7MHoW1FelP6pjFoAaxGcq9HW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:35:39.0353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1184c72a-67e5-475c-5353-08dd13757761
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722

From: Penny Zheng <penny.zheng@amd.com>

HWP, amd-pstate, amd-pstate-epp are all the implementation
of ACPI CPPC (Collaborative Processor Performace Control),
so we introduce cppc_mode flag to print CPPC-related para.

And HWP and amd-pstate-epp are both governor-less driver,
so we introduce hw_auto flag to bypass governor-related print.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 tools/misc/xenpm.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 336d246346..a09b53c4f3 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -787,12 +787,22 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
     return mantissa * multiplier;
 }
 
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
+    bool cppc_mode = false, hw_auto = false;
     int i;
 
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_PSTATE_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_PSTATE_EPP_DRIVER_NAME) )
+        cppc_mode = true;
+
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_PSTATE_EPP_DRIVER_NAME) )
+        hw_auto = true;
+
     printf("cpu id               : %d\n", cpuid);
 
     printf("affected_cpus        :");
@@ -800,7 +810,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if ( hwp )
+    if ( hw_auto )
         printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
                p_cpufreq->cpuinfo_min_freq,
                p_cpufreq->cpuinfo_max_freq);
@@ -812,7 +822,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( hwp )
+    if ( cppc_mode )
     {
         const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
 
@@ -838,7 +848,8 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
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


