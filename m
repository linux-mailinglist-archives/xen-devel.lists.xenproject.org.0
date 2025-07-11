Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05174B011E0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040311.1411780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4xZ-0005Yj-8G; Fri, 11 Jul 2025 04:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040311.1411780; Fri, 11 Jul 2025 04:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4xZ-0005WO-4c; Fri, 11 Jul 2025 04:02:05 +0000
Received: by outflank-mailman (input) for mailman id 1040311;
 Fri, 11 Jul 2025 04:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4nv-0002Li-VQ
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:52:08 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:240a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68e1cf5e-5e0a-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 05:52:06 +0200 (CEST)
Received: from SJ0PR05CA0186.namprd05.prod.outlook.com (2603:10b6:a03:330::11)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 11 Jul
 2025 03:52:01 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::26) by SJ0PR05CA0186.outlook.office365.com
 (2603:10b6:a03:330::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Fri,
 11 Jul 2025 03:52:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:52:00 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:56 -0500
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
X-Inumbo-ID: 68e1cf5e-5e0a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TH4fnQQJdDm68Iz3H/ntTWyRYZ3Qa9tUX6EWRWUAi4LjEt0iCotQViHuIx38oOP7DzcfxHeZLrC+QuqYtBe8PynaejpuT18kZqhsrGG09r21oeTjBuDP+yqYfxOCr3uF2a/4z0bOGS6fxur12oQXhAuikVjh2yQ8qcftpOBcGAcjviiMrxp4fHECeOL5A6wsB8xH/gjPTqT8+SKiEM9gPyr6BN8iMKtg04EkKRjR22Bx12cPTM4QLBJ6Y0XYIMwA0YTYr9HytzrJXVjrEraH5lgUJv3cr7vfZGi2EfI+SITfj/LHWmOx0NWqKRRvKe32y2KNErQKiaecg66RaHunOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHIaqVQfw5SIu46I6IoQrGzrNg9ClD5CbJDZSB1Y0vM=;
 b=TyEPrT3/3G+ttUdz/FAoBepBDKVXV1KlzANGRl1FNCrB7i2L1kLaKAe01kOqq1xIeuu3wNQuaxxRiSjTJDDYZiaGMCvok7Oh1AQY17dQ09HnTUTEh2TGbK+SlOyJK7kw9WfjBl8vHJirJSy2hYbnboqUA3CN9m71YNvK6wXGd2CaGFwtDLyIvsz9NkXAkAyf59o8L5XAdLHgCY1RV3c+GXp2Fon3Gll/u3nsMq+kh0ePsYi5u5BBvYAFehVkVI6lAsdIxeSVPx+j2cfAKrEYMyNCShg8RcaLVyK0Y5CMwK0jNsEjzHtzzYUai0iMd+X10eq0b3OjJtFdmPGYAfnjmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHIaqVQfw5SIu46I6IoQrGzrNg9ClD5CbJDZSB1Y0vM=;
 b=0Egw9NUQSi3b2Bsah1e6GYONF63SXbO3Rx6wNqwYaCwlPxZwsjO3XKYrlBABIHhsGKllXKNBlh6iIO6/4Redfp/hJbdFijP4M1ySGDeqEayvUOB5tDROIw2ZkBaYl3GdMvbrIFQbEpgz/Bp8YXGG/keLzQVuXEV2TrCZ8oNI3ZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v6 16/19] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-op
Date: Fri, 11 Jul 2025 11:51:03 +0800
Message-ID: <20250711035106.2540522-17-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 4331e59c-9bf4-4456-33ed-08ddc02e4a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cdjrYz2no6/Fn+jxjfqzJQH84Kjk7Wn+AUG7ve9rS4OsPaSNEDkPVZDDCuW/?=
 =?us-ascii?Q?mlWsDA38i67jXCGmiDPkPGLAj1XpL56jvJNLUAwY/XDqEe7th5EDEh+2kcx6?=
 =?us-ascii?Q?1UEpnDd8vGU7YkkealMGuuthkoD/6J1CWgweKG27h9PfmIcTOwuoeA+xmXde?=
 =?us-ascii?Q?JbSznayUQE4fN07FgvUOtS8bNjfULG71BgGIyHGSs9tG/+S+96sXYOds878P?=
 =?us-ascii?Q?bEavtWzEHV/t8Me0+Wibh0muse88dCVixXQR1KWcPAGNCMn7j7b4jf64it1W?=
 =?us-ascii?Q?R52Zl4at9nF7j83Q4uL5M6M7QTbyMPzN4noClihJGgpQFK7F67t0jkELVW6W?=
 =?us-ascii?Q?QdeP2ZpZreIkoNXk5mMKlclVm/lDsmuq/uQBLYJjLvyswwyYHSYDhh0Yu0jB?=
 =?us-ascii?Q?2JFtdnfCsXROfXHSpPMs7MeQzMsrLV0g46E7KSMsDdaDhkqn3rq104OhgPIR?=
 =?us-ascii?Q?+/E0h2yb/CcQ/dvL1a3Hp5BjDExdjRUkV1IksgqHrvBpllAB03a6RROS0ZTI?=
 =?us-ascii?Q?RuSpSxbI98pIa3Ro7xWxy01okTlwV/d/U4piqL/O341k9tW6t94zZwlKJMQV?=
 =?us-ascii?Q?ikPIaNkciomsvQVrOrTDkf3JnIYjOk/VUobPcvnHdC24XVu4MAEh1msQ87Fs?=
 =?us-ascii?Q?j4BJXt7KVe0L60K9OmBJkvtaXJvbHLyUsDUFtOB3vLcVlARjVyySwDaQcFKe?=
 =?us-ascii?Q?IV0G8/EBPl0Kll5W4cTt53iefr+9wV8yc6rDkuaebciaEiQwJvuP0g0HLi6t?=
 =?us-ascii?Q?Riv7Tmgh6EUHFkMa3CFebXFTHFElR/4VoR6Nu7kDeEROk5Iol2x9i/gW9wSz?=
 =?us-ascii?Q?cKt7SZEgwb7msVNQLMyshtoZDmIaXtw+deYzDIsRR8kqFj9k3WXQ+18YP2L+?=
 =?us-ascii?Q?UrRjrG6XLQqdWW+0WkmPCb8qom39v8oupp29dKzYWp52tlTtPP4tGlcx2cFg?=
 =?us-ascii?Q?n3Gp/IdCsfsPvBnTtJ9GUdh+oqaxWW5fg5Qyn1ZPXOKboyoIf9qOnCgsNMVJ?=
 =?us-ascii?Q?DtyY7f9V7drMWh16owt6L9Vh7dkfXsiFwocZ80DfFjlaGmLkwvqFQWVDiT5i?=
 =?us-ascii?Q?fR35vOAgdUAQlXpaPT0f0WDqn2rcuis/I17bdHcIG4E8nLFtiHKlnP46elZ7?=
 =?us-ascii?Q?u2/g7oJVeBIuD7gXb1/7T4/RkDvM74MiYZqGBjJVLG8TnkeKIQtTvav7VzUp?=
 =?us-ascii?Q?sVjPMi+d/p5XuF7tlFAFByVym8QxnvU7FZzEMXDC6ar8b4PYi8McB6ZjzpMV?=
 =?us-ascii?Q?rtulVfGOofCxPXM7SHKQlfqnwXD++JcQHck1Y3fiP8pkYS3aO4WvMsnbWDpB?=
 =?us-ascii?Q?qg9BnZYJ/4SCimjsgNVX958xV40zXi26WF2+49ArxQ0SAm69tj7q7obpHz/X?=
 =?us-ascii?Q?mzEhuPEomQj1jNkG+tPHRRKozgZiY9HwYGMPfFstyfBDUOkyt2oNvfmfyb2n?=
 =?us-ascii?Q?547ZuZ22LzkbjB+MenWRcg+pDLqNpty1JEx2YSt0fcGhJgrQnVsXYl6+/MsM?=
 =?us-ascii?Q?6MYcci5OOeqB89uzaRR6t8PPFWaH3F5fdp2I?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:52:00.3777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4331e59c-9bf4-4456-33ed-08ddc02e4a5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336

In amd-cppc passive mode, it's Xen governor which is responsible for
performance tuning, so governor and CPPC could co-exist. That is, both
governor-info and CPPC-info need to be printed together via xenpm tool.

If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
make xen_sysctl.u exceed 128 bytes.
So we introduce a new sub-op GET_CPUFREQ_CPPC to specifically print
CPPC-related para.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- new commit
---
v5 -> v6:
- remove the changes for get-cpufreq-para
---
 tools/include/xenctrl.h     |  2 ++
 tools/libs/ctrl/xc_pm.c     | 27 +++++++++++++++++++++
 tools/misc/xenpm.c          | 47 +++++++++++++++++++++++++++++++++++++
 xen/drivers/acpi/pm-op.c    |  4 ++++
 xen/include/public/sysctl.h |  2 ++
 5 files changed, 82 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 965d3b585a..699243c4df 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1953,6 +1953,8 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
                         int ctrl_type, int ctrl_value);
 int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
                         xc_set_cppc_para_t *set_cppc);
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para);
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
 
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 6fda973f1f..3f72152617 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -366,6 +366,33 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
     return ret;
 }
 
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para)
+{
+    int ret;
+    struct xen_sysctl sysctl = {};
+    struct xen_get_cppc_para *sys_cppc_para = &sysctl.u.pm_op.u.get_cppc;
+
+    if ( !xch  || !cppc_para )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    sysctl.cmd = XEN_SYSCTL_pm_op;
+    sysctl.u.pm_op.cmd = GET_CPUFREQ_CPPC;
+    sysctl.u.pm_op.cpuid = cpuid;
+
+    ret = xc_sysctl(xch, &sysctl);
+    if ( ret )
+        return ret;
+
+    BUILD_BUG_ON(sizeof(*cppc_para) != sizeof(*sys_cppc_para));
+    memcpy(cppc_para, sys_cppc_para, sizeof(*sys_cppc_para));
+
+    return ret;
+}
+
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 120e9eae22..bdc09f468a 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -69,6 +69,7 @@ void show_help(void)
             " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
             "                                     set the C-State limitation (<num> >= 0) and\n"
             "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
+            " get-cpufreq-cppc      [cpuid]       list cpu cppc parameter of CPU <cpuid> or all\n"
             " set-cpufreq-cppc      [cpuid] [balance|performance|powersave] <param:val>*\n"
             "                                     set Hardware P-State (HWP) parameters\n"
             "                                     on CPU <cpuid> or all if omitted.\n"
@@ -996,6 +997,51 @@ void cpufreq_para_func(int argc, char *argv[])
         show_cpufreq_para_by_cpuid(xc_handle, cpuid);
 }
 
+/* show cpu cppc parameters information on CPU cpuid */
+static int show_cppc_para_by_cpuid(xc_interface *xc_handle, unsigned int cpuid)
+{
+    int ret;
+    xc_cppc_para_t cppc_para;
+
+    ret = xc_get_cppc_para(xc_handle, cpuid, &cppc_para);
+    if ( !ret )
+    {
+        printf("cpu id               : %d\n", cpuid);
+        print_cppc_para(cpuid, &cppc_para);
+        printf("\n");
+    }
+    else if ( errno == ENODEV )
+    {
+        ret = -ENODEV;
+        fprintf(stderr, "CPPC is not available!\n");
+    }
+    else
+        fprintf(stderr, "[CPU%u] failed to get cppc parameter\n", cpuid);
+
+    return ret;
+}
+
+static void cppc_para_func(int argc, char *argv[])
+{
+    int cpuid = -1;
+
+    if ( argc > 0 )
+        parse_cpuid(argv[0], &cpuid);
+
+    if ( cpuid < 0 )
+    {
+        unsigned int i;
+
+        /* show cpu cppc information on all cpus */
+        for ( i = 0; i < max_cpu_nr; i++ )
+            /* Bail out only on unsupported platform */
+            if ( show_cppc_para_by_cpuid(xc_handle, i) == -ENODEV )
+                break;
+    }
+    else
+        show_cppc_para_by_cpuid(xc_handle, cpuid);
+}
+
 void scaling_max_freq_func(int argc, char *argv[])
 {
     int cpuid = -1, freq = -1;
@@ -1576,6 +1622,7 @@ struct {
     { "get-cpufreq-average", cpufreq_func },
     { "start", start_gather_func },
     { "get-cpufreq-para", cpufreq_para_func },
+    { "get-cpufreq-cppc", cppc_para_func },
     { "set-cpufreq-cppc", cppc_set_func },
     { "set-scaling-maxfreq", scaling_max_freq_func },
     { "set-scaling-minfreq", scaling_min_freq_func },
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index acaa33561f..0723cea34c 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -390,6 +390,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         ret = set_cpufreq_para(op);
         break;
 
+    case GET_CPUFREQ_CPPC:
+        ret = get_cpufreq_cppc(op->cpuid, &op->u.get_cppc);
+        break;
+
     case SET_CPUFREQ_CPPC:
         ret = set_cpufreq_cppc(op);
         break;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index eb3a23b038..2578a63b01 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -523,6 +523,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
     #define SET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x05)
+    #define GET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x06)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -547,6 +548,7 @@ struct xen_sysctl_pm_op {
     uint32_t cpuid;
     union {
         struct xen_get_cpufreq_para get_para;
+        struct xen_get_cppc_para    get_cppc;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
         struct xen_set_cppc_para    set_cppc;
-- 
2.34.1


