Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96F9E4D51
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 06:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848858.1263657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4eB-0002Xh-UX; Thu, 05 Dec 2024 05:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848858.1263657; Thu, 05 Dec 2024 05:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4eB-0002UR-RR; Thu, 05 Dec 2024 05:43:31 +0000
Received: by outflank-mailman (input) for mailman id 848858;
 Thu, 05 Dec 2024 05:43:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=coHJ=S6=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tJ4eA-0001z8-Db
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 05:43:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da8d5936-b2cb-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 06:43:29 +0100 (CET)
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by DM3PR12MB9392.namprd12.prod.outlook.com (2603:10b6:0:44::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.11; Thu, 5 Dec 2024 05:43:24 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:5:1c0:cafe::52) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Thu, 5
 Dec 2024 05:43:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 05:43:23 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 23:43:20 -0600
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
X-Inumbo-ID: da8d5936-b2cb-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD+ra+IFQGzH37GSSyAkDexD9EKCYoUst8aA73R00lx9ccwDC77aina1yYkqKaOeGI6Fp7SI/yVKxIrkpumG59eF/RQhlG7KaI1yPl2JgoLbRYutRYK5p2orXZbgF0awMvyHFcHMVPwWVXXWCxX4stCCV9pjfurQx4JkbYFv22W1TWYDGgWAZx2SxteVWGuPpfRSxkLovqvJ4QaUC7zS4Sp2WDqGBfsSK9Uvim0e+p402HDE7W+9aKQMY0qhnIbzyanuh+lkTDit2h2P/k1x8TfFdcAe9PwFGoKfexKvsHwZENjjT76tVNPqRcLTJq2NEpKcQh0GZRKj/5ivSl4UPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsDTXx9VhQgMbr8Jxkh1RlqXObfZJnJqSYjRU1bKv7Q=;
 b=lK1paWeIxVEpdwe0oxSewu5sOfn4bb+nurvE1opka0szu7Y5CNuaZt8AxF+JkOnV9tIfiL3qqV4yCAvUKrYvMyPMkGWtCttsy36DVIU4cmAvHM4JgQ3LPdQjhx8HKhtl5KfY8vpMPLvHKedtbqR4und0poMkzYG9ajO3l7U8Q/dIzLie+Xje3KchAfMFDxm1pU0SdZM79ayCyLE4C28EpcuqUih8EclK+bE2FFP1MNCUmq7Q6zn2FzbymjMoUtqSb5hU3bMZXr3VWi+b0thi/8dkmbzwgUcB5+yrWw6xrkaYOt7zf8pQAVvS+IRQySU7d8OulLe+a3zaGE3Debvv0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsDTXx9VhQgMbr8Jxkh1RlqXObfZJnJqSYjRU1bKv7Q=;
 b=DhgqZlkxnyvjmPrP40F35R3OYpBA8zkZ11e3j8kK8Ao5zMy+kshfd//LD6QepqV5SwruGl4MHXqZp2Q+EHAlXVKDS6bjbSRwR1kB9XMCWDrVtDZ+om4+DyHQhOMnXrWt6x7eLlza/PVkkJaLfxERVQdKIBAnu5r4hYLUQlsRkVM=
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
Subject: [PATCH v2 2/4] acpi/cppc: extract _cpc entry parsing logic
Date: Thu, 5 Dec 2024 13:42:50 +0800
Message-ID: <20241205054252.471761-3-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DM3PR12MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c4401c-9187-43bd-f46c-08dd14efbbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9APmW5t2gIPePvIuvB3zLgJsIg3fd0GPpk4OQeLwt3XqaaJoGUoCq9bswOyN?=
 =?us-ascii?Q?vj8MkJoUlKuL/5Dm397fhI0z9gMnfYz8QBNYsYA5vnNqHs4MS/iqf+BCQ/GR?=
 =?us-ascii?Q?bnNkilwRPvm3KW6/iOqJK+q/XKntlWcQBSX1l5fbAmpc8JqDO1yZmI3aHRUf?=
 =?us-ascii?Q?ritxH54ClqT+Oor7viCbHz3uOKrfigMxXmrbsTQMq5BX21KsvZJr45+YhiwX?=
 =?us-ascii?Q?0vg3LkaG+1WUnf5fgnAQkO0diRl5s+b59Ic/e6ASFgK7gm3JxmHnfgkpmRuA?=
 =?us-ascii?Q?onbb3bScy7TeOk4eBc45+3A775LPz7yIKKbCYGPYhzuawfj/yPcz7qpl8O1g?=
 =?us-ascii?Q?D5E1zgLr8+0LWx6+gQ+cDhZFj/C90W9Fsd0fRFFiD5o1vHgegG0Y/o7cXEmK?=
 =?us-ascii?Q?VzD4gGqSjmeYvZUM1eHCkMbaJlA6ZIx5Hjl/343qcGQ8nH5ITSouz56K/n/T?=
 =?us-ascii?Q?T7Ds5RGloPmTTYQRm3U+pFoCRrOWp/3vEVQjDJ62dOZZH2XHLAxiRclWMsYU?=
 =?us-ascii?Q?CS4SzGtd98hwwSsWjKXMbzdjaeyUbvSG0TPtctaNCSQdCCuqFPdIBuXNX1+P?=
 =?us-ascii?Q?HewHscInNkBtjG81aWX2COOOFuVCQZ1ZgXNhN27Wcc9O6HI+1nwvgJwNeoZN?=
 =?us-ascii?Q?DzSRJ6IzCeD2/h6D4rW4kHb6Nr+kT7NhXjZhcLOUJoaStZWcGd1hwUoV6Xdd?=
 =?us-ascii?Q?wL8B2XkSdPxMmYTaDLuOwaCOaRPiokjRm0fzjR5un2zqMheucm0DJ0zxJCgf?=
 =?us-ascii?Q?VG5aiMKQw9wuUHerD1vVEcWFX08bqYjEFvfh8s+u5NRi1NOavx8FE2hzFGKC?=
 =?us-ascii?Q?kGp3Rjy7WC29Bd0QlcwILonn5EHfogvNuByBl7vNjEwErErQLmV4GX3JSTtI?=
 =?us-ascii?Q?mA3FXzvjaeSx5nAxYKCzWQTjxmU2vFFgS28ad/CD2vjyxjhG+o35QFfQw/e9?=
 =?us-ascii?Q?Q7eVIgrvwqtx/lR8VWjzNcf9fYQTOldouxOpL4Y15aXqLYff27axsRc9Hwfg?=
 =?us-ascii?Q?YWXW/NxvF27dxiTf7JTUAMG+mq3sxe1/hcZjjNvO84Qal7dzHmNDv5m15Upu?=
 =?us-ascii?Q?rsfPJ8BYL3cdpiOy1hSWgQCLbAtFrqeQbRlPTAv5EGmDo2RXpjKZDfPRlBiq?=
 =?us-ascii?Q?ZBRnFhB5+DNXbBi5QILXTrtEON/T1QSWtUaaZHVuZkoKeBsgXoNerAg289Qc?=
 =?us-ascii?Q?P87VE90mA1Sb/U2Rq4qF+2ig+j2XnqgsJ7g99myhMxd04MdeprSQ4t+kQKLO?=
 =?us-ascii?Q?dpjjebPZRjLdswNT+SNqlpW6JVpvZGFabjB/gJ4+ys46F6KgB9kVc1X4Ng2P?=
 =?us-ascii?Q?5ci+fNZ8xa5Pq9QqOL9oBkwVzWN2S+haprikh+DnnEYvI12yAjbsKo0sZwWq?=
 =?us-ascii?Q?kAOPxMI+SPcWg8FQAQj+7sNk9QbgqLUsCRPKcMtqRzIX0E08H0W6rdYw8qLn?=
 =?us-ascii?Q?4A6DBgrf/pW1KzfmujHFmEzZedLCZ1Do?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 05:43:23.7432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c4401c-9187-43bd-f46c-08dd14efbbed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9392

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
 drivers/acpi/cppc_acpi.c | 93 +++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 40 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index c3fc2c05d868..13d6ff84a1e9 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -675,19 +675,11 @@ static int pcc_data_alloc(int pcc_ss_id)
 static inline void arch_init_invariance_cppc(void) { }
 #endif
 
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
@@ -706,31 +698,24 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
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
@@ -739,14 +724,14 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
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
@@ -758,8 +743,8 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
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
@@ -793,7 +778,7 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 						goto out_free;
 				} else if (pcc_subspace_id != gas_t->access_width) {
 					pr_debug("Mismatched PCC ids in _CPC for CPU:%d\n",
-						 pr->id);
+						 pr->acpi_id);
 					goto out_free;
 				}
 			} else if (gas_t->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY) {
@@ -848,7 +833,7 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 			memcpy(&cpc_ptr->cpc_regs[i-2].cpc_entry.reg, gas_t, sizeof(*gas_t));
 		} else {
 			pr_debug("Invalid entry type (%d) in _CPC for CPU:%d\n",
-				 i, pr->id);
+				 i, pr->acpi_id);
 			goto out_free;
 		}
 	}
@@ -864,6 +849,45 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
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
@@ -907,21 +931,10 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 
 	arch_init_invariance_cppc();
 
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


