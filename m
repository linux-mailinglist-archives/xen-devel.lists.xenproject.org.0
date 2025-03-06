Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81FA5459C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903235.1311177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq73Q-0005GC-3Z; Thu, 06 Mar 2025 08:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903235.1311177; Thu, 06 Mar 2025 08:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq73Q-0005Dq-0D; Thu, 06 Mar 2025 08:58:08 +0000
Received: by outflank-mailman (input) for mailman id 903235;
 Thu, 06 Mar 2025 08:58:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mq-00031D-4g
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:41:00 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:2418::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8afbc87-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:56 +0100 (CET)
Received: from CH2PR10CA0026.namprd10.prod.outlook.com (2603:10b6:610:4c::36)
 by SJ0PR12MB8137.namprd12.prod.outlook.com (2603:10b6:a03:4e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Thu, 6 Mar
 2025 08:40:51 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::6e) by CH2PR10CA0026.outlook.office365.com
 (2603:10b6:610:4c::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 08:40:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:50 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:48 -0600
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
X-Inumbo-ID: b8afbc87-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJdCkYzbpKVQMc5c3fHLH32oQCpjU3k6KJZZxhUdTrTR9JNrLsbpepjxjmJn/4cR5hQDNLuyWROEvidBgLywo+gvRfu/s3KULpegfz+NfQluLbjIvYD3sW4122MQrwLLjHwAQZAozw1BWCCcmVHNNrA3kdBLQcK1T/FuoljIFFjwMlzAkYqAeNPCcQhLhitEaALkMA8ocKzOpy04ebf9ZQESjBUu2LVtkGKVcsRgGJUslaLN7zC/l1nJKt9cxktuOtzsldBXj1Rk9E7mjfI0b94q2njljYF2QBtoClMzYVM0z7j6eiLWusOuRrTI8fc8AGJ14fjZjKQEm9++jV/DiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c9sueaBP6Rd4TxQW09D/ICaquL7cGU914u/trV6d4s=;
 b=sBgQgjS//pGfW57jh1UDshIP6KCMcD1WOdBoxXPdVVSVse0VcbT7ThTWifXVrQGR1qA8ejIFjbN715ICRzogqem9+LgmINR057LNP52wDJjX5cJqzZ7mGXDsIPaAcnlrjCrr6D2QnlczQqDNqDFutk84931KdB1bc6qOAxnIE/w4LHjF0C7ffGFQAhUTfoIvjVx55X6Z32Gz97YpqtsDgX+JbBUAdwF5+hEeRhs6RRdZw+8Bktfn/Cl+Zr6U+gb2AZWtdkwSJW6xl6j2M2Oo33kfuUq+aJBCbPvaK8MommxmNqpDWIjJ0FWaOB29vK7bdrsyxVJbwOqL2ab2wkD+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c9sueaBP6Rd4TxQW09D/ICaquL7cGU914u/trV6d4s=;
 b=4jXY//7Pn1I1tRmwcf9eMgvg3DuGTx/dTxSpzuvHStOyy8+UhTAZc+gE44ic3gU3ClYrovlUUFIeHvNMJN52iTUFg4P8cv/ixFBcQK7rmhWcz1YdQrbTMNhCEtepeh/acNG3uyuJzn5jNWVgvjTNo9eDwJ+fjIhA5yQbh0GjDFY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3 14/15] xen/xenpm: Adapt cpu frequency monitor in xenpm
Date: Thu, 6 Mar 2025 16:39:48 +0800
Message-ID: <20250306083949.1503385-15-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SJ0PR12MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: a455b2b3-a5ce-412c-ecce-08dd5c8a9982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MBwpxHXd+0sjlYVisTPz06s9BYtbKIBMmUJHwpA5OwHxuGu/aTEVow49RSoq?=
 =?us-ascii?Q?u/Rm8Wj6stJZ3YGiB4rN5jWTKC9vZsvbuvx1VNddmeG056iZF2LzpBAVLa3J?=
 =?us-ascii?Q?TZitzQA/8HSF+9Qc/KzndlytYWqY96B1m54bacXy/CF6KxO0iwHLRbPsmY3w?=
 =?us-ascii?Q?b7xuejp2cyq27bsAsP7DCECECtfHYnmnvXlYqLB5WxRvyEflehbg9z2ILy/i?=
 =?us-ascii?Q?Vh1+uGqh5HMBqFT5xTwmBQ3V/+DtTSBOj40jJ7mBhzDMCYKXkCAM5fiaGykD?=
 =?us-ascii?Q?52dPtE+Xzn/N8hIMVcrudIa+MnF0zBUZszIOEpu2kD9eoooXmqi+4jDeDKWY?=
 =?us-ascii?Q?zCGvSdwk3AecLVetCPwxL1O6NClGicbaNyGa7P+BJ8/SzQnZaeNybFiri4Cj?=
 =?us-ascii?Q?wQu1Z0aglV7bMvIWKXX6WLRXRPr9SAF5Kx7Q7pOhv181++fuOf9UNbMp6GVP?=
 =?us-ascii?Q?Pz70RtOBgvyI9C9yU0s5PFMgZxUoyQ1xMq4h4PVS7+4322E3X+mKG0AI5L2G?=
 =?us-ascii?Q?e0LZ7nlECh00OqjqS2O+a/oF1b6/LW67Eqdph/7i2umNQkB0ioWfa8BAX6JJ?=
 =?us-ascii?Q?DRuvJfnkUx/dNgNcgPdb8T18B4G6e8brf7lq/w9LcfaKXxnjQSkH5FOX2JW1?=
 =?us-ascii?Q?Gd5f8fAvG+rAWFaEloaWEeY9DQL1QRLhU/tzbGOBCbY2MBRqxcWEYmrqgXBW?=
 =?us-ascii?Q?YVHEHSiwmItRsHTHLSPvUXpT5Le41nyF3oew7PFJMB22WKl73+uB+56jmEK5?=
 =?us-ascii?Q?dRmcHLW+7FNj9tQygXQZFTCkAdN7Q7l0wLaYWfG0VgoWOeXyXGJMCV3FAZlC?=
 =?us-ascii?Q?//OfPWaTwi/gHGLUoEyrncJwrWYVWKUDuVcJxfV2cIrEdXLJdX7k7qLcYLd9?=
 =?us-ascii?Q?pd7+kGdEj7AmmBMbKlskvuyefLCLUksN8oS5/YzaMVAWmfXJNP4z+EoE8z9+?=
 =?us-ascii?Q?kyjDxhjGlzzBzmqATo7nA1FpzlNFzx+PjvTmrp36Xj0NPnWZU4tDVm7Bw1rO?=
 =?us-ascii?Q?Pivyb6SESZn7LvjqCsUakMSJyu/bhuBrZ+xpcuapph2BO3lUz+bWMnFHCID3?=
 =?us-ascii?Q?Oc9jEVDo3VlaRsrr9tJmzTu1JIHm8dlSJ57KxHhICeJmSaKgKzP+GAtO4YD3?=
 =?us-ascii?Q?wpsKyVCRUpoodDbA+sDfKn/n+QbfEgrwGvHFF3Gnc2Qzqc/TeZzpBv6/TPzH?=
 =?us-ascii?Q?d0jpPytvEEidLCPzzKLebMbUbzAarOw0/henwpROoeJ72doFzscyb1F2oW+F?=
 =?us-ascii?Q?fF8mrWkN6E9q/pXPtCuo15Sk3Vf+lSDYtZNcGlZjLGwzBRbj52flsidOkQVx?=
 =?us-ascii?Q?JzjpW5MBpsJ2wn6E5RG4b5IXB7GMPEF+UD8gt1wwHDEzXAvbQlK+LpLfZetE?=
 =?us-ascii?Q?J7GNNuHKlrFVoaNXgsy47yELg67WZv8riyqBt2HyudAqaoTfX+yhMBItlngH?=
 =?us-ascii?Q?AtaQrAGIJ8hZs+ZsetH0Gy5MuJUIJiF5vxFG9GRaCD0F2YApPUqRw2HnLjGw?=
 =?us-ascii?Q?K1dlSNmtVje4mIA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:50.6277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a455b2b3-a5ce-412c-ecce-08dd5c8a9982
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8137

Make `xenpm get-cpureq-para/set-cpufreq-para` available in CPPC mode.
Also, In `xenpm get-cpufreq-para <cpuid>`, para scaling_available_frequencies
only has meaningful value when cpufreq driver in legacy P-states.
So we loosen "has_num" condition to bypass scaling_available_frequencies
check in CPPC mode.

Also, in `xenpm get-cpyfreq-para start`, the monitor of average frequency shall
not depend on the existence of legacy P-states.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 tools/libs/ctrl/xc_pm.c   | 12 +++++++-----
 tools/misc/xenpm.c        |  5 +++--
 xen/drivers/acpi/pmstat.c | 30 +++++++++++++++++-------------
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index b27b45c3dc..d843b79d6d 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -214,13 +214,12 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
 			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
 
     bool has_num = user_para->cpu_num &&
-                     user_para->freq_num &&
                      user_para->gov_num;
 
     if ( has_num )
     {
         if ( (!user_para->affected_cpus)                    ||
-             (!user_para->scaling_available_frequencies)    ||
+             (user_para->freq_num && !user_para->scaling_available_frequencies)    ||
              (user_para->gov_num && !user_para->scaling_available_governors) )
         {
             errno = EINVAL;
@@ -228,14 +227,16 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
         }
         if ( xc_hypercall_bounce_pre(xch, affected_cpus) )
             goto unlock_1;
-        if ( xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
+        if ( user_para->freq_num &&
+             xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
             goto unlock_2;
         if ( user_para->gov_num &&
              xc_hypercall_bounce_pre(xch, scaling_available_governors) )
             goto unlock_3;
 
         set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
-        set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
+        if ( user_para->freq_num )
+            set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
         if ( user_para->gov_num )
             set_xen_guest_handle(sys_para->scaling_available_governors,
                                  scaling_available_governors);
@@ -301,7 +302,8 @@ unlock_4:
     if ( user_para->gov_num )
         xc_hypercall_bounce_post(xch, scaling_available_governors);
 unlock_3:
-    xc_hypercall_bounce_post(xch, scaling_available_frequencies);
+    if ( user_para->freq_num )
+        xc_hypercall_bounce_post(xch, scaling_available_frequencies);
 unlock_2:
     xc_hypercall_bounce_post(xch, affected_cpus);
 unlock_1:
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index a7aeaea35e..a521800504 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -539,7 +539,7 @@ static void signal_int_handler(int signo)
                         res / 1000000UL, 100UL * res / (double)sum_px[i]);
             }
         }
-        if ( px_cap && avgfreq[i] )
+        if ( avgfreq[i] )
             printf("  Avg freq\t%d\tKHz\n", avgfreq[i]);
     }
 
@@ -926,7 +926,8 @@ static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
             ret = -ENOMEM;
             goto out;
         }
-        if (!(p_cpufreq->scaling_available_frequencies =
+        if (p_cpufreq->freq_num &&
+            !(p_cpufreq->scaling_available_frequencies =
               malloc(p_cpufreq->freq_num * sizeof(uint32_t))))
         {
             fprintf(stderr,
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index c8e00766a6..7f432be761 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -202,7 +202,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     pmpt = processor_pminfo[op->cpuid];
     policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
 
-    if ( !pmpt || !pmpt->perf.states ||
+    if ( !pmpt || ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
          !policy || !policy->governor )
         return -EINVAL;
 
@@ -229,17 +229,20 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( ret )
         return ret;
 
-    if ( !(scaling_available_frequencies =
-           xzalloc_array(uint32_t, op->u.get_para.freq_num)) )
-        return -ENOMEM;
-    for ( i = 0; i < op->u.get_para.freq_num; i++ )
-        scaling_available_frequencies[i] =
-                        pmpt->perf.states[i].core_frequency * 1000;
-    ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
-                   scaling_available_frequencies, op->u.get_para.freq_num);
-    xfree(scaling_available_frequencies);
-    if ( ret )
-        return ret;
+    if ( op->u.get_para.freq_num )
+    {
+        if ( !(scaling_available_frequencies =
+               xzalloc_array(uint32_t, op->u.get_para.freq_num)) )
+            return -ENOMEM;
+        for ( i = 0; i < op->u.get_para.freq_num; i++ )
+            scaling_available_frequencies[i] =
+                            pmpt->perf.states[i].core_frequency * 1000;
+        ret = copy_to_guest(op->u.get_para.scaling_available_frequencies,
+                    scaling_available_frequencies, op->u.get_para.freq_num);
+        xfree(scaling_available_frequencies);
+        if ( ret )
+            return ret;
+    }
 
     op->u.get_para.cpuinfo_cur_freq =
         cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
@@ -465,7 +468,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     switch ( op->cmd & PM_PARA_CATEGORY_MASK )
     {
     case CPUFREQ_PARA:
-        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+        if ( !(xen_processor_pmbits & (XEN_PROCESSOR_PM_PX |
+                                       XEN_PROCESSOR_PM_CPPC)) )
             return -ENODEV;
         if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
-- 
2.34.1


