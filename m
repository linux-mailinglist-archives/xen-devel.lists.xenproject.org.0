Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F6AC4AA9
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997941.1378726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzw-0002nC-8x; Tue, 27 May 2025 08:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997941.1378726; Tue, 27 May 2025 08:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJpzw-0002mL-5m; Tue, 27 May 2025 08:49:24 +0000
Received: by outflank-mailman (input) for mailman id 997941;
 Tue, 27 May 2025 08:49:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJpzv-0002ks-9W
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2414::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7887d64a-3ad7-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 10:49:17 +0200 (CEST)
Received: from MW4PR04CA0152.namprd04.prod.outlook.com (2603:10b6:303:85::7)
 by SA1PR12MB9470.namprd12.prod.outlook.com (2603:10b6:806:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Tue, 27 May
 2025 08:49:16 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::66) by MW4PR04CA0152.outlook.office365.com
 (2603:10b6:303:85::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.21 via Frontend Transport; Tue,
 27 May 2025 08:49:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:10 -0500
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
X-Inumbo-ID: 7887d64a-3ad7-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH+1rhaavDfDwBCH8HXrYcrbqNOTupBCt8lI50yyBM95NoYZEUTZohZHLKfkHe2ksOmext4rkgoqB3YNWrXf7D69rUd/5VHHx4j8XBZZHTv4px/bfaktemi56+cg89WvNnuwQvrovtVTMOPmyfPuxn3DSSI8Tu7F5D/EQJPlC8rt6KMxzhTCgjNEEfF97GCL9d4ZwMkC5gHP9KsS0FR0l3FvyiijmXBkeYfsfmu5MQKtt+vQ+QF5Tbdf/y+ls4deVwOX4L8wabnvN0FnndH5R55aJRb3pLWuW2zPopp8Hh0BSmpK6XAYzYGDIhfF14IJ/oubmr0SBWGxsqTLkYlrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi/3Ae0XClQrJGJypXXAtKw9kybaw/jzcKrEH2+kynE=;
 b=sFQytABQGmyw7FNdyPK/+EqLWKVhmfk76xJ1oZN2h+ZX2O0f8OIBCha2tVbd6K8I7AzmVaQjC//ZZf0nzPWDe2BP4V1eVyBchx2xZ+OOd2rcb3vEduXGwSM1nO9QS1S7PFM/Kb9ch7xFgUXAbGiT2WK2ZWANjxy2Li543aN0y4bJj2++Ba8IF7Tn9+zCOi5o2d2JUcHJQf8PHhJxm8Mk4hsCSGzkUUGJciXBJeAuRvvRFZn//uTtO+0Xh6aK0Ro1Uh8Y0RzhRGGhrA8pGosrYl32IIilXTOrrqA1zFS/vvCiaxZjtURipNdDKOjVaLq0ytkgnw5oaTNtxiL2tuiSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fi/3Ae0XClQrJGJypXXAtKw9kybaw/jzcKrEH2+kynE=;
 b=S+XZkPPCdXAJWXXEr7+0JY00sZMNIz+fP86JRXIVQIKEGkdu1yh+3rNuL+Bf0a/ZfSre8znrT3+qgba6uSAc9EccMpT+sJ/nr75GjBD5STWzuVLOQ+yaAwOU+nnlsE0wC2HD4hL+MEBBoC55CFsV/ENHXqR1/8X0DuOcFy35Hnw=
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
Subject: [PATCH v5 02/18] xen/cpufreq: move "init" flag into common structure
Date: Tue, 27 May 2025 16:48:17 +0800
Message-ID: <20250527084833.338427-3-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|SA1PR12MB9470:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbeb641-8768-4968-9ca5-08dd9cfb5c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v3k7aF9UT+SK3STyAWHp4/4GGkyDW9KbQoaTc78Sqz+bFxnZZZSz5wxX3kaV?=
 =?us-ascii?Q?9JEd75MrHaclknsdzvwDILk6e1vNrXZ1fQr8QMIm76HXj8BdI1iV+pX0rv0t?=
 =?us-ascii?Q?5p4moyUlNIMRSM3VeoxGwv3e7pGSMUngD589rqX5eb2UMXI4ESev/tbu/M6B?=
 =?us-ascii?Q?0cVy86IIaHbUbr2BndxHwj2UmGbIsoG717ijJX2mFiCF8WybPOj44RuhKdag?=
 =?us-ascii?Q?N1aS+rt2Dut311bjS8VlAmMSxa5NZUGWOg7FpKHgKlPwMEV2yu9VHPbrSr7G?=
 =?us-ascii?Q?JxB0GoAoiBpobEtKtdqhWrX2SIHenoZLqpW4f0gERrsdzb+kwguCh7qAsOS3?=
 =?us-ascii?Q?IFibDTNJXhlyX1aaiOG8y6CnK3EFNmn0Qth/SGAr27G6xPEkURPrCj+W4hSC?=
 =?us-ascii?Q?KbGh5v7yfW2CveBfaZKKRO75NbiTl7L0e27/NXrt2Df5sgutKAWsdUohdRlY?=
 =?us-ascii?Q?euhTnQG6o5o+EGGDZ9Kz0lFxQVNccoqbflagOmn2onUOHN4YRudBuhTElBQy?=
 =?us-ascii?Q?wmDdKEmPCniwPe0ETgNNOv+IqhPdB39BLtgC97NQtjKSU06qw6H017gdaTh1?=
 =?us-ascii?Q?Yw/EedZGWepA9blJ+T4+5PIhLE7irs4y/q1ylTDdWxPVtWj1CBLbyxjDFhmw?=
 =?us-ascii?Q?NeA0ioNAsMo7GGOnieKOlc7OvVzjppkD2kL7P+j0u0XrGaKbQ6Nqd2w39X47?=
 =?us-ascii?Q?PcN2bkT9YPlqjRiu/gjFTXNSIeZLi1s9C7aycixA9+LeIO3fkQUH5JFEjSdY?=
 =?us-ascii?Q?t8X2y5ni98yxEhyqDiAgwQTmX4CsgMG4NNoPUwRZ1k5+a6t3/e/IPmuweSOA?=
 =?us-ascii?Q?EU1QHFYfD3pDpZRepWKvOzuxmQqxgAXrIsVWRgV8wUYabT1crqcY9Vx6akUj?=
 =?us-ascii?Q?ueFBfboYnA5tCmveukqYrNKfeNY36sXfk+TRED6d/hlLjXdaT6orTJNee+hB?=
 =?us-ascii?Q?Y9mMvtcxWIrOwBMdpTbfa//3St1Smh+NUG8oPmzbGVMUBD7W7Mp7xUJ90vFB?=
 =?us-ascii?Q?Jkdxzvk2YM6PY2orI5mwuBx0Z7BAwz8KSLupJirpRMjrzlQRYpJWRX/WA447?=
 =?us-ascii?Q?DOR8K24/NcMqqSN0kfPGzfwPs6j0HzJhKXMCtGFNjpih5JV1QL1ihs3KpaBO?=
 =?us-ascii?Q?4R7x253QHyC0/BpdA367z64KLn23B+FsE8l3rQViqaThWA0cgWg+/JepM0ns?=
 =?us-ascii?Q?o+/YRkZS4+RYBNM+8//b0FToqNiXHZu/SZydmHYnKZ+6+RjzooXdNsIpG/oL?=
 =?us-ascii?Q?ts5P4N00ezLU6gK6B+npzIID0VeG57mYJJQcgXlzHQHcBOpJTSz7tnVuoEKZ?=
 =?us-ascii?Q?0V00m+GSi9w3Lh1cMvveEYGM2RS/33E9iO6mSsU3oAtxYuMn0vZozhgwnPsb?=
 =?us-ascii?Q?SBoPoSaEuGglzu+Xlg75fgLnYYutupJRzgjckas6lfair0IlYpid6yDZPD26?=
 =?us-ascii?Q?llBPX+Rok6NJ0iDekkFfXzviIUQR0rlboXeHME8eejigp0s4lzG1GYySOOcO?=
 =?us-ascii?Q?gOUs5Xn3U3+Nhz+XDXPXC+SY0U4/m6b8fvxV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:15.4858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbeb641-8768-4968-9ca5-08dd9cfb5c52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9470

AMD cpufreq cores will be intialized in two modes, legacy P-state mode,
and CPPC mode. So "init" flag shall be extracted from px-specific
"struct xen_processor_perf", and placed in the common
"struct processor_pminfo". Otherwise, later when introducing a new
sub-hypercall to propagate CPPC data, we need to pass irrelevant px-specific
"struct xen_processor_perf" to just set init flag.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
v4 -> v5:
- commit message refactor
---
 xen/drivers/acpi/pmstat.c                 | 6 +++---
 xen/drivers/cpufreq/cpufreq.c             | 8 ++++----
 xen/include/acpi/cpufreq/processor_perf.h | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index b7fcc02db9..6a1a900f78 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -68,7 +68,7 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
             return -ENODEV;
         if ( hwp_active() )
             return -EOPNOTSUPP;
-        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
             return -EINVAL;
         break;
     default:
@@ -228,7 +228,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     ret = copy_to_guest(op->u.get_para.affected_cpus,
                         data, op->u.get_para.cpu_num);
 
-    if ( pmpt->perf.init & XEN_PX_INIT )
+    if ( pmpt->init & XEN_PX_INIT )
     {
         for ( i = 0; i < op->u.get_para.freq_num; i++ )
             data[i] = pmpt->perf.states[i].core_frequency * 1000;
@@ -466,7 +466,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     case CPUFREQ_PARA:
         if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
             return -ENODEV;
-        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
             return -EINVAL;
         break;
     }
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 19e2992335..08d027317c 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -209,7 +209,7 @@ int cpufreq_add_cpu(unsigned int cpu)
 
     perf = &processor_pminfo[cpu]->perf;
 
-    if ( !(perf->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
         return -EINVAL;
 
     if (!cpufreq_driver.init)
@@ -373,7 +373,7 @@ int cpufreq_del_cpu(unsigned int cpu)
 
     perf = &processor_pminfo[cpu]->perf;
 
-    if ( !(perf->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
@@ -569,7 +569,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
         if ( cpufreq_verbose )
             print_PPC(pxpt->platform_limit);
 
-        if ( pxpt->init == XEN_PX_INIT )
+        if ( pmpt->init == XEN_PX_INIT )
         {
             ret = cpufreq_limit_change(cpu);
             goto out;
@@ -578,7 +578,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 
     if ( perf->flags == ( XEN_PX_PCT | XEN_PX_PSS | XEN_PX_PSD | XEN_PX_PPC ) )
     {
-        pxpt->init = XEN_PX_INIT;
+        pmpt->init = XEN_PX_INIT;
 
         ret = cpufreq_cpu_init(cpu);
         goto out;
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 301104e16f..5f2612b15a 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -29,14 +29,14 @@ struct processor_performance {
     struct xen_processor_px *states;
     struct xen_psd_package domain_info;
     uint32_t shared_type;
-
-    uint32_t init;
 };
 
 struct processor_pminfo {
     uint32_t acpi_id;
     uint32_t id;
     struct processor_performance    perf;
+
+    uint32_t init;
 };
 
 extern struct processor_pminfo *processor_pminfo[NR_CPUS];
-- 
2.34.1


