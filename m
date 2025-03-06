Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FCA548C1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 12:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903353.1311268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq960-0000qo-Vd; Thu, 06 Mar 2025 11:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903353.1311268; Thu, 06 Mar 2025 11:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq960-0000oZ-Rp; Thu, 06 Mar 2025 11:08:56 +0000
Received: by outflank-mailman (input) for mailman id 903353;
 Thu, 06 Mar 2025 11:08:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq95z-0000aa-1z
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 11:08:55 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20606.outbound.protection.outlook.com
 [2a01:111:f403:2407::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a62f1a-fa7b-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 12:08:52 +0100 (CET)
Received: from SJ0PR13CA0158.namprd13.prod.outlook.com (2603:10b6:a03:2c7::13)
 by CY5PR12MB6407.namprd12.prod.outlook.com (2603:10b6:930:3c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 11:08:46 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::ea) by SJ0PR13CA0158.outlook.office365.com
 (2603:10b6:a03:2c7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.11 via Frontend Transport; Thu,
 6 Mar 2025 11:08:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 11:08:45 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 05:08:42 -0600
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
X-Inumbo-ID: 62a62f1a-fa7b-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bx4yQKcIou+bGDBwVOXYgeK+sFSXCVyzU5qJP41LPhenpKGW++ePj9YoMuSLZVBaD5EN4N01v1hfSHr/2v/Yw4v+jc4bgLWyOmInikt45CaRe2UypDvbL4E1NqSdWNOd5yi4m+iOyyC7u5ZfioYbJymJVXc/NPNCCUZSDVru+Oi8h65L7o5y8/CB5VuK5sx5DhyOrnJIgi4pYMdx0OUL2mpnMawdZ3vUMCQYdmD2mQC+t0184iKxa7531VOtBi0liHaVW3JR8qkwhs4heR6QFm/GpHBYWxZQthOttkrEavsHwxwtlvH1aO98g95w4Gt/JNEsEtOlCF0lteD3RwUq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umPQCB2LN+Kalqs6W3FFGVHcfPlI9C3UYolJoarzFPM=;
 b=WuCEKnQphRNQA44CLda2Npj1PP7ea5xqyOlsgxULfVdSgqEfDby2TbQSpijT1YDK1C4i9thuEgcl9/DbltLG2yFsxfRxM+3VvYDOjVfDuoGyQ270Se25ju6/ixaLG8d6Xp5O6ZDnqas5ApIpuapxmRD9mCJ8gGjrWJwREIh/18bhmqJ3bc/hZDLdpgDj4/+bXWCjYrGWWgMZAomgRFZUxuH1Mz1Fx/RMv9P4eGBTnXrla11dKaFL+7K6g+vFgcmKDl75rZ0CI8ZfpkGVFOcNlQuDp4Hbhimyz+FY2XoHTqSz7iLvkJQI4DqbX8bXnmxrec1Z5VMyDrPT3GU6SCPHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umPQCB2LN+Kalqs6W3FFGVHcfPlI9C3UYolJoarzFPM=;
 b=ld0kDCcFSxAytTnql+O4h+lQYq3yOyDvfJ8z2J3HalvoiTB40GXb+2ZhzxEpN0/5qv0VcP5eMYvF0JhHx6LtmKOJhpIjIPyXNmoyzw/hQ+tgucFeJBsKpuOhlzCoHI/uButNh6RYm6QMPyvuX9OM5FC9QfxvHK75T33EfE66Tm8=
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
	<linux-kernel@vger.kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 1/5] xen/acpi: upload power and performance related data from a PVH dom0
Date: Thu, 6 Mar 2025 19:08:20 +0800
Message-ID: <20250306110824.1506699-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306110824.1506699-1-Penny.Zheng@amd.com>
References: <20250306110824.1506699-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|CY5PR12MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f168f34-20af-40f2-4f22-08dd5c9f4399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUQzcGZDNUV6d2l2clduK0ZmcWUyOXZZTG9CMm5STUF6ZHowNURjOUw3WVd2?=
 =?utf-8?B?WFV3NXN3RHBHYWZoTmYzMG9xR2NIQnljcUlhTDNKTms2TUwyUGRxRFZSdWl2?=
 =?utf-8?B?TEVoejF3YlVTVDc1VGQzSWJJeHNJSlFIN2t6Tk1wUGVQY3ZOODVuVUhnMHo2?=
 =?utf-8?B?NlB6Q1RRcE1ySUIySkllTk5jYmNuT0FvK2ZuOXY4SEJCdDM5S0tML3MwM0g5?=
 =?utf-8?B?UTJoMDlXTVJKV0pjcU1GYVZoMzl5cTYxWmxuZEVucmNzdEsxYTV2aVJpMHhs?=
 =?utf-8?B?ZmxSQms5VUNyeTk5VThLMGlPOWc1enBiTnBKMDVnTnF1aG5td0ZHS3ZyU2Qw?=
 =?utf-8?B?b2NMSEhadmZnYmNIOU56WEp5RjZ2MFBtd3d5Q2VScys5ZTAxNTlKZjlUUUFS?=
 =?utf-8?B?aWlDYndGb3RHckVVWE0vZVk2RzJZTWZ4S3E5Z3hYTE9VUjRFaWh6UkRmK3lv?=
 =?utf-8?B?ekpBV2ZuY0gzbW1YeGpDSmpDY0hpam55MFJHV2ZVeTB6eHVjZSs4Z1Q2Y1Fz?=
 =?utf-8?B?RG1mRW53MVM4TWIxc3ZKVXk1QXVpcFlTWWNjYVZtcC96LzBUODFES1VDVU1N?=
 =?utf-8?B?WjRGL0tWNitqbW9kMy9ueEdTZVQ5N2FOYTZWSG43bnlmY1h4ZXovNkdyZjJK?=
 =?utf-8?B?TGNhVlVHaGVyRDdnWVdjMUlQMkFEWCtWaXlnRE9HSExWMFc1aWxoblRTK3hJ?=
 =?utf-8?B?MDhzb1lUc1BkTlN3eGRoN053d2s0WDJ6MGVsbUR2TUlwNGRabXJMZERKdUJ4?=
 =?utf-8?B?RXdPMTBmam44RWlVYWlhcUw3N3JBVnpyVnFIYTRBWGdLczZvdXBVWnFCaHRL?=
 =?utf-8?B?QWgxTEN6VlpQSG90Nkd1a3lqVmg2QVlWN0ZJRG53UDg0WEJNZW4zSFVKMHdo?=
 =?utf-8?B?K2U5NlNDbjAzZU10QmdHNzFWUmVkSWZ4bS9qVHFPK2tDSGIzQ05nNmE5Vzhz?=
 =?utf-8?B?K2w4SkEvRzFvVmwxN3lhZzR0MWhTWjQ4c0p1MFppWVVWWngydkt6dUp5WkJM?=
 =?utf-8?B?V1NNNHB0bkRDazl6UlJMbzlNejRVc254Q3BHUlRmYTYrNG9ubGhMZUNlRmY3?=
 =?utf-8?B?RmFLaitPYXhlUWs3WVU4TnZyZmlva1J1dElYK3d6NWF3T2R6V1FxL29XVkpS?=
 =?utf-8?B?WEk2SjI5YVVLTExTZVRMYW5BS01yckZ4VEI5UzVyNlBZc2tITUU1VDVvWjFF?=
 =?utf-8?B?QWQ2L3V6dVpsdzRSYVdPdDlPR2syUVBCZEdxblBHcTRBRjc2RXNLQU52RzNG?=
 =?utf-8?B?ek9XU1RNd2lkR2RJb1JJem5CVnEzMHhNNTVwSFhqVTlsN1ovYmp1OHRsbHBC?=
 =?utf-8?B?OVJlbWNTSjl3Ymp4Rjk0Vjl2S0tURU1jdXhqd05TSTVxVUtUTHJVOWdkSExH?=
 =?utf-8?B?WXhsWGFzS0pyNEltb0pVczgrdGxGcWR3RFNGTnU1OTkvdGRDdlNBN1FmekZ1?=
 =?utf-8?B?bFVUb2VkZHZaTFFpaUs5NW5JY3Z5K1YwVU00QXNiTkp5SUVUajFhUy95amw5?=
 =?utf-8?B?N2F5UzZBVHFOcTVEQ0FyVzU2SCt1SXdSZmhsaXJRZWdQM2Q5VkJkN3N3eGxW?=
 =?utf-8?B?V1BtYkFqOWxoYy9ZSTQxUHNqUzJGbVJkOUl2b0pBUjRLUFROVzF3MGMzcmk2?=
 =?utf-8?B?L1Q4NXVkMWVkQ2RjM2g5NzZsNHdyNDRoWlNzVTUvS3ZYdVFZSnhiYllMQ0lP?=
 =?utf-8?B?cEpZOFh0TXFCZGdXaDc0RG51QjNZVnhReW05RFpLREgwNlFZczFMYmFtT0No?=
 =?utf-8?B?T2MwYkJRYzRwekk0VjRMQ3FYQ21CZW1SbUhXbXJNeHJZeE8wUWRuQWhyd0c0?=
 =?utf-8?B?dE9LMVlTZ0RnKzVoL2t3ZFFhZlk3dHZ2dlloVEJRT1R6WXh1Q3VjU3poMnFX?=
 =?utf-8?B?RytRUXpNMDJLSTdyZS9Xc1FGTzdJclpaTkZETzFISExESmhCSURBRWhZbG1h?=
 =?utf-8?B?cDFHbVF0Qnl0bkZtWUloS2hsZVRORytyU2RzMUlNMEhIYndmaDg1R2tOVzYz?=
 =?utf-8?Q?FAnZBdfBkX6SMyMa1n42pPBy7suObc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:08:45.8279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f168f34-20af-40f2-4f22-08dd5c9f4399
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6407

From: Roger Pau Monne <roger.pau@citrix.com>

When running as a PVH dom0 the ACPI MADT is crafted by Xen in order to
report the correct numbers of vCPUs that dom0 has, so the host MADT is
not provided to dom0.  This creates issues when parsing the power and
performance related data from ACPI dynamic tables, as the ACPI
Processor UIDs found on the dynamic code are likely to not match the
ones crafted by Xen in the dom0 MADT.

Xen would rely on Linux having filled at least the power and
performance related data of the vCPUs on the system, and would clone
that information in order to setup the remaining pCPUs on the system
if dom0 vCPUs < pCPUs.  However when running as PVH dom0 it's likely
that none of dom0 CPUs will have the power and performance data
filled, and hence the Xen ACPI Processor driver needs to fetch that
information by itself.

In order to do so correctly, introduce a new helper to fetch the _CST
data without taking into account the system capabilities from the
CPUID output, as the capabilities reported to dom0 in CPUID might be
different from the ones on the host.

Note that the newly introduced code will only fetch the _CST, _PSS,
_PPC and _PCT from a single CPU, and clone that information for all the
other Processors.  This won't work on an heterogeneous system with
Processors having different power and performance related data between
them.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 drivers/xen/pcpu.c               |   3 +-
 drivers/xen/xen-acpi-processor.c | 232 ++++++++++++++++++++++++++++---
 include/xen/xen.h                |   2 +-
 3 files changed, 216 insertions(+), 21 deletions(-)

diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index 093ad4a08672..36fb5372cd04 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -388,7 +388,7 @@ static int __init xen_pcpu_init(void)
 arch_initcall(xen_pcpu_init);
 
 #ifdef CONFIG_ACPI
-bool __init xen_processor_present(uint32_t acpi_id)
+bool xen_processor_present(uint32_t acpi_id)
 {
 	const struct pcpu *pcpu;
 	bool online = false;
@@ -403,6 +403,7 @@ bool __init xen_processor_present(uint32_t acpi_id)
 
 	return online;
 }
+EXPORT_SYMBOL_GPL(xen_processor_present);
 
 void xen_sanitize_proc_cap_bits(uint32_t *cap)
 {
diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index 296703939846..e9f38f171240 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -48,6 +48,8 @@ static unsigned long *acpi_id_cst_present;
 /* Which ACPI P-State dependencies for a enumerated processor */
 static struct acpi_psd_package *acpi_psd;
 
+static bool pr_initialized;
+
 static int push_cxx_to_hypervisor(struct acpi_processor *_pr)
 {
 	struct xen_platform_op op = {
@@ -172,8 +174,13 @@ static int xen_copy_psd_data(struct acpi_processor *_pr,
 
 	/* 'acpi_processor_preregister_performance' does not parse if the
 	 * num_processors <= 1, but Xen still requires it. Do it manually here.
+	 *
+	 * Also init the field if not set, as that's possible if the physical
+	 * CPUs on the system doesn't match the data provided in the MADT when
+	 * running as a PVH dom0.
 	 */
-	if (pdomain->num_processors <= 1) {
+	if (pdomain->num_processors <= 1 ||
+	    dst->shared_type == CPUFREQ_SHARED_TYPE_NONE) {
 		if (pdomain->coord_type == DOMAIN_COORD_TYPE_SW_ALL)
 			dst->shared_type = CPUFREQ_SHARED_TYPE_ALL;
 		else if (pdomain->coord_type == DOMAIN_COORD_TYPE_HW_ALL)
@@ -313,6 +320,155 @@ static unsigned int __init get_max_acpi_id(void)
 	pr_debug("Max ACPI ID: %u\n", max_acpi_id);
 	return max_acpi_id;
 }
+
+/*
+ * Custom version of the native acpi_processor_evaluate_cst() function, to
+ * avoid some sanity checks done based on the CPUID data.  When running as a
+ * Xen domain the CPUID data provided to dom0 is not the native one, so C
+ * states cannot be sanity checked.  Leave it to the hypervisor which is also
+ * the entity running the driver.
+ */
+static int xen_acpi_processor_evaluate_cst(acpi_handle handle,
+					   struct acpi_processor_power *info)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *cst;
+	acpi_status status;
+	u64 count;
+	int last_index = 0;
+	int i, ret = 0;
+
+	status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_debug(handle, "No _CST\n");
+		return -ENODEV;
+	}
+
+	cst = buffer.pointer;
+
+	/* There must be at least 2 elements. */
+	if (!cst || cst->type != ACPI_TYPE_PACKAGE || cst->package.count < 2) {
+		acpi_handle_warn(handle, "Invalid _CST output\n");
+		ret = -EFAULT;
+		goto end;
+	}
+
+	count = cst->package.elements[0].integer.value;
+
+	/* Validate the number of C-states. */
+	if (count < 1 || count != cst->package.count - 1) {
+		acpi_handle_warn(handle, "Inconsistent _CST data\n");
+		ret = -EFAULT;
+		goto end;
+	}
+
+	for (i = 1; i <= count; i++) {
+		union acpi_object *element;
+		union acpi_object *obj;
+		struct acpi_power_register *reg;
+		struct acpi_processor_cx cx;
+
+		/*
+		 * If there is not enough space for all C-states, skip the
+		 * excess ones and log a warning.
+		 */
+		if (last_index >= ACPI_PROCESSOR_MAX_POWER - 1) {
+			acpi_handle_warn(handle, "No room for more idle states (limit: %d)\n",
+					 ACPI_PROCESSOR_MAX_POWER - 1);
+			break;
+		}
+
+		memset(&cx, 0, sizeof(cx));
+
+		element = &cst->package.elements[i];
+		if (element->type != ACPI_TYPE_PACKAGE) {
+			acpi_handle_info(handle, "_CST C%d type(%x) is not package, skip...\n",
+					 i, element->type);
+			continue;
+		}
+
+		if (element->package.count != 4) {
+			acpi_handle_info(handle, "_CST C%d package count(%d) is not 4, skip...\n",
+				i, element->package.count);
+			continue;
+		}
+
+		obj = &element->package.elements[0];
+
+		if (obj->type != ACPI_TYPE_BUFFER) {
+			acpi_handle_info(handle, "_CST C%d package element[0] type(%x) is not buffer, skip...\n",
+					 i, obj->type);
+			continue;
+		}
+
+		reg = (struct acpi_power_register *)obj->buffer.pointer;
+
+		obj = &element->package.elements[1];
+		if (obj->type != ACPI_TYPE_INTEGER) {
+			acpi_handle_info(handle, "_CST C[%d] package element[1] type(%x) is not integer, skip...\n",
+					 i, obj->type);
+			continue;
+		}
+
+		cx.type = obj->integer.value;
+		/*
+		 * There are known cases in which the _CST output does not
+		 * contain C1, so if the type of the first state found is not
+		 * C1, leave an empty slot for C1 to be filled in later.
+		 */
+		if (i == 1 && cx.type != ACPI_STATE_C1)
+			last_index = 1;
+
+		cx.address = reg->address;
+		cx.index = last_index + 1;
+
+		switch (reg->space_id) {
+		case ACPI_ADR_SPACE_FIXED_HARDWARE:
+			cx.entry_method = ACPI_CSTATE_FFH;
+			break;
+
+		case ACPI_ADR_SPACE_SYSTEM_IO:
+			cx.entry_method = ACPI_CSTATE_SYSTEMIO;
+			break;
+
+		default:
+			acpi_handle_info(handle, "_CST C%d space_id(%x) neither FIXED_HARDWARE nor SYSTEM_IO, skip...\n",
+					 i, reg->space_id);
+			continue;
+		}
+
+		if (cx.type == ACPI_STATE_C1)
+			cx.valid = 1;
+
+		obj = &element->package.elements[2];
+		if (obj->type != ACPI_TYPE_INTEGER) {
+			acpi_handle_info(handle, "_CST C%d package element[2] type(%x) not integer, skip...\n",
+					 i, obj->type);
+			continue;
+		}
+
+		cx.latency = obj->integer.value;
+
+		obj = &element->package.elements[3];
+		if (obj->type != ACPI_TYPE_INTEGER) {
+			acpi_handle_info(handle, "_CST C%d package element[3] type(%x) not integer, skip...\n",
+					 i, obj->type);
+			continue;
+		}
+
+		memcpy(&info->states[++last_index], &cx, sizeof(cx));
+	}
+
+	acpi_handle_info(handle, "Found %d idle states\n", last_index);
+
+	info->count = last_index;
+
+end:
+	kfree(buffer.pointer);
+
+	return ret;
+}
+
 /*
  * The read_acpi_id and check_acpi_ids are there to support the Xen
  * oddity of virtual CPUs != physical CPUs in the initial domain.
@@ -331,6 +487,7 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	unsigned long long tmp;
 	union acpi_object object = { 0 };
 	struct acpi_buffer buffer = { sizeof(union acpi_object), &object };
+	struct acpi_buffer cst_buf = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_io_address pblk = 0;
 
 	status = acpi_get_type(handle, &acpi_type);
@@ -354,24 +511,45 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	default:
 		return AE_OK;
 	}
-	if (invalid_phys_cpuid(acpi_get_phys_id(handle,
-						acpi_type == ACPI_TYPE_DEVICE,
-						acpi_id))) {
+
+	if (!xen_processor_present(acpi_id)) {
 		pr_debug("CPU with ACPI ID %u is unavailable\n", acpi_id);
 		return AE_OK;
 	}
-	/* There are more ACPI Processor objects than in x2APIC or MADT.
-	 * This can happen with incorrect ACPI SSDT declerations. */
-	if (acpi_id >= nr_acpi_bits) {
-		pr_debug("max acpi id %u, trying to set %u\n",
-			 nr_acpi_bits - 1, acpi_id);
-		return AE_OK;
-	}
+
 	/* OK, There is a ACPI Processor object */
 	__set_bit(acpi_id, acpi_id_present);
 
 	pr_debug("ACPI CPU%u w/ PBLK:0x%lx\n", acpi_id, (unsigned long)pblk);
 
+	if (!pr_initialized) {
+		struct acpi_processor *pr = context;
+		int rc, rc2;
+
+		/*
+		 * There's no CPU on the system that has any performance or
+		 * power related data, initialize all the required fields by
+		 * fetching that info here.
+		 *
+		 * Note such information is only fetched once, and then reused
+		 * for all pCPUs.  This won't work on heterogeneous systems
+		 * with different Cx anb/or Px states between CPUs.
+		 */
+
+		pr->handle = handle;
+
+		rc = acpi_processor_get_performance_info(pr);
+		if (rc)
+			pr_err("ACPI CPU%u failed to get performance data\n",
+			       acpi_id);
+		rc2 = xen_acpi_processor_evaluate_cst(handle, &pr->power);
+		if (rc2)
+			pr_err("ACPI CPU%u failed to get _CST data\n", acpi_id);
+
+		if (!rc && !rc2)
+			pr_initialized = true;
+	}
+
 	/* It has P-state dependencies */
 	if (!acpi_processor_get_psd(handle, &acpi_psd[acpi_id])) {
 		pr_debug("ACPI CPU%u w/ PST:coord_type = %llu domain = %llu\n",
@@ -379,11 +557,13 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 			 acpi_psd[acpi_id].domain);
 	}
 
-	status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
+	status = acpi_evaluate_object(handle, "_CST", NULL, &cst_buf);
 	if (ACPI_FAILURE(status)) {
 		if (!pblk)
 			return AE_OK;
 	}
+	kfree(cst_buf.pointer);
+
 	/* .. and it has a C-state */
 	__set_bit(acpi_id, acpi_id_cst_present);
 
@@ -391,10 +571,6 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 }
 static int check_acpi_ids(struct acpi_processor *pr_backup)
 {
-
-	if (!pr_backup)
-		return -ENODEV;
-
 	if (acpi_id_present && acpi_id_cst_present)
 		/* OK, done this once .. skip to uploading */
 		goto upload;
@@ -422,8 +598,8 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
 
 	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT,
 			    ACPI_UINT32_MAX,
-			    read_acpi_id, NULL, NULL, NULL);
-	acpi_get_devices(ACPI_PROCESSOR_DEVICE_HID, read_acpi_id, NULL, NULL);
+			    read_acpi_id, NULL, pr_backup, NULL);
+	acpi_get_devices(ACPI_PROCESSOR_DEVICE_HID, read_acpi_id, pr_backup, NULL);
 
 upload:
 	if (!bitmap_equal(acpi_id_present, acpi_ids_done, nr_acpi_bits)) {
@@ -464,6 +640,7 @@ static int xen_upload_processor_pm_data(void)
 	struct acpi_processor *pr_backup = NULL;
 	int i;
 	int rc = 0;
+	bool free_perf = false;
 
 	pr_info("Uploading Xen processor PM info\n");
 
@@ -473,12 +650,29 @@ static int xen_upload_processor_pm_data(void)
 		if (!_pr)
 			continue;
 
-		if (!pr_backup)
+		if (!pr_backup) {
 			pr_backup = kmemdup(_pr, sizeof(*_pr), GFP_KERNEL);
+			pr_initialized = true;
+		}
 		(void)upload_pm_data(_pr);
 	}
 
+	if (!pr_backup) {
+		pr_backup = kzalloc(sizeof(struct acpi_processor), GFP_KERNEL);
+		if (!pr_backup)
+			return -ENOMEM;
+		pr_backup->performance = kzalloc(sizeof(struct acpi_processor_performance),
+						 GFP_KERNEL);
+		if (!pr_backup->performance) {
+			kfree(pr_backup);
+			return -ENOMEM;
+		}
+		free_perf = true;
+	}
+
 	rc = check_acpi_ids(pr_backup);
+	if (free_perf)
+		kfree(pr_backup->performance);
 	kfree(pr_backup);
 
 	return rc;
diff --git a/include/xen/xen.h b/include/xen/xen.h
index a1e5b3f18d69..6ff3e2f40803 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -81,7 +81,7 @@ static inline void xen_free_unpopulated_pages(unsigned int nr_pages,
 #endif
 
 #if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI) && defined(CONFIG_X86)
-bool __init xen_processor_present(uint32_t acpi_id);
+bool xen_processor_present(uint32_t acpi_id);
 #else
 #include <linux/bug.h>
 static inline bool xen_processor_present(uint32_t acpi_id)
-- 
2.34.1


