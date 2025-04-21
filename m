Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF66CA94D67
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961103.1352766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmC-0000s4-BT; Mon, 21 Apr 2025 07:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961103.1352766; Mon, 21 Apr 2025 07:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmC-0000mi-11; Mon, 21 Apr 2025 07:41:12 +0000
Received: by outflank-mailman (input) for mailman id 961103;
 Mon, 21 Apr 2025 07:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljR-0007m8-61
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:21 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20622.outbound.protection.outlook.com
 [2a01:111:f403:2408::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97ad78e9-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:19 +0200 (CEST)
Received: from MN0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:208:52c::13)
 by MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 07:38:13 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:52c:cafe::3a) by MN0PR05CA0025.outlook.office365.com
 (2603:10b6:208:52c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Mon,
 21 Apr 2025 07:38:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:12 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:09 -0500
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
X-Inumbo-ID: 97ad78e9-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoMF1mmFDBLaXxhLTXNQmUiU9lj49fR+vbvY5U07GQghEoS4KdkrCTbAzJ8gExgKJhU8422qBMm76ljEz5UrBIBsewRF/LZnuxRbuk/0JMNLBVrF59EjHq+eeFetdeT0jElaKE9vaB6TGF2Lbw7ZsTf5h5GBcJpq6veCQrya+PUOZf7TZEqxtrFSCh6Rgej4zl+RbSYSAzYYf8Pyn64i32NRfpTgcqD5LQcOFTKgp7vC8GwYb58TO4DcXNUyQOHiZR5dKegYVZ6SOzuYD92BNpm25SpkDOw4bQZRZ8iYbfdP2TQBoPbg2BITKpWCBlhNyoWDDNs9Sw/xwjQjVuX/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5lZPUfoWXCbTowP6nydOmEPoS2TEqlQPUd7Xt/sLXQ=;
 b=YonJ3ZVYhczEqtBKB4N5Lcd/vg5LTzKzeiuDYQhpUJ4hS7ad7ShIQAtbeSgrv6Ndkgz49/0vxf8QLQY/Hrto9OUR52JKYH84x9HCNa1OJvOjLGThG24+Tj+QzceeTxJeP8R90JwJdaEtWFAQDRm/fVG1xsVfpfZddVHaKDn1ARyaWesDozEa64hilx4NrktGeEaIvwOUeiXlFd7SXzGaQKr5Y/WJpV0IbAGN0Q3W3l7HvNLhoNcbr9bmIO2gckn0/y971TTWMTvcGoKhJ5inWYiXGb//PsjTfq0i+PTJNyrtZmufCOdMYvAz0T51kx2tYYMm14nypUEXnSpwOAsHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5lZPUfoWXCbTowP6nydOmEPoS2TEqlQPUd7Xt/sLXQ=;
 b=SG1URyxTJSqkleQwJUYi5M4arfuj3lJY89aDhVs1LlRyqcefmMuqvUZ7s8/rk+Eg5Nsu78UkLOeRDvSPvZK6M3IkZd3Ztrgf4eYqdTzFKMygLj76oNKDwxqu5PaZ8aaXJive3KgHCcOKzXavDuSX3XGOZyVZn5anyC9eapZMQBk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 10/20] xen/pmstat: introduce CONFIG_PM_OP
Date: Mon, 21 Apr 2025 15:37:13 +0800
Message-ID: <20250421073723.3863060-11-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|MW6PR12MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8d57e2-2107-47c4-af5d-08dd80a77855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PaCBwlSkn1CPT9Eq1Tsocz5r7liu2Ne6NSD6sDPsugQ2nAvwj3YiZF/fNil/?=
 =?us-ascii?Q?Uh5xhGmfxug4DeQcZbqNTfBozPO/7KWr1YFOZlDeJHKue0EEcgGQOtaF7dBU?=
 =?us-ascii?Q?mgmRo7QtVidAyrXXk+1mLzOzyjXWWzLQmOIdDteDvObbuxcNnyyFNm2lXG1U?=
 =?us-ascii?Q?ieEtQxv68Sa5CORUqyasgMSZ0VUcL/SeYrZJsNXNyCnO8KdZG9avhhNXKh/L?=
 =?us-ascii?Q?8vfG24sBrtvflhJLIMV0CH777Ewzb7RdTo5JRl0+i+Wd8P1uwAcP06HY4V+K?=
 =?us-ascii?Q?3CC+shq5OVyNMuc45kfy64pReqvmJwUnfVnRR9j4d79AqhZn52bXdN/7i/OE?=
 =?us-ascii?Q?pQerlRkID9Nh781d+hwBiK8vRdl5O0pd2zbx6E7sR6da8QwMN0T2EPCiO2rJ?=
 =?us-ascii?Q?ryP2S223gwNHRn+kKxAl7RsLPNEdWX6PPH48Whiz6HmDOJuUqt+DIn5g+F6O?=
 =?us-ascii?Q?WSsDF5Q04EzOOW0BwlDxnO7WdxE2eSDXHpFayX5k56LN1yIL5eS0i2LjIE/E?=
 =?us-ascii?Q?joFtbPETt3QRpgehoPyUEKYtoYl3UkxcHY2xM6zTAozPrgeh6BkYvewG9DKO?=
 =?us-ascii?Q?KsK07IS5nvnzNZFoIMq6EvywEod5PO3WXTSiZOD+fxNT08u1fenVyz3//v6u?=
 =?us-ascii?Q?N04Z3d4X0fFDrTELx9yPfF+tJk7uN5ZDxPEReWPhds3IW8eH4AqmAByjlj1F?=
 =?us-ascii?Q?k7paGJAdYGVIfXT5fzkJLW/n/foxTSgpAc2EQ9uRElj6EBw3ojC8N/iCDCHr?=
 =?us-ascii?Q?ubnm+NJKrTdqIcNHJnZc2gltIVqnog1sWOl1KllsnnfMhplu+pnQbcfZDMf5?=
 =?us-ascii?Q?w/M2m6iNh4aNyqRBcLpAVbIrjndLqOo07xnjiSPlPJR8XHHLMEo/gsGaKPQP?=
 =?us-ascii?Q?RW/fYHWqMj6K44oRBFzt84AfpR45y0oN6q/eOycGXD4sdydqxOHd1ltOaeRE?=
 =?us-ascii?Q?BNK1ClU6l9HsNcT5PmyLO7KxYvWkrzfgexGWMrRyz/3k23LIi2y8a8UPVxbZ?=
 =?us-ascii?Q?gOLs9TnmYgdggShiHVGMO7jUlp/OAWhtENzatj/urbz6V7LFT0FuaI0Qy1Ip?=
 =?us-ascii?Q?Ldrx6u9CJch72EN50CIunfHY8mgpq1ZenwyixhehY5ALny8bRs98nQGqOWmW?=
 =?us-ascii?Q?XGd9xxdZ7Qs6RDvckqbuhn+CpTROlkx9xqAm//uTHwo7klU5F2PhbHqtM9vP?=
 =?us-ascii?Q?odrIUTj6IPko6Y5yPgMHSMcwEBjrUjdDHF25CE4PF5wN8wefiP/B23e4R/RU?=
 =?us-ascii?Q?kAjWCr1qM0f8/oeB1Yh0xAB2zbjioP2s/Mx5k81Awo9Lva/wRz9EeIvp+p2B?=
 =?us-ascii?Q?KLQZm7YvOt/hdQh2UR7C+vdGFZ5KcgZNmpnAFDdnpIOib36Ff7V6K50fOn5T?=
 =?us-ascii?Q?Ekky9FJp8QpwjUhX392vbz/mMSC/YJIHZ3A6FGfemqi6x6ocn2JxkLdeCI3R?=
 =?us-ascii?Q?XIU5WunyPUxYFlkGni4xqsjdNxLmURMq9ns3hhLa2x9Lsf8+BPhvGRIPLxHu?=
 =?us-ascii?Q?WOlhUwxoVW/691JHF5QasZq9HlyMyh7kL66u?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:12.2824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8d57e2-2107-47c4-af5d-08dd80a77855
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952

We move the following functions into a new file drivers/acpi/pm_op.c, as
they are all more fitting in performance controling and only called by
do_pm_op():
 - get_cpufreq_para()
 - set_cpufreq_para()
 - set_cpufreq_gov()
 - set_cpufreq_cppc()
 - cpufreq_driver_getavg()
 - cpufreq_update_turbo()
 - cpufreq_get_turbo_status()
We introduce a new Kconfig CONFIG_PM_OP to wrap the new file.

Also, although the following helpers are only called by do_pm_op(), they have
dependency on local variable, we wrap them with CONFIG_PM_OP in place:
 - write_userspace_scaling_setspeed()
 - write_ondemand_sampling_rate()
 - write_ondemand_up_threshold()
 - get_cpufreq_ondemand_para()
 - cpufreq_driver.update()
 - get_hwp_para()
Various style corrections shall be applied at the same time while moving these
functions, including:
 - add extra space before and after bracket of if() and switch()
 - fix indentation

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3
- new commit
---
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/common/Kconfig                           |   7 +
 xen/common/sysctl.c                          |   4 +-
 xen/drivers/acpi/Makefile                    |   1 +
 xen/drivers/acpi/pm_op.c                     | 409 +++++++++++++++++++
 xen/drivers/acpi/pmstat.c                    | 357 ----------------
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                |  41 --
 xen/include/acpi/cpufreq/cpufreq.h           |   3 -
 11 files changed, 434 insertions(+), 402 deletions(-)
 create mode 100644 xen/drivers/acpi/pm_op.c

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index d5fa3d47ca..e4c09244ab 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -466,6 +466,7 @@ static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
+#ifdef CONFIG_PM_OP
 /*
  * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
  * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
@@ -508,6 +509,7 @@ static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *
 
     return per_cpu(hwp_drv_data, cpu)->ret;
 }
+#endif /* CONFIG_PM_OP */
 
 static const struct cpufreq_driver __initconst_cf_clobber
 hwp_cpufreq_driver = {
@@ -516,9 +518,12 @@ hwp_cpufreq_driver = {
     .target = hwp_cpufreq_target,
     .init   = hwp_cpufreq_cpu_init,
     .exit   = hwp_cpufreq_cpu_exit,
+#ifdef CONFIG_PM_OP
     .update = hwp_cpufreq_update,
+#endif
 };
 
+#ifdef CONFIG_PM_OP
 int get_hwp_para(unsigned int cpu,
                  struct xen_cppc_para *cppc_para)
 {
@@ -639,6 +644,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
     return hwp_cpufreq_target(policy, 0, 0);
 }
+#endif /* CONFIG_PM_OP */
 
 int __init hwp_register_driver(void)
 {
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 69364e1855..12fca45b45 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -49,6 +49,7 @@ static void cf_check transition_pstate(void *pstate)
     wrmsrl(MSR_PSTATE_CTRL, *(unsigned int *)pstate);
 }
 
+#ifdef CONFIG_PM_OP
 static void cf_check update_cpb(void *data)
 {
     struct cpufreq_policy *policy = data;
@@ -77,6 +78,7 @@ static int cf_check powernow_cpufreq_update(
 
     return 0;
 }
+#endif /* CONFIG_PM_OP */
 
 static int cf_check powernow_cpufreq_target(
     struct cpufreq_policy *policy,
@@ -324,7 +326,9 @@ powernow_cpufreq_driver = {
     .target = powernow_cpufreq_target,
     .init   = powernow_cpufreq_cpu_init,
     .exit   = powernow_cpufreq_cpu_exit,
+#ifdef CONFIG_PM_OP
     .update = powernow_cpufreq_update
+#endif
 };
 
 unsigned int __init powernow_register_driver(void)
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 9cccc37232..ca1f692487 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -593,4 +593,11 @@ config SYSCTL
 	  to reduce Xen footprint.
 endmenu
 
+config PM_OP
+	bool "Enable Performance Management Operation"
+	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	default y
+	help
+	  This option shall enable userspace performance management control
+	  to do power/performance analyzing and tuning.
 endmenu
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 2fe76362b1..4ab827b694 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -181,13 +181,15 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     case XEN_SYSCTL_get_pmstat:
         ret = do_get_pm_info(&op->u.get_pmstat);
         break;
+#endif
 
+#ifdef CONFIG_PM_OP
     case XEN_SYSCTL_pm_op:
         ret = do_pm_op(&op->u.pm_op);
         if ( ret == -EAGAIN )
             copyback = 1;
         break;
-#endif
+#endif /* CONFIG_PM_OP */
 
     case XEN_SYSCTL_page_offline_op:
     {
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 2fc5230253..e1f84a4468 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -6,6 +6,7 @@ obj-bin-y += tables.init.o
 obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
+obj-$(CONFIG_PM_OP) += pm_op.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
diff --git a/xen/drivers/acpi/pm_op.c b/xen/drivers/acpi/pm_op.c
new file mode 100644
index 0000000000..3123cb9556
--- /dev/null
+++ b/xen/drivers/acpi/pm_op.c
@@ -0,0 +1,409 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/acpi.h>
+#include <xen/domain.h>
+#include <xen/errno.h>
+#include <xen/guest_access.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+
+#include <acpi/cpufreq/cpufreq.h>
+#include <public/platform.h>
+#include <public/sysctl.h>
+
+/*
+ * 1. Get PM parameter
+ * 2. Provide user PM control
+ */
+static int cpufreq_update_turbo(unsigned int cpu, int new_state)
+{
+    struct cpufreq_policy *policy;
+    int curr_state;
+    int ret = 0;
+
+    if ( new_state != CPUFREQ_TURBO_ENABLED &&
+         new_state != CPUFREQ_TURBO_DISABLED )
+        return -EINVAL;
+
+    policy = per_cpu(cpufreq_cpu_policy, cpu);
+    if ( !policy )
+        return -EACCES;
+
+    if ( policy->turbo == CPUFREQ_TURBO_UNSUPPORTED )
+        return -EOPNOTSUPP;
+
+    curr_state = policy->turbo;
+    if ( curr_state == new_state )
+        return 0;
+
+    policy->turbo = new_state;
+    if ( cpufreq_driver.update )
+    {
+        ret = alternative_call(cpufreq_driver.update, cpu, policy);
+        if ( ret )
+            policy->turbo = curr_state;
+    }
+
+    return ret;
+}
+
+static int cpufreq_get_turbo_status(unsigned int cpu)
+{
+    struct cpufreq_policy *policy;
+
+    policy = per_cpu(cpufreq_cpu_policy, cpu);
+    return policy && policy->turbo == CPUFREQ_TURBO_ENABLED;
+}
+
+static int read_scaling_available_governors(char *scaling_available_governors,
+                                            unsigned int size)
+{
+    unsigned int i = 0;
+    struct cpufreq_governor *t;
+
+    if ( !scaling_available_governors )
+        return -EINVAL;
+
+    list_for_each_entry(t, &cpufreq_governor_list, governor_list)
+    {
+        i += scnprintf(&scaling_available_governors[i],
+                       CPUFREQ_NAME_LEN, "%s ", t->name);
+        if ( i > size )
+            return -EINVAL;
+    }
+    scaling_available_governors[i-1] = '\0';
+
+    return 0;
+}
+
+static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
+{
+    uint32_t ret = 0;
+    const struct processor_pminfo *pmpt;
+    struct cpufreq_policy *policy;
+    uint32_t gov_num = 0;
+    uint32_t *data;
+    char     *scaling_available_governors;
+    struct list_head *pos;
+    unsigned int cpu, i = 0;
+
+    pmpt = processor_pminfo[op->cpuid];
+    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !pmpt || !pmpt->perf.states ||
+         !policy || !policy->governor )
+        return -EINVAL;
+
+    list_for_each(pos, &cpufreq_governor_list)
+        gov_num++;
+
+    if ( (op->u.get_para.cpu_num  != cpumask_weight(policy->cpus)) ||
+         (op->u.get_para.freq_num != pmpt->perf.state_count)    ||
+         (op->u.get_para.gov_num  != gov_num) )
+    {
+        op->u.get_para.cpu_num =  cpumask_weight(policy->cpus);
+        op->u.get_para.freq_num = pmpt->perf.state_count;
+        op->u.get_para.gov_num  = gov_num;
+        return -EAGAIN;
+    }
+
+    if ( !(data = xzalloc_array(uint32_t,
+                                max(op->u.get_para.cpu_num,
+                                    op->u.get_para.freq_num))) )
+        return -ENOMEM;
+
+    for_each_cpu(cpu, policy->cpus)
+        data[i++] = cpu;
+    ret = copy_to_guest(op->u.get_para.affected_cpus,
+                        data, op->u.get_para.cpu_num);
+
+    for ( i = 0; i < op->u.get_para.freq_num; i++ )
+        data[i] = pmpt->perf.states[i].core_frequency * 1000;
+    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
+                         data, op->u.get_para.freq_num);
+
+    xfree(data);
+    if ( ret )
+        return -EFAULT;
+
+    op->u.get_para.cpuinfo_cur_freq =
+        cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
+                           : policy->cur;
+    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
+    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
+    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
+
+    if ( cpufreq_driver.name[0] )
+        strlcpy(op->u.get_para.scaling_driver,
+                cpufreq_driver.name, CPUFREQ_NAME_LEN);
+    else
+        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
+
+    if ( IS_ENABLED(CONFIG_INTEL) &&
+         !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
+                  CPUFREQ_NAME_LEN) )
+        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
+    else
+    {
+        if ( !(scaling_available_governors =
+               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
+            return -ENOMEM;
+        if ( (ret = read_scaling_available_governors(
+                        scaling_available_governors,
+                        (gov_num * CPUFREQ_NAME_LEN *
+                         sizeof(*scaling_available_governors)))) )
+        {
+            xfree(scaling_available_governors);
+            return ret;
+        }
+        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
+                            scaling_available_governors,
+                            gov_num * CPUFREQ_NAME_LEN);
+        xfree(scaling_available_governors);
+        if ( ret )
+            return -EFAULT;
+
+        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
+        op->u.get_para.u.s.scaling_max_freq = policy->max;
+        op->u.get_para.u.s.scaling_min_freq = policy->min;
+
+        if ( policy->governor->name[0] )
+            strlcpy(op->u.get_para.u.s.scaling_governor,
+                    policy->governor->name, CPUFREQ_NAME_LEN);
+        else
+            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
+                    CPUFREQ_NAME_LEN);
+
+        /* governor specific para */
+        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
+                          "userspace", CPUFREQ_NAME_LEN) )
+            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
+
+        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
+                          "ondemand", CPUFREQ_NAME_LEN) )
+            ret = get_cpufreq_ondemand_para(
+                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
+                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
+                &op->u.get_para.u.s.u.ondemand.sampling_rate,
+                &op->u.get_para.u.s.u.ondemand.up_threshold);
+    }
+
+    return ret;
+}
+
+static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
+{
+    struct cpufreq_policy new_policy, *old_policy;
+
+    old_policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+    if ( !old_policy )
+        return -EINVAL;
+
+    memcpy(&new_policy, old_policy, sizeof(struct cpufreq_policy));
+
+    new_policy.governor = __find_governor(op->u.set_gov.scaling_governor);
+    if ( new_policy.governor == NULL )
+        return -EINVAL;
+
+    return __cpufreq_set_policy(old_policy, &new_policy);
+}
+
+static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
+{
+    int ret = 0;
+    struct cpufreq_policy *policy;
+
+    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !policy || !policy->governor )
+        return -EINVAL;
+
+    if ( hwp_active() )
+        return -EOPNOTSUPP;
+
+    switch( op->u.set_para.ctrl_type )
+    {
+    case SCALING_MAX_FREQ:
+    {
+        struct cpufreq_policy new_policy;
+
+        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
+        new_policy.max = op->u.set_para.ctrl_value;
+        ret = __cpufreq_set_policy(policy, &new_policy);
+
+        break;
+    }
+
+    case SCALING_MIN_FREQ:
+    {
+        struct cpufreq_policy new_policy;
+
+        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
+        new_policy.min = op->u.set_para.ctrl_value;
+        ret = __cpufreq_set_policy(policy, &new_policy);
+
+        break;
+    }
+
+    case SCALING_SETSPEED:
+    {
+        unsigned int freq =op->u.set_para.ctrl_value;
+
+        if ( !strncasecmp(policy->governor->name,
+                          "userspace", CPUFREQ_NAME_LEN) )
+            ret = write_userspace_scaling_setspeed(op->cpuid, freq);
+        else
+            ret = -EINVAL;
+
+        break;
+    }
+
+    case SAMPLING_RATE:
+    {
+        unsigned int sampling_rate = op->u.set_para.ctrl_value;
+
+        if ( !strncasecmp(policy->governor->name,
+                          "ondemand", CPUFREQ_NAME_LEN) )
+            ret = write_ondemand_sampling_rate(sampling_rate);
+        else
+            ret = -EINVAL;
+
+        break;
+    }
+
+    case UP_THRESHOLD:
+    {
+        unsigned int up_threshold = op->u.set_para.ctrl_value;
+
+        if ( !strncasecmp(policy->governor->name,
+                          "ondemand", CPUFREQ_NAME_LEN) )
+            ret = write_ondemand_up_threshold(up_threshold);
+        else
+            ret = -EINVAL;
+
+        break;
+    }
+
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
+{
+    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !policy || !policy->governor )
+        return -ENOENT;
+
+    if ( !hwp_active() )
+        return -EOPNOTSUPP;
+
+    return set_hwp_para(policy, &op->u.set_cppc);
+}
+
+int do_pm_op(struct xen_sysctl_pm_op *op)
+{
+    int ret = 0;
+    const struct processor_pminfo *pmpt;
+
+    switch ( op->cmd )
+    {
+    case XEN_SYSCTL_pm_op_set_sched_opt_smt:
+    {
+        uint32_t saved_value = sched_smt_power_savings;
+
+        if ( op->cpuid != 0 )
+            return -EINVAL;
+        sched_smt_power_savings = !!op->u.set_sched_opt_smt;
+        op->u.set_sched_opt_smt = saved_value;
+        return 0;
+    }
+
+    case XEN_SYSCTL_pm_op_get_max_cstate:
+        BUILD_BUG_ON(XEN_SYSCTL_CX_UNLIMITED != UINT_MAX);
+        if ( op->cpuid == 0 )
+            op->u.get_max_cstate = acpi_get_cstate_limit();
+        else if ( op->cpuid == 1 )
+            op->u.get_max_cstate = acpi_get_csubstate_limit();
+        else
+            ret = -EINVAL;
+        return ret;
+
+    case XEN_SYSCTL_pm_op_set_max_cstate:
+        if ( op->cpuid == 0 )
+            acpi_set_cstate_limit(op->u.set_max_cstate);
+        else if ( op->cpuid == 1 )
+            acpi_set_csubstate_limit(op->u.set_max_cstate);
+        else
+            ret = -EINVAL;
+        return ret;
+    }
+
+    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
+        return -EINVAL;
+    pmpt = processor_pminfo[op->cpuid];
+
+    switch ( op->cmd & PM_PARA_CATEGORY_MASK )
+    {
+    case CPUFREQ_PARA:
+        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+            return -ENODEV;
+        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
+            return -EINVAL;
+        break;
+    }
+
+    switch ( op->cmd )
+    {
+    case GET_CPUFREQ_PARA:
+    {
+        ret = get_cpufreq_para(op);
+        break;
+    }
+
+    case SET_CPUFREQ_GOV:
+    {
+        ret = set_cpufreq_gov(op);
+        break;
+    }
+
+    case SET_CPUFREQ_PARA:
+    {
+        ret = set_cpufreq_para(op);
+        break;
+    }
+
+    case SET_CPUFREQ_CPPC:
+        ret = set_cpufreq_cppc(op);
+        break;
+
+    case GET_CPUFREQ_AVGFREQ:
+    {
+        op->u.get_avgfreq = cpufreq_driver_getavg(op->cpuid, USR_GETAVG);
+        break;
+    }
+
+    case XEN_SYSCTL_pm_op_enable_turbo:
+    {
+        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_ENABLED);
+        break;
+    }
+
+    case XEN_SYSCTL_pm_op_disable_turbo:
+    {
+        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_DISABLED);
+        break;
+    }
+
+    default:
+        printk("not defined sub-hypercall @ do_pm_op\n");
+        ret = -ENOSYS;
+        break;
+    }
+
+    return ret;
+}
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index abfdc45cc2..61b60e59a2 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -330,360 +330,3 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
 
     return ret;
 }
-
-/*
- * 1. Get PM parameter
- * 2. Provide user PM control
- */
-static int read_scaling_available_governors(char *scaling_available_governors,
-                                            unsigned int size)
-{
-    unsigned int i = 0;
-    struct cpufreq_governor *t;
-
-    if ( !scaling_available_governors )
-        return -EINVAL;
-
-    list_for_each_entry(t, &cpufreq_governor_list, governor_list)
-    {
-        i += scnprintf(&scaling_available_governors[i],
-                       CPUFREQ_NAME_LEN, "%s ", t->name);
-        if ( i > size )
-            return -EINVAL;
-    }
-    scaling_available_governors[i-1] = '\0';
-
-    return 0;
-}
-
-static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
-{
-    uint32_t ret = 0;
-    const struct processor_pminfo *pmpt;
-    struct cpufreq_policy *policy;
-    uint32_t gov_num = 0;
-    uint32_t *data;
-    char     *scaling_available_governors;
-    struct list_head *pos;
-    unsigned int cpu, i = 0;
-
-    pmpt = processor_pminfo[op->cpuid];
-    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
-
-    if ( !pmpt || !pmpt->perf.states ||
-         !policy || !policy->governor )
-        return -EINVAL;
-
-    list_for_each(pos, &cpufreq_governor_list)
-        gov_num++;
-
-    if ( (op->u.get_para.cpu_num  != cpumask_weight(policy->cpus)) ||
-         (op->u.get_para.freq_num != pmpt->perf.state_count)    ||
-         (op->u.get_para.gov_num  != gov_num) )
-    {
-        op->u.get_para.cpu_num =  cpumask_weight(policy->cpus);
-        op->u.get_para.freq_num = pmpt->perf.state_count;
-        op->u.get_para.gov_num  = gov_num;
-        return -EAGAIN;
-    }
-
-    if ( !(data = xzalloc_array(uint32_t,
-                                max(op->u.get_para.cpu_num,
-                                    op->u.get_para.freq_num))) )
-        return -ENOMEM;
-
-    for_each_cpu(cpu, policy->cpus)
-        data[i++] = cpu;
-    ret = copy_to_guest(op->u.get_para.affected_cpus,
-                        data, op->u.get_para.cpu_num);
-
-    for ( i = 0; i < op->u.get_para.freq_num; i++ )
-        data[i] = pmpt->perf.states[i].core_frequency * 1000;
-    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
-                         data, op->u.get_para.freq_num);
-
-    xfree(data);
-    if ( ret )
-        return -EFAULT;
-
-    op->u.get_para.cpuinfo_cur_freq =
-        cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
-                           : policy->cur;
-    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
-    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
-    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
-
-    if ( cpufreq_driver.name[0] )
-        strlcpy(op->u.get_para.scaling_driver,
-            cpufreq_driver.name, CPUFREQ_NAME_LEN);
-    else
-        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
-
-    if ( IS_ENABLED(CONFIG_INTEL) &&
-         !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
-                  CPUFREQ_NAME_LEN) )
-        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
-    {
-        if ( !(scaling_available_governors =
-               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
-            return -ENOMEM;
-        if ( (ret = read_scaling_available_governors(
-                        scaling_available_governors,
-                        (gov_num * CPUFREQ_NAME_LEN *
-                         sizeof(*scaling_available_governors)))) )
-        {
-            xfree(scaling_available_governors);
-            return ret;
-        }
-        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
-                            scaling_available_governors,
-                            gov_num * CPUFREQ_NAME_LEN);
-        xfree(scaling_available_governors);
-        if ( ret )
-            return -EFAULT;
-
-        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
-        op->u.get_para.u.s.scaling_max_freq = policy->max;
-        op->u.get_para.u.s.scaling_min_freq = policy->min;
-
-        if ( policy->governor->name[0] )
-            strlcpy(op->u.get_para.u.s.scaling_governor,
-                policy->governor->name, CPUFREQ_NAME_LEN);
-        else
-            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
-                    CPUFREQ_NAME_LEN);
-
-        /* governor specific para */
-        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
-                          "userspace", CPUFREQ_NAME_LEN) )
-            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
-
-        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
-                          "ondemand", CPUFREQ_NAME_LEN) )
-            ret = get_cpufreq_ondemand_para(
-                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
-                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
-                &op->u.get_para.u.s.u.ondemand.sampling_rate,
-                &op->u.get_para.u.s.u.ondemand.up_threshold);
-    }
-
-    return ret;
-}
-
-static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
-{
-    struct cpufreq_policy new_policy, *old_policy;
-
-    old_policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
-    if ( !old_policy )
-        return -EINVAL;
-
-    memcpy(&new_policy, old_policy, sizeof(struct cpufreq_policy));
-
-    new_policy.governor = __find_governor(op->u.set_gov.scaling_governor);
-    if (new_policy.governor == NULL)
-        return -EINVAL;
-
-    return __cpufreq_set_policy(old_policy, &new_policy);
-}
-
-static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
-{
-    int ret = 0;
-    struct cpufreq_policy *policy;
-
-    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
-
-    if ( !policy || !policy->governor )
-        return -EINVAL;
-
-    if ( hwp_active() )
-        return -EOPNOTSUPP;
-
-    switch(op->u.set_para.ctrl_type)
-    {
-    case SCALING_MAX_FREQ:
-    {
-        struct cpufreq_policy new_policy;
-
-        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-        new_policy.max = op->u.set_para.ctrl_value;
-        ret = __cpufreq_set_policy(policy, &new_policy);
-
-        break;
-    }
-
-    case SCALING_MIN_FREQ:
-    {
-        struct cpufreq_policy new_policy;
-
-        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-        new_policy.min = op->u.set_para.ctrl_value;
-        ret = __cpufreq_set_policy(policy, &new_policy);
-
-        break;
-    }
-
-    case SCALING_SETSPEED:
-    {
-        unsigned int freq =op->u.set_para.ctrl_value;
-
-        if ( !strncasecmp(policy->governor->name,
-                          "userspace", CPUFREQ_NAME_LEN) )
-            ret = write_userspace_scaling_setspeed(op->cpuid, freq);
-        else
-            ret = -EINVAL;
-
-        break;
-    }
-
-    case SAMPLING_RATE:
-    {
-        unsigned int sampling_rate = op->u.set_para.ctrl_value;
-
-        if ( !strncasecmp(policy->governor->name,
-                          "ondemand", CPUFREQ_NAME_LEN) )
-            ret = write_ondemand_sampling_rate(sampling_rate);
-        else
-            ret = -EINVAL;
-
-        break;
-    }
-
-    case UP_THRESHOLD:
-    {
-        unsigned int up_threshold = op->u.set_para.ctrl_value;
-
-        if ( !strncasecmp(policy->governor->name,
-                          "ondemand", CPUFREQ_NAME_LEN) )
-            ret = write_ondemand_up_threshold(up_threshold);
-        else
-            ret = -EINVAL;
-
-        break;
-    }
-
-    default:
-        ret = -EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
-{
-    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
-
-    if ( !policy || !policy->governor )
-        return -ENOENT;
-
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
-
-    return set_hwp_para(policy, &op->u.set_cppc);
-}
-
-int do_pm_op(struct xen_sysctl_pm_op *op)
-{
-    int ret = 0;
-    const struct processor_pminfo *pmpt;
-
-    switch ( op->cmd )
-    {
-    case XEN_SYSCTL_pm_op_set_sched_opt_smt:
-    {
-        uint32_t saved_value = sched_smt_power_savings;
-
-        if ( op->cpuid != 0 )
-            return -EINVAL;
-        sched_smt_power_savings = !!op->u.set_sched_opt_smt;
-        op->u.set_sched_opt_smt = saved_value;
-        return 0;
-    }
-
-    case XEN_SYSCTL_pm_op_get_max_cstate:
-        BUILD_BUG_ON(XEN_SYSCTL_CX_UNLIMITED != UINT_MAX);
-        if ( op->cpuid == 0 )
-            op->u.get_max_cstate = acpi_get_cstate_limit();
-        else if ( op->cpuid == 1 )
-            op->u.get_max_cstate = acpi_get_csubstate_limit();
-        else
-            ret = -EINVAL;
-        return ret;
-
-    case XEN_SYSCTL_pm_op_set_max_cstate:
-        if ( op->cpuid == 0 )
-            acpi_set_cstate_limit(op->u.set_max_cstate);
-        else if ( op->cpuid == 1 )
-            acpi_set_csubstate_limit(op->u.set_max_cstate);
-        else
-            ret = -EINVAL;
-        return ret;
-    }
-
-    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
-        return -EINVAL;
-    pmpt = processor_pminfo[op->cpuid];
-
-    switch ( op->cmd & PM_PARA_CATEGORY_MASK )
-    {
-    case CPUFREQ_PARA:
-        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
-            return -ENODEV;
-        if ( !pmpt || !(pmpt->perf.init & XEN_PX_INIT) )
-            return -EINVAL;
-        break;
-    }
-
-    switch ( op->cmd )
-    {
-    case GET_CPUFREQ_PARA:
-    {
-        ret = get_cpufreq_para(op);
-        break;
-    }
-
-    case SET_CPUFREQ_GOV:
-    {
-        ret = set_cpufreq_gov(op);
-        break;
-    }
-
-    case SET_CPUFREQ_PARA:
-    {
-        ret = set_cpufreq_para(op);
-        break;
-    }
-
-    case SET_CPUFREQ_CPPC:
-        ret = set_cpufreq_cppc(op);
-        break;
-
-    case GET_CPUFREQ_AVGFREQ:
-    {
-        op->u.get_avgfreq = cpufreq_driver_getavg(op->cpuid, USR_GETAVG);
-        break;
-    }
-
-    case XEN_SYSCTL_pm_op_enable_turbo:
-    {
-        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_ENABLED);
-        break;
-    }
-
-    case XEN_SYSCTL_pm_op_disable_turbo:
-    {
-        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_DISABLED);
-        break;
-    }
-
-    default:
-        printk("not defined sub-hypercall @ do_pm_op\n");
-        ret = -ENOSYS;
-        break;
-    }
-
-    return ret;
-}
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index 0327fad23b..e5cb9ab02f 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -64,6 +64,7 @@ static int cf_check cpufreq_governor_userspace(
     return ret;
 }
 
+#ifdef CONFIG_PM_OP
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
 {
     struct cpufreq_policy *policy;
@@ -80,6 +81,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
 
     return __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
 }
+#endif /* CONFIG_PM_OP */
 
 static bool __init cf_check
 cpufreq_userspace_handle_option(const char *name, const char *val)
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 06cfc88d30..0126a3f5d9 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -57,6 +57,7 @@ static struct dbs_tuners {
 
 static DEFINE_PER_CPU(struct timer, dbs_timer);
 
+#ifdef CONFIG_PM_OP
 int write_ondemand_sampling_rate(unsigned int sampling_rate)
 {
     if ( (sampling_rate > MAX_SAMPLING_RATE / MICROSECS(1)) ||
@@ -93,6 +94,7 @@ int get_cpufreq_ondemand_para(uint32_t *sampling_rate_max,
 
     return 0;
 }
+#endif /* CONFIG_PM_OP */
 
 static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 {
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index 723045b240..987c3b5929 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -224,47 +224,6 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag)
     return policy->cur;
 }
 
-int cpufreq_update_turbo(unsigned int cpu, int new_state)
-{
-    struct cpufreq_policy *policy;
-    int curr_state;
-    int ret = 0;
-
-    if (new_state != CPUFREQ_TURBO_ENABLED &&
-        new_state != CPUFREQ_TURBO_DISABLED)
-        return -EINVAL;
-
-    policy = per_cpu(cpufreq_cpu_policy, cpu);
-    if (!policy)
-        return -EACCES;
-
-    if (policy->turbo == CPUFREQ_TURBO_UNSUPPORTED)
-        return -EOPNOTSUPP;
-
-    curr_state = policy->turbo;
-    if (curr_state == new_state)
-        return 0;
-
-    policy->turbo = new_state;
-    if (cpufreq_driver.update)
-    {
-        ret = alternative_call(cpufreq_driver.update, cpu, policy);
-        if (ret)
-            policy->turbo = curr_state;
-    }
-
-    return ret;
-}
-
-
-int cpufreq_get_turbo_status(unsigned int cpu)
-{
-    struct cpufreq_policy *policy;
-
-    policy = per_cpu(cpufreq_cpu_policy, cpu);
-    return policy && policy->turbo == CPUFREQ_TURBO_ENABLED;
-}
-
 /*********************************************************************
  *                 POLICY                                            *
  *********************************************************************/
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 241117a9af..0742aa9f44 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -143,9 +143,6 @@ extern int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag);
 #define CPUFREQ_TURBO_UNSUPPORTED   0
 #define CPUFREQ_TURBO_ENABLED       1
 
-int cpufreq_update_turbo(unsigned int cpu, int new_state);
-int cpufreq_get_turbo_status(unsigned int cpu);
-
 static inline int
 __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
 {
-- 
2.34.1


