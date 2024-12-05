Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71759E4D52
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 06:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848861.1263677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4eG-00035I-JC; Thu, 05 Dec 2024 05:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848861.1263677; Thu, 05 Dec 2024 05:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4eG-00032l-Fm; Thu, 05 Dec 2024 05:43:36 +0000
Received: by outflank-mailman (input) for mailman id 848861;
 Thu, 05 Dec 2024 05:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=coHJ=S6=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tJ4eF-0001z8-FA
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 05:43:35 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd62f5be-b2cb-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 06:43:34 +0100 (CET)
Received: from MW4PR03CA0071.namprd03.prod.outlook.com (2603:10b6:303:b6::16)
 by CY8PR12MB7609.namprd12.prod.outlook.com (2603:10b6:930:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 05:43:29 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::bb) by MW4PR03CA0071.outlook.office365.com
 (2603:10b6:303:b6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Thu, 5
 Dec 2024 05:43:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 05:43:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 23:43:25 -0600
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
X-Inumbo-ID: dd62f5be-b2cb-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqbEarWZcyjRyCaTHu+gTf5GtU0WxNMQmKRL7pBJXmwaWS8qB5qNdfAXW6PC27o4kvZnBvxh+QZgL5QRtbcCuZKHVYZRS2sOLUfEm5nH1kyCaMWIsWc5ab3vQdSeh12x18JFSF9ZLYzJOUWJtkS29WCf+yqoEnK4iVd1qM6Wq99L38yP/76ZgRCXZJ2dRraSlLktPJ0fy3HZ9KgikOUwMTfEeCdaI0bsIhN5LMn7FkpCz9eLq24N8odQyMl01Cw9tff2OU5VYjLJ8aIuhgjULaQ7RlzFD5bXD6PXaOtaYoqPN7PO8vscqBoCa5G/yES0fq1E4WpbttXdux2w4p0Eag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3kT6q2N35dmBYg9LrUhnFoFHFr1MmQ2XdbI9z7bg1s=;
 b=sbepxTvpRkMUDqCcq2jJGi3Ccib/Pa1UTQtuQ4fJT+FB9dSvksHZ32dP/iBwfx53zqos3AuouienTocZ7czrrqujHWl/0qKqvY6u7Rd5QdHjeU+jtBP+ONgOeof75AExah3r5WhwYCseuQSsRbBkn0AzoMXbNOgRsFYZRJ+Yw0+xy7YeSXizAy4pjKlakQ/8+b1SNDgc5eExoZxw1Xtd8a3RkPA99aRd6fJSecrDWZjUamPiOj7Pg9yQIVR4u+zwvD+5Av7HXRUX24dSv1fFzwi3FnB8oWy+utba817OeOkCUq+YqgzMFqwf6FEZxXRIVkBjvssykBGIkVBOuTUSKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3kT6q2N35dmBYg9LrUhnFoFHFr1MmQ2XdbI9z7bg1s=;
 b=if2IhlaItK79RyYRy47iIOOgclnVXSxdIsyzv0378RQBVZbtb6Jz4itfldaRnxq+cgaT4i7Yw5twxZdenehYDSddDh00d6xkV9YOAX9oohA44M56zcibQ79Ez7W4rXHqW2hi8ZsX6WgwzIxtpTeZnIGudzm/h0ZFSvTkvEXgiTk=
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
Subject: [PATCH v2 4/4] xen/cppc: introduce cppc data upload sub-hypercall
Date: Thu, 5 Dec 2024 13:42:52 +0800
Message-ID: <20241205054252.471761-5-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 849b106c-4aad-4ce6-36f2-08dd14efbf02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hUwWn9GBx1E0HpOsdtodvd6SX/W/0F/sohJNZ86YnkruvPeE4P0MOaN103TA?=
 =?us-ascii?Q?nk2EmgyHpWzIITrhCfkVgFZ2WiHoJ4j5Eq53Hk/h+Pgf3UHlkBesoEfa6vgs?=
 =?us-ascii?Q?NwAlEzArodqxBctDOkCWRkj5mIIglmkSoOzKOWNWCS282Kr9EML5K4mgKRTs?=
 =?us-ascii?Q?fV9efe3Dob+gZH+VFioaDBtZqhKl2xZZcSyNSrKGTIF7HwiOuFukrP5jeplW?=
 =?us-ascii?Q?Ox1jxDdlekpPmXb6PoSnthQPNAEIHPnp/xVvlD7kwYCVAchQuLCVVFggz2v+?=
 =?us-ascii?Q?2Y+xsPdgD2j7YZC45o6mvX0hDtizPkJcMC4WT88Dm9KYoPk7EYtwQShNST5a?=
 =?us-ascii?Q?hM5MKHysDqO2M9PkVZKfNUBa9qBtY+3X55htgG0knLTyyyraiTWDK2IOqmxC?=
 =?us-ascii?Q?u2nAUKV7zLkB2Io7/ghKdsAPtKt7xK6Qjf+q3q0ZidsS/aUBfxcX10Q+n4Mz?=
 =?us-ascii?Q?utiS4YUfvalhtVW7kigTlVNipJMT36OOCk0vIAAnU5A43M/6uTs6rxOAApZ/?=
 =?us-ascii?Q?kJn96GobkQDg3KY3i1ByZopsr0Od3hQh7cdv6rSfNOiXmu9bjw+3ExjvKqeh?=
 =?us-ascii?Q?e0Nqp3bOxMDHdiXXPuUpE+orYIun1rQPAxXB0KiUtb0B8jb/WXsHkFoUcKEZ?=
 =?us-ascii?Q?Gg+rHFbYSTJYIaPi6KTNVWOjmSh7CQyMbvqQzevOEufRdeVDsxKYXQZhs9iS?=
 =?us-ascii?Q?xER5onyfc3N45izOY5x/FQsZoOqcWtA8gz0Olzqbyro19hH1tmhRF2mDKdhQ?=
 =?us-ascii?Q?9mFqldziWElNIHV6UsBw2YgUxL0gRHfleGvSdeTkCmYyv/7wp5+1NryR9gEZ?=
 =?us-ascii?Q?Z2/oePtjHORMIdkddujEa9jqmMkMTstzj/TeMv0KYMew2PJmOVK9GXpjNKLE?=
 =?us-ascii?Q?PkTGmyRgaEJPBnXWGDJErhcs/fMMUDg0d7LfNt+dFnEFaDuklfKOjmRKiiiP?=
 =?us-ascii?Q?B3RgObQ4fl1XkYzbA+uRzKTuZ0elVc6X2cm4RDC1aTUHF8kUw02E76V50BAz?=
 =?us-ascii?Q?TBhPYl8tqpYJm01pE4c8lT62c5FtRskZK1JrP1dFkBwIOL+NuHY5y92v8tfc?=
 =?us-ascii?Q?19P8sMBph0O+XuLFnIndHlhsbPQW+fY0+NxtNBBsS3Mdu+NpzZC/DIMYhkgM?=
 =?us-ascii?Q?D66SpmfXwgB9tOcQkDMcSvJtGDgF3Ivxjczf4I1VpqBbNCqhcp/NTgqv77sd?=
 =?us-ascii?Q?I48BiqBgpUTCEu9T90LZ2RNEjhgxPcWzuo9D9cmpDBXsTUO76rvmVBe90H0S?=
 =?us-ascii?Q?bAICojxysyh17BVJmUKXsJjcpNsT7OvYpudh62M2BelBXWDcwXcFcu7HiUJD?=
 =?us-ascii?Q?kETfKDOt/PgfSZKkHTM6sBDGX6DEDbDCtft4aL1hcyVOD9M+MG02ng9if89X?=
 =?us-ascii?Q?NOT+T4Gi6UKM0gnioMLuA+ugBodrbYVz7N+fXuV9SwsVxYGDs+QEnJ6shJ4e?=
 =?us-ascii?Q?BwPWpbOTnYe/NYdLSdM04DOuJpNtPZBz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 05:43:28.9248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 849b106c-4aad-4ce6-36f2-08dd14efbf02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609

As Xen is uncapable of parsing the ACPI dynamic table, this commit
introduces a new sub-hypercall XEN_PM_CPPC to deliver CPPC perf
caps data.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 drivers/acpi/cppc_acpi.c         |  1 +
 drivers/xen/xen-acpi-processor.c | 89 +++++++++++++++++++++++++++++++-
 include/acpi/processor.h         |  1 +
 include/xen/interface/platform.h | 11 ++++
 4 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index 3a436591da07..3570a52a5dbd 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -860,6 +860,7 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
 		cpc_ptr->cpc_regs[i].cpc_entry.int_value = 0;
 	}
 
+	pr->flags.has_cpc = 1;
 	pr_debug("Parsed _CPC entry for CPU: %d\n", pr->acpi_id);
 	kfree(output.pointer);
 	return 0;
diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index e9f38f171240..8a39e46c1ebc 100644
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
 
@@ -208,6 +213,44 @@ static int xen_copy_pct_data(struct acpi_pct_register *pct,
 	dst_pct->address = pct->address;
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
+	struct cppc_perf_caps *cppc_perf = acpi_cppc_data + _pr->acpi_id;
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
@@ -284,6 +327,9 @@ static int upload_pm_data(struct acpi_processor *_pr)
 	if (_pr->flags.power)
 		err = push_cxx_to_hypervisor(_pr);
 
+	if (_pr->flags.has_cpc)
+		err |= push_cppc_to_hypervisor(_pr);
+
 	if (_pr->performance && _pr->performance->states)
 		err |= push_pxx_to_hypervisor(_pr);
 
@@ -488,6 +534,7 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	union acpi_object object = { 0 };
 	struct acpi_buffer buffer = { sizeof(union acpi_object), &object };
 	struct acpi_buffer cst_buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer cpc_buf = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_io_address pblk = 0;
 
 	status = acpi_get_type(handle, &acpi_type);
@@ -567,11 +614,20 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
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
 
@@ -588,11 +644,19 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
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
 
@@ -608,6 +672,12 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
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
@@ -726,6 +796,15 @@ static int __init xen_acpi_processor_init(void)
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
@@ -751,6 +830,11 @@ static int __init xen_acpi_processor_init(void)
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
@@ -766,6 +850,8 @@ static int __init xen_acpi_processor_init(void)
 
 err_out:
 	/* Freeing a NULL pointer is OK: alloc_percpu zeroes. */
+	kfree(acpi_cppc_data);
+err1_out:
 	free_acpi_perf_data();
 	bitmap_free(acpi_ids_done);
 	return rc;
@@ -779,6 +865,7 @@ static void __exit xen_acpi_processor_exit(void)
 	bitmap_free(acpi_id_present);
 	bitmap_free(acpi_id_cst_present);
 	kfree(acpi_psd);
+	kfree(acpi_cppc_data);
 	for_each_possible_cpu(i)
 		acpi_processor_unregister_performance(i);
 
diff --git a/include/acpi/processor.h b/include/acpi/processor.h
index 18499cc11366..66492f5d68a8 100644
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
index 79a443c65ea9..e11bb9443dc0 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -319,6 +319,7 @@ DEFINE_GUEST_HANDLE_STRUCT(xenpf_getidletime_t);
 #define XEN_PM_PX   1
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
+#define XEN_PM_CPPC 4
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
@@ -412,6 +422,7 @@ struct xenpf_set_processor_pminfo {
 		struct xen_processor_power          power;/* Cx: _CST/_CSD */
 		struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
 		GUEST_HANDLE(uint32_t)              pdc;
+		struct xen_processor_cppc           cppc_data; /* _CPC */
 	};
 };
 DEFINE_GUEST_HANDLE_STRUCT(xenpf_set_processor_pminfo);
-- 
2.34.1


