Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNdKE7AyzWn0agYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:58:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C968F37C952
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270553.1559212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x1s-0004VH-E0; Wed, 01 Apr 2026 14:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270553.1559212; Wed, 01 Apr 2026 14:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x1s-0004SN-Ag; Wed, 01 Apr 2026 14:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1270553;
 Wed, 01 Apr 2026 14:58:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7x1q-0004Oo-8R
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:58:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7x1p-005twE-Kg
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:58:45 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd328d-2eae-0a2a0a5409dd-0a2a4503e650-48
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:58:45 +0200
Received: from [40.93.194.23]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd32a3-02b3-0a2a45030019-285dc217cd90-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:58:45 +0200
Received: from PH7P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::35)
 by PH8PR12MB6937.namprd12.prod.outlook.com (2603:10b6:510:1bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 14:58:24 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::6c) by PH7P220CA0036.outlook.office365.com
 (2603:10b6:510:32b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 14:58:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 14:58:24 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 09:58:23 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 1 Apr 2026 09:58:22 -0500
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
 b=FKVF4993NQdzmJ4lL4J5vlfiIB5Ycl+sljEGTi23OFAPbrF2AI24Mk4hKi29or1DIKAXz5WiSKoK4OYegEoDpC+EJvMv0Zid3pn03qd6irPEAZo/5/A4AtaWIaJ+d0+8uC9XaztqrXw5x+YDdTPtSUt13av6TDi4gVdTririI9MDN44VcO4zUdaqsqRqovDyLmP2YYwwTTIVD09zXHz+LJD8zsWLLdf7rnXuopltvIeS3+Up4NyajdkcvMp8vJ+gtYqCXJmPR2XoyeYPsj5Bd62rF/8gd8wQH/wOLpPKNW8XYaSxILjVaxptSFzELy/2sJ1ZANFlcV8yROoSrwONtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SILGjUjbSSooX9tKAJTxY2XSLgszRtPxBBJmqIQCNh4=;
 b=pozuB6RQieA01K8G53fPmMrNLYuC937W2LVkf4CcisdubX5lR2+igvVGVdJ+vZeLnPW/fCDWrofUzrd+gzs7u56VespLACXoicjryXWjTJxz/W1bAJB7mHnH+8sf40DtfKd0kq7XYvaKlZUIGygbdKWEBx9KwbAXoGM//HJWMW3P+ojmKakQ7QU5nBSqWDlhvwD+8YLwvaSVIKz4WLLk+QPRWYY+z3SrUS6HHhyyAF68R3Z9kkO3H12rN6oq/6cij6hslct/mYIPr6BBZcmI6xz+ayUpCF8uIMUj18Dw+SfpMiMyce9YH7AzYob86swm4izJrEa3mpQgQLNh99+Q8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SILGjUjbSSooX9tKAJTxY2XSLgszRtPxBBJmqIQCNh4=;
 b=wpQfAEIM2863b9s6/6/nWEHO/Uev9PTR19xTgZaX8HZx0fApQB+UjdUNKKuOb+Br9jD35hANbXZ5PoR1Ifn8S9m6H5dnQgPbW44nrK6PGdh0sitMqjWd0Jrr+iYrF/Q4/WmW/qmiehd6hE7D5Mj16I0DHsPWm/l0Mt3yLcwdtLk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH 2/3] xen/arm: pci: Narrow scope of file-local symbols
Date: Wed, 1 Apr 2026 16:58:15 +0200
Message-ID: <20260401145816.169557-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401145816.169557-1-michal.orzel@amd.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|PH8PR12MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: 18dfb3eb-8378-41f4-44cb-08de8fff1f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rbRM5clr5BVo/NVYlU8de5PMg+vEPdtChG16vEsfq85RsgldzzE1WvcpZx7bjojmO0S8uUxvdO+222cBsbm7dqCFCQ7HxAXfxjkgb6iHov2TaVw1hsMDYZ73iGqoJg4wC0VpgqHT81ylHaT6gqnSw+xoZgx/s+V05XWsN2z7/7g4L/NFcrHBBfL2GDcS+IAi3axnMZY9srNm73RQLAmsHr5uOpwFPjbxOr9Ol+01JFyTUJhroAYP1gLrqVLn2+aBkgUAdsHV+zyP2Im92tYxhIay5RYgwDO/koFfkzvR5D+HJoX0wTOyBE30yrKghbtbPP5VvvnxFBqXbig2Bg3+DXRMBFjo40lBaW6FBZpM19qt6djBpTR2XspfPJ9nthOVAGWf1qNMHUbIJX06xpA9AX4Amn5OhFZlf2lC17+PEUiHE+NvJ4kNtgv5FlgaAxXuzVw3axE93B3Rw71cEc/TI9nbsXlMwcOm1G9n5o0K6M9IFl5pBx8Rm89ZXiY1g3/rDoWAyfUpbx01fvUCtip2nPr2mO6cuNV+Su77kuolsxKUUjWhkTbXZEchOq20SiVL4gPaPT6Q28MeF+VZv0mkonhFbn6lJKweM0VcTTnid62GsFjwXKmzY1pv/0PswwQDlHNnRgJvNDDcOu56n+hPU2aEit2ylHf5cpZVCN4pxjf+pKVL9lhV3+GCKKfWYltXrToWuwgGV6Zqp4L2bdh65XfJonjz1o8aVaHsTtHQs2/ZQaVwJ6bKfLlsvrlniMmi30UozLYWCAMQ+u63ijrLCQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AcrG56HInp9MW3Ca18f4YugSR/stvOMOudgEeA0EanNL64x1sYPj6DRdXHB6MIODaRXvrtzB7x3+OwaSnh4buHtJGcztcCffXoW1X1od9pgourL/qiHd5EmTkqgXKzqKHQ5D8LcPlgG9BsCbBQaAfA+CkMLbYjStx7D5bnjqY66etAL1Q8EdBn6EGZ0Y9EbsWfv+G8+T9QoYcZGGUHMIT21iszTN6wFyD9Z2XZMrNgJ/upWHmtqIu+1xLH11tpsaTZPxGF7RykppmTSSQHwM8Rjrbrr8wJkZCbb1iOobxlfhbX8qQZdXynFWoFnq9zFLhR/F07MwMGvNTWnZ3EYLiLwbgR3hOSn8HKt3n5mNb1IdgY+Cofun9GanFWvQG3vz6XxIZgH04q6w5PcGQOqitIEhU/hSxf3y+0qhwi6QcRvWdyVetd2eS9sFDw5UiGjW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:58:24.1309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dfb3eb-8378-41f4-44cb-08de8fff1f8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6937
X-purgate-ID: tlsNG-33051d/1775055525-40F6FC9A-284D97A4/0/0
X-purgate-type: clean
X-purgate-size: 2925
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: C968F37C952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make pci_alloc_host_bridge() and pci_add_host_bridge() in
pci-host-common.c, rcar4_pcie_ops and rcar4_pcie_child_ops in
pci-host-rcar4.c, and nwl_pcie_ops in pci-host-zynqmp.c static, as
they are only used within their respective translation units.

Also include pci-host-rcar4.h in pci-host-rcar4.c so that the
declarations of its externally visible functions are visible at the
point of definition.

This resolves MISRA C Rule 8.4 violations.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/pci/pci-host-common.c | 4 ++--
 xen/arch/arm/pci/pci-host-rcar4.c  | 5 +++--
 xen/arch/arm/pci/pci-host-zynqmp.c | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 487c545f3a26..9060afc14d93 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -158,7 +158,7 @@ err_exit:
     return NULL;
 }
 
-struct pci_host_bridge *pci_alloc_host_bridge(void)
+static struct pci_host_bridge *pci_alloc_host_bridge(void)
 {
     struct pci_host_bridge *bridge = xzalloc(struct pci_host_bridge);
 
@@ -170,7 +170,7 @@ struct pci_host_bridge *pci_alloc_host_bridge(void)
     return bridge;
 }
 
-void pci_add_host_bridge(struct pci_host_bridge *bridge)
+static void pci_add_host_bridge(struct pci_host_bridge *bridge)
 {
     list_add_tail(&bridge->node, &pci_host_bridges);
 }
diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-rcar4.c
index 9290c6cac5d3..e1e8eb0ee1f9 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -13,6 +13,7 @@
 #include <asm/pci.h>
 
 #include "pci-designware.h"
+#include "pci-host-rcar4.h"
 
 #define RCAR4_DWC_VERSION       0x520A
 
@@ -61,7 +62,7 @@ static int __init rcar4_child_cfg_reg_index(struct dt_device_node *np)
 }
 
 /* ECAM ops */
-const struct pci_ecam_ops rcar4_pcie_ops = {
+static const struct pci_ecam_ops rcar4_pcie_ops = {
     .bus_shift  = 20,
     .cfg_reg_index = rcar4_cfg_reg_index,
     .pci_ops    = {
@@ -73,7 +74,7 @@ const struct pci_ecam_ops rcar4_pcie_ops = {
     }
 };
 
-const struct pci_ecam_ops rcar4_pcie_child_ops = {
+static const struct pci_ecam_ops rcar4_pcie_child_ops = {
     .bus_shift  = 20,
     .cfg_reg_index = rcar4_child_cfg_reg_index,
     .pci_ops    = {
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
index 2c4afa7a19d2..2d98b0069647 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -27,7 +27,7 @@ static int __init nwl_cfg_reg_index(struct dt_device_node *np)
 }
 
 /* ECAM ops */
-const struct pci_ecam_ops nwl_pcie_ops = {
+static const struct pci_ecam_ops nwl_pcie_ops = {
     .bus_shift  = 20,
     .cfg_reg_index = nwl_cfg_reg_index,
     .pci_ops    = {
-- 
2.43.0


