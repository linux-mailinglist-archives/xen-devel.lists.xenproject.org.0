Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362FDB31605
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 13:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089953.1447444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPWO-0007A3-8d; Fri, 22 Aug 2025 11:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089953.1447444; Fri, 22 Aug 2025 11:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPWO-00076M-3N; Fri, 22 Aug 2025 11:01:24 +0000
Received: by outflank-mailman (input) for mailman id 1089953;
 Fri, 22 Aug 2025 11:01:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPOa-00083s-Bn
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:53:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2009::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32fb4ed4-7f46-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 12:53:14 +0200 (CEST)
Received: from BN9PR03CA0073.namprd03.prod.outlook.com (2603:10b6:408:fc::18)
 by SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Fri, 22 Aug
 2025 10:53:07 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::16) by BN9PR03CA0073.outlook.office365.com
 (2603:10b6:408:fc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Fri,
 22 Aug 2025 10:53:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:53:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:53:03 -0500
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
X-Inumbo-ID: 32fb4ed4-7f46-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gu6CAUO/e/SorWE6FETFoJ+ADbPmfc3Vg9S3nlA3/NYeefTecVHTsYhkZiNZeYgK9/nmNxkScnamr9DQ/Hh77uNOUAUv+3wEOXkn2CWQzMQFWHztVudEeeEohNsb4k4KQYLH0QQ+sJBVVKV57kTWmniHaOhM07oah4sK0yFWtM0LOw5gH/bWmWo2dt5E7czlg1bjooTUs94WAbCMRGxCuKowFwvk0xs1YyworqjgS3MQ6XhaonnC0OuHscqLEGdOX9FkmknLOpPuKqHLz7fy7dJxDeHHzx8PhN+nWh7ARQM1Fl3wRcNpv7TiPZQLyejoydDaVHK2aXTB1Bs6CSwplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNCaXKUF7+hinSzQyjxfgg7C/DAI0Sf6Bnbv0WLNBN4=;
 b=nmpbos4aVZk5OV2+TqNkCKsN3GHNoZK94kbB22bqY0YqEeAdHXWJmxcJ+qy+CDrCo6TXfIGfxxF6Tm0RD5zBGT6H5CBJx/b1XuB47xDjEhoU7ow9OAjiQ1REMdZVm+p8LnIu/TAgIeFlleGj1L+Nff7gB0TK/yeaP7UGD0hdTTHkI9vRd3+elfRId5EGaGppNr/Eg8QNKSdT5vnRts8b9H65Ecns20ZqbDFr1YHRxSCgRKC2J79GWWsJEX64IZSxkS3ZnGJVVffLFzU6E6E9xXRJMCL3rfXdU0jhNMClxLlYap3ROD2KAAcFMxaD8DwX7ekpTZUE2czgZO7dTLh79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNCaXKUF7+hinSzQyjxfgg7C/DAI0Sf6Bnbv0WLNBN4=;
 b=OKpw6hH2l438jkRLPYn5Y03fFBTbqcuE/3aVjJGkHj4VJuZDipov1O21/T8/X6aA8Hz4tGdjXPcTQcRGgmNkaIwYozEKLnH25eMUAN33pgd1mB4NnIoK6Yy9EX/jBcjLCDfkKRpBV5OERajt2lpL3wMlwR9AmWJHtvq1+FmZsWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Fri, 22 Aug 2025 18:52:18 +0800
Message-ID: <20250822105218.3601273-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822105218.3601273-1-Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: b78ac3d9-8393-4fd2-2bcd-08dde16a13cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZtcuIZ1qA1bu+lCYYL1ytXjtyZz23baao7FJ2Vrbe3yuDmFTwqm9davwKwgO?=
 =?us-ascii?Q?7+yDL4ETq2mNGIMrrrKf068s09MsU+O2Iim+RABo0Veb51BOV0xfvi7xQ1kp?=
 =?us-ascii?Q?D+QiYKxfCmUJe6k4U5Rwe3gO5h+1x8n9i9xPNOdrXTTV1gRQGxlCplQGy2MV?=
 =?us-ascii?Q?p7oZd0fwN3G+qoFcPu53AOdB+MxApS/PUZRhc5acj3xbpfgQ7ehnztKxVVhn?=
 =?us-ascii?Q?gz2O9yd6OH4rEvuDhob5grA6hi2KsKD1m81l2g3D1hsBxa7n3PYP5VFnIkgz?=
 =?us-ascii?Q?K7NizGTykRz9+k25FqPwvKaLOU3imYzlcEBdtdFKYTazAYpdecfIqtxdsJ40?=
 =?us-ascii?Q?qtwifCEwz7C73aQCX273D9GK6hWqATDi/XL5QTo4kCJn9qt5VVT2AqoT6sXN?=
 =?us-ascii?Q?l9NTIpsC/8wK7kkl/ytDKSOmP4Plwz8iabSDzpcdSzj00QvN67cJZyO6nwVb?=
 =?us-ascii?Q?xDXM9z1YypFBiOGbysXjWz9KvytzMqNUQLrRl3Elk+CD3qnIIZ7KAaUeSy+y?=
 =?us-ascii?Q?9j55lgsu4yIo75nqG0iQ+IztmQHmjHn8XvuVEGLy/r4hK5Ls7mhltWKcxV0B?=
 =?us-ascii?Q?zR66fu5ZRH61qgnVzR3tPhO91/5+imQ+gB+6+l8ciquD40W6q9/YeXaz5CvI?=
 =?us-ascii?Q?f6PhFmRelYKmieu4GUiaJMfqGJsaw35Jm5W87SWbXnPqIyX42XeSIhXbEmqj?=
 =?us-ascii?Q?Pql+8q+8etaiNreUzsp/uASLJbrVpuVFGEPMGIBBx95WxQ/QYQCClOe6BoPn?=
 =?us-ascii?Q?NzyT9lwvOo0HIpNWMcp5OVRvWseKYEdAkoYBNa/fJsKdnTh/maE73ffCH98M?=
 =?us-ascii?Q?im0AjU69hFBr/Nb5qScD3QoEJ6b0c+BFiCMplFE3VeDsTMIMVIAnZfG8dY2Y?=
 =?us-ascii?Q?8voAQlo0DR9ALnlAWvDo/Bg4rNYAFZh9zRG9kG7KuEOYn/N9xAtKoWybFwYJ?=
 =?us-ascii?Q?pBhau4QmSvSM+EqFtfxE9YOugFrjBfXhCPuK2bZxTTuqHEg1mjxQRmDr9r/E?=
 =?us-ascii?Q?9rbjIuxQ9R+dToETb3cO/keZUV/7bBgQkvxfpWeOCJx76vYzp/WzMxUlcp7+?=
 =?us-ascii?Q?Ks1Ywc7g8OkLdlKOTKmjbvhgIzHp5hiA1soR0M/nrwu3NiiipG+JrDpgS1NZ?=
 =?us-ascii?Q?+2TKneVp222JxSgH0Nglo7I43K9IuxDk50AqInVzpOEUi4JcBc03gpyEJ3om?=
 =?us-ascii?Q?wksnyLLkDjy+2LN24yuyqJZ95jm9v7cC4ufQUCF+ZK36+MXbVL33YurPSS+0?=
 =?us-ascii?Q?Z7rbu1xE0QVxX4h10SJuOCoqCuRmPmAjS12HABWzIb4++NobaUgvf0aoOxFa?=
 =?us-ascii?Q?MoDl8pdu/NeoCwVfm0E7gshIiJ6ZRMobEJXz8TSX/OMeAm31mYKrV6Z9dE6L?=
 =?us-ascii?Q?zqRqPdhSMUis3OuzrIm1T/JT8TJe+nqnw2Zq3qyXz4QjljmuXcnm2GUGhGSp?=
 =?us-ascii?Q?LcSoFfRd0/89JTj51SWnRUUUHfePUlyPrgPYfLG8zHHNClN0WvhqesbWzd7h?=
 =?us-ascii?Q?1a88ILPMzlM56twiRYtUZYDJfLHWJe0l35wP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:53:07.0916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b78ac3d9-8393-4fd2-2bcd-08dde16a13cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243

Introduce helper set_amd_cppc_para() and get_amd_cppc_para() to
SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.

In get_cpufreq_cppc()/set_cpufreq_cppc(), we include
"processor_pminfo[cpuid]->init & XEN_CPPC_INIT" condition check to deal with
cpufreq driver in amd-cppc.

Also, a new field "policy" has also been added in "struct xen_get_cppc_para"
to describe performance policy in active mode. It gets printed with other
cppc paras. Move manifest constants "XEN_CPUFREQ_POLICY_xxx" to public header
to let it be used in user space tools.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Give the variable des_perf an initializer of 0
- Use the strncmp()s directly in the if()
---
v3 -> v4
- refactor comments
- remove double blank lines
- replace amd_cppc_in_use flag with XEN_PROCESSOR_PM_CPPC
---
v4 -> v5:
- add new field "policy" in "struct xen_cppc_para"
- add new performamce policy XEN_CPUFREQ_POLICY_BALANCE
- drop string comparisons with "processor_pminfo[cpuid]->init & XEN_CPPC_INIT"
and "cpufreq.setpolicy == NULL"
- Blank line ahead of the main "return" of a function
- refactor comments, commit message and title
---
v5 -> v6:
- remove duplicated manifest constants, and just move it to public header
- use "else if" to avoid confusion that it looks as if both paths could be taken
- add check for legitimate perf values
- use "unknown" instead of "none"
- introduce "CPUFREQ_POLICY_END" for array overrun check in user space tools
---
v6 -> v7:
- use ARRAY_SIZE() instead
- ->policy print is avoided in passive mode and print "unknown" in invalid
cases
- let cpufreq_is_governorless() being the variable's initializer
- refactor with the conditional operator to increase readability
- move duplicated defination ahead and use local variable
- avoid using "else-condition" to bring "dead code" in Misra's nomeclature
- move the comment out of public header and into the respective internal
struct field
- wrap set{,get}_amd_cppc_para() with CONFIG_PM_OP
- add symmetry scenario for maximum check
---
 tools/misc/xenpm.c                   |  16 +++
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 181 +++++++++++++++++++++++++++
 xen/drivers/acpi/pm-op.c             |  10 +-
 xen/include/acpi/cpufreq/cpufreq.h   |  32 ++---
 xen/include/public/sysctl.h          |   6 +
 5 files changed, 226 insertions(+), 19 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 02981c4583..eedb745a46 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -38,6 +38,13 @@
 static xc_interface *xc_handle;
 static unsigned int max_cpu_nr;
 
+static const char cpufreq_policy_str[][12] = {
+    [CPUFREQ_POLICY_UNKNOWN] = "unknown",
+    [CPUFREQ_POLICY_POWERSAVE] = "powersave",
+    [CPUFREQ_POLICY_PERFORMANCE] = "performance",
+    [CPUFREQ_POLICY_ONDEMAND] = "ondemand",
+};
+
 /* help message */
 void show_help(void)
 {
@@ -826,6 +833,15 @@ static void print_cppc_para(unsigned int cpuid,
     printf("                     : desired [%"PRIu32"%s]\n",
            cppc->desired,
            cppc->desired ? "" : " hw autonomous");
+
+    if ( !cppc->desired )
+    {
+        if ( cppc->policy < ARRAY_SIZE(cpufreq_policy_str) )
+            printf("  performance policy : %s\n",
+                   cpufreq_policy_str[cppc->policy]);
+        else
+            printf("  performance policy : unknown\n");
+    }
     printf("\n");
 }
 
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 1b4753a062..493550bbb3 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -557,6 +557,187 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
     return 0;
 }
 
+#ifdef CONFIG_PM_OP
+int get_amd_cppc_para(const struct cpufreq_policy *policy,
+                      struct xen_get_cppc_para *cppc_para)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
+                                                   policy->cpu);
+
+    if ( data == NULL )
+        return -ENODATA;
+
+    cppc_para->policy           = policy->policy;
+    cppc_para->lowest           = data->caps.lowest_perf;
+    cppc_para->lowest_nonlinear = data->caps.lowest_nonlinear_perf;
+    cppc_para->nominal          = data->caps.nominal_perf;
+    cppc_para->highest          = data->caps.highest_perf;
+    cppc_para->minimum          = data->req.min_perf;
+    cppc_para->maximum          = data->req.max_perf;
+    cppc_para->desired          = data->req.des_perf;
+    cppc_para->energy_perf      = data->req.epp;
+
+    return 0;
+}
+
+int set_amd_cppc_para(struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint8_t max_perf, min_perf, des_perf, epp;
+    bool active_mode = cpufreq_is_governorless(cpu);
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    /* Return if there is nothing to do. */
+    if ( set_cppc->set_params == 0 )
+        return 0;
+
+    /* Only allow values if params bit is set. */
+    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
+          set_cppc->desired) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
+          set_cppc->minimum) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
+          set_cppc->maximum) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
+          set_cppc->energy_perf) )
+        return -EINVAL;
+
+    /*
+     * Validate all parameters
+     * Maximum performance may be set to any performance value in the range
+     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
+     * be set to a value that is larger than or equal to minimum Performance.
+     */
+    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
+         (set_cppc->maximum > data->caps.highest_perf ||
+          set_cppc->maximum <
+                        (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
+                         ? set_cppc->minimum
+                         : data->req.min_perf)) )
+        return -EINVAL;
+    /*
+     * Minimum performance may be set to any performance value in the range
+     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
+     * be set to a value that is less than or equal to Maximum Performance.
+     */
+    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
+         (set_cppc->minimum < data->caps.lowest_nonlinear_perf ||
+          (set_cppc->minimum >
+                        (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
+                         ? set_cppc->maximum
+                         : data->req.max_perf))) )
+        return -EINVAL;
+    /*
+     * Desired performance may be set to any performance value in the range
+     * [Minimum Performance, Maximum Performance], inclusive.
+     */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+    {
+        if ( active_mode )
+            return -EOPNOTSUPP;
+
+        if ( (set_cppc->desired >
+                        (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
+                         ? set_cppc->maximum
+                         : data->req.max_perf)) ||
+             (set_cppc->desired <
+                        (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
+                         ? set_cppc->minimum
+                         : data->req.min_perf)) )
+            return -EINVAL;
+    }
+    /*
+     * Energy Performance Preference may be set with a range of values
+     * from 0 to 0xFF
+     */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF )
+    {
+        if ( !active_mode )
+            return -EOPNOTSUPP;
+
+        if ( set_cppc->energy_perf > UINT8_MAX )
+            return -EINVAL;
+    }
+
+    /* Activity window not supported in MSR */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        return -EOPNOTSUPP;
+
+    epp = per_cpu(epp_init, cpu);
+    min_perf = data->caps.lowest_nonlinear_perf;
+    max_perf = data->caps.highest_perf;
+    des_perf = data->req.des_perf;
+    /*
+     * Apply presets:
+     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/ONDEMAND are
+     * only available when CPPC in active mode
+     */
+    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
+        if ( !active_mode )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_POWERSAVE;
+        /*
+         * Lower max_perf to nonlinear_lowest to achieve
+         * ultmost power saviongs
+         */
+        max_perf = min_perf;
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        if ( !active_mode )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
+        /* Increase min_perf to highest to achieve ultmost performance */
+        min_perf = max_perf;
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND:
+        if ( !active_mode )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_ONDEMAND;
+        /*
+         * Take medium value to show no preference over
+         * performance or powersave
+         */
+        epp = CPPC_ENERGY_PERF_BALANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
+        if ( active_mode )
+            policy->policy = CPUFREQ_POLICY_UNKNOWN;
+        break;
+
+    default:
+        return -EINVAL;
+    }
+
+    /* Further customize presets if needed */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM )
+        min_perf = set_cppc->minimum;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM )
+        max_perf = set_cppc->maximum;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF )
+        epp = set_cppc->energy_perf;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+        des_perf = set_cppc->desired;
+
+    amd_cppc_write_request(cpu, min_perf, des_perf, max_perf, epp);
+
+    return 0;
+}
+#endif /* CONFIG_PM_OP */
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 2b4c8070aa..195dcb88b5 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -84,6 +84,8 @@ static int get_cpufreq_cppc(unsigned int cpu,
 
     if ( hwp_active() )
         ret = get_hwp_para(cpu, cppc_para);
+    else if ( processor_pminfo[cpu]->init & XEN_CPPC_INIT )
+        ret = get_amd_cppc_para(per_cpu(cpufreq_cpu_policy, cpu), cppc_para);
 
     return ret;
 }
@@ -317,10 +319,12 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -ENOENT;
 
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
+    if ( hwp_active() )
+        return set_hwp_para(policy, &op->u.set_cppc);
+    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
+        return set_amd_cppc_para(policy, &op->u.set_cppc);
 
-    return set_hwp_para(policy, &op->u.set_cppc);
+    return -EOPNOTSUPP;
 }
 
 int do_pm_op(struct xen_sysctl_pm_op *op)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index babc4a1a2c..6ca686c4b2 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -81,7 +81,18 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
-    unsigned int        policy; /* CPUFREQ_POLICY_* */
+    unsigned int        policy; /* Performance Policy
+                                 * If cpufreq_driver->target() exists,
+                                 * the ->governor decides what frequency
+                                 * within the limits is used.
+                                 * If cpufreq_driver->setpolicy() exists, these
+                                 * following policies are available:
+                                 * CPUFREQ_POLICY_PERFORMANCE represents
+                                 * maximum performance
+                                 * CPUFREQ_POLICY_POWERSAVE represents least
+                                 * power consumption
+                                 * CPUFREQ_POLICY_ONDEMAND represents no
+                                 * preference over performance or powersave */
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
@@ -132,21 +143,6 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
 extern struct cpufreq_governor *__find_governor(const char *governor);
 #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
 
-/*
- * Performance Policy
- * If cpufreq_driver->target() exists, the ->governor decides what frequency
- * within the limits is used. If cpufreq_driver->setpolicy() exists, these
- * following policies are available:
- * CPUFREQ_POLICY_PERFORMANCE represents maximum performance
- * CPUFREQ_POLICY_POWERSAVE represents least power consumption
- * CPUFREQ_POLICY_ONDEMAND represents no preference over performance or
- * powersave
- */
-#define CPUFREQ_POLICY_UNKNOWN      0
-#define CPUFREQ_POLICY_POWERSAVE    1
-#define CPUFREQ_POLICY_PERFORMANCE  2
-#define CPUFREQ_POLICY_ONDEMAND     3
-
 unsigned int cpufreq_policy_from_governor(const struct cpufreq_governor *gov);
 
 /* pass a target to the cpufreq driver */
@@ -293,6 +289,10 @@ int acpi_cpufreq_register(void);
 
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
+int get_amd_cppc_para(const struct cpufreq_policy *policy,
+                      struct xen_get_cppc_para *cppc_para);
+int set_amd_cppc_para(struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc);
 
 bool cpufreq_is_governorless(unsigned int cpuid);
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 3f654f98ab..c50fa7bb3c 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -336,8 +336,14 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+#define CPUFREQ_POLICY_UNKNOWN      0
+#define CPUFREQ_POLICY_POWERSAVE    1
+#define CPUFREQ_POLICY_PERFORMANCE  2
+#define CPUFREQ_POLICY_ONDEMAND     3
+
 struct xen_get_cppc_para {
     /* OUT */
+    uint32_t policy; /* CPUFREQ_POLICY_xxx */
     /* activity_window supported if set */
 #define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
     uint32_t features; /* bit flags for features */
-- 
2.34.1


