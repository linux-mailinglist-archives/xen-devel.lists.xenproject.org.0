Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FAA548C3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 12:09:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903356.1311298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq966-0001dg-Tf; Thu, 06 Mar 2025 11:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903356.1311298; Thu, 06 Mar 2025 11:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq966-0001bW-Nd; Thu, 06 Mar 2025 11:09:02 +0000
Received: by outflank-mailman (input) for mailman id 903356;
 Thu, 06 Mar 2025 11:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq964-0000aa-Rk
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 11:09:00 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66f25704-fa7b-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 12:08:59 +0100 (CET)
Received: from MW4PR03CA0005.namprd03.prod.outlook.com (2603:10b6:303:8f::10)
 by MN6PR12MB8516.namprd12.prod.outlook.com (2603:10b6:208:46f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 11:08:53 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::76) by MW4PR03CA0005.outlook.office365.com
 (2603:10b6:303:8f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 11:08:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 11:08:53 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 05:08:50 -0600
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
X-Inumbo-ID: 66f25704-fa7b-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GWRF+dz6NCOStVi+W0bwP+VSnBvQixlqKnFteps8a6NgpQgxw2vLjVAJbStUdaR1+u2k7ixso01GPBPijl3Js53FSE8oT3AYMrhm9s/lMzBHe/2JE+pOS2dh82cy+zrNBkA1j8xsjBaBaR402+yjDahONectdSR9EMpYX2unMJFQJhnFEl3KcnVDcW6i6ou4sT+0HbqxpFKvJpRSk8oOxPRtNh/lP3KCE3A/uCrhGwgTIwvzJvHqSlER7D6ZSbUzzYvsKxJFhQ3nY6+qeGEWCIkXGSqUcuAuF5E6lIUN4N5NShX5mZQXVmPp2wgIQmSrmZLqflGVRCmy4PZro9smKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZRxKjwyMiSYNUhMY1N3tzoMlUFhuT5YHU4ioGA+va0=;
 b=yYeXuOSjXrUOYWja//Ge5+cYdTEk7kUw6Pi9YuwYSFL07rPi+XveYg8k8wqfD3iNl5zxoQdUTajxPaSXyJ8yp+ks1I9y1FnuJbc3oOgzvHIy9+ZdkFmQ2hZgIBu9Jldl1v/FlOaYjPtKZ/GweIF6he4mJkxXHi0T9S7QOJTzwbhQvmqZeVqxMDWEGKA2hrM+tp6GeCSBQSgJOlu+S6WVWTBLs2QySCabqN6FBAeERW8+AU1qO4ljXkL4XG9t4emOVPszrYbPBbUA3RQ+7PCLRfIw6Ochmpheg6jleALN6mYqMusd+ByzszKPMcGdVvji7qy3i1rpZuBtb0yhxYYtTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZRxKjwyMiSYNUhMY1N3tzoMlUFhuT5YHU4ioGA+va0=;
 b=WcH7BNYn3PQat97AuH44GBFmTcQl0Ylwj0nr3tlr+IjryFkmbTk4snVfYbEIdI0UgTg6Bim0QL+63wGB/YKpNOuDerjKX0mB6++yfQk+bsI8tV2DIrUKZlc4oGAIKt/E+kn2XMJ/TIxPvnIYjNaQ2SyJN3qSJrSxOarVUNmNCds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Ray Huang <Ray.Huang@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/5] xen/cppc: get xen-required cppc perf caps data
Date: Thu, 6 Mar 2025 19:08:23 +0800
Message-ID: <20250306110824.1506699-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306110824.1506699-1-Penny.Zheng@amd.com>
References: <20250306110824.1506699-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|MN6PR12MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a480329-5f26-45fd-1c84-08dd5c9f480e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/QHqUcqO1YAxFun7RLHrTs1TpmMzVdRq8EkY4J+2TsSF7ZFhjvTJzn9F8N52?=
 =?us-ascii?Q?FGibGHXUueo5wY+xYEvg0Ly17qPZv9XJ77tcN3BSYQdTCGX+S1ZR+2DAQwFG?=
 =?us-ascii?Q?oHPPlae4y2ZqmqE+Wav2aKM21j9IiEeyzarLwT8ObHuCHAxDJv8+O5zyXAf8?=
 =?us-ascii?Q?jdz+ITsmtMFayx0qG3w7LD8+tcHlQGnwHujMUhW5HHFEkLquKcqfAKVDbzsM?=
 =?us-ascii?Q?rqNSRxqB/eAkVMQN/ikhu9rUpGeVIEdCdPM7VG7KOEjNHSaPCE1+l8SG680R?=
 =?us-ascii?Q?hKsEx943yZZ+/G4V27nfqw5YTvkKDRiPuiqPdnhK4NUEh2xUQmHL9iyGrEU5?=
 =?us-ascii?Q?BRLuusjVX2A5EW11/dEPQnrl/UV1wMjUj2YF74sKHUOpfo4ciByNWT3aMGbU?=
 =?us-ascii?Q?M3TYKWneHfRDD6Ca3JV6zOjBA6Y6JTUVq88JfuEnGzANi3iP6ajSxWUsnrHm?=
 =?us-ascii?Q?f7BDECJBnIa47dDahmRPgouo7AIrWkki3ceyY9LIhMGzzgWRCuTi6TV32Qjn?=
 =?us-ascii?Q?MCK73gJGEDEd//YhBZK7OI51QbtgppcXyvt5018AhM4Aq1zVCARanqCj45Xv?=
 =?us-ascii?Q?I4U7ziSvpuprM5r2GhH+Ujq9Sl37+kBsizpqf3Qq3JjrEQO4KdyXckqXdmhi?=
 =?us-ascii?Q?lszxvxSJP1R+Sud9o1QPMa6wLM0mrxJVBxuynoU+JDifhW0Jb3trMNr9+l0V?=
 =?us-ascii?Q?GKFFDE+lu99+gujH+G1RInCiytxzK0ROzoaG7P1YYO8VeyTS6UNxd0GXhpxq?=
 =?us-ascii?Q?nSQiGKEbpjS/RVj/fJRSYLcH7BMClhG6xw6K8fRTG2TivzHQb9t4bgcrlpjq?=
 =?us-ascii?Q?/ozY5yJUiO2WpPCmpC+sF+f0bhmom0b3QTtb+tf0+TbBlY1IhMTyzEKoYPRF?=
 =?us-ascii?Q?j0TziGkdUmj+M4525Jvue2WAuYQbDjUOknan9cLuo9FFCsFgeUDByOQCgn23?=
 =?us-ascii?Q?jwsim0iv0hQdxakpXYKp5aMw6LvyKqRyMbywIgMudI0JF636Db0oJA15M1o/?=
 =?us-ascii?Q?Xz19lOXppc1iNoqSZh9XGvk+o1Av+hJc6IzwMfWwWcDlCqqLt6NKUAPB8BA6?=
 =?us-ascii?Q?GKjBn6pxkNYISXVMkfo2FSRaQ6re9iLP6IhBqwhWnv34Qhiz9BIoaoTA155v?=
 =?us-ascii?Q?FvS9EcZDpVV4Pp8TTPjDrXuvMGRlF4uQMsZCl1rlofw5prHH/4CAYiTiONlM?=
 =?us-ascii?Q?DbBn8awozPtrrI1FX53RjwF/1axJ2Dp8k/oxoFT4JR+I4Z4xV4Hx6mCQw7Yc?=
 =?us-ascii?Q?FKmXXqsip9ABC+rcj8q8rpY7yFc4yZjeTBiZtvuaVnPIF8DpdmG009DyngLY?=
 =?us-ascii?Q?FlUp4wWVV6i/OzdCnOKv8X0YuYIrKA80yIJr1oYBGH0OCedtV3CxOzs742Ws?=
 =?us-ascii?Q?VPhmjWsnhIlO4dIqVgx4t2dQqrykvH7M7Ti4X6Q2vLHwMS4CXJ8F8IN4UNvO?=
 =?us-ascii?Q?ZU+5jPOXAHWN8qCcmEPnu38U1wbhCTJIwCf0ebsn0h4VNQEzKIBCvAfq5MpV?=
 =?us-ascii?Q?7quNYmLVEGAZbTU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:08:53.3043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a480329-5f26-45fd-1c84-08dd5c9f480e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8516

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
v2 -> v3:
- no change
---
 drivers/acpi/cppc_acpi.c | 110 +++++++++++++++++++++++++++++++++++----
 include/acpi/cppc_acpi.h |   5 ++
 include/acpi/processor.h |   1 +
 3 files changed, 105 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index 7832bebeb953..ee8015ce3ddf 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -768,6 +768,15 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
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
@@ -833,7 +842,9 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
 			goto out_free;
 		}
 	}
-	per_cpu(cpu_pcc_subspace_idx, pr->id) = pcc_subspace_id;
+
+	if (!pr->flags.pcc_unsupported)
+		per_cpu(cpu_pcc_subspace_idx, pr->id) = pcc_subspace_id;
 
 	/*
 	 * Initialize the remaining cpc_regs as unsupported.
@@ -1012,8 +1023,7 @@ int __weak cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val)
 static int cpc_read(int cpu, struct cpc_register_resource *reg_res, u64 *val)
 {
 	void __iomem *vaddr = NULL;
-	int size;
-	int pcc_ss_id = per_cpu(cpu_pcc_subspace_idx, cpu);
+	int size, pcc_ss_id;
 	struct cpc_reg *reg = &reg_res->cpc_entry.reg;
 
 	if (reg_res->type == ACPI_TYPE_INTEGER) {
@@ -1039,14 +1049,17 @@ static int cpc_read(int cpu, struct cpc_register_resource *reg_res, u64 *val)
 
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
@@ -1278,6 +1291,81 @@ int cppc_get_epp_perf(int cpunum, u64 *epp_perf)
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
index 62d368bcd9ec..dcf129ec540f 100644
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
index a17e97e634a6..1decb437c750 100644
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


