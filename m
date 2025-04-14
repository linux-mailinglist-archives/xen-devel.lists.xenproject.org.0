Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3EA87928
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:42:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949113.1345734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERg-0008Kx-7P; Mon, 14 Apr 2025 07:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949113.1345734; Mon, 14 Apr 2025 07:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ERg-0008IR-4O; Mon, 14 Apr 2025 07:41:32 +0000
Received: by outflank-mailman (input) for mailman id 949113;
 Mon, 14 Apr 2025 07:41:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ERf-0008Gw-9H
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:41:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2418::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de7a3f90-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:26 +0200 (CEST)
Received: from CH2PR14CA0029.namprd14.prod.outlook.com (2603:10b6:610:60::39)
 by SA1PR12MB7040.namprd12.prod.outlook.com (2603:10b6:806:24f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 07:41:22 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::85) by CH2PR14CA0029.outlook.office365.com
 (2603:10b6:610:60::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 07:41:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:22 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:20 -0500
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
X-Inumbo-ID: de7a3f90-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0JuS9H30zZt6UUk0DRlGIFXgM8kaTrkq0g1d0A29qGIcoUJSVEPJ+B9ll4pxTjE80nWXJ0Acif42qqChnLvSas6axv8O5ysV7RYVAiJhoCTELLMMlwz+LHDNqSGjJeHJKvFsOU3N2ZDWiwelxWZPxwYIv96Lwt+aJCodBDCdLfRwsPdRzdVnN7+Yufv33O4Fiyr/gU222ch8dF3fR1BEU5X3CffkcNHuVmfccxw6vUMNF7byUzAiJEcfxT7ynsYweQ8v17yACgvCwx5AFK2ZNOTpJCRfysSQsSc/7X6xRvMpw5aHEU8bEZ4AXCFpfIE8NzxLyZuAKRxCd1a4sPb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvNIGetFWmpj6rnrTReRhEXzC+9BEUaQxTa7BY4QW9I=;
 b=Sb0OGpEgzxs+hhYIe4U+NdNFG89H+kxsZAjLkOFjj7t+QZ6hj3DNGY3IXzjh5Zcss48meFBlurnNgkQgJlfRUgm8yTT5+U/K5GXMhPrKWHxdi36kwxwI+yP0eMhJHCvpe0uEy57XwgsXtucJE3pXlJ+dqOfon1DkmydFpSN36PvGoJKzVR3cT8nwZHAsvuN4Vdqn4ZoAza9EGNOvb0qSFReWoyufqbOcfT5WaBC2gt7AdpVwnva73V45EUvrka6nF0dhJNerR4ry9sVcNmXJ6buLOgjlmtag0FwtYQHmXv3Qk+h1YDtsb7DiVwO4b61NvZ3HcwL2erC8mhjAj7trUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvNIGetFWmpj6rnrTReRhEXzC+9BEUaQxTa7BY4QW9I=;
 b=QGIOK39oH0+AdqaW8mVFTN2a+hP29r2Zk5vg2RXqBMVZvyyPt+TJOQKRbS2rl8p7apc0GHsv91XoZpjBb09ieZzRoFRbAIDDZRmEgNt/HumAUorLDgqhAklh0s9KZmqILUKVZme3dKaJ/HH9/tkrt9JNtAbIZg+wx7cuA/HaYEk=
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
Subject: [PATCH v4 01/15] xen/cpufreq: move "init" flag into common structure
Date: Mon, 14 Apr 2025 15:40:42 +0800
Message-ID: <20250414074056.3696888-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SA1PR12MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: b82a5493-65ea-40b0-d0e0-08dd7b27c094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HphH1n+9rB5LZfne5XmtYlcWKj196NB6BTha2eRWbxO6vt+31jtYZ28+soHo?=
 =?us-ascii?Q?5q5FBk/VVXo1IaY+hzEskXreivVuOAbJcWG3MlyoB38fFEZ4CcyhTr5f96+/?=
 =?us-ascii?Q?GdESf1aIojFR2kgfI0JYqx5m79Ikpd+nFJEbTq80K93TvCHesebVqakTxDkQ?=
 =?us-ascii?Q?xkyl/968MnP3KtFswu9+HJik18k6Act7TO/NjoHREmtROy2N5MK5LCj/LNVn?=
 =?us-ascii?Q?UITMQ27rOCKBQICOG6gOVbxUKUtEgCEgxtvPLsFLRVFeftTkhnYIuQa2YuAu?=
 =?us-ascii?Q?aPrYF/4TRoxhFAxAsDSyNYc4q9kXXzcXmeidp0B/ERGpOH6Jadygv/c15bGt?=
 =?us-ascii?Q?Qzanlu2fUgiV5t1xDmz48X7zUjmVB+4Zvx04Sf+fdeB1DWdL3DN3rQGXSb4t?=
 =?us-ascii?Q?U557CRQ9Uyt/K2mQ/6H1mGx9lQKbcGHYC7y/m0Mn3VX7am25tKPg/SS9nT6e?=
 =?us-ascii?Q?CDIaFvqNQA290xs1P+vkxaA++vZe2aC9ZP0dVqCg+W65Q2Td4Mxz637PaBCQ?=
 =?us-ascii?Q?Y/pLcF2+MRCdHM1L3GF3iHLZcUFXSmXGJfOvOvLjGjAs9+/b3SKve0GwNm6y?=
 =?us-ascii?Q?A/ptERQ14tDpTtIPzThWMvQn9HEH3KPXHynqECUenPttDSbzgSIry5UwNJzc?=
 =?us-ascii?Q?yMhmU1/dQKEBaOu9zxRzWF8+RFxFKExE09BYmOmKMa8E80npm7hh5zLMsdQS?=
 =?us-ascii?Q?32J6uBeYT3wr95FdJDfnvyubCPHNj9XUWzY8hYwbvO+FXXoe+A/QGy3DugSi?=
 =?us-ascii?Q?DtBEtmWVBVn0UEmR9tOvaJTGGVgpWR2a6fd3VcPo0Z/ajYxYIaYybJfx2bfY?=
 =?us-ascii?Q?zK3snb/FkOR+RCwLnxSMLy2VpvfyTAs06GWyzIKQgNoX+oIC03xKqaTEa5cw?=
 =?us-ascii?Q?mSDRxXcrf+Wsvjob2tJGFZNKKsYGPIMgemkYBVpTTCnsBvvufkI/FC2m5oqx?=
 =?us-ascii?Q?7PCZYLPLxhdvdUiwJ/5mLi4pddmaPF/gge8Gn452JCIX9s+tQ8SdCTX/LYLE?=
 =?us-ascii?Q?Iyc120krRojFsVaZ7NOVWqoSnt/HBk3yghMj9RD6tOYQsj3q2zOUYLgryJTu?=
 =?us-ascii?Q?mST+DdcjVuQ4eY8pE2opw//wxdFslzTZ0dxRRYj5TBCiHx4QU69B96FxxJzI?=
 =?us-ascii?Q?qTPuWhOYHwamzVCeC4QW1Ajp9QEfvNMkbiZ3DDh1AHehNYBvzRisMMm5dWEc?=
 =?us-ascii?Q?e400YBJWBRjFeAPkADI5TMgKi06ln07mXdeAWbe8BVNeB+5WpidssIM0ew+i?=
 =?us-ascii?Q?ZFL+BWPilBtdwso5bKMkFB+siWz2r2u5SIxDsOUvmHROazqZHYR28i2uwdsZ?=
 =?us-ascii?Q?n7VaYGtKtg5NGNOlL+b7/rvXuPl05ysokBUjUX9hRplY3P3aLjDGArBSyxAK?=
 =?us-ascii?Q?3OqCLh7SHg5vbifr00la24vQF4x/wzYH8wy97xD3q6JrRBHM2ewc0F8F8lrb?=
 =?us-ascii?Q?lnA0he9kKeBpnhnvj+q2rjx/IdZ32t/lWcHrSdYX2i6Tz0SiJ0LSWhSKKsSH?=
 =?us-ascii?Q?Su6h9b/wWDDizpQWEGW2vs6tn1u/7u7wJLaS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:22.0772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b82a5493-65ea-40b0-d0e0-08dd7b27c094
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7040

AMD cpufreq cores will be intialized in two modes, legacy P-state mode,
and CPPC mode. So "init" flag shall be extracted from specific
"struct xen_processor_perf", and placed in the common
"struct processor_pminfo".

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 xen/drivers/acpi/pmstat.c                 | 4 ++--
 xen/drivers/cpufreq/cpufreq.c             | 8 ++++----
 xen/include/acpi/cpufreq/processor_perf.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index c51b9ca358..767594908c 100644
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
@@ -463,7 +463,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     case CPUFREQ_PARA:
         if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
             return -ENODEV;
-        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
             return -EINVAL;
         break;
     }
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 4a103c6de9..b01ed8e294 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -209,7 +209,7 @@ int cpufreq_add_cpu(unsigned int cpu)
 
     perf = &processor_pminfo[cpu]->perf;
 
-    if ( !(perf->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
         return -EINVAL;
 
     if (!cpufreq_driver.init)
@@ -367,7 +367,7 @@ int cpufreq_del_cpu(unsigned int cpu)
 
     perf = &processor_pminfo[cpu]->perf;
 
-    if ( !(perf->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
@@ -563,7 +563,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
         if ( cpufreq_verbose )
             print_PPC(pxpt->platform_limit);
 
-        if ( pxpt->init == XEN_PX_INIT )
+        if ( pmpt->init == XEN_PX_INIT )
         {
             ret = cpufreq_limit_change(cpu);
             goto out;
@@ -572,7 +572,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
 
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


