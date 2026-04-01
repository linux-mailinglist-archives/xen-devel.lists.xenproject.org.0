Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBT3HqgyzWn0agYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:58:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328FC37C934
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270546.1559203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x1j-00042h-13; Wed, 01 Apr 2026 14:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270546.1559203; Wed, 01 Apr 2026 14:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x1i-0003z6-Sv; Wed, 01 Apr 2026 14:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1270546;
 Wed, 01 Apr 2026 14:58:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7x1h-0003xe-8X
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:58:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7x1g-001u1t-KT
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:58:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd328b-5cb7-0a2a0a5109dd-0a2a45099c52-14
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:58:36 +0200
Received: from [40.93.194.21]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69cd329a-bf79-0a2a45090019-285dc215fbb0-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:58:35 +0200
Received: from PH7P220CA0059.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::23)
 by PH7PR12MB7235.namprd12.prod.outlook.com (2603:10b6:510:206::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 1 Apr
 2026 14:58:25 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::1) by PH7P220CA0059.outlook.office365.com
 (2603:10b6:510:32b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.31 via Frontend Transport; Wed,
 1 Apr 2026 14:58:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 14:58:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 09:58:25 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 1 Apr 2026 09:58:23 -0500
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
 b=vshDJzq/1FUERdJW0zOu2eT2OixXCDRJ4A4TZQe3PDypbEF2wDzmIdHrWrpwiV2hznn3DnvkYomqJKzrwKBfxdnXsXFUtsavKOelNK6g7jX6Ds5DsgXO7faWKiPe32ZtfRvI7zOItP8+d/IQTKOiLM8Ap9kwbSZb195FDQUmi/OXEx043rH4ceR9/Ny4Cbz2gWtlwHhiiUG/8bQaXqRZBpie6ibl7cbQmbviKbUZDV1poKsK83iz7sveOMrsdPW1WONjVpQfndbCCLaXCcYWQWPgxzPcnEzp2zgd9akTee4vhTZhi2+vhJ7umiVLQUneHj8fMY/GHtFijQkSUkrNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/HuOQxA0RHFb08ApkVbZL0fHFl6S6/91W7UGQFdUAk=;
 b=HonZ5FwcO+J247mAGfzHa1sXEYCuEjJG7Mr8LdH7yLV9fVt4MNm0NVZcdBebyl2GcizZX43PADyEon8QPKb0RQTOXoQMwdyz2OYUzc+/G9nCZelJehUgO2xctx4VMg/RlhDMYxz3oyZGab4P3n7ZMt/QtfH4Uyuv+ysPzg4B1qXoKyzGCHK7LPIVBM2cP92/rVaeyXQL2GC/uLEfbFxuy2xft4p7Gx5XtWXHU7zCp4uuIRZBDl63Di9Uj3kDU4ceF8yNturUIUbuh8jCo/X0X5YyLvufX/Nie9rDuiJCWcBGoTdJQi82PiboBePU0gNptawNbzyJPHvPsltMXFCz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/HuOQxA0RHFb08ApkVbZL0fHFl6S6/91W7UGQFdUAk=;
 b=IcCllfrW6PPIK06LU5ktab2JXZ7Kl3W/oExQI1V/+XGB0b4X4tipoIgJd8pOPAvuYV49YQ7PTdbI+o80heM1/UaXXj+mxiQ714k6T52gX03MSr+HDlePHBQFJ44dqytWepNHjOpIT4bKGKXQmftYPX8RrEH67nPi9O0WdqN5Uvs=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: vpci: Move content of xen/arch/arm/vpci.h to arch header
Date: Wed, 1 Apr 2026 16:58:16 +0200
Message-ID: <20260401145816.169557-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401145816.169557-1-michal.orzel@amd.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|PH7PR12MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfc84cb-a4bd-472b-52a3-08de8fff205f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	c/mEPU9RjHryXAPoPXBb+PQeogepqtvCkH1itRG+ng4DoE5DBJFxVobuTFcsVqzrmPNOdcsd3VjFn7NVeaw4NZDnXKSFJJoDfhq5LRmruNAaMuhW1ad75RV3U9QIW3uZR3Myyvwr/itHNbYem0LxuGsHQP9gh350i+vvruk9t+zmzgsr70gZVIQIRAjPSemmIkUcMhsLbGUN8VGZFZpHGNxhTDDaY5zARLcIeRs+N5PuVroGRfdefG4qbofa6jmHxhmw8tPRI3Z8HJejGToq9yDOvS0JlDWG2xy84qhldfu0kIlq/10SCEP0gmpQzumlIH1PvLliWueDLtAHZWOXHJoT6UTMBD+Tx32CVbvyuD6FFBKpTZloWQH6MkctZV7aMea0Nz9kBL5BtPDriqU9Nf5L6TlBX0tXXhZeEKJtUMw0vZwi+aJyPIhmOmKNLQR/+ipxwmMXF9KpBLF4uVuX/nW7txWsCvCVbpWsPLsLhlcyE5aORa9HxjBBtujUNuSBb+ibl8j1KbarfNKe+b8jDC+YQblQTZOZ+yOjTRZQowwSueJWjINAZLpGUJTDhpGfe37EBzDuL0RYdQAF58WRmZm+SbejhWeVz9YyM+NPm2aOVR1EmvykWe072a9SvpeZ+Hc+9Tiig9mK4qbS7ZwRpz9kp2m3R7sV7/eZv6qffJo6Ej8uknzFPtBPi9pkTRuGLIlOVQk1yR79gUfKaV/bzGSkxKNaD1gdEvNjJtQ9zL5xSdCQLEu5NO36V47P4UZISACKnQN6fva3mkMNR8Q8cA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nsSG0nyfapMxnBAK2ag+8i+B5zRzLhMsVCz615KbxFaxVF8DovMuoLVkYemtMrJqHS6NemZvnHGREx7CEKWfJrUbXT8t3uH1NWDC9sBvMZKizCir25TZ8tu61Vo0J7md0oomCFzDDb1HwYMvfgeY6YwwZ4BcxNBBo6MY2nfimdHMtHtOMKzc6ThAzm2riyfKXn6IBrXktU2MP1QFuS1UgE1MmaysN2jMrCfHbxcXOgzue4W0nTPoNywk7qmfC+GT1eSE44TpxLLzIEYH7NswLD7fY+2ringWoUo3KeEQzUV3hK99LS42SBSlw1JDPAWed0kauIEoBKWbyMmQT+6hH/gGt5A7fpp7u1zced24Q/QMGdLBrFxh7GZbo2C74RZwnh8Py5FXRJJ6Fe0570vR5Cpg8U4cUYPTkQykRO6aESGDKinfNTqSDJg7mvOoxwFe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:58:25.5138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfc84cb-a4bd-472b-52a3-08de8fff205f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7235
X-purgate-ID: tlsNG-bad1c0/1775055516-55F56152-6D3BC427/0/0
X-purgate-type: clean
X-purgate-size: 3589
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 328FC37C934
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move domain_vpci_init() and domain_vpci_get_num_mmio_handlers()
declarations from the private xen/arch/arm/vpci.h into the public
xen/arch/arm/include/asm/vpci.h, and remove the now redundant
private header.

Update domain.c to include <asm/vpci.h> instead of the removed private
header.

This ensures the declarations are visible where the functions are
defined, resolving a MISRA C Rule 8.4 violation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
I'm moving a file with GPL2+ license to a file with GPL2-only. I consider this
ok in this case becase the copyright on a file with just prototypes does not
make any sense and a license text was most likely blindly copy-pasted like for
most of the files in that era.
---
 xen/arch/arm/domain.c           |  2 +-
 xen/arch/arm/include/asm/vpci.h | 18 ++++++++++++++
 xen/arch/arm/vpci.h             | 42 ---------------------------------
 3 files changed, 19 insertions(+), 43 deletions(-)
 delete mode 100644 xen/arch/arm/vpci.h

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 581f82bddd48..26380a807cad 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -31,10 +31,10 @@
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/vpci.h>
 #include <asm/vpsci.h>
 #include <asm/vtimer.h>
 
-#include "vpci.h"
 #include "vuart.h"
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
diff --git a/xen/arch/arm/include/asm/vpci.h b/xen/arch/arm/include/asm/vpci.h
index db04687fc099..0cc6f5a10532 100644
--- a/xen/arch/arm/include/asm/vpci.h
+++ b/xen/arch/arm/include/asm/vpci.h
@@ -2,6 +2,9 @@
 #ifndef ARM_VPCI_H
 #define ARM_VPCI_H
 
+struct domain;
+
+#ifdef CONFIG_HAS_VPCI
 /* Arch-specific MSI data for vPCI. */
 struct vpci_arch_msi {
 };
@@ -10,4 +13,19 @@ struct vpci_arch_msi {
 struct vpci_arch_msix_entry {
 };
 
+
+int domain_vpci_init(struct domain *d);
+unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d);
+#else
+static inline int domain_vpci_init(struct domain *d)
+{
+    return 0;
+}
+
+static inline unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
+{
+    return 0;
+}
+#endif /* CONFIG_HAS_VPCI */
+
 #endif /* ARM_VPCI_H */
diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
deleted file mode 100644
index 3c713f3fcdb5..000000000000
--- a/xen/arch/arm/vpci.h
+++ /dev/null
@@ -1,42 +0,0 @@
-/*
- * xen/arch/arm/vpci.h
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __ARCH_ARM_VPCI_H__
-#define __ARCH_ARM_VPCI_H__
-
-#ifdef CONFIG_HAS_VPCI
-int domain_vpci_init(struct domain *d);
-unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d);
-#else
-static inline int domain_vpci_init(struct domain *d)
-{
-    return 0;
-}
-
-static inline unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
-{
-    return 0;
-}
-#endif
-
-#endif /* __ARCH_ARM_VPCI_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.43.0


