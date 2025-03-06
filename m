Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37193A548C0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 12:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903355.1311287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq964-0001MQ-Hv; Thu, 06 Mar 2025 11:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903355.1311287; Thu, 06 Mar 2025 11:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq964-0001KR-Er; Thu, 06 Mar 2025 11:09:00 +0000
Received: by outflank-mailman (input) for mailman id 903355;
 Thu, 06 Mar 2025 11:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq963-0000aa-1m
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 11:08:59 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6613471a-fa7b-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 12:08:58 +0100 (CET)
Received: from PH7PR17CA0008.namprd17.prod.outlook.com (2603:10b6:510:324::8)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 11:08:51 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::a2) by PH7PR17CA0008.outlook.office365.com
 (2603:10b6:510:324::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 11:08:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 11:08:50 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 05:08:47 -0600
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
X-Inumbo-ID: 6613471a-fa7b-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZvrj1ljjwHXUMZi/hrwY9TPxvLFIZqOc6kLrMMTxVp05w76hHfJoyD6Wrj2hot727o9tJ8TyWBQuj4kL+ATUD+ZBEUqZLo06F0nVm4k4QVe7RCslYXa1AtulH7rOl8pqW/vJUFyciv8eHWOrSk+6hYj1japyPVeu/QU5wZPqrYd6LotisYeztW7EsmGUvZdyt0mYLPA9/khcoG5a/4exHqs9Yy7S0Oea2FJOunMhoDxioZwSwCxOFU2N8VxF6RPx8N5ZD8jrHKI2tZaTxk1us5mHQ1YqBYIFGNH0vE+kjNX4Tc4tdJCx5Mc1NnTj2dOvyFyW89xNKuA/HYiFjYVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq7vU9w3neS35oOjCAPGIVLiBLKO/J0X0LYCQ7COV/I=;
 b=Agp3roJv4dmsLRQ7BhM/z4aGGltWxwsu5TF+n8pjaTjUTj/3L+n2tXkH8EYe1sRVl5QMT7VoB/GqJG4D9dFC5w8hjY6s2WT03Siajvoj4/V4Yq7Whq7ZM6S5pSuu3qnO/KtenchyD+k7v3L4SiUynJkKNOSpXrIhGNAKeKH4+pmxGeyj+5mWC0jsDaMI1zaoUJC0UDDsH82ZPQztkc5LFIF85n8D025nImR+zTBkVzTeLNJ3y1LjLS7zbJ6I4NbvEe8+93kyLIwwZOq3HbHgLYzpmnnLz9REPJdVIJERN1/KyMHl+jxnsjVZQkE+x2JBkrWIwnFVTWZJfI4K0hqKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq7vU9w3neS35oOjCAPGIVLiBLKO/J0X0LYCQ7COV/I=;
 b=v9dpuE7t9VyThvhRFTtgsYET1UNs7lfeagq7ByR5oO/fOXqRwPOdjSYJEygtIv/7DmUbA8+FnkALEAvm07LtEbDKWets3ZDZjsECOJZ1AEvZouwKVh5L3e3AVNJpv2RzYwif7NJtTVxEegMt+IB4jJLzfmNb8hgyzqTS4qgcuDk=
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
Subject: [PATCH v3 3/5] acpi/cppc: extract _cpc entry parsing logic
Date: Thu, 6 Mar 2025 19:08:22 +0800
Message-ID: <20250306110824.1506699-4-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de6d9a2-821c-48d5-6541-08dd5c9f468f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MsbVH3VvkL8LirultWvhMG9sbS9PF5m57FFFpUh9uycZKmr40EH0FhGhKnBV?=
 =?us-ascii?Q?za8DJRxsdj+RPiDodzTz0hx6fukpSIqdiNP0PLfRcRS16X3Lo+626L4S7gff?=
 =?us-ascii?Q?5MGooomIWm+Mi8g/vEEJa7GxWnl/JUPcBBO5AjSGXpnccB/uqlaj3VWHNGPI?=
 =?us-ascii?Q?q03jrEoR9dRxouHvHlfgDn+mB60hzz0u8rVuBWRQK+6yxc9/1s1AJPdc7urR?=
 =?us-ascii?Q?NHRN2sfv/h++DBPBr8Xo4V+tHDxf+m205mTUuGJ9T1ySGyD8bCRiEd5QvDG6?=
 =?us-ascii?Q?YTIH3B+RgayOH0HSWhtqIv1ev3cntWfajtGpVyRv3PNSvQ4tWWN6BLPe9FkM?=
 =?us-ascii?Q?47oRQVL8gzCam+w4P15rqdb88EYHb1XnqbpicjpZxm0dX95schqfDgwPOqA+?=
 =?us-ascii?Q?m2kUj0yXPGYg4h9/EqFkS23jq6zvvikormMGj/KB1W0A76X+GFbAkg2Vxz9c?=
 =?us-ascii?Q?0qGy+SF88cbr2Th+bblTNp5sDA2GnXLCvwzHejk+WEiBFQ2oKCbN3DjVQ3dy?=
 =?us-ascii?Q?qlNRcHbmnIfrUAqJ2278hCYCYT2B1yscBySO80Mjj2lqxdVaXQb+4jQrx4qz?=
 =?us-ascii?Q?KYZefpulYGasY6B9RrsRD8wg6Y+42l7Y6AQMUM+HjiddSAtFcuSjd2XgIGwt?=
 =?us-ascii?Q?EHk0kuw/U1pKHYt4w9S4xqTQ16V5aOYruFrC1+maRi+9DxIyezADLjnJcP87?=
 =?us-ascii?Q?2tcxmjPQH6vPePty0xgir7omzVAiK+7zAnyEley5Fa/bYLUiBNbPU7NUy4hT?=
 =?us-ascii?Q?AXmfeJNpSNGshKUf4AzreyWQSfeRjtUjMM4FXcm4tfsMQzjFFoiJjQooUtqa?=
 =?us-ascii?Q?oW2qw7QMkOKB69gWvVndIxmcp9GgyFOeZkyHG8G6Lnp6Toc6k0nf686F6N6A?=
 =?us-ascii?Q?jVBX7p3wAWI1ki107MRLaC9u27ivq7/cXkk2BklZJZsXaLhLYF38TlcDRXMm?=
 =?us-ascii?Q?aUmqbAlzrZl11WprkPfl3v8JUvMnYeDIY9lRGU4wV3ogMf3srVxrB5EtV1TF?=
 =?us-ascii?Q?r4fUEtM4xSl/QVyRjjHQxBjaPMy2rfUjIt6BO0IxOtsgjkwqyGjFtW80zF/5?=
 =?us-ascii?Q?MtZRR0BebRAVXaSZyjPLCv9ravlyw6yx0MAiKq6PMd5AHbstLUyHWTWm5Bu1?=
 =?us-ascii?Q?XXlif0jv3oF7PHW8OeR+fqPMcSjj7vTidSQG83te3YiZ9JRYO4PMnsr6+3rJ?=
 =?us-ascii?Q?uSFc4nvCo1ZboW7f7T390raFBw6i9sa1a8pNzAJpL6zagcLWBp/kV13h36S+?=
 =?us-ascii?Q?ZiRmGt6rHbmQOTB6aUWabqUykh0tjBuxLohLlBTX0Q5fw8B/tHxa8s5ecLWY?=
 =?us-ascii?Q?oSbzBdWQZUCIndJCY4Ci3xcC7rVXLkwLAkcYdZaYHylvuGOPoxWVvn23fwIO?=
 =?us-ascii?Q?4iB1fRdvHupxXYw8FclTYphiUPiu3c2sTDtVOKD9zMn1ztVxff6C9lujwM+g?=
 =?us-ascii?Q?ZStPVHV83HZHoOTnnPCdGdc9Nll+viSsu1QR62ZNSylFsHtVNrNW4xrsrDu2?=
 =?us-ascii?Q?3t08zWeZtR3qy9M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 11:08:50.8117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de6d9a2-821c-48d5-6541-08dd5c9f468f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572

When running as Xen dom0 PVH guest, MADT table is customized
and may have the "wrong" UID processor number, which is
inconsistent with the UID in Processor entry in native DSDT.

As a result, during ACPI boot-up for dom0, linux fails to set
up proper processor logical id <-> physical id map(acpi_map_cpuid).
Furthermore, It leads to that some ACPI processor feature data,
like per-cpu cpc_desc structure, failed to be correctly stored.

In order to re-parse _CPC entry later for delivering correct data
in performance hypercall, firstly, we extract parsing logic from
acpi_cppc_processor_probe() and export it as a new function
acpi_cppc_processor_parse().

Also, replace logical processor id with ACPI ID, to show correct print
info in Xen dom0 PVH guest.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- no change
---
 drivers/acpi/cppc_acpi.c | 93 +++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 40 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index f193e713825a..7832bebeb953 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -671,19 +671,11 @@ static int pcc_data_alloc(int pcc_ss_id)
  *  )
  */
 
-/**
- * acpi_cppc_processor_probe - Search for per CPU _CPC objects.
- * @pr: Ptr to acpi_processor containing this CPU's logical ID.
- *
- *	Return: 0 for success or negative value for err.
- */
-int acpi_cppc_processor_probe(struct acpi_processor *pr)
+static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc *cpc_ptr)
 {
 	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
 	union acpi_object *out_obj, *cpc_obj;
-	struct cpc_desc *cpc_ptr;
 	struct cpc_reg *gas_t;
-	struct device *cpu_dev;
 	acpi_handle handle = pr->handle;
 	unsigned int num_ent, i, cpc_rev;
 	int pcc_subspace_id = -1;
@@ -702,31 +694,24 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 	status = acpi_evaluate_object_typed(handle, "_CPC", NULL, &output,
 			ACPI_TYPE_PACKAGE);
 	if (ACPI_FAILURE(status)) {
-		ret = -ENODEV;
-		goto out_buf_free;
+		return -ENODEV;
 	}
 
 	out_obj = (union acpi_object *) output.pointer;
 
-	cpc_ptr = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
-	if (!cpc_ptr) {
-		ret = -ENOMEM;
-		goto out_buf_free;
-	}
-
 	/* First entry is NumEntries. */
 	cpc_obj = &out_obj->package.elements[0];
 	if (cpc_obj->type == ACPI_TYPE_INTEGER)	{
 		num_ent = cpc_obj->integer.value;
 		if (num_ent <= 1) {
 			pr_debug("Unexpected _CPC NumEntries value (%d) for CPU:%d\n",
-				 num_ent, pr->id);
-			goto out_free;
+				 num_ent, pr->acpi_id);
+			goto out_pointer;
 		}
 	} else {
 		pr_debug("Unexpected _CPC NumEntries entry type (%d) for CPU:%d\n",
-			 cpc_obj->type, pr->id);
-		goto out_free;
+			 cpc_obj->type, pr->acpi_id);
+		goto out_pointer;
 	}
 
 	/* Second entry should be revision. */
@@ -735,14 +720,14 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 		cpc_rev = cpc_obj->integer.value;
 	} else {
 		pr_debug("Unexpected _CPC Revision entry type (%d) for CPU:%d\n",
-			 cpc_obj->type, pr->id);
-		goto out_free;
+			 cpc_obj->type, pr->acpi_id);
+		goto out_pointer;
 	}
 
 	if (cpc_rev < CPPC_V2_REV) {
 		pr_debug("Unsupported _CPC Revision (%d) for CPU:%d\n", cpc_rev,
-			 pr->id);
-		goto out_free;
+			 pr->acpi_id);
+		goto out_pointer;
 	}
 
 	/*
@@ -754,8 +739,8 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 	    (cpc_rev == CPPC_V3_REV && num_ent != CPPC_V3_NUM_ENT) ||
 	    (cpc_rev > CPPC_V3_REV && num_ent <= CPPC_V3_NUM_ENT)) {
 		pr_debug("Unexpected number of _CPC return package entries (%d) for CPU:%d\n",
-			 num_ent, pr->id);
-		goto out_free;
+			 num_ent, pr->acpi_id);
+		goto out_pointer;
 	}
 	if (cpc_rev > CPPC_V3_REV) {
 		num_ent = CPPC_V3_NUM_ENT;
@@ -789,7 +774,7 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 						goto out_free;
 				} else if (pcc_subspace_id != gas_t->access_width) {
 					pr_debug("Mismatched PCC ids in _CPC for CPU:%d\n",
-						 pr->id);
+						 pr->acpi_id);
 					goto out_free;
 				}
 			} else if (gas_t->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY) {
@@ -844,7 +829,7 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 			memcpy(&cpc_ptr->cpc_regs[i-2].cpc_entry.reg, gas_t, sizeof(*gas_t));
 		} else {
 			pr_debug("Invalid entry type (%d) in _CPC for CPU:%d\n",
-				 i, pr->id);
+				 i, pr->acpi_id);
 			goto out_free;
 		}
 	}
@@ -860,6 +845,45 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 		cpc_ptr->cpc_regs[i].cpc_entry.int_value = 0;
 	}
 
+	pr_debug("Parsed _CPC entry for CPU: %d\n", pr->acpi_id);
+	kfree(output.pointer);
+	return 0;
+
+ out_free:
+	/* Free all the mapped sys mem areas for this CPU */
+	for (i = 2; i < cpc_ptr->num_entries; i++) {
+		void __iomem *addr = cpc_ptr->cpc_regs[i-2].sys_mem_vaddr;
+
+		if (addr)
+			iounmap(addr);
+	}
+ out_pointer:
+	kfree(output.pointer);
+	return ret;
+}
+
+/**
+ * acpi_cppc_processor_probe - Search for per CPU _CPC objects.
+ * @pr: Ptr to acpi_processor containing this CPU's logical ID.
+ *
+ *	Return: 0 for success or negative value for err.
+ */
+int acpi_cppc_processor_probe(struct acpi_processor *pr)
+{
+	acpi_handle handle = pr->handle;
+	struct cpc_desc *cpc_ptr;
+	struct device *cpu_dev;
+	int pcc_subspace_id = -1;
+	int ret = -ENODATA;
+
+	cpc_ptr = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
+	if (!cpc_ptr)
+		return -ENOMEM;
+
+	ret = acpi_cppc_processor_parse(pr, cpc_ptr);
+	if (ret)
+		goto out_free;
+	pcc_subspace_id = per_cpu(cpu_pcc_subspace_idx, pr->id);
 
 	/* Store CPU Logical ID */
 	cpc_ptr->cpu_id = pr->id;
@@ -901,21 +925,10 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 		goto out_free;
 	}
 
-	kfree(output.pointer);
 	return 0;
 
 out_free:
-	/* Free all the mapped sys mem areas for this CPU */
-	for (i = 2; i < cpc_ptr->num_entries; i++) {
-		void __iomem *addr = cpc_ptr->cpc_regs[i-2].sys_mem_vaddr;
-
-		if (addr)
-			iounmap(addr);
-	}
 	kfree(cpc_ptr);
-
-out_buf_free:
-	kfree(output.pointer);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(acpi_cppc_processor_probe);
-- 
2.34.1


