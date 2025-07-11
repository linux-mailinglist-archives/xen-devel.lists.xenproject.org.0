Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F1B011DE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040267.1411754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wi-0002h6-Jq; Fri, 11 Jul 2025 04:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040267.1411754; Fri, 11 Jul 2025 04:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wi-0002dv-Cc; Fri, 11 Jul 2025 04:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1040267;
 Fri, 11 Jul 2025 04:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nw-0002LK-EH
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:52:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2414::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6738b20c-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:52:02 +0200 (CEST)
Received: from SJ0PR05CA0208.namprd05.prod.outlook.com (2603:10b6:a03:330::33)
 by MN0PR12MB6029.namprd12.prod.outlook.com (2603:10b6:208:3cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 03:51:58 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::17) by SJ0PR05CA0208.outlook.office365.com
 (2603:10b6:a03:330::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Fri,
 11 Jul 2025 03:51:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:57 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:55 -0500
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
X-Inumbo-ID: 6738b20c-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1dolZwy/KVL4ro5/hD74KvVGn2ZwvauMEl6dSbZS+YkMsv9cXhC3a9qlj8aJhoKSsELa79yQ+h9Qz4fVJSfJZMbCmiZfpIJipIPxZVxA5KA/d6B/zNtt/1+XViXT6z3OU1i56nvj7Apo9P8RMAKWLLTqa+q+N8iYY3WqCvwpibSHNMbZ0doobyNLE0U9JNQ4mGE9y181okKSGNONK34kqe4SsL6sLfmvfV3EP9j9AGEZsjpDa52Wc9jeVJWdpfGXBZL7RnxYmywm175TRpgFeHtmq5629/laeoJ5o0rAH4uMGutynpMgdZzZ2hJl9uP5D6kMTH8DJQiunn2RLpoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8Ck12KZjKIBi0141uA3E7Xx1pEuuUqreZFrdu0/Hqg=;
 b=tJCCa6Qxt8itsH77bKO+5KmTv0TQKmf0tExb7rYr20kRhfDbauspei9j/Cc9la4OOOFWBRVcxJHaYRH3ej/vxwDM8VD48uC2gXW2zRXWswWKTZg1pMVsaVMR+7riNt/ZDheLU8RPZO7TwE5/zSCO0L6Tg9ORg/OCSOXTCE+yRKtNMX8DYFiZyTRXrM+QyENINY8938vCp0zsCfImhDZxyh6gw/FOSBAK4oGlI1eRHCSixzMbGO9fSVnU4glQGzHMm3Zv/M/mh8zqu7haAtjQ+edsxzSBrJeX1ISQpgnskxFGzk6bb/+idgynLt90nsWHno+Aw8ZbskHpIgBwgx+3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8Ck12KZjKIBi0141uA3E7Xx1pEuuUqreZFrdu0/Hqg=;
 b=toIUnFoJvfCLVbWFGBxyND8uzEfkMaLC9bJqIlvqoDRfeNunIn+k5MLzZ6ggvv1dr5xK1fAnRc7f3sA/ED6ONKtdWhrjc7fQoXNnNKOiMMjdfKPHIlN5X659QByGrl7AhVNIO7wxfUg3jV+E86QT24SHdAkeOgTFgR7gVhs/454=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 15/19] tools/cpufreq: introduce helper to deal with CPPC-related parameters
Date: Fri, 11 Jul 2025 11:51:02 +0800
Message-ID: <20250711035106.2540522-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|MN0PR12MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d44eb8-2b44-4bfa-7da9-08ddc02e48a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4K8M/3Ivws0EFT7SRQoNf9x4zahs5pEOnrGOFXv7FQl9u8AXh+q6L/aqHZyC?=
 =?us-ascii?Q?mQAjQgA/u72SYY0UlIwGN+khGqPY03RPuEyMuXX35lgkt873n37ADTnLnCnQ?=
 =?us-ascii?Q?5MV+cOxNyg1dMaz3BwzylgDG9peFEPXHNzhvuKjmGtIoQwYxiBNUWMMvzftw?=
 =?us-ascii?Q?vb8hJ0zla2tMZqQRJNxkrBOokKwfALCkEN6j92MiVhY7OMmYrBXS3zN+E9Fd?=
 =?us-ascii?Q?Q5yc4NnU1uYkevym6hAgVaVUsHM5gtqBICS6ILWBNwRvQpo24qd2SttMqUtN?=
 =?us-ascii?Q?v1DdvqoKPNvCQEaRyuYqKQgjkEzN90wqXlxuNQWOLfszE9Sw/sSHjciPgx5v?=
 =?us-ascii?Q?ULGPd85p/cY4G6TnJVbP+afgZ4DGWjoX/rcHQWKrJ4sNycymSHlhd/mswiQq?=
 =?us-ascii?Q?AF5UZOvaTlwB/c1yyUpDPxG3cJ6dvH5dx5ipMxsUtmlJb/wGzewALWmRCQXM?=
 =?us-ascii?Q?2bRbtelCOp6R2qaMhRjUm+H6nXHdO36ozHxBd57lLQ7RKMHRFSdv+5FMXAGz?=
 =?us-ascii?Q?Fz1EV+Px/B/FmMrzH+dNzLN06OQWjnpOQ+wDAQsO/0Wimxcxtkj7gAd2sKTv?=
 =?us-ascii?Q?b777LeZZGQFtPBu16UjiTRMmPfPWum58NIDe9dq7P0+bQuuozwjPU4trQb3e?=
 =?us-ascii?Q?ZK09EcKQIGeq6p+zqhWyEMYyzmamv1gJie5y6h6PhBcSlSicFHxgZyCelji5?=
 =?us-ascii?Q?3Gxs27otqyJLdI17uqu3yYI/Ta6AOdjrpDY9+D0bBN9TT6ydzmZ/UJtrUwWl?=
 =?us-ascii?Q?ComYDX8vDL1UoaNrmOTXx3kra1lWpz5Qpz0MCGkh3diAUEQigzhiOyuTR5uo?=
 =?us-ascii?Q?/9+/dru92zBVm3zQXbDLQGcYqpnTmOJaxvtbYkZxeKuBBI6uFgxDBugKwWLa?=
 =?us-ascii?Q?Ml0Y6HJWs9n8sPheXD6tum3CMF+8BggRwmD1lBrKaQm4awVoUhkEvvz0xPit?=
 =?us-ascii?Q?p7THwfZvfajMeFVtWQWPnvNL98TxuI2MX7ilBfqgzFWxYDb/qYYeHnrr8w4E?=
 =?us-ascii?Q?aNyUxsrUh1WtiqhA4Ui8hCfKXzEvmIqLJKb/qoL4C+kr1EDxqL4lF9hyH1bS?=
 =?us-ascii?Q?Mrw5NurBrJoSHYgwuX3XkYbwOLrp8f8EJiGWpFxh0C5IMOMjPCYGilj4CJvl?=
 =?us-ascii?Q?hJ4qzH4poliN9vJxip91TEHDjLTYr9wDdRhzwYMIXdAaC4nqK9boehXURlJt?=
 =?us-ascii?Q?pmFQaDdmgtbICx5qfFq2FB1vuSpbtUNfuDAHY9plAe9YzcQbD7Rs9BMMlU91?=
 =?us-ascii?Q?umMMWKm3eTQKLjp3UaGrGfPCpqzyhmKJ+xB0lJf+eSaIrXeBqdf9fFO8OuLc?=
 =?us-ascii?Q?cZNklMgIzsDjE/ywFzMqu+i8ACGjrr40QIwqwNbr710pkYorpp9HCIAAjy+n?=
 =?us-ascii?Q?jQR7UlqK24llnAAtaNpXfqTCTA0gVOIEfshS4px+mZ/o0/996HzXHNvLpEo5?=
 =?us-ascii?Q?njnPF4tRNZdZgPChh58HG9iTGwE9Vp6wI4ptdCxPc/SaCVeP2oY4XOusESzs?=
 =?us-ascii?Q?uZf3c3Ai2Q9LM/gTmPEAP27uL35aw9BPJ0Hz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:57.4714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d44eb8-2b44-4bfa-7da9-08ddc02e48a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6029

New helpers print_cppc_para() and get_cpufreq_cppc() are introduced to deal
with CPPC-related parameters, in order to be re-used when later exporting new
sub-op "get-cpufreq-cppc".

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v5 -> v6:
- new commit
---
 tools/misc/xenpm.c       | 53 +++++++++++++++++++++-------------------
 xen/drivers/acpi/pm-op.c | 16 +++++++++---
 2 files changed, 41 insertions(+), 28 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 55b0b0c482..120e9eae22 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -799,6 +799,33 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
     return mantissa * multiplier;
 }
 
+/* print out parameters about cpu cppc */
+static void print_cppc_para(unsigned int cpuid,
+                            const xc_cppc_para_t *cppc)
+{
+    printf("cppc variables       :\n");
+    printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
+           cppc->lowest, cppc->lowest_nonlinear);
+    printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
+           cppc->nominal, cppc->highest);
+    printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
+           cppc->minimum, cppc->maximum, cppc->energy_perf);
+
+    if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
+    {
+        unsigned int activity_window;
+        const char *units;
+
+        activity_window = calculate_activity_window(cppc, &units);
+        printf("                     : activity_window [%"PRIu32" %s]\n",
+               activity_window, units);
+    }
+
+    printf("                     : desired [%"PRIu32"%s]\n",
+           cppc->desired,
+           cppc->desired ? "" : " hw autonomous");
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -825,31 +852,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
     if ( hwp )
-    {
-        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
-
-        printf("cppc variables       :\n");
-        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
-               cppc->lowest, cppc->lowest_nonlinear);
-        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
-               cppc->nominal, cppc->highest);
-        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
-               cppc->minimum, cppc->maximum, cppc->energy_perf);
-
-        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
-        {
-            unsigned int activity_window;
-            const char *units;
-
-            activity_window = calculate_activity_window(cppc, &units);
-            printf("                     : activity_window [%"PRIu32" %s]\n",
-                   activity_window, units);
-        }
-
-        printf("                     : desired [%"PRIu32"%s]\n",
-               cppc->desired,
-               cppc->desired ? "" : " hw autonomous");
-    }
+        print_cppc_para(cpuid, &p_cpufreq->u.cppc_para);
     else
     {
         if ( p_cpufreq->gov_num )
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index e616c3316a..acaa33561f 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -77,6 +77,17 @@ static int read_scaling_available_governors(char *scaling_available_governors,
     return 0;
 }
 
+static int get_cpufreq_cppc(unsigned int cpu,
+                            struct xen_get_cppc_para *cppc_para)
+{
+    int ret = -ENODEV;
+
+    if ( hwp_active() )
+        ret = get_hwp_para(cpu, cppc_para);
+
+    return ret;
+}
+
 static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
 {
     uint32_t ret = 0;
@@ -141,9 +152,8 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( hwp_active() )
-        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    ret = get_cpufreq_cppc(op->cpuid, &op->u.get_para.u.cppc_para);
+    if ( ret == -ENODEV )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
-- 
2.34.1


