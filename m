Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26FAC4AB3
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997997.1378860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1C-0001LJ-Fy; Tue, 27 May 2025 08:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997997.1378860; Tue, 27 May 2025 08:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1C-0001I1-8E; Tue, 27 May 2025 08:50:42 +0000
Received: by outflank-mailman (input) for mailman id 997997;
 Tue, 27 May 2025 08:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0S-00031E-Jl
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:56 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2413::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ca97f44-3ad7-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:49:51 +0200 (CEST)
Received: from SJ0PR13CA0091.namprd13.prod.outlook.com (2603:10b6:a03:2c5::6)
 by LV2PR12MB5895.namprd12.prod.outlook.com (2603:10b6:408:173::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 08:49:46 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::ff) by SJ0PR13CA0091.outlook.office365.com
 (2603:10b6:a03:2c5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Tue,
 27 May 2025 08:49:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:46 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:42 -0500
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
X-Inumbo-ID: 8ca97f44-3ad7-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuZcWS5V+RmzS9kND5IYgH0rJyLGTHgREl4FY+qUXgHREHBCJZ9+wiRKTeu6flOv6hRONa37VxAurf2ao6S2wolbkBLFIBWfi5qvPhXSZNqufnqF5XViW5EYFL7Qsb6PpY3s6Fpzb1xVNGate5c91MA3lW561yLMmzfIdTlMoBoU0cuVOAvdJjlLB6MYxBBi6NjxD4N/P9RTQWmoFdvhRfu0bqMUZFVnY8OPF3En2jT+OaF07owiHaes2Hk5wzsN+keIBpTn1VvABV5xlnrtRMWw3IFvq47l9EozhY0z9KwNA3NCoFlCuslsoJv6/fswjvBzwFSpP2K4/RDmok7ZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDagGZO2RtNskUq1QiXQkXAONydlZKUYORV/JjISAuM=;
 b=kd2ePY798t00IyIm96Hv/EuN7xhKPxYpGC+aB6fXA+xKLHAqXjPQPhwO8qYDmM8F3UxxWdFyEAJpurznFtisY/RVK+KuBsmrMRylEnMJxXz/fihO48RDh7j6TFb8yf9V0B9w4iWtBMpwG9E3rQKyQtF4YVFk6VoBb5b2TX9Q85vyAYqSF64Dhqb0RVvWF3KaDCvjNO+2fAMpOXq39jAy4/w78Pv6gfdyzJ7lso0wXRHc/3SdS4qsmUc4X7uIACoxhWL7/JLT4Gh54gYuL0yNcUsowWhqLba6kJFtmcEAYm5jIkxY0G4QzHDCL32czb/D4Tbhn7+IWFcHrL5IMsIljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDagGZO2RtNskUq1QiXQkXAONydlZKUYORV/JjISAuM=;
 b=SBRF7aex/lNFS+5xYBbpQvTrd7oF8M2SSciVyobOCt7kKq+sVq4FjAIVUyZRqdeKkPpisAwDfeAWt1nOcYHP2/jirX9aVMBZFeZqk9X/8fYGMQUjlelBqQiyjs0GFoBdsXzGmP7MAdvEdvhAfkcRRAY0OhEkVaKzcQSMLTETlOQ=
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
Subject: [PATCH v5 18/18] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Tue, 27 May 2025 16:48:33 +0800
Message-ID: <20250527084833.338427-19-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|LV2PR12MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a664462-af30-4823-8602-08dd9cfb6e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F7hmuFWIrW43PPJFzv/OGojC1AP6jdziNA1p8pxmF/DulCcLhWcVbgxjWMtW?=
 =?us-ascii?Q?HNf24N+7MEUkYYx2Lzy4EsZCvZTqd6kOBO4gDBvtgeZ6TroE9uIxHZP7z2RP?=
 =?us-ascii?Q?CABb1c4XC7UJA2nJBt5sATMbertA4N7zptPJjEXhiB7Kxd+0mL4iVadHl/lv?=
 =?us-ascii?Q?afJfK5jtRVCYhQbR1AmhsixP4FNiBGb/4HqprfbWfEkcNXVpHoCrQgfNOAi4?=
 =?us-ascii?Q?HRm55cz/TCTWtJ/R/HW9e8PY+O0X1ZFi+j7ykV8HGdzbVp8X3cPORvDUElPb?=
 =?us-ascii?Q?SuhBYYRFWuBFdc5YYqhk18bYpLFT3q6QvxX3MQmK6SioQeXEHV92n+feKk9q?=
 =?us-ascii?Q?Ab+N47ZXJ8IKGyEmMQbE2GK61A7SqjqJBE7Gjv+eRGjbgJnkytoGY5b3lSTa?=
 =?us-ascii?Q?+k0xEUqt6WRg8BQbm43hsXzNVikr1MzFJEMkdj0Y4NL4B2ZNLhSiNaZ6PV3M?=
 =?us-ascii?Q?HisAMhr7JgNYasM8GE0cnFQJXlc26HDtCk+ku5giHX0OhKZr5Ao0RW9CNAKJ?=
 =?us-ascii?Q?WIe1A97P9uOS+1P+W2dO2v8N0KM+CFDfQxV3dWwAie4fOBnyzR2swSSD7Wot?=
 =?us-ascii?Q?dbp7S6Efq2T/Sd/yKDmOzonb4pQV1KACXQVQXQp+af2bqI8Pk/9lbIqgdiW/?=
 =?us-ascii?Q?/4oLu+LxC0EQDT/WcxS8aukT1y8a0IFdfhtVRmdyUHYvtkOhytjS+pReoHYz?=
 =?us-ascii?Q?llRVjS+UUcqyFj/z6NMJUquj1a48igeZKpH375UTUIrey+NN0rQtaVcqTQLJ?=
 =?us-ascii?Q?Ib0TQmxED2QqM365VlAxV4necd5YehGUDePMCWfYaU1k4n28SnGvbCT9RiX1?=
 =?us-ascii?Q?Q2cyMZX4EOWJ+7WprVBOUsSX8OhwgejIm7tenbc8sGyQfPoLRSyvt4q5VyGM?=
 =?us-ascii?Q?B9Uvc+jFn4dd/J/o/Aa/x5GMehE9JznFbWCp83m47WQqoOR05rgYE98XIWZh?=
 =?us-ascii?Q?ZBiQzyd/MOkTOSjYh1LHQpYCU0CCQWDJUl/HIUBF7nSSH8qyEFU6+URNgatF?=
 =?us-ascii?Q?ApofF9dLXRN7HIuQKef5IQTT4FHUzTXOOlAmKYNdhqKzoIq/iMEbSiSICpER?=
 =?us-ascii?Q?VNtn2UkpY/7yQZbKVPODwG1Ah7djYXSnjKROGE+y1MNhXvuoEYRcqh84HmOw?=
 =?us-ascii?Q?ZirItNimbvR4j5Kz+JopTkt+tSAIdaid5kVokXEAOIXIkpgirfiWixL5wAUw?=
 =?us-ascii?Q?trGslwdCpKf3kJpbZ2kt5gvl8iFAJXKsBZjwZe2CZxXtTYSHKiXAw0m6hq2G?=
 =?us-ascii?Q?t6+O/1bFQ7CAjbjqvktU0pgKE3uTa4g/Re4o/RVKZ45imbl2cUWkvMQuASGZ?=
 =?us-ascii?Q?7VNMCqduWXUL1CslCxcbDRxZU5BINy4b4VqNihMBp643XYzg8IaxZrMilqBz?=
 =?us-ascii?Q?B1L7F83pBXAnSFpei/AWgjKKgjMPHzpWV+YezkoZ7TD3+R7QGjhhI/k8h5aM?=
 =?us-ascii?Q?7qdVXeXHPuXotVx0KRmJsD+JMfoGynhp0XOjugtwSmpT/S7KnXv48eKjRy9C?=
 =?us-ascii?Q?2RH6mv9xaMAnlKgmrtj+TmshEiV3WtaP88LQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:46.0563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a664462-af30-4823-8602-08dd9cfb6e8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5895

Introduce helper set_amd_cppc_para() and get_amd_cppc_para() to
SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.

In get_cpufreq_cppc()/set_cpufreq_cppc(), we use
"processor_pminfo[cpuid]->init & XEN_CPPC_INIT" to identify
cpufreq driver is amd-cppc/amd-cppc-epp. Furthermore, using whether
->setpolicy isn't null to tell whether amd-cppc in active mode.

Also, a new field "policy" has also been added in "struct xen_cppc_para" to
describe performance policy in active mode. It gets printed with other
cppc paras. A set of public macro XEN_CPUFREQ_POLICY_xxx is introduced
to be sync with internal ones CPUFREQ_POLICY_xxx.
A new policy XEN_CPUFREQ_POLICY_BALANCE is introduced, and could be achieved
only via xenpm XEN_SYSCTL_CPPC_SET_PRESET_BALANCE preset.

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
- add new field "policy" in "struct xen_cppc_para"
- add new performamce policy XEN_CPUFREQ_POLICY_BALANCE
- drop string comparisons with "processor_pminfo[cpuid]->init & XEN_CPPC_INIT"
and "cpufreq.setpolicy == NULL"
- Blank line ahead of the main "return" of a function
- refactor comments, commit message and title
---
 tools/misc/xenpm.c                   |  10 +++
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 129 +++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c            |  13 ++-
 xen/include/acpi/cpufreq/cpufreq.h   |  12 ++-
 xen/include/public/sysctl.h          |   5 ++
 5 files changed, 163 insertions(+), 6 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 2864506da4..2e5975cae4 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -38,6 +38,13 @@
 static xc_interface *xc_handle;
 static unsigned int max_cpu_nr;
 
+static const char cpufreq_policy_str[][12] = {
+    [XEN_CPUFREQ_POLICY_UNKNOWN] = "none",
+    [XEN_CPUFREQ_POLICY_POWERSAVE] = "powersave",
+    [XEN_CPUFREQ_POLICY_PERFORMANCE] = "performance",
+    [XEN_CPUFREQ_POLICY_BALANCE] = "balance",
+};
+
 /* help message */
 void show_help(void)
 {
@@ -984,6 +991,9 @@ static void print_cppc_para(unsigned int cpuid,
     printf("                     : desired [%"PRIu32"%s]\n",
            cppc->desired,
            cppc->desired ? "" : " hw autonomous");
+
+    printf("  performance policy : %s\n",
+           cpufreq_policy_str[cppc->policy]);
     printf("\n");
 }
 
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 5f15e86dc4..490446018c 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -506,6 +506,135 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
     return 0;
 }
 
+int get_amd_cppc_para(const struct cpufreq_policy *policy,
+                      struct xen_cppc_para *cppc_para)
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
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    /* Validate all parameters */
+    if ( set_cppc->minimum > UINT8_MAX || set_cppc->maximum > UINT8_MAX ||
+         set_cppc->desired > UINT8_MAX || set_cppc->energy_perf > UINT8_MAX )
+        return -EINVAL;
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
+     * XEN_SYSCTL_CPPC_SET_DESIRED reflects whether desired perf is set, which
+     * is also the flag to distinguish between passive mode and active mode.
+     * When it is set, CPPC in passive mode, only
+     * XEN_SYSCTL_CPPC_SET_PRESET_NONE could be chosen.
+     * when it is not set, CPPC in active mode, three different profile
+     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/BALANCE are provided,
+     */
+    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_POWERSAVE;
+        min_perf = data->caps.lowest_perf;
+        /* Lower max frequency to lowest */
+        max_perf = data->caps.lowest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        /* Increase idle frequency to highest */
+        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
+        min_perf = data->caps.highest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_BALANCE;
+        min_perf = data->caps.lowest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_BALANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
+        /*
+         * In paasive mode, Xen governor is responsible for perfomance tuning.
+         * we shall set lowest_perf with "lowest_nonlinear_perf" to ensure
+         * governoring performance in P-states range.
+         */
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
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index e5f375921a..9e1ed29a0a 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -334,6 +334,10 @@ static int get_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( hwp_active() )
         ret = get_hwp_para(op->cpuid, &op->u.cppc_para);
 
+    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
+        ret = get_amd_cppc_para(per_cpu(cpufreq_cpu_policy, op->cpuid),
+                                &op->u.cppc_para);
+
     return ret;
 }
 
@@ -429,10 +433,13 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -ENOENT;
 
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
+    if ( hwp_active() )
+        return set_hwp_para(policy, &op->u.set_cppc);
+
+    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
+        return set_amd_cppc_para(policy, &op->u.set_cppc);
 
-    return set_hwp_para(policy, &op->u.set_cppc);
+    return -EOPNOTSUPP;
 }
 
 int do_pm_op(struct xen_sysctl_pm_op *op)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 6f31009e82..c542a6e633 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -134,14 +134,16 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
 extern struct cpufreq_governor *__find_governor(const char *governor);
 #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
 
-#define CPUFREQ_POLICY_UNKNOWN      0
+#define CPUFREQ_POLICY_UNKNOWN      XEN_CPUFREQ_POLICY_UNKNOWN
 /*
  * If cpufreq_driver->target() exists, the ->governor decides what frequency
  * within the limits is used. If cpufreq_driver->setpolicy() exists, these
  * two generic policies are available:
  */
-#define CPUFREQ_POLICY_POWERSAVE    1
-#define CPUFREQ_POLICY_PERFORMANCE  2
+#define CPUFREQ_POLICY_POWERSAVE    XEN_CPUFREQ_POLICY_POWERSAVE
+#define CPUFREQ_POLICY_PERFORMANCE  XEN_CPUFREQ_POLICY_PERFORMANCE
+/* Achieved only via xenpm XEN_SYSCTL_CPPC_SET_PRESET_BALANCE preset */
+#define CPUFREQ_POLICY_BALANCE      XEN_CPUFREQ_POLICY_BALANCE
 
 unsigned int cpufreq_policy_from_governor(const struct cpufreq_governor *gov);
 
@@ -292,5 +294,9 @@ int acpi_cpufreq_register(void);
 
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
+int get_amd_cppc_para(const struct cpufreq_policy *policy,
+                      struct xen_cppc_para *cppc_para);
+int set_amd_cppc_para(struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 29872fe508..18c38744ae 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -308,6 +308,11 @@ struct xen_ondemand {
 
 struct xen_cppc_para {
     /* OUT */
+#define XEN_CPUFREQ_POLICY_UNKNOWN      0
+#define XEN_CPUFREQ_POLICY_POWERSAVE    1
+#define XEN_CPUFREQ_POLICY_PERFORMANCE  2
+#define XEN_CPUFREQ_POLICY_BALANCE      4
+    uint32_t policy;
     /* activity_window supported if set */
 #define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
     uint32_t features; /* bit flags for features */
-- 
2.34.1


