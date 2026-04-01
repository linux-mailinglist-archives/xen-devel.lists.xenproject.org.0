Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GInpM6MyzWn0agYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:58:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4283437C925
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270545.1559194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x1d-0003jN-Mj; Wed, 01 Apr 2026 14:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270545.1559194; Wed, 01 Apr 2026 14:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x1d-0003i3-Js; Wed, 01 Apr 2026 14:58:33 +0000
Received: by outflank-mailman (input) for mailman id 1270545;
 Wed, 01 Apr 2026 14:58:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7x1b-0003hW-V0
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:58:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7x1b-001u1t-Ag
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:58:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd328b-5cb7-0a2a0a5109dd-0a2a45099c52-8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:58:30 +0200
Received: from [40.93.201.23]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd3295-bf79-0a2a45090019-285dc917bd8a-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:58:30 +0200
Received: from CH0PR04CA0080.namprd04.prod.outlook.com (2603:10b6:610:74::25)
 by IA1PR12MB9523.namprd12.prod.outlook.com (2603:10b6:208:595::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 1 Apr
 2026 14:58:23 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::93) by CH0PR04CA0080.outlook.office365.com
 (2603:10b6:610:74::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 14:58:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 14:58:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 1 Apr
 2026 09:58:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 1 Apr
 2026 09:58:22 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 1 Apr 2026 09:58:20 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFlQpEVCUBJhdVIdHrGMAfcHEr5+bhfxDG8kD5PfwF6ZROOhkhMVptqfNLFN/JTi+Xl1DaM05l6cMYPI+sN7htLtQrdwdqs8Kmuh0JIl2Yp75L5GsgBMEk0ELM0W/1t/hXTrRTUR5+Jp15DLvKPRSHFNQcbfeS+l+IKGL4HcJxZp/KisVm0JehBLhoXs3EfirYj6LgLdTtpdDKL+EwLf40X2IkbaDz4XQh4g2ND/KNiNrDur6uL2eBe7++Mfp221p0ay9ApJQTggUrNtrJHke0hUut/05SljehjQlDvT2++Hxe4R0i+AufZ8x8EAhzaERoTJ4oQGKgRXKpXbLJ0g8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uo2M5ShFMFkpBNGfNOdv7BCV8+gKP2tZKik3PjF1G/I=;
 b=jq2hevditdIQzA19X/ZKQ9AQNAwJ37wfaUkJIANEbTb+KdQP4IYdsUOstWyHEt7EOdT085obF8bk2z/xvHnm6Nc0pIiwOdZI5UeW9T7Q6oOoi4dIDOS5JTt8xLATod2iKzKtrgWUidIJztvCr1VpIwy2mDaZy8gV7uisTNBwdX6BduR/IqihkGo4QptlHHlNbQ30OLjgwp914YdTb6KJBaDPenHjQgfguF6gPIG1vgpLJ0AuBPOz0YqTFOKL36Nv01o0qSuDEVOXVU/e2NT1RQAlkMTOjR+7hKzRarIoxIMAjOda9TK58iyo5r1mqtqN2P7m4LX6KCqk5HvwUt+wsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo2M5ShFMFkpBNGfNOdv7BCV8+gKP2tZKik3PjF1G/I=;
 b=hi+iS+E+pEc9Vd75ZNMkbwzBz1tJJn8JUDaP4Xm08TBsnWXMruDcUnC+TmTGdJL5uHZMu2lnViWjwdMPmJ/9Kto0Fh8CE+rvF5j3KDfEpQr/9je2q/YpE7RPl170nUIvbvELhTajFKmYkh1sde09hfMve5tMLei41ZCQ0wvBZks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] xen/arm: acpi: Rename local acpi_size to avoid shadowing typedef
Date: Wed, 1 Apr 2026 16:58:14 +0200
Message-ID: <20260401145816.169557-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401145816.169557-1-michal.orzel@amd.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|IA1PR12MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: 4920bb35-0988-49b5-d3d7-08de8fff1eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4IPKsd9U65PeYPDvfCJ4sdHcosoLG0GH0QixQPntgIxjuxSXzQwtlLRpAViJzlq1PjbrVDpaQOMhosHeNO3kNefMlHzHVDdwDZ9vDaj0JOMskFn+rvlbMoIQhGn3aUHIgeVCRCDBED/1smbs7ZsLZKHOahxjvSJ63gvMlJ7VfJCcA79XJKlm4zRdwEjHPH5nL+viMlhU4VNFQY/2ceXS2e5j6RoBfG81lLUjmfrqSKzW1ka62JLcgC1YhDoArH6deKiEjAPULmbhCdwQI+d84hR8qu7+hmJMw9i1tbxtV7H0Quc2C/JVzjJiLJSQq2ZfMqYF7gRCkbkac9RB4ADDEkYGUhMRoQBZJlaRVT/CREg9fdy89XHVP4qNCXIld8fP8VccdUxKnh4OGA0iV9Sh6M2u9DtUBXo7cBH8aOCvQBbXmpfFlgoM5csEBEtcy7wpoOs/vQncnIZnhbu0KZ+1mTEYIrwUQjW9PD6YGuOsyt32G8SGgcfornhoo/WAUd1IjCap/vnG9MpF+efwStq3EAfLp1X6SYwsSd3SlT5eALW8+/qO+qlPSiPPepqOBIkuR5bQ9tmPae+t9lRCN+/MvzuYI57uj6LvVtyub7JRpx66QJsn75yIdQu141x0WiijiQtvcIMtGil9gdOUxFHzpUWzRN0vHqkFSja9r3XS59Pfu0OE+wYWwerHFJAllEUpAyPjlKzoG7Gvxa1SYqaDCbsUCCSXp31DXw1n5P4Qe2cKPTEBxFMI5HOscGrwSAAWyl2kCFrS6IST6nBc5Lg7Kg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MdIC+eLYGsSz9HVa3WNUwB4SBMVQ1V7IFjIqh9OIEu7eb8uKsbU48RZVpbkkVlj1TTusILNq9uCT/6iLCQqiGtGiCKvkgVBoDZp/VmM3AIzX/0utsfwYC5aQJUhJvZwTVK+YfAf6QXokRN/7v5RM2HkPv3N74GPc1cCrYpGnSn1ve9M5ko/7oE30OY2z7pdb0zS6N9TddwVyLn9NuG7Ce7Qkx9dLHRbnWlNdoJUW5RJyB96yNJKMbsYSDwsnZM5kvxp2xU61PLBNfeTQgzv7vjrQl8FW7mmSDi7CFVkLHDG28Kqqfz7TJ2xr6181JemPY9oeTl34u38+qGT2m8n/svVCwD/DbH1g5Z/NHoUQlRKXI0OU8M6N52PckjeJoCgDRaBbKfYO7F/WZ9zqyTWMLLi1vipVVY5dpYX8SX66oVfTJfQi7dL7G9kFjbjCkk3J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:58:22.7348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4920bb35-0988-49b5-d3d7-08de8fff1eb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9523
X-purgate-ID: tlsNG-bad1c0/1775055510-5734C152-E07CEAC3/0/0
X-purgate-type: clean
X-purgate-size: 2215
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 4283437C925
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename the local variable acpi_size to acpi_len in
estimate_acpi_efi_size() to avoid shadowing the acpi_size typedef
from xen/include/acpi/actypes.h.

This resolves a MISRA C Rule 5.6 violation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/acpi/domain_build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index 1c3555d814cc..5a117001ef11 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -447,18 +447,18 @@ static int __init acpi_create_fadt(struct domain *d, struct membank tbl_add[])
 static int __init estimate_acpi_efi_size(struct domain *d,
                                          const struct kernel_info *kinfo)
 {
-    size_t efi_size, acpi_size, madt_size;
+    size_t efi_size, acpi_len, madt_size;
     u64 addr;
     struct acpi_table_rsdp *rsdp_tbl;
     struct acpi_table_header *table;
 
     efi_size = estimate_efi_size(kernel_info_get_mem_const(kinfo)->nr_banks);
 
-    acpi_size = ROUNDUP(sizeof(struct acpi_table_fadt), 8);
-    acpi_size += ROUNDUP(sizeof(struct acpi_table_stao), 8);
+    acpi_len = ROUNDUP(sizeof(struct acpi_table_fadt), 8);
+    acpi_len += ROUNDUP(sizeof(struct acpi_table_stao), 8);
 
     madt_size = gic_get_hwdom_madt_size(d);
-    acpi_size += ROUNDUP(madt_size, 8);
+    acpi_len += ROUNDUP(madt_size, 8);
 
     addr = acpi_os_get_root_pointer();
     if ( !addr )
@@ -484,12 +484,12 @@ static int __init estimate_acpi_efi_size(struct domain *d,
     }
 
     /* Add place for STAO table in XSDT table */
-    acpi_size += ROUNDUP(table->length + sizeof(u64), 8);
+    acpi_len += ROUNDUP(table->length + sizeof(u64), 8);
     acpi_os_unmap_memory(table, sizeof(struct acpi_table_header));
 
-    acpi_size += ROUNDUP(sizeof(struct acpi_table_rsdp), 8);
+    acpi_len += ROUNDUP(sizeof(struct acpi_table_rsdp), 8);
     d->arch.efi_acpi_len = PAGE_ALIGN(ROUNDUP(efi_size, 8)
-                                      + ROUNDUP(acpi_size, 8));
+                                      + ROUNDUP(acpi_len, 8));
 
     return 0;
 }
-- 
2.43.0


