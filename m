Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF196AFAA12
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035081.1407342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJU-0001Ad-8a; Mon, 07 Jul 2025 03:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035081.1407342; Mon, 07 Jul 2025 03:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcJU-00018g-2u; Mon, 07 Jul 2025 03:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1035081;
 Mon, 07 Jul 2025 03:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcJS-0007mT-Hx
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:14:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80873347-5ae0-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 05:14:33 +0200 (CEST)
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 03:14:28 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::c1) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 03:14:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 03:14:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Jul 2025 22:14:24 -0500
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
X-Inumbo-ID: 80873347-5ae0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrgvaVU2jtvtaYZ6GeFx8L2KNI8KtGcGxw3q4vFpyXp9+NF9Udn/IAd3ROt34D6sDqNh1e4aCsp03IbqMthztyPwZogodNmZvMXgfxvNalrkW/PdGXXoOBaVNxuj3pOAMtGugnRSp51FHjuUf5ZoV95bVtiwaE/9eH/+0NZClXCaHnjxPDVNO1qbbA96YoX+Rtrb/8RGxLmz4wl05le/QU5eI87vs6WYvFj7O6Fpp6gPJ9myX4aG6RY3adyL+xg4b9PNsDTiBcfuZXwwep1EbLQCcDZlSh72mMSLH6NQoAt3rcHxhQ6c0Oby35yWNF9tjKcAVrFyzOxksEd/V4KjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdgLxZJojMqTzA4uMqMuY2FrEHyVqR+LGLe1iCymvs4=;
 b=w7VfKPV5vCeBG+vIYSxDzehLtLf2WYR2UmMC+nwS5I3nu5xSzok3r4yop5jKTC8r8cRSvbRy7nwaFdk6VpJbQuu81yw6c5cVovBZfPBVZ67hFlRey8NQGc4VZ9tM8ir/W7gG/wXakSdNaWoH8shuwJOYaoFQZGZzS1yfysxShvPPChkchyoR9QOfYILq9y7+JMRVMvcyejxiugh3ivp/rsQz5lWCHuQH+UTsqzdWK4Nte1BxwigJcGPF+gBzq+S5oHu8P1L4fFn7BtrHtFZW65ULAIcWoXKPToWYbPSvIRWt3CgzvrK7SBcX4QdkQKerxlUUTsExkReFQefqiB3JgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdgLxZJojMqTzA4uMqMuY2FrEHyVqR+LGLe1iCymvs4=;
 b=vjmC5+hqqJuGD+7PANMIrgV1Hsl0PEzVOWB0A9LsnzZN1LEOfkzianCxPDi47Wsr+ZJvwpSu51D33sDK2H3ptaTbFz0KgmnvENcbq0nLF5uqdOsZsLQDgNJUYwvWaus3M6rH9HBrSvDSgotHowfJIbxtCzJK+rBhZe+6DWmrYnI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 07/11] xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
Date: Mon, 7 Jul 2025 11:13:42 +0800
Message-ID: <20250707031346.901567-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707031346.901567-1-Penny.Zheng@amd.com>
References: <20250707031346.901567-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|DS7PR12MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: b39db9b2-9970-42d3-a69d-08ddbd046169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pxa++nRdScc4IMsg16V32iwWwYep5Nd4/JauVoUe/V2NEAA9aFwN6UQtu1V6?=
 =?us-ascii?Q?2aTHlVKeGV5DB5hzTFvUM3taRLudMbXFUDGDgQZhfCc9zN/5ho54ucVSbrOG?=
 =?us-ascii?Q?KlWWD8/BuUm/NrBZzbdAZ9LVpnNyVVGDx/ErOa2IwBAs/CglJuMjqVORkHFT?=
 =?us-ascii?Q?p7IiHdsxLI1imctACKnpmSVOaD1A1fo9ns2huyWyrIeiKUP88jKTWQetnI4X?=
 =?us-ascii?Q?pYQx4nGwBaxJVBjnfdovE3axAmFI3ikd3W/zzF5ewLEkwIJA2Q5zvJa4oPVz?=
 =?us-ascii?Q?7AJMHJRThLkTGa2P5KsLw9xDCflUuoCEfbb0S8kKHg/XqdiRksckgl7fM6rv?=
 =?us-ascii?Q?yRNKXkdqp/udiHsI+0y6HKbD3HW21raloBLtgKy7zpRI6Yh0+2T7pKCHVFpx?=
 =?us-ascii?Q?3p5cLFtXHq7Qa+6M9XiBIaOrMa1FU79/V2hYhePcPOPm/XIdCDD1nn5YVBoI?=
 =?us-ascii?Q?yMOcjXEsWQTJGoqOghA30PGf7Hi1W9Xu4q+QdTx9Da45VMq/HzSdHd0IaWTz?=
 =?us-ascii?Q?4Gn6lQEBbxKmUhG8TJd9p0dcztz+s5GbbVBSGvPfo4b6+BHKDfbNIodb/+Pb?=
 =?us-ascii?Q?giOpHuDUsvR/bTnlPkIRIv1tmUQCQ9gsKKpcfBaW9bt4anJmNFMGlaQtvySy?=
 =?us-ascii?Q?cddlLqLkWh5OKcvQxPITf/HZ2zLCtp8NikHO0qw0Y/m6+EswS88nhzdN/iNE?=
 =?us-ascii?Q?XZDmuRsSajlL6HBesn5zK6qpOYn1W9FZp/NAFVLsBFSIS3v8YYVZQXBMpKcj?=
 =?us-ascii?Q?U12+OFtdLxUrQy1U48lBH9XKWUxB4WBRlHKinWN9eC4MwjgSSdopJOGsMXwr?=
 =?us-ascii?Q?TeIq8b45ZILXxoo1kKZHcSF3R/IVogbCGaxIEGbOIo+pf32blEHrVJFNW7bQ?=
 =?us-ascii?Q?ynyHjsVO52GPXAGX1bO8+Ne6RF7DUkQ0NsFG0bf0ATpWm+L2Hpmm8MVim3L9?=
 =?us-ascii?Q?0AVdJKFIJpqbePKNwvZbw3H+nizHuxgH6GnqcL1aev72OkTyIvFopCZMzx5r?=
 =?us-ascii?Q?j6nvCGzaNejGec3uVJ0x77y2m/IbXzmWWfH1+yxBESstK1YqXlme7403bNux?=
 =?us-ascii?Q?eIzobuQhzeNqD38obWJCd346SR/SG/OHPCbWXlGtwx8G+141KZkB5wbxr3j/?=
 =?us-ascii?Q?/mUxVW+S/cgwXX6ujqwAhFA5hxlqD0FAVMY+qBFAA0kPHZ9Ue0+5OB6KIPQD?=
 =?us-ascii?Q?vECLBa7TmKDjHmekJNyEqW2y1+2cUS+CwM5uHNzH1dZm7fFeuhUWztV4NZkR?=
 =?us-ascii?Q?5ETynqKSFxp3TFj1q1QQKAvxoy1EWNX7GonpiyOHPyNas19QnMccexG81C/R?=
 =?us-ascii?Q?A8N6MchvUnzkSR76WDLcN1OpTl6TLQZl94Dp+s8AVYcPUD1s00MTFOQi2WZ2?=
 =?us-ascii?Q?4BqR4YQT3u6pt9cKFKVAQUCQMZzrVUPxVZTTBLgCuoj4Bwfm4s9dcWLA4mTz?=
 =?us-ascii?Q?Fp0CJJcxh0zap4gu7bwADvYmm+Iyfh6CTmTrcOOFU2A3Q5SV90U4KY9Bop7m?=
 =?us-ascii?Q?t8hSQ8Vr57MbmqpOnLkJxxY9pMEMWHaI6b1M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 03:14:26.6963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b39db9b2-9970-42d3-a69d-08ddbd046169
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958

Function cpupool_do_sysctl is designed for doing cpupool related sysctl
operations, and shall be wrapped.

The following static functions are only called by cpupool_do_sysctl(), then
shall be wrapped too:
- cpupool_get_next_by_id
- cpupool_destroy
- cpupool_unassign_cpu_helper
- cpupool_unassign_cpu

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
v2 -> v3
- move #endif up ahead of the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/sched/cpupool.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 3d02c7b706..f5459c2779 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -241,10 +241,12 @@ struct cpupool *cpupool_get_by_id(unsigned int poolid)
     return __cpupool_get_by_id(poolid, true);
 }
 
+#ifdef CONFIG_SYSCTL
 static struct cpupool *cpupool_get_next_by_id(unsigned int poolid)
 {
     return __cpupool_get_by_id(poolid, false);
 }
+#endif /* CONFIG_SYSCTL */
 
 void cpupool_put(struct cpupool *pool)
 {
@@ -352,6 +354,7 @@ static struct cpupool *cpupool_create(unsigned int poolid,
 
     return ERR_PTR(ret);
 }
+#ifdef CONFIG_SYSCTL
 /*
  * destroys the given cpupool
  * returns 0 on success, 1 else
@@ -379,6 +382,7 @@ static int cpupool_destroy(struct cpupool *c)
     debugtrace_printk("cpupool_destroy(pool=%u)\n", c->cpupool_id);
     return 0;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Move domain to another cpupool
@@ -568,6 +572,7 @@ static int cpupool_unassign_cpu_start(struct cpupool *c, unsigned int cpu)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 static long cf_check cpupool_unassign_cpu_helper(void *info)
 {
     struct cpupool *c = info;
@@ -633,6 +638,7 @@ static int cpupool_unassign_cpu(struct cpupool *c, unsigned int cpu)
     }
     return continue_hypercall_on_cpu(work_cpu, cpupool_unassign_cpu_helper, c);
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * add a new domain to a cpupool
@@ -810,6 +816,7 @@ static void cpupool_cpu_remove_forced(unsigned int cpu)
     rcu_read_unlock(&sched_res_rculock);
 }
 
+#ifdef CONFIG_SYSCTL
 /*
  * do cpupool related sysctl operations
  */
@@ -975,6 +982,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     return ret;
 }
+#endif /* CONFIG_SYSCTL */
 
 unsigned int cpupool_get_id(const struct domain *d)
 {
-- 
2.34.1


