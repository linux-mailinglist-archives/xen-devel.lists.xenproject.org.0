Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E5AC6599
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999109.1379869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCxr-0007Wt-72; Wed, 28 May 2025 09:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999109.1379869; Wed, 28 May 2025 09:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCxr-0007VI-36; Wed, 28 May 2025 09:20:47 +0000
Received: by outflank-mailman (input) for mailman id 999109;
 Wed, 28 May 2025 09:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvX-0001jE-PE
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2413::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3682bc8-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:18:22 +0200 (CEST)
Received: from MW4PR04CA0074.namprd04.prod.outlook.com (2603:10b6:303:6b::19)
 by IA0PPF80FB91A80.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.32; Wed, 28 May
 2025 09:18:18 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::8b) by MW4PR04CA0074.outlook.office365.com
 (2603:10b6:303:6b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 28 May 2025 09:18:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:17 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:18:15 -0500
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
X-Inumbo-ID: b3682bc8-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJ15Noy+EYTuZ+7buvWGPQwUo7rULps5eL1uMG9TzTB+fDe4clR/bjcjHkTX6aVF/Lk8pheAT9IoaZLcauFWPaI1ionvCbb4/YCJQoYmH1Y0RVhJM1mvisQhAorzhYM5rhsMQptbVgkTyGXUXmp2ybTn9mf/DBu2wFY/VeTOCBI7kOY3IGAvEqA+h2QAkcO8Cw4tLLVj1kmSZKumEUdQ+Z07l9cEFIOwtyBj17ev1PLhY1T+aZD8ar5DTBEjks5s28WW8+J7CMp+Fg1X8nubSKRy4of/nBuqb2ZWO0lJsJJlmtikT/KCYFLrYd5V8ryj26Py8T9t0VOMgjt/i8lqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdgLxZJojMqTzA4uMqMuY2FrEHyVqR+LGLe1iCymvs4=;
 b=rWqO9Q4ddkHtt8iJG9ZJjFcC4pzkvq2VsYQ5EvpKib+5TdoJ6zn0XrR5Ts61CodISXOy+3lvku875GK4i7UV28Rawe0r1HMYXKOoXEwedj5pL3Rn+o/ndOOuTNmx7dfjKDR8X5kDuOB+vEUErHoDpocgtmVjPcqsWZIaQLv3ABShlsXqAOQ33hyBg6s3wCB5jy7TQbzBaKXTKw3SAQVyb+GG45s6z3Ti4BJQDagsVtTDm+ck92BSevMo/UHJZ9CCAetX0LOwOzdvgVwmrdPwXGtR/jpoXvDMTfSIaXnLfwiGYbT8Hzw3noaYUXIHDij1DZ1ZAkUCpiOYxa82OPSuaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdgLxZJojMqTzA4uMqMuY2FrEHyVqR+LGLe1iCymvs4=;
 b=tHyE8dFktuxkOlRrCjAxiWEQpZ7rSXORnCPpCElrszlq9WBwhhMJmZ4VPx2NUiBThT/Vgs0GTHF9iiTsHgi2ylA8d06hw72zr27Qw1KPIl6m4jicjwNHi1EVp6F8FOn9zP2Km4Den1QIet4rhkODTXPPHrvs4LbEynftic14TTc=
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
Subject: [PATCH v4 14/20] xen/sysctl: wrap around XEN_SYSCTL_cpupool_op
Date: Wed, 28 May 2025 17:17:02 +0800
Message-ID: <20250528091708.390767-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|IA0PPF80FB91A80:EE_
X-MS-Office365-Filtering-Correlation-Id: 47fa69c0-a522-4ab9-4c54-08dd9dc89522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mJyVDGlnX6/kadcqdRkjrkA0ym3J1w8o2gyDpvUYLBBx/RVrQCPmyZhR+Ga5?=
 =?us-ascii?Q?2qqmsLENPsrTLXCIW3T/FuMPaCuk0tgp0lmKJ7QF4jGrO0l+Ryp5qwoRfqyY?=
 =?us-ascii?Q?fLf4F1VJ0pWR+xJiXd+h3c0AcPpgbT/T++2qe/L93DzxSmUDZlvy+8TwRN9r?=
 =?us-ascii?Q?7NC08IElglODrydTn3uOjp7zjJfAmaND2GatI2ZtcllhZDg2ThYQfpe2wPIu?=
 =?us-ascii?Q?1Ol7bntNwc85hPtdTp4YmsjeQSXMgJBqQPsqowM9DeB6cyUs921yI6tN/G3O?=
 =?us-ascii?Q?A9qq9NmdnQaTxfYwlfjvmRBkOj8MSsauzrjT9IYa70rJw45+1Kmi8xIL7BRy?=
 =?us-ascii?Q?xGQ9uhnUaZ+Pv4rcrNa74H0PDQsPbdfTB7kfPfGD/U29/u0qY1mI8PdmlAqQ?=
 =?us-ascii?Q?07ZgNEvKpLMVzL1E1aBWjMRWRfhWLgUBX7ugs3XU0I6SR054mNkPnT+63Di5?=
 =?us-ascii?Q?3W/cTTxaa+7HYw063iSPd+1g4Y64l8y3hiJrQplqw5Q24/Y9EI2t9usTYstk?=
 =?us-ascii?Q?eq7CymoE4Ths4bnoknZMLmrIAUitfy0NWQYEjO5Xw8cJzOryOM55MXDyiBnI?=
 =?us-ascii?Q?qxCya6ebYBAFoEgp9cglGUwWz20vDMCfzye+7REXXyAtT70UGNF/C8+n+XC9?=
 =?us-ascii?Q?+hyczAUbhUwZTKD9ALzh1UUW7tnzEt1mntcMcCHZnMHYl1XMwRqANqF7AJSC?=
 =?us-ascii?Q?xXQ5Acm11/cc+P8tIkuiWPWra5Ak9i4PSXMiv9QciS0ohBV3t9R0695lm9L6?=
 =?us-ascii?Q?SDYynWsXSAsnhQutcsqit9E1rzpgkwJVOyPOsHLOfYM2s0UeXKTN1Vfwwyaw?=
 =?us-ascii?Q?pX2ymhWJ9eVQnRyHZI0rbUC+/OgMHhB28UjDZ1Vpu+1JsfWxnAHIfNdsVj6r?=
 =?us-ascii?Q?XuMA7s1mnOvqnFB0+5MVtT7ivWvuGVt6/IbUsmVktQmRyshOpxctagqHrkpH?=
 =?us-ascii?Q?2kxjEDPRTq0Y0vTwobyjAWk8rri3fqxeAKghLEwlHjuiq/0wp8G8t9xvtwo9?=
 =?us-ascii?Q?zFwc1zf/IsjE221MI1CQsFdMXCZxZzYHb+CiXuvOSKW92FuYTmuyPa64JzVL?=
 =?us-ascii?Q?EUC8KkS8aVKmyUHXyQAFVBYfohVkuOy7TwOTxsIqO7SxviQOgi7A+nTfGQIC?=
 =?us-ascii?Q?sFkc6rLiTfpVQQH1nzfyHyfS9IhYX2TUj4BKOgQlKZnSwuOhnu/Vat5vjh0Z?=
 =?us-ascii?Q?NosfQNaiFSUWT3JwZH/QntkTqihJDpBj1gHhchs7/cesSqqoC3qDzc8Hy85v?=
 =?us-ascii?Q?wB+ZLjCfH6v7Wmux0q+m7vQnwhPfubOOvH9PIy8cc5HGuwRzybvDVHHe95D4?=
 =?us-ascii?Q?agqQV9UM2QcXHfiSlayNGwgACSmHjU2akj46FcOIwsXSHUNp1rEVOPjtNGd/?=
 =?us-ascii?Q?ZcRLuglXRYGeymOi4JeNXXE5VCjojHyNsfX3TVWtIDX+atI5ONNT8VtKGnLF?=
 =?us-ascii?Q?3lyrn90TZgED9Xh1Wi9KWmKRIMnKZtchnY5bjKfhWiA+cNTXKMQJfxx0Tqt8?=
 =?us-ascii?Q?3ziAZTQx/uyldG0+uAbSl9e4PdLdZkH74f1F?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:17.6909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fa69c0-a522-4ab9-4c54-08dd9dc89522
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF80FB91A80

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


