Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB603B011DA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040244.1411710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wY-0001P0-UA; Fri, 11 Jul 2025 04:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040244.1411710; Fri, 11 Jul 2025 04:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wY-0001Mw-QN; Fri, 11 Jul 2025 04:01:02 +0000
Received: by outflank-mailman (input) for mailman id 1040244;
 Fri, 11 Jul 2025 04:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4oE-0002LK-Hm
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:52:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73a41a29-5e0a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 05:52:23 +0200 (CEST)
Received: from SJ0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:a03:3a0::22)
 by PH8PR12MB7205.namprd12.prod.outlook.com (2603:10b6:510:227::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Fri, 11 Jul
 2025 03:52:15 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::bb) by SJ0PR03CA0257.outlook.office365.com
 (2603:10b6:a03:3a0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.25 via Frontend Transport; Fri,
 11 Jul 2025 03:52:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:52:15 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:52:03 -0500
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
X-Inumbo-ID: 73a41a29-5e0a-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0/Qatn/XVkVYRFDIERb0LSuv638OvhzuFSbhS9G+8INqRW22pzNYU+BbRsdxRg8xeV0UyCvQAC+eQPV0b9FyitmiVFoPIYIjg+TwGJdS8t460BrUzQOLg0fxWozWAYmgwXpt8pM2rgJac0ESj0XrWi7EVt9yDd18jWs/JX7RH78YgK+qmZ4BF5Q9JOjhzCStibtWt2QHyDdnyowCh6RKbMz47qtI9IiK1epOEEne9M3wtsgjnJWHBeO7nGWlHtErZDqNIzDlVHZWzVsS+D/inzGfhuIg2+KMl4pY+tyNXOZzhR/VqEYS2t9NLF+uP1LrwFKPpscTHi7OgzVLTG5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGvTM+LhqZPBi9mX494YfOLM+xw21X/u01IyMg49oiQ=;
 b=J1/8mrK8sv5/elLv6lXlhdc1T9JxadVh2BG2rphzAI+asPgmd5sAEpMCRbB15uU8cQ+HEeQV7qEYh/pdzJgreGuDeg1RQDJAfpxeRD4pkw1+og7jxUrrVCDthFFFRT0WmYxRQ3uQZuiwm79rvSIulgWVx2N9+f6+PjHeln5v18M3s+q07P3C6vPRcfCqVHuPqMVBZUT7U9NSm2IWzobVZAS2HDTpdjVKsfaU1YbkLsHB42LeFU8YJdzruogwic/b9z3x6nD0EBc0Ixyzr8drfCncwhw7HHvby8DWkEIx3bgp62rJ+Mz8IHSlhERUST46UurLZ6uPX/187GFWcLsiSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGvTM+LhqZPBi9mX494YfOLM+xw21X/u01IyMg49oiQ=;
 b=B+jNGcJ50jzA7qyjLOipw94BNjdx1OizC6Fn/ObFj9AfTQIf60ORfyis5zrhKL3uuMMLiSsjTMNbaP/EQRd/N87xv19dyFjCjkUSctydvExJcN41y0UO0Cw+zahQ7BCCp/8XIed38AVybuRSD3Zle8PLhAqje4Pdp6bO93qbQRs=
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
Subject: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Fri, 11 Jul 2025 11:51:06 +0800
Message-ID: <20250711035106.2540522-20-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|PH8PR12MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cccfec-e41c-4e38-5e56-08ddc02e534a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5DabpQtBgKl+niJyW55VbSkFmFZKGhoD/hQFK+lbxJlnTEVaLFgFC+UUI2PD?=
 =?us-ascii?Q?m5tNSFxkwkwy0StwRMGrf7+ShYp/IHpdLMn5SRNtwEKVPEclraJZVJ7ao0Te?=
 =?us-ascii?Q?ET+etzf5ZSz+BryD/sCAc5l3M7jLWq5FR/604WYrNeEU05wRpt4PWVYap3W6?=
 =?us-ascii?Q?BoMnNWr1zPhhubl9Fo9ws15ppmZA/wUQoznCr1miFAFcinmCNNQj66grXqK3?=
 =?us-ascii?Q?tWblEk8moMnh1I6AGOhACREgO+itswMC4u1sCBAKy9im9lKK9i0t5FIAQhr9?=
 =?us-ascii?Q?Cy4FG9acD9g0exEij+H75TvoeULgyQIsc1xOLr8LMkFtr3FhqLnn+KfHHkDj?=
 =?us-ascii?Q?trkqMIka3cJhtWnnNiWkfZc+y1VZ0qvcKufqsXRtGVwuhlixS5PPbU/e9MPN?=
 =?us-ascii?Q?ayBNJ5C0xgKEuMXqV9V/hj07mxTjbtvWOXzmzOxxo9wrCNp24YjKKoNIyuoO?=
 =?us-ascii?Q?rcl/eklzT0zpCeoFGy54tpphgnAZQ+Fva10Htx8yzHShEVUEK0jMAFb792F/?=
 =?us-ascii?Q?l/YMsbpwh4sQrq7dxDm/AMotMe1uDg/L461Tg7BwpoyHNQp1Au7Zit1x7TxX?=
 =?us-ascii?Q?HSDyIWrUIJ2JngLpVWg8SYfm0dZFUD2ShdOWaXNVRLmrkdtFbld63gsmHUoa?=
 =?us-ascii?Q?H8VqtgAVfGA6iiqFjZlOKU1mcpcDHqlS+FdzK7LOM5aZ+lUSbLaty5qSAd1V?=
 =?us-ascii?Q?boDIuD4i2oUJXjm6kVn8e60C/bwaLLkmzO5eboHuBxCVoNeleOou6TVMRx53?=
 =?us-ascii?Q?Ma8wZzWTRlpFDT/Wv8zJH/ozpJZp5e9QtFm1gnIdC/HGFFor5hQ/YOgLjgqp?=
 =?us-ascii?Q?0D9GM4ZI72U1n26vgjm/Edxttz1p1YiTUO/R8fRQoaj9gvdfaLxEfcmsKci/?=
 =?us-ascii?Q?X3TudTo95+ob4xuTboqdsy0QKUtBaE8BZ/tERHE3YhBF9EIr5tDksy+bcWdR?=
 =?us-ascii?Q?EcmnEJb1M5Yxrvul1fOHqyyP83yB5AbaR4AcoAfkNAxYwEl+6kHDZhuRp2yD?=
 =?us-ascii?Q?BwRwInK5ZBQXrQBIaAMd8BVfS7C37QrDun3E92ocoL/Gx73/KYQUztcBQHMx?=
 =?us-ascii?Q?E9UeTcFz0sypmGzgp9jpIhrC9SNRLSOaGCuMReqRVTWNAl3KtBobmyYmtTle?=
 =?us-ascii?Q?Mt1r8p0TjsRRRjHeUJTuLACkGHHgEsQXZ+ni5bOfKUC0ev4amad4qh6QS9PS?=
 =?us-ascii?Q?OFKT4455ImICFEzAI5Ud6doX2ujVgdZM10F+3ACcaRAiEcKqwYUrELc33xMx?=
 =?us-ascii?Q?I9CyvAKZzWRjaFR7NImyMmws5TRS+TtzykUuXblQNKgJHsxMyx726vXuCkdH?=
 =?us-ascii?Q?KSnRJ3kGhaS6h7EyVL4EjTiDoBQ68l2SVP/5gkGbfmmhhJSubdQuuVYmirXg?=
 =?us-ascii?Q?fBtW5Bt/XdC/2D7PBfJE/zGVWH9XoNkEdcF4evewLwIeb5F5qmRw9j4XU5m9?=
 =?us-ascii?Q?tSEVEl+5yqjTNOFBOmVT4hiVr4s3TY1Ienq+HozAXZT/ZnQXyzeQvv666kTP?=
 =?us-ascii?Q?qyo51A/Y8xS1bEpvdUDPmweThR6cKj9Wekw+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:52:15.3548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cccfec-e41c-4e38-5e56-08ddc02e534a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7205

Introduce helper set_amd_cppc_para() and get_amd_cppc_para() to
SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.

In get_cpufreq_cppc()/set_cpufreq_cppc(), we include
"processor_pminfo[cpuid]->init & XEN_CPPC_INIT" condition check to deal with
cpufreq driver in amd-cppc.

Also, a new field "policy" has also been added in "struct xen_get_cppc_para"
to describe performance policy in active mode. It gets printed with other
cppc paras. Move manifest constants "XEN_CPUFREQ_POLICY_xxx" to public header
to let it be used in user space tools. Also add a new anchor
"XEN_CPUFREQ_POLICY_xxx" for array overrun check.

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
 tools/misc/xenpm.c                   |  11 ++
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 180 +++++++++++++++++++++++++++
 xen/drivers/acpi/pm-op.c             |  10 +-
 xen/include/acpi/cpufreq/cpufreq.h   |  19 +--
 xen/include/public/sysctl.h          |  17 +++
 5 files changed, 219 insertions(+), 18 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 9cb30ea9ce..49766c8d35 100644
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
@@ -825,6 +832,10 @@ static void print_cppc_para(unsigned int cpuid,
     printf("                     : desired [%"PRIu32"%s]\n",
            cppc->desired,
            cppc->desired ? "" : " hw autonomous");
+
+    if ( cppc->policy < CPUFREQ_POLICY_END )
+        printf("  performance policy : %s\n",
+               cpufreq_policy_str[cppc->policy]);
 }
 
 /* print out parameters about cpu frequency */
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index e4bd990982..cee948b12f 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -561,6 +561,186 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
     return 0;
 }
 
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
+    uint8_t max_perf, min_perf, des_perf = 0, epp;
+    bool active_mode;
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    if ( cpufreq_is_governorless(cpu) )
+        active_mode = true;
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
+     * [Nonlinear Lowest Performance, Highest Performance], inclusive.
+     */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM &&
+         (set_cppc->maximum > data->caps.highest_perf ||
+          set_cppc->maximum < data->caps.lowest_nonlinear_perf) )
+        return -EINVAL;
+    /*
+     * Minimum performance may be set to any performance value in the range
+     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
+     * be set to a value that is less than or equal to Maximum Performance.
+     */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM &&
+         (set_cppc->minimum < data->caps.lowest_nonlinear_perf ||
+          (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM &&
+           set_cppc->minimum > set_cppc->maximum) ||
+          (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
+           set_cppc->minimum > data->req.max_perf)) )
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
+        if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM &&
+              set_cppc->desired > set_cppc->maximum) ||
+             (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM &&
+              set_cppc->desired < set_cppc->minimum) ||
+             (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
+              set_cppc->desired > data->req.max_perf) ||
+             (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
+              set_cppc->desired < data->req.min_perf) )
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
+        if ( set_cppc->energy_perf > UINT_MAX )
+            return -EINVAL;
+    }
+
+    /* Activity window not supported in MSR */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        return -EOPNOTSUPP;
+
+    /* Return if there is nothing to do. */
+    if ( set_cppc->set_params == 0 )
+        return 0;
+
+    epp = per_cpu(epp_init, cpu);
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
+        min_perf = data->caps.lowest_nonlinear_perf;
+        /*
+         * Lower max_perf to nonlinear_lowest to achieve
+         * ultmost power saviongs
+         */
+        max_perf = data->caps.lowest_nonlinear_perf;
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        if ( !active_mode )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
+        /* Increase min_perf to highest to achieve ultmost performance */
+        min_perf = data->caps.highest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND:
+        if ( !active_mode )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_ONDEMAND;
+        min_perf = data->caps.lowest_nonlinear_perf;
+        max_perf = data->caps.highest_perf;
+        /*
+         * Take medium value to show no preference over
+         * performance or powersave
+         */
+        epp = CPPC_ENERGY_PERF_BALANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
+        policy->policy = CPUFREQ_POLICY_UNKNOWN;
+        min_perf = data->caps.lowest_nonlinear_perf;
+        max_perf = data->caps.highest_perf;
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
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 54815c444b..164290397e 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -84,6 +84,8 @@ static int get_cpufreq_cppc(unsigned int cpu,
 
     if ( hwp_active() )
         ret = get_hwp_para(cpu, cppc_para);
+    else if ( processor_pminfo[cpu]->init & XEN_CPPC_INIT )
+        ret = get_amd_cppc_para(per_cpu(cpufreq_cpu_policy, cpu), cppc_para);
 
     return ret;
 }
@@ -325,10 +327,12 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -ENOENT;
 
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
+    if ( hwp_active() )
+        return set_hwp_para(policy, &op->u.set_cppc);
+    else if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
+        return set_amd_cppc_para(policy, &op->u.set_cppc);
 
-    return set_hwp_para(policy, &op->u.set_cppc);
+    return -EOPNOTSUPP;
 }
 
 int do_pm_op(struct xen_sysctl_pm_op *op)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index da0456f46d..2bb10dc233 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -133,21 +133,6 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
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
@@ -294,6 +279,10 @@ int acpi_cpufreq_register(void);
 
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
+int get_amd_cppc_para(const struct cpufreq_policy *policy,
+                      struct xen_get_cppc_para *cppc_para);
+int set_amd_cppc_para(struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc);
 
 bool cpufreq_in_cppc_passive_mode(unsigned int cpuid);
 bool cpufreq_is_governorless(unsigned int cpuid);
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 2578a63b01..a6d7aedbad 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -336,8 +336,25 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+/*
+ * Performance Policy
+ * If cpufreq_driver->target() exists, the ->governor decides what frequency
+ * within the limits is used. If cpufreq_driver->setpolicy() exists, these
+ * following policies are available:
+ * CPUFREQ_POLICY_PERFORMANCE represents maximum performance
+ * CPUFREQ_POLICY_POWERSAVE represents least power consumption
+ * CPUFREQ_POLICY_ONDEMAND represents no preference over performance or
+ * powersave
+ */
+#define CPUFREQ_POLICY_UNKNOWN      0
+#define CPUFREQ_POLICY_POWERSAVE    1
+#define CPUFREQ_POLICY_PERFORMANCE  2
+#define CPUFREQ_POLICY_ONDEMAND     3
+#define CPUFREQ_POLICY_END          4
+
 struct xen_get_cppc_para {
     /* OUT */
+    uint32_t policy; /* CPUFREQ_POLICY_xxx */
     /* activity_window supported if set */
 #define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
     uint32_t features; /* bit flags for features */
-- 
2.34.1


