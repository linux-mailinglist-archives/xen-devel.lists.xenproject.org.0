Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613EC9E4D54
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 06:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848860.1263667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4eF-0002oW-79; Thu, 05 Dec 2024 05:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848860.1263667; Thu, 05 Dec 2024 05:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4eF-0002mW-3M; Thu, 05 Dec 2024 05:43:35 +0000
Received: by outflank-mailman (input) for mailman id 848860;
 Thu, 05 Dec 2024 05:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=coHJ=S6=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tJ4eD-0001z8-IB
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 05:43:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc455609-b2cb-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 06:43:32 +0100 (CET)
Received: from DS7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::26) by
 PH8PR12MB7181.namprd12.prod.outlook.com (2603:10b6:510:22a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Thu, 5 Dec
 2024 05:43:27 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::46) by DS7P222CA0017.outlook.office365.com
 (2603:10b6:8:2e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Thu,
 5 Dec 2024 05:43:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 05:43:26 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 23:43:23 -0600
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
X-Inumbo-ID: dc455609-b2cb-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2myruzZq6Lyh6/aNpzGbce9kl2lX3JhD2RiEihN+BAOD8lNlb29Hq2tRrUFWG3lEs30RVAntG+gAlS8zB9UdWczNlZmvxwADvcWibl0CmzBHt1sguY8y7xV3xX6WPbclXqjNWZlVVUfRODSRgA+pWpVfBgjumgBIDnceAeVGbU/TQzky2XVh042oLM9QU6l96oU+bkd6UlCa1B+cHgXes3G0IpWx9ndaQghprqZV/E74SvwM6vZOw0nr8waZgsaZKklfzy7YH72x2EJk97H4qUqFAZfHKZW74b6c9ev0TsARU+camC5WXdtCFWnFLoLWf0YFQO/iC+Ljv17/jtegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFOJrAd0KMsoZrN9Shjj1dooQzMESP1akwRRETW6xhI=;
 b=GMZhXYwPHmkAtCCLbxYdpUXgylFiQ+L7bGRHtGCAXvNXme6/LLJWwIqpaAMgvElOvUFMwcmGVzgjWTcTz+81stLbwI7XsXhUU+lC5cQ8QqH1r0DdfALOjN1Z45LsO6rB+GE4qtIpxsxbOKcuA94Ou99F7Q9p6Aug5V5mDMeCCjVpw9uRS11/FxHlKlVIC0rdBigqCVgBx/2Rv0a4d+fA6/V8hfqItpUBNVnsj2qLi/MzP9S9GGpR8XbghkPiApgnaOIgH6eV1ZR17sK3RsCXMj4yDcMgqIhsk5zb8g9vI/DA4FxJ57Yfku+8qMIj8ocHczHVtd1O1aYUB8UZ49EfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFOJrAd0KMsoZrN9Shjj1dooQzMESP1akwRRETW6xhI=;
 b=ens/F7esvTX9U4hlVjvFwAwKPCgacatzecxS8uSDfkrIoDq87HsSVLxonE1jtmji1hcP8EAe87VWJsZd3XTPsy+ph4PrMP5MjdLsM3y2BMf6N1sSKrkyzKwPxlw1ZckjJurNNqk37g+MiJxWDX56mwAJBPct93mJ+QlPBklxBT0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Ray Huang <Ray.Huang@amd.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, Jason Andryuk <jason.andryuk@amd.com>, "Penny
 Zheng" <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] xen/cppc: get xen-required cppc perf caps data
Date: Thu, 5 Dec 2024 13:42:51 +0800
Message-ID: <20241205054252.471761-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241205054252.471761-1-Penny.Zheng@amd.com>
References: <20241205054252.471761-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|PH8PR12MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 77293042-9397-4491-4cd8-08dd14efbd82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hA5gdBlM4rCRgjPyC3wKnk76+FoHivFpgWQppyuuYLoJDL9I06SyhMORBdWJ?=
 =?us-ascii?Q?/n5G63Qq+VTSOvan+vD+Sg4NCZ5qv3ebBVLgj9JDZAy7BaIbDDdfWn5D3XnK?=
 =?us-ascii?Q?NoIfSLRVk1g4/Ivv4N41PvrbkT2B66JukXfTqHIIWmy4INqojAskb8j5wpgG?=
 =?us-ascii?Q?IiCUXlKu+GGDs+Yr0Nee7RvB0XMR7/PqrFHWg1Czj/jqWR3NoLqrYhqWS6tL?=
 =?us-ascii?Q?mo/ytzB68MThvAijxqWPGRshb8LhdAivZwylFl6coUptfIF+d1m3lish7KOr?=
 =?us-ascii?Q?kFtbPS6wskZqple8Xh9GNtPjjq0aTXddeAUPg+ei2kZQiyXO9yGBA+1A8z6M?=
 =?us-ascii?Q?LYSG8evphqQuoTx5RaAKExZBE+lX4pr21amQ78s8IklltdTR6BEUhxLN78Ge?=
 =?us-ascii?Q?kVjKbBhwcl0RwMUVw1YbaQtIs7hCiV5Hki7YnAm+Q2D4tCCL/5zPLBiGP0Mt?=
 =?us-ascii?Q?rNpvv6IIXfGj5X3Jqnu1nFfYyEgpui1qj4EST311YSk8+wmNKSRD8kIOa8o0?=
 =?us-ascii?Q?yEcZRduNrKUhqCERUCwT5saRjq1eoy3Hmsy5l2ekt9ZDj6DHnK0k7KMT78nY?=
 =?us-ascii?Q?bPq31jzmWVtYTVjqK0UWUAvh9esurwr0lOtDdDNRbIChLsqBbhP1hJ4wqtwh?=
 =?us-ascii?Q?McKie1JHabCTgpNTwPuTD2SZjqRzrf97rEVVqFkYfWYuQQGexRaKYyGrETKy?=
 =?us-ascii?Q?NzO8vkje8UOWx/So4D0erW0acVhTdSgJzExvBrFZI44H18T1TmuJSPs67nG4?=
 =?us-ascii?Q?Q8gcZ99fiX/n7SvwNRfX3H1bdbKeDvklQFP/pVGm1BMdXQZ5DrTB/+3P+ulA?=
 =?us-ascii?Q?4X/axEOmz7R/e+95ZApwFkhl7ETTWrgTgcK54WJPb0oAJihoTvZ3BYQ4g9GA?=
 =?us-ascii?Q?1i+vuoMKr8TnhobFqSpv4u20ZUM+GUY6BhC/3pVG5mBeLjtU7Vvb35EDT+OC?=
 =?us-ascii?Q?fW+HYFv08NOKUbSM6nYDx1r72tlOJL4r2Q3unYizn7n5gAnqjPQN0zsd8L63?=
 =?us-ascii?Q?6tk/olrnookcM0acO22T1YJiVHt/i61BvHzaOLri84sE3mzfcleMATWSRDBH?=
 =?us-ascii?Q?APA0UQkLUlQwn59hyNEECN57cKE9d52sFZWCJTk3602EwhtLM5ctY9IcEHEY?=
 =?us-ascii?Q?iHdEUHgXdvPM/94GbPViJCscGrjBh7gn4QAHWv8ekMwhI/3tZva3Mo1KUNwa?=
 =?us-ascii?Q?q4O47P6lmmSoz7FcqkdFH/50sVMtCfTU8yFEt0/ChsCwA7484QMquFg1Nxlf?=
 =?us-ascii?Q?YUUFa8nnQWPxYGz/4jOf//f+Vzv33EFPcAwM+fyyqqZ2e3lRKKq45/GdYy+K?=
 =?us-ascii?Q?LV/47e6M0ff4b82nVYfF0yxp8Gjskv0I/r5e4Vq8HUkIWT7Uf0QDV7cuSNFY?=
 =?us-ascii?Q?nFWOqWttsjjkBNsD6sug6xc7FusVBRD/Ig2os0OyWQto1q9QvRtOuk2Ummvq?=
 =?us-ascii?Q?Qe4i0eXYcb1b8+EAlImZ4xvu62LkuMLa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 05:43:26.3932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77293042-9397-4491-4cd8-08dd14efbd82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7181

When running as Xen dom0 PVH guest, processor logical id <-> physical
id map could not be properly set up. So the original function
cppc_get_perf_caps() fails to get correct cppc data for Xen ACPI
processor.

A new function xen_processor_get_perf_caps() is introduced to
get xen-required cppc perf caps data.

Also, as Xen couldn't read and process PCC-type register, this commit
includes a new flag pcc_unsupported in struct acpi_processor_flags to
tell whether platform supports PCC-type register.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 drivers/acpi/cppc_acpi.c | 110 +++++++++++++++++++++++++++++++++++----
 include/acpi/cppc_acpi.h |   5 ++
 include/acpi/processor.h |   1 +
 3 files changed, 105 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index 13d6ff84a1e9..3a436591da07 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -772,6 +772,15 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
 			 * so extract it only once.
 			 */
 			if (gas_t->space_id == ACPI_ADR_SPACE_PLATFORM_COMM) {
+				/*
+				 * When ACPI processor represents Xen processor, PCC register type
+				 * could not be properly read and processed right now, as logical
+				 * processor doesn't always have 1:1 map relation to physical processor.
+				 */
+				if (pr->flags.pcc_unsupported) {
+					pr_debug("Unsupported PCC register type:%d\n", pr->acpi_id);
+					goto out_free;
+				}
 				if (pcc_subspace_id < 0) {
 					pcc_subspace_id = gas_t->access_width;
 					if (pcc_data_alloc(pcc_subspace_id))
@@ -837,7 +846,9 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
 			goto out_free;
 		}
 	}
-	per_cpu(cpu_pcc_subspace_idx, pr->id) = pcc_subspace_id;
+
+	if (!pr->flags.pcc_unsupported)
+		per_cpu(cpu_pcc_subspace_idx, pr->id) = pcc_subspace_id;
 
 	/*
 	 * Initialize the remaining cpc_regs as unsupported.
@@ -1018,8 +1029,7 @@ int __weak cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val)
 static int cpc_read(int cpu, struct cpc_register_resource *reg_res, u64 *val)
 {
 	void __iomem *vaddr = NULL;
-	int size;
-	int pcc_ss_id = per_cpu(cpu_pcc_subspace_idx, cpu);
+	int size, pcc_ss_id;
 	struct cpc_reg *reg = &reg_res->cpc_entry.reg;
 
 	if (reg_res->type == ACPI_TYPE_INTEGER) {
@@ -1044,14 +1054,17 @@ static int cpc_read(int cpu, struct cpc_register_resource *reg_res, u64 *val)
 
 		*val = val_u32;
 		return 0;
-	} else if (reg->space_id == ACPI_ADR_SPACE_PLATFORM_COMM && pcc_ss_id >= 0) {
-		/*
-		 * For registers in PCC space, the register size is determined
-		 * by the bit width field; the access size is used to indicate
-		 * the PCC subspace id.
-		 */
-		size = reg->bit_width;
-		vaddr = GET_PCC_VADDR(reg->address, pcc_ss_id);
+	} else if (reg->space_id == ACPI_ADR_SPACE_PLATFORM_COMM) {
+		pcc_ss_id = per_cpu(cpu_pcc_subspace_idx, cpu);
+		if (pcc_ss_id >= 0) {
+			/*
+			 * For registers in PCC space, the register size is determined
+			 * by the bit width field; the access size is used to indicate
+			 * the PCC subspace id.
+			 */
+			size = reg->bit_width;
+			vaddr = GET_PCC_VADDR(reg->address, pcc_ss_id);
+		}
 	}
 	else if (reg->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY)
 		vaddr = reg_res->sys_mem_vaddr;
@@ -1282,6 +1295,81 @@ int cppc_get_epp_perf(int cpunum, u64 *epp_perf)
 }
 EXPORT_SYMBOL_GPL(cppc_get_epp_perf);
 
+
+int xen_processor_get_perf_caps(struct acpi_processor *pr, struct cppc_perf_caps *perf_caps)
+{
+	struct cpc_desc *cpc_ptr;
+	struct cpc_register_resource *highest_reg, *lowest_reg,
+		*lowest_non_linear_reg, *nominal_reg,
+		*low_freq_reg = NULL, *nom_freq_reg = NULL;
+	u64 high, low, nom, min_nonlinear, low_f = 0, nom_f = 0;
+	int ret = 0;
+
+	cpc_ptr = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
+	if (!cpc_ptr)
+		return -ENOMEM;
+
+	ret = acpi_cppc_processor_parse(pr, cpc_ptr);
+	if (ret)
+		goto err;
+
+	highest_reg = &cpc_ptr->cpc_regs[HIGHEST_PERF];
+	lowest_reg = &cpc_ptr->cpc_regs[LOWEST_PERF];
+	lowest_non_linear_reg = &cpc_ptr->cpc_regs[LOW_NON_LINEAR_PERF];
+	nominal_reg = &cpc_ptr->cpc_regs[NOMINAL_PERF];
+	low_freq_reg = &cpc_ptr->cpc_regs[LOWEST_FREQ];
+	nom_freq_reg = &cpc_ptr->cpc_regs[NOMINAL_FREQ];
+
+	/* Are any of the regs PCC ?*/
+	if (CPC_IN_PCC(highest_reg) || CPC_IN_PCC(lowest_reg) ||
+		CPC_IN_PCC(lowest_non_linear_reg) || CPC_IN_PCC(nominal_reg) ||
+		CPC_IN_PCC(low_freq_reg) || CPC_IN_PCC(nom_freq_reg)) {
+		pr_debug("Unsupported register type read for Xen Processor %d,"
+			 "highest_reg in PCC: %s, lowest_reg in PCC: %s,"
+			 "lowest_non_linear_reg in PCC: %s, nominal_reg in PCC: %s,"
+			 "low_freq_reg in PCC: %s, nom_freq_reg in PCC: %s\n",
+			 pr->acpi_id, CPC_IN_PCC(highest_reg) ? "true" : "false",
+			 CPC_IN_PCC(lowest_reg) ? "true" : "false",
+			 CPC_IN_PCC(lowest_non_linear_reg) ? "true" : "false",
+			 CPC_IN_PCC(nominal_reg) ? "true" : "false",
+			 CPC_IN_PCC(low_freq_reg) ? "true" : "false",
+			 CPC_IN_PCC(nom_freq_reg) ? "true" : "false");
+		goto err;
+	}
+
+	cpc_read(pr->acpi_id, highest_reg, &high);
+	perf_caps->highest_perf = high;
+
+	cpc_read(pr->acpi_id, lowest_reg, &low);
+	perf_caps->lowest_perf = low;
+
+	cpc_read(pr->acpi_id, nominal_reg, &nom);
+	perf_caps->nominal_perf = nom;
+
+	cpc_read(pr->id, lowest_non_linear_reg, &min_nonlinear);
+	perf_caps->lowest_nonlinear_perf = min_nonlinear;
+
+	if (!high || !low || !nom || !min_nonlinear)
+		pr_warn("CPPC: read zero cpc register value for Xen Processor %d"
+			"highest_reg: %llu, lowest_reg: %llu"
+			"nominal_reg: %llu, lowest_non_linear_reg: %llu\n",
+			pr->acpi_id, high, low, nom, min_nonlinear);
+
+	/* Read optional lowest and nominal frequencies if present */
+	if (CPC_SUPPORTED(low_freq_reg))
+		cpc_read(pr->acpi_id, low_freq_reg, &low_f);
+
+	if (CPC_SUPPORTED(nom_freq_reg))
+		cpc_read(pr->acpi_id, nom_freq_reg, &nom_f);
+
+	perf_caps->lowest_freq = low_f;
+	perf_caps->nominal_freq = nom_f;
+
+ err:
+	kfree(cpc_ptr);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xen_processor_get_perf_caps);
 /**
  * cppc_get_perf_caps - Get a CPU's performance capabilities.
  * @cpunum: CPU from which to get capabilities info.
diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
index 76e44e102780..2281110c00b7 100644
--- a/include/acpi/cppc_acpi.h
+++ b/include/acpi/cppc_acpi.h
@@ -164,6 +164,7 @@ extern int cppc_set_auto_sel(int cpu, bool enable);
 extern int amd_get_highest_perf(unsigned int cpu, u32 *highest_perf);
 extern int amd_get_boost_ratio_numerator(unsigned int cpu, u64 *numerator);
 extern int amd_detect_prefcore(bool *detected);
+extern int xen_processor_get_perf_caps(struct acpi_processor *pr, struct cppc_perf_caps *perf_caps);
 #else /* !CONFIG_ACPI_CPPC_LIB */
 static inline int cppc_get_desired_perf(int cpunum, u64 *desired_perf)
 {
@@ -249,6 +250,10 @@ static inline int amd_detect_prefcore(bool *detected)
 {
 	return -ENODEV;
 }
+static inline int xen_processor_get_perf_caps(struct acpi_processor *pr, struct cppc_perf_caps *perf_caps)
+{
+	return -ENOTSUPP;
+}
 #endif /* !CONFIG_ACPI_CPPC_LIB */
 
 #endif /* _CPPC_ACPI_H*/
diff --git a/include/acpi/processor.h b/include/acpi/processor.h
index e6f6074eadbf..18499cc11366 100644
--- a/include/acpi/processor.h
+++ b/include/acpi/processor.h
@@ -214,6 +214,7 @@ struct acpi_processor_flags {
 	u8 bm_control:1;
 	u8 bm_check:1;
 	u8 has_cst:1;
+	u8 pcc_unsupported:1;
 	u8 has_lpi:1;
 	u8 power_setup_done:1;
 	u8 bm_rld_set:1;
-- 
2.34.1


