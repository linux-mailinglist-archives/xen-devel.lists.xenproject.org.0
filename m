Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0572EAC4AB4
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998066.1378897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1c-0004XB-Ps; Tue, 27 May 2025 08:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998066.1378897; Tue, 27 May 2025 08:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1c-0004V5-ME; Tue, 27 May 2025 08:51:08 +0000
Received: by outflank-mailman (input) for mailman id 998066;
 Tue, 27 May 2025 08:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0F-00031E-HV
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:43 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2412::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86839a97-3ad7-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:49:40 +0200 (CEST)
Received: from SJ0PR13CA0105.namprd13.prod.outlook.com (2603:10b6:a03:2c5::20)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.23; Tue, 27 May
 2025 08:49:32 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::2a) by SJ0PR13CA0105.outlook.office365.com
 (2603:10b6:a03:2c5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Tue,
 27 May 2025 08:49:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:28 -0500
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
X-Inumbo-ID: 86839a97-3ad7-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDuHygYFY121d5CqPVsYnxL7KlQzMsQV8wsIxbglHhKZB3KkGdM4A/MkeCoaScaMOLSHeK8D/9dXSNIiFZPfDALq/7TLqTQqyO0QDYZ1tAkEO4AiAbszWgtiogg0HFIaKrj6MmBusDoiE3S5RhWQGCdA0qc2G6Q9VDgSaONlolXibUBWZnENImuWXLjyG+gm8Qi1mfZEDKGxEYhAsUIO8AHGzhnW1EUA7aLDoYE6bAOuI9yGTcZsriDJ5zbuntazd/WiWFvEOq+aeDsErVmH1JyJM7M8gGR9vYxeVKF+3ugSnp8pNSBRfG+cpg5W9rAWAZniGtKF5AinxAX5SbT4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yck7AKHKtbmxCUvtsRyzheF4rrJVBYbut7aEbRVxucI=;
 b=sBTlnLL5wIwPprtT9PYSdZ67L+bwbuNOS+mgTVs4ku2ZTRzZwPzKxk9Lnt2cOUlD6QgCzX+gZ0yUz2KbLwLcxsSYFq6QbU+IvFghx/7TTobj19dSO0BeIO2nAreJ55NpGYe7W66FlzlOOR1N5Ms38Qi7wwQy4wNiCEtBcMFW4Cp/YyXEv3NbJ1owjQ1hVCP7IvS+M2doBIjQtbTmR9VQigwGBi76VWx0z4uu2PL98iil8Jr9j231FesNG58+z9C/yvNNimPg3rzAKt05fyDgRTFm+OKkdIAOa/PTCKXTaMLwGwNuh7HYuLiZeIDBytHGx7F/iq/gbJAjhFL+fRQBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yck7AKHKtbmxCUvtsRyzheF4rrJVBYbut7aEbRVxucI=;
 b=njIeBczp2sQ21hxsElk+YLOD+yerYtA8n5iDCf9htqA5pQLi+ZkNcOLwuHt/dx+wh+eT6l+/w7F3zvwEAF6Hp/mObO2rOQvCtiuTTiHmZhwqJNwqEcDaFZ+aFsvc7Vr9orrWrt9akyUuVwgdVVv5kd3NOozoccwyMCjgUR79q8g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 11/18] xen/x86: implement EPP support for the amd-cppc driver in active mode
Date: Tue, 27 May 2025 16:48:26 +0800
Message-ID: <20250527084833.338427-12-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: c268a789-cbec-46ad-05cf-08dd9cfb6675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+aCMLJa+WILE1FEcHoJAnq4S+aw6ray7ULDI1TkK7a583z8wHfcYuwmTM/og?=
 =?us-ascii?Q?fgz9FjiSMYWCFJmyg0/OBfr4qNmZokXQYkt64ptbEc3uMYdaAIQ8d9clBd3Y?=
 =?us-ascii?Q?dSCbLPjmaquxZHe5ZvOnnfTGYFFWkoa1/yv6VJGUDk23RzKvCXLkn701ojNc?=
 =?us-ascii?Q?5WJEjon1GUrwUJvgO38PMNo+EqrR8+KRLhCfLiM0kPOoG15JPIVYhCFdumw8?=
 =?us-ascii?Q?IL0sUu+Fn4vuPzzENAglNq6h/fzyArEiF/58eY9/22VAgC9ELk1S/Sqgr9mf?=
 =?us-ascii?Q?vbiJTs7DluCKG9oHw0jkxuZMgnLEho4xE090Ie1ZFbdplABvGI2EHPjkJBTp?=
 =?us-ascii?Q?8M4aB0kkpn3kBknQNjLhQm2sXpOV+17b1K1kRHgoukOLtZg70N71Qx+Rq/80?=
 =?us-ascii?Q?Y25sKn5F1Ssm28kPrr10w5EWsfU1Rgv9BGa5576EBGPFlEx+2OJIsIJ6w8ih?=
 =?us-ascii?Q?uMPxAAb53avMN1SksLDoupOm+8EgBgLGX8wz5I3A8bKVDoe4TbvpXSJt+30B?=
 =?us-ascii?Q?UPq99TNIJl1O1DA0ajUGaOi2w09gPrzCvSZ58brg3yLNqpaL8hW1k+3OiyI5?=
 =?us-ascii?Q?ykaR9Iom4d3voONbdR8KZ7+xpKckAASuHdwUeBlgCsihb2PVfen87g7z+Dlk?=
 =?us-ascii?Q?VeTs4sp0Khg93Te98qmDrvGOlpkxdD7mxTj68ywmWRQTmPA4rnJidZQNqx2h?=
 =?us-ascii?Q?TjIIW0JzkQE1l0EaZ4M7E9J0HLYM20cWsVtTPvYL08c7k8zovryUa7H83GLM?=
 =?us-ascii?Q?FXDGpsIlNd+HSDZHcjYg3ZTV+c3qh3hp8VEOw1lBtXBa0T24r+zJGRfZ+1D8?=
 =?us-ascii?Q?edAwSpckqr9XCZ+KC0tKY056LaWkcrUjiwFyj+VgrKZURyWUjTHEZEQJPCZ5?=
 =?us-ascii?Q?dlE4da2RQI7gOIwZEvb5BYwz/IsSCq8kYRtTSZ0RA8ZAGhfFXUnLJo9XEk+Q?=
 =?us-ascii?Q?b5MVBGcDJqo2aKAEpMDO8x7rtULwmAtbnguuSvB0hehdS6aMknqADRV0u5rr?=
 =?us-ascii?Q?+N5jgp1gIRliv3W3afSbxRNmSIFuJIeN9qEWdaq7TacJwUu4Gy1H/qmQsNLQ?=
 =?us-ascii?Q?jQcC1X1BEgTJCUDirHf+A183Ew/lQKzwiwYDTRQ3RKaqkvhwIhFB1glb4Vj9?=
 =?us-ascii?Q?zR9qnSkgMNZmjlONIZc0GOJGJGe/1oeQHoWoMkW+JSd91n4ENg4iqAuAqQxw?=
 =?us-ascii?Q?eVKuzUYuBuBIWl8ajE6A3WO3xUMMZM1knujdSVN0H5vpa6XILzl2RVG2iQiz?=
 =?us-ascii?Q?hjsKZ/GGqnBM3l0BzPbAnWyXimpL8xpBCOSHuRATQOsIA26E2FJpKLBsZFpe?=
 =?us-ascii?Q?pdKV36dxjIk1SMobXLCyGmqXClY4LIvS4OEAJzWTy2hd9vkFrREyk0cVIRVu?=
 =?us-ascii?Q?AQP+jIlWv7qW3pbaU82sAkWShR1GIxHAxkUoK0aiacWGyYtvfVbFPnZUI8EA?=
 =?us-ascii?Q?tp8D4qgngCN1FLExBXwVSB6qNnns3ZGIxzF3Du72fOen+AnRioyArxxYJ36z?=
 =?us-ascii?Q?9JlIvaLTqP9LsW8uNSif/OT5E+GgWu4VJnDY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:32.4883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c268a789-cbec-46ad-05cf-08dd9cfb6675
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274

amd-cppc has 2 operation modes: autonomous (active) mode and
non-autonomous (passive) mode.
In active mode, we don't need Xen governor to calculate and tune the cpu
frequency, while hardware built-in CPPC power algorithm will calculate the
runtime workload and adjust cores frequency automatically according to the
power supply, thermal, core voltage and some other hardware conditions.

Users could set EPP register to tell hardware their preference ratio toward
performance over energy efficiency, which is configured on a scale from 0 to
255 where 0 represents maximum performance and 255 represents maximum
efficiency.

We implement a new AMD CPU frequency driver `amd-cppc-epp` for active mode.
It requires `active` tag for users to explicitly select active mode.
In driver `active-cppc-epp`, ->setpolicy() is hooked, not the ->target(), as
it does not depend on xen governor to do performance tuning.

Users could re-use "governor" in Xen cmdline to deliver which performance
policy they want to apply, represented by a new field "policy"
(CPUFREQ_POLICY_xxx), CPUFREQ_POLICY_PERFORMANCE as maximum performance,
CPUFREQ_POLICY_POWERSAVE as the least power consumption.
Function cpufreq_policy_from_governor() is responsible for tranforming
governor into policy. Right now, only "performance" and "powersave" are
considered.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Remove redundant epp_mode
- Remove pointless initializer
- Define sole caller read_epp_init_once and epp_init value to read
pre-defined BIOS epp value only once
- Combine the commit "xen/cpufreq: introduce policy type when
cpufreq_driver->setpolicy exists"
---
v2 -> v3:
- Combined with commit "x86/cpufreq: add "cpufreq=amd-cppc,active" para"
- Refactor doc about "active mode"
- Change opt_cpufreq_active to opt_active_mode
- Let caller pass epp_init when unspecified to allow the function parameter
to be of uint8_t
- Make epp_init per-cpu value
---
v3 -> v4:
- doc refinement
- use MASK_EXTR() to get epp value
- fix indentation
- replace if-else() with switch()
- combine successive comments and do refinement
- no need to introduce amd_cppc_epp_update_limit() as a wrapper
- rename cpufreq_parse_policy() with cpufreq_policy_from_governor()
- no need to use case-insensitive comparison
---
v4 -> v5:
- refine doc to state what the default is for "active" sub-option and it's of
boolean nature
- excess blank after << for AMD_CPPC_EPP_MASK
- set max_perf with lowest_perf to get utmost powersave
- refine commit message to include description about relation between "policy"
and "governor"
---
 docs/misc/xen-command-line.pandoc    |  10 ++-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 123 ++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/msr-index.h |   1 +
 xen/drivers/cpufreq/utility.c        |  11 +++
 xen/include/acpi/cpufreq/cpufreq.h   |  12 +++
 xen/include/public/sysctl.h          |   1 +
 6 files changed, 153 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9ef847a336..23518b2ae4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -515,7 +515,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[verbose]]`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[active][,verbose]]`
 
 > Default: `xen`
 
@@ -537,6 +537,14 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
   on supported AMD hardware to provide finer grained frequency control
   mechanism. The default is disabled.
+* `active` is a boolean to enable amd-cppc driver in active(autonomous) mode.
+  In this mode, users could write to energy performance preference
+  register(epp) to tell hardware if they want to bias toward performance or
+  energy efficiency. Built-in CPPC power algorithm will calculate the runtime
+  workload and adjust cores frequency automatically according to the power
+  supply, thermal, core voltage and some other hardware conditions.
+  The default is disabled, and the option only applies when `amd-cppc` is
+  enabled.
 
 There is also support for `;`-separated fallback options:
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 8f0a30c19d..5f15e86dc4 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -30,6 +30,9 @@
         printk(XENLOG_DEBUG "AMD_CPPC: CPU%u " fmt, cpu, ## args);  \
 })
 
+static bool __ro_after_init opt_active_mode;
+static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
+
 struct amd_cppc_drv_data
 {
     const struct xen_processor_cppc *cppc_data;
@@ -76,6 +79,13 @@ static bool __init amd_cppc_handle_option(const char *s, const char *end)
         return true;
     }
 
+    ret = parse_boolean("active", s, end);
+    if ( ret >= 0 )
+    {
+        opt_active_mode = ret;
+        return true;
+    }
+
     return false;
 }
 
@@ -224,11 +234,18 @@ static void cf_check amd_cppc_write_request_msrs(void *info)
 }
 
 static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
-                                   uint8_t des_perf, uint8_t max_perf)
+                                   uint8_t des_perf, uint8_t max_perf,
+                                   uint8_t epp)
 {
     struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
     uint64_t prev = data->req.raw;
 
+    if ( !opt_active_mode )
+        data->req.des_perf = des_perf;
+    else
+        data->req.des_perf = 0;
+    data->req.epp = epp;
+
     data->req.min_perf = min_perf;
     data->req.max_perf = max_perf;
     data->req.des_perf = des_perf;
@@ -239,6 +256,14 @@ static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
     on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);
 }
 
+static void read_epp_init(void)
+{
+    uint64_t val;
+
+    rdmsrl(MSR_AMD_CPPC_REQ, val);
+    this_cpu(epp_init) = MASK_EXTR(val, AMD_CPPC_EPP_MASK);
+}
+
 static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
                                             unsigned int target_freq,
                                             unsigned int relation)
@@ -260,7 +285,10 @@ static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
      * performance in P-state range.
      */
     amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
-                           des_perf, data->caps.highest_perf);
+                           des_perf, data->caps.highest_perf,
+                           /* Pre-defined BIOS value for passive mode */
+                           per_cpu(epp_init, policy->cpu));
+
     return 0;
 }
 
@@ -336,6 +364,8 @@ static void cf_check amd_cppc_init_msrs(void *info)
      */
     policy->cur = cpufreq_driver_getavg(policy->cpu, GOV_GETAVG);
 
+    read_epp_init();
+
     return;
 
  err:
@@ -369,7 +399,7 @@ static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
-static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+static int amd_cppc_cpufreq_init_perf(struct cpufreq_policy *policy)
 {
     unsigned int cpu = policy->cpu;
     struct amd_cppc_drv_data *data;
@@ -402,12 +432,80 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     amd_cppc_boost_init(policy, data);
 
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    int ret;
+
+    ret = amd_cppc_cpufreq_init_perf(policy);
+    if ( ret )
+        return ret;
+
     amd_cppc_verbose(policy->cpu,
                      "CPU initialized with amd-cppc passive mode\n");
 
     return 0;
 }
 
+static int cf_check amd_cppc_epp_cpu_init(struct cpufreq_policy *policy)
+{
+    int ret;
+
+    ret = amd_cppc_cpufreq_init_perf(policy);
+    if ( ret )
+        return ret;
+
+    policy->policy = cpufreq_policy_from_governor(policy->governor);
+
+    amd_cppc_verbose(policy->cpu,
+                     "CPU initialized with amd-cppc active mode\n");
+
+    return 0;
+}
+
+static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
+                                                   policy->cpu);
+    uint8_t max_perf, min_perf, epp;
+
+    /*
+     * min_perf represents the idle frequency, while max_perf represents
+     * the maximum frequency
+     */
+    max_perf = data->caps.highest_perf;
+    min_perf = data->caps.lowest_perf;
+
+    /*
+     * We set min_perf with highest_perf in performance mode
+     * and max_perf with lowest_perf in powersave mode, to achieve
+     * ultmost performance and power savings.
+     */
+    switch ( policy->policy )
+    {
+    case CPUFREQ_POLICY_PERFORMANCE:
+        /* Force the epp value to be zero for performance policy */
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        min_perf = data->caps.highest_perf;
+        break;
+    case CPUFREQ_POLICY_POWERSAVE:
+        /* Force the epp value to be 0xff for powersave policy */
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        max_perf = data->caps.lowest_perf;
+        break;
+    default:
+        epp = per_cpu(epp_init, policy->cpu);
+        break;
+    }
+
+    amd_cppc_write_request(policy->cpu, min_perf,
+                           0 /* no des_perf for epp mode */,
+                           max_perf, epp);
+    return 0;
+}
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
@@ -418,13 +516,30 @@ amd_cppc_cpufreq_driver =
     .exit   = amd_cppc_cpufreq_cpu_exit,
 };
 
+static const struct cpufreq_driver __initconst_cf_clobber
+amd_cppc_epp_driver =
+{
+    .name       = XEN_AMD_CPPC_EPP_DRIVER_NAME,
+    .verify     = amd_cppc_cpufreq_verify,
+    .setpolicy  = amd_cppc_epp_set_policy,
+    .init       = amd_cppc_epp_cpu_init,
+    .exit       = amd_cppc_cpufreq_cpu_exit,
+};
+
 int __init amd_cppc_register_driver(void)
 {
+    int ret;
+
     if ( !cpu_has_cppc )
     {
         xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
         return -ENODEV;
     }
 
-    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+    if ( opt_active_mode )
+        ret = cpufreq_register_driver(&amd_cppc_epp_driver);
+    else
+        ret = cpufreq_register_driver(&amd_cppc_cpufreq_driver);
+
+    return ret;
 }
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index e4401186c7..3e2522a862 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -242,6 +242,7 @@
 #define MSR_AMD_CPPC_ENABLE                 0xc00102b1U
 #define  AMD_CPPC_ENABLE                    (_AC(1, ULL) << 0)
 #define MSR_AMD_CPPC_REQ                    0xc00102b3U
+#define  AMD_CPPC_EPP_MASK                  (_AC(0xff, ULL) << 24)
 
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index b35e2eb1b6..2617581125 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -487,3 +487,14 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
 
     return __cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 }
+
+unsigned int cpufreq_policy_from_governor(const struct cpufreq_governor *gov)
+{
+    if ( !strncmp(gov->name, "performance", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_PERFORMANCE;
+
+    if ( !strncmp(gov->name, "powersave", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_POWERSAVE;
+
+    return CPUFREQ_POLICY_UNKNOWN;
+}
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 83050c58b2..6f31009e82 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -83,6 +83,7 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
+    unsigned int        policy; /* CPUFREQ_POLICY_* */
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
@@ -133,6 +134,17 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
 extern struct cpufreq_governor *__find_governor(const char *governor);
 #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
 
+#define CPUFREQ_POLICY_UNKNOWN      0
+/*
+ * If cpufreq_driver->target() exists, the ->governor decides what frequency
+ * within the limits is used. If cpufreq_driver->setpolicy() exists, these
+ * two generic policies are available:
+ */
+#define CPUFREQ_POLICY_POWERSAVE    1
+#define CPUFREQ_POLICY_PERFORMANCE  2
+
+unsigned int cpufreq_policy_from_governor(const struct cpufreq_governor *gov);
+
 /* pass a target to the cpufreq driver */
 extern int __cpufreq_driver_target(struct cpufreq_policy *policy,
                                    unsigned int target_freq,
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 42997252ef..fa431fd983 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -424,6 +424,7 @@ struct xen_set_cppc_para {
 };
 
 #define XEN_AMD_CPPC_DRIVER_NAME "amd-cppc"
+#define XEN_AMD_CPPC_EPP_DRIVER_NAME "amd-cppc-epp"
 #define XEN_HWP_DRIVER_NAME "hwp"
 
 /*
-- 
2.34.1


