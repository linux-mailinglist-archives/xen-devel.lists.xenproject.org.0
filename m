Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33CA548C4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 12:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903360.1311307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq96A-00020b-Cf; Thu, 06 Mar 2025 11:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903360.1311307; Thu, 06 Mar 2025 11:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq96A-0001x6-8a; Thu, 06 Mar 2025 11:09:06 +0000
Received: by outflank-mailman (input) for mailman id 903360;
 Thu, 06 Mar 2025 11:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq968-0000aQ-Iy
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 11:09:04 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2009::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6827042f-fa7b-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 12:09:01 +0100 (CET)
Received: from MW4PR04CA0169.namprd04.prod.outlook.com (2603:10b6:303:85::24)
 by SJ1PR12MB6316.namprd12.prod.outlook.com (2603:10b6:a03:455::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 11:08:56 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::30) by MW4PR04CA0169.outlook.office365.com
 (2603:10b6:303:85::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.29 via Frontend Transport; Thu,
 6 Mar 2025 11:08:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 11:08:55 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 05:08:52 -0600
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
X-Inumbo-ID: 6827042f-fa7b-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLq3Oqe6PQkaHOqxgUIZJVVtLTcc3aUYPdz/Y/Xn7/jCXjO7H7C2O9Koy0APaEOdoIUG9gc88Hj7JAeZRgbmxfL3rGUqMAdmUaWRcYFEN/PgDFi05+Mxd9JoI/ud7ikPRKv/TH1H921H/xf09DmrWi/UWSozxwT4DZNp17qf3m59g0UkUfDxp1cxFwrl7LG6nCW7lTpkR6un3Tw2wyfD3YF6shO8hEzkOtev2162L1IBFZqtF3cTX/aBVIKiT0LdQJU4756oL2Whtiq/nuoatgqig7abpcDdXH5gkqIgRov2xLGeLP8LIaewkLAzLxYvDi0CwQXZjgjGQdKAV1Bz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHUIRi0jHL+VKEOq7A4wC/l3NWO1LytHjAeyNXEqji0=;
 b=rJfGhaKUpI83uZ4wim+wXGgC9qH34WQHU5tekoj6ivW76jiWUHuOPlfOxPOWWFRrAaRPomkxVXG+HOfHtR0mhzRoDQKuO4MHV/96WK8f1UUQYPXgkxuPOkm0Gp6SUu6T/BngOSMTKWqIem8gAaNp4AU+eN7PSFOIEKWLN7iokZQUdpn/a32SVuUFw4eJYe49FVnmGwLL5ubreQSlYsWMLHRg71zuZtuzIh7RuGRAivNOYMQ6YldjZBjUOCZCf9m8ZarVAksTIos1wxn5YHTkCbMX5YO08yUtuPzIk3Ce8gj+SnloGp1fr0IztwkiNydoyHZog5EB7xN5IaD8ppAnSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHUIRi0jHL+VKEOq7A4wC/l3NWO1LytHjAeyNXEqji0=;
 b=POwpDWlbvvw8FhKHvQyi4201VDy0/DeSeVKd62nbiHJ68ySf/HyNdlZm6HnWzi0K2w2X8bRyB2Y82uWZHINOnynHT53I6R6+zLMlu1D4hGmM7aQpsEhol+lvel7VSycsRjt7gIm9E6oTCBegivi8ARFLn7W/zL5Fo3adxZT0T1k=
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
Subject: [PATCH v3 5/5] xen/cppc: introduce cppc data upload sub-hypercall
Date: Thu, 6 Mar 2025 19:08:24 +0800
Message-ID: <20250306110824.1506699-6-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|SJ1PR12MB6316:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e54340-d5e6-4b12-4088-08dd5c9f498d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z4l3lhxdL8FwebKIeKarDw6pIaLeW8J/Om5VdXdtq16RabP5avdgFqM6VC7Z?=
 =?us-ascii?Q?TPJMASCw2Sc/IcyuOT+unn57EyAkus/5vE0CzCOTrGv8bX2Nfs/jl0F7hbQa?=
 =?us-ascii?Q?s3VH9E61vZu6I03U/shyS+C5EVFR2sWAuw0EQAli8oehmrtKmW2med40+aGq?=
 =?us-ascii?Q?kGz9PrzKCgxmPxt+3jhKKrzhrqaO7eD22Vut9OxB3GH5jChYykCgrL57EqDy?=
 =?us-ascii?Q?hCFxJR7uAMocHM3MmcrTca+LkJ4JNXNpi2qT0zR1eEcSCYvtx3T5uA8UJP7W?=
 =?us-ascii?Q?hLyCjUJ7uZVjnZpMB6C/TVcRv/H19jYRR4O8Fk4O6Zcil+wqRz6TAPxtrwU1?=
 =?us-ascii?Q?3y5vWXI5VogD7RkJH6kRq+XxRkN+ZAK+ANhrzb9Zn3XyHYmQlK75Qgq3bdvt?=
 =?us-ascii?Q?u1/mPIuOwSK1NAbkB5MenEfc816YRjOHGPv5EZKoSB3+cuIXZ95DqDWK+Enl?=
 =?us-ascii?Q?QmH81ZQdbAyD8O03ZYBMQSwBCyHXGbQeMhPRr/u8hWvGRaAoSzIn2+RHU4BT?=
 =?us-ascii?Q?GhIt7wTI5oB9ISh6Hhd6d631Pp8/KF/Mch0DNlmz5G4SaFzFtg4cGAeGQGRi?=
 =?us-ascii?Q?cAYFCv085tg5RJRx1SFrlBBRMmJcOBIxkk73Zh0mWuUsmPdSfxouUIh0tL7/?=
 =?us-ascii?Q?wg1GTexrZ+yLatYE4s6HOtf1JroCPj6QfojmxWql4iJITgbuBXYDv25zoqnG?=
 =?us-ascii?Q?EHgdsTVNyyKGQI17Nu+ZGQO6VIQkJvD3GuPB+iTLyIEnLL8e2rMWK3jDWKgo?=
 =?us-ascii?Q?G2JK+naA0JqLyW+5AYjxFXVOIrSbdw8DFLCIh1EuxvesQ5Zr2TnKYGilhPJC?=
 =?us-ascii?Q?+PSXhyl9w6U4/LacOO7gwtrsyV3hjlqLj5dkSDaVndhdsY+KUBVeJwuSFpat?=
 =?us-ascii?Q?FysvSe9wXfmD8M0Kkfpu2WQm8Z3NUJYyqPOMBdiegFhQRZp6lSG4pWLHM9rT?=
 =?us-ascii?Q?YJnoAsnNiqjpL6WRghS43XG5rkmr9QUW4FTjwh/86Hnud+oQR13KYv3V5Oav?=
 =?us-ascii?Q?z6Iyx1dKW7LRVHjaqZbc85et60R17nmfyd6Is5xMfirolX2IOnvFpxknbtAf?=
 =?us-ascii?Q?+w0IxFysfEJxpoo/I9jTzI1sgACAt7a929mlYbrOGVLq93fhKr/1K8CifCb3?=
 =?us-ascii?Q?4Kuv+pwzpe86Uwqdee8rnB38mgPd6BiLLvluZoaRQpwU74bf3ucXRoBUZmLQ?=
 =?us-ascii?Q?UiBbDWE2FGc1LOegJDcqTkdFG2I4J0IY1Ht6PqNngFQ+77sLcwVyLbfDiwpO?=
 =?us-ascii?Q?v04uECNhg4TQvS6nT8Ba1C6n7B/01/+9lQ5kzR8nO0E3uC467BdO2e2O4Fqv?=
 =?us-ascii?Q?apeCUNEV4oZIIlHqgkNnY9Sc1Zg5uFpBI10qb4qGpy/O9mE0OhnpmRxn0rXS?=
 =?us-ascii?Q?9EGCfWqEBIik8Tpd08BGEXtYXaJ4fQHfCFr/ud/vwknuAEY6XpAJ3Q88SeQG?=
 =?us-ascii?Q?A0/+z7BveEZ4RErVmDlq3rdGHHdUjVsb5HYpuqs4aPivrmv6PnUUCwnPInlQ?=
 =?us-ascii?Q?MhMQJQq2q0dDHi0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:08:55.8309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e54340-d5e6-4b12-4088-08dd5c9f498d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6316

As Xen is uncapable of parsing the ACPI dynamic table, this commit
introduces a new sub-hypercall XEN_PM_CPPC to deliver CPPC perf
caps data.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- Adapt to the changes from new commit "xen: introduces XEN_PM_PSD
sub-hypercall for solely delivery of _PSD info"
---
 drivers/acpi/cppc_acpi.c         |  1 +
 drivers/xen/xen-acpi-processor.c | 92 +++++++++++++++++++++++++++++++-
 include/acpi/processor.h         |  1 +
 include/xen/interface/platform.h | 11 ++++
 4 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index ee8015ce3ddf..6b1c8d167405 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -856,6 +856,7 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
 		cpc_ptr->cpc_regs[i].cpc_entry.int_value = 0;
 	}
 
+	pr->flags.has_cpc = 1;
 	pr_debug("Parsed _CPC entry for CPU: %d\n", pr->acpi_id);
 	kfree(output.pointer);
 	return 0;
diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index 8db8631a4b9d..9c4faad043bc 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -25,6 +25,7 @@
 #include <xen/xen.h>
 #include <xen/interface/platform.h>
 #include <asm/xen/hypercall.h>
+#include <acpi/cppc_acpi.h>
 
 static int no_hypercall;
 MODULE_PARM_DESC(off, "Inhibit the hypercall.");
@@ -45,8 +46,12 @@ static unsigned long *acpi_ids_done;
 static unsigned long *acpi_id_present;
 /* And if there is an _CST definition (or a PBLK) for the ACPI IDs */
 static unsigned long *acpi_id_cst_present;
+/* And if there is an _CPC entry for the ACPI IDs */
+static unsigned long *acpi_id_cpc_present;
 /* Which ACPI P-State dependencies for a enumerated processor */
 static struct acpi_psd_package *acpi_psd;
+/* ACPI CPPC structures for a enumerated processor */
+static struct cppc_perf_caps *acpi_cppc_data;
 
 static bool pr_initialized;
 
@@ -228,6 +233,44 @@ static int push_psd_to_hypervisor(struct acpi_processor *_pr)
 
 	return 0;
 }
+static int push_cppc_to_hypervisor(struct acpi_processor *_pr)
+{
+	int ret = 0;
+	struct xen_platform_op op = {
+		.cmd            = XENPF_set_processor_pminfo,
+		.interface_version  = XENPF_INTERFACE_VERSION,
+		.u.set_pminfo.id    = _pr->acpi_id,
+		.u.set_pminfo.type  = XEN_PM_CPPC,
+	};
+	const struct cppc_perf_caps *cppc_perf = acpi_cppc_data + _pr->acpi_id;
+
+	op.u.set_pminfo.cppc_data.highest_perf = cppc_perf->highest_perf;
+	op.u.set_pminfo.cppc_data.lowest_perf = cppc_perf->lowest_perf;
+	op.u.set_pminfo.cppc_data.nominal_perf = cppc_perf->nominal_perf;
+	op.u.set_pminfo.cppc_data.lowest_nonlinear_perf = cppc_perf->lowest_nonlinear_perf;
+	op.u.set_pminfo.cppc_data.lowest_freq = cppc_perf->lowest_freq;
+	op.u.set_pminfo.cppc_data.nominal_freq = cppc_perf->nominal_freq;
+
+	if (!no_hypercall)
+		ret = HYPERVISOR_platform_op(&op);
+
+	if (!ret) {
+		pr_debug("ACPI CPU%u - CPPC uploaded.\n", _pr->acpi_id);
+		pr_debug("     highest_perf: %d\n", cppc_perf->highest_perf);
+		pr_debug("     lowest_perf: %d\n", cppc_perf->lowest_perf);
+		pr_debug("     lowest_nonlinear_perf: %d\n", cppc_perf->lowest_nonlinear_perf);
+		pr_debug("     nominal_perf: %d\n", cppc_perf->nominal_perf);
+		pr_debug("     lowest_freq: %d Mhz\n", cppc_perf->lowest_freq);
+		pr_debug("     nominal_freq: %d Mhz\n", cppc_perf->nominal_freq);
+	} else if ((ret != -EINVAL) && (ret != -ENOSYS))
+		/* EINVAL means the ACPI ID is incorrect - meaning the ACPI
+		 * table is referencing a non-existing CPU - which can happen
+		 * with broken ACPI tables. */
+		pr_warn("(_CPC): Hypervisor error (%d) for ACPI CPU%u\n",
+			ret, _pr->acpi_id);
+
+		return ret;
+}
 static int push_pxx_to_hypervisor(struct acpi_processor *_pr)
 {
 	int ret = 0;
@@ -300,12 +343,16 @@ static int upload_pm_data(struct acpi_processor *_pr)
 		return -EBUSY;
 	}
 
-	if (_pr->performance && _pr->performance->states)
+	if ((_pr->performance && _pr->performance->states) ||
+	    _pr->flags.has_cpc)
 		err |= push_psd_to_hypervisor(_pr);
 
 	if (_pr->flags.power)
 		err = push_cxx_to_hypervisor(_pr);
 
+	if (_pr->flags.has_cpc)
+		err |= push_cppc_to_hypervisor(_pr);
+
 	if (_pr->performance && _pr->performance->states)
 		err |= push_pxx_to_hypervisor(_pr);
 
@@ -510,6 +557,7 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	union acpi_object object = { 0 };
 	struct acpi_buffer buffer = { sizeof(union acpi_object), &object };
 	struct acpi_buffer cst_buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer cpc_buf = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_io_address pblk = 0;
 
 	status = acpi_get_type(handle, &acpi_type);
@@ -589,11 +637,20 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	/* .. and it has a C-state */
 	__set_bit(acpi_id, acpi_id_cst_present);
 
+	status = acpi_evaluate_object(handle, "_CPC", NULL, &cpc_buf);
+	if (ACPI_FAILURE(status)) {
+		return AE_OK;
+	}
+	kfree(cpc_buf.pointer);
+
+	/* .. and it has a _CPC entry */
+	__set_bit(acpi_id, acpi_id_cpc_present);
+
 	return AE_OK;
 }
 static int check_acpi_ids(struct acpi_processor *pr_backup)
 {
-	if (acpi_id_present && acpi_id_cst_present)
+	if (acpi_id_present && acpi_id_cst_present && acpi_id_cpc_present)
 		/* OK, done this once .. skip to uploading */
 		goto upload;
 
@@ -610,11 +667,19 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
 		return -ENOMEM;
 	}
 
+	acpi_id_cpc_present = bitmap_zalloc(nr_acpi_bits, GFP_KERNEL);
+	if (!acpi_id_cpc_present) {
+		bitmap_free(acpi_id_present);
+		bitmap_free(acpi_id_cst_present);
+		return -ENOMEM;
+	}
+
 	acpi_psd = kcalloc(nr_acpi_bits, sizeof(struct acpi_psd_package),
 			   GFP_KERNEL);
 	if (!acpi_psd) {
 		bitmap_free(acpi_id_present);
 		bitmap_free(acpi_id_cst_present);
+		bitmap_free(acpi_id_cpc_present);
 		return -ENOMEM;
 	}
 
@@ -630,6 +695,12 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
 			pr_backup->acpi_id = i;
 			/* Mask out C-states if there are no _CST or PBLK */
 			pr_backup->flags.power = test_bit(i, acpi_id_cst_present);
+			/* Mask out relevant flag if there are no _CPC */
+			pr_backup->flags.has_cpc = test_bit(i, acpi_id_cpc_present);
+			if (pr_backup->flags.has_cpc) {
+				if (xen_processor_get_perf_caps(pr_backup, acpi_cppc_data + i))
+					return -EINVAL;
+			}
 			/* num_entries is non-zero if we evaluated _PSD */
 			if (acpi_psd[i].num_entries) {
 				memcpy(&pr_backup->performance->domain_info,
@@ -748,6 +819,15 @@ static int __init xen_acpi_processor_init(void)
 		bitmap_free(acpi_ids_done);
 		return -ENOMEM;
 	}
+
+	acpi_cppc_data = kcalloc(nr_acpi_bits, sizeof(struct cppc_perf_caps),
+				GFP_KERNEL);
+	if (!acpi_cppc_data) {
+		pr_debug("Memory allocation error for acpi_cppc_data\n");
+		rc = -ENOMEM;
+		goto err1_out;
+	}
+
 	for_each_possible_cpu(i) {
 		if (!zalloc_cpumask_var_node(
 			&per_cpu_ptr(acpi_perf_data, i)->shared_cpu_map,
@@ -773,6 +853,11 @@ static int __init xen_acpi_processor_init(void)
 		rc = acpi_processor_get_performance_info(pr);
 		if (rc)
 			goto err_out;
+
+		pr->flags.pcc_unsupported = true;
+		rc = xen_processor_get_perf_caps(pr, acpi_cppc_data + i);
+		if (rc)
+			goto err_out;
 	}
 
 	rc = xen_upload_processor_pm_data();
@@ -788,6 +873,8 @@ static int __init xen_acpi_processor_init(void)
 
 err_out:
 	/* Freeing a NULL pointer is OK: alloc_percpu zeroes. */
+	kfree(acpi_cppc_data);
+err1_out:
 	free_acpi_perf_data();
 	bitmap_free(acpi_ids_done);
 	return rc;
@@ -801,6 +888,7 @@ static void __exit xen_acpi_processor_exit(void)
 	bitmap_free(acpi_id_present);
 	bitmap_free(acpi_id_cst_present);
 	kfree(acpi_psd);
+	kfree(acpi_cppc_data);
 	for_each_possible_cpu(i)
 		acpi_processor_unregister_performance(i);
 
diff --git a/include/acpi/processor.h b/include/acpi/processor.h
index 1decb437c750..12c1398abc7e 100644
--- a/include/acpi/processor.h
+++ b/include/acpi/processor.h
@@ -214,6 +214,7 @@ struct acpi_processor_flags {
 	u8 bm_control:1;
 	u8 bm_check:1;
 	u8 has_cst:1;
+	u8 has_cpc:1;
 	u8 pcc_unsupported:1;
 	u8 has_lpi:1;
 	u8 power_setup_done:1;
diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
index a35e1eb958f3..1db915d44dd7 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -320,6 +320,7 @@ DEFINE_GUEST_HANDLE_STRUCT(xenpf_getidletime_t);
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
 #define XEN_PM_PSD  4
+#define XEN_PM_CPPC 5
 /* Px sub info type */
 #define XEN_PX_PCT   1
 #define XEN_PX_PSS   2
@@ -384,6 +385,15 @@ struct xen_processor_px {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_processor_px);
 
+struct xen_processor_cppc {
+    uint32_t highest_perf;
+    uint32_t nominal_perf;
+    uint32_t lowest_perf;
+    uint32_t lowest_nonlinear_perf;
+    uint32_t lowest_freq;
+    uint32_t nominal_freq;
+};
+
 struct xen_psd_package {
 	uint64_t num_entries;
 	uint64_t revision;
@@ -411,6 +421,7 @@ struct xenpf_set_processor_pminfo {
 		struct xen_psd_package              domain_info; /* _PSD */
 		struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS */
 		GUEST_HANDLE(uint32_t)              pdc;
+		struct xen_processor_cppc           cppc_data; /* _CPC */
 	};
 	uint32_t shared_type;     /* coordination type of this processor */
 };
-- 
2.34.1


