Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E3ACF84C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007453.1386739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaB-00039g-3T; Thu, 05 Jun 2025 19:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007453.1386739; Thu, 05 Jun 2025 19:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGaB-00037Z-02; Thu, 05 Jun 2025 19:48:59 +0000
Received: by outflank-mailman (input) for mailman id 1007453;
 Thu, 05 Jun 2025 19:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGa9-0002tD-AD
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:48:57 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2418::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d27cfbb-4246-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 21:48:55 +0200 (CEST)
Received: from BN9P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::13)
 by SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 19:48:46 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::ec) by BN9P223CA0008.outlook.office365.com
 (2603:10b6:408:10b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Thu,
 5 Jun 2025 19:48:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:48:44 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:48:41 -0500
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
X-Inumbo-ID: 1d27cfbb-4246-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcG5aCmN+sLVcWelr4FxqvUy/uLTWAXBl91zZl/UgIjZ34jaA6OkR9QHnXLI1iu9xSXbzDp2IbE8sXR0EW8cOGZl2gVKIrFTPK/Paqw1Oo1ZyaNJXJnBFDWOez9AZplwR4c6pJTItz0eEbwmrFr8THqgoaOGXg0O59PCkjdjMrNwewq0v3jv3qvPupnEVDPvCLM4VNzE1FWRQcjXEAyVcIVsvqb/QgheIvhbreeDgQmYVGEIqhNrgnbcPecJtTil2uIn7GPS/r8JVMlrkrHncZPrALTdhlRyZu0I1OdSvb3P7v+jtcyOVgAdse2qqjj+6uBGAjrCvSWttbWx9Qdjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVCZ4mr10xTNgUay/BsdsDmnmul66uI4HIiTZagqRPM=;
 b=R2UDXpaK84TanGZczMHhnxSeq1fvFH/v062teWAYc1tiNQAg1ryBtMzB3r7p3/0YQY2Xp6hC1KJZarMhyNcQd1WMbKphGiin0Z8vcnuHyPfLbjkBNhK46Unr/MyKIbz5KPknHRWL5BRyQan/9myj7rTh+bGlfDC+jHAlqcAtyospachncVzB1GJKjy1JkLpEMhqCmR2Ee/jE6hZF5ZoQzAe+fINEy7uhX6XBOR2Ps1huvd67xKJw23jU0tl096Qs98aZiKepxP+IVVysmPPSpQl/bbGcdU6Mc+B0t/MT/sKrdUH3vxLHUqoi63cqYRI5ZOO090+wdn/dG3mm50Gicw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVCZ4mr10xTNgUay/BsdsDmnmul66uI4HIiTZagqRPM=;
 b=G4WyiA4A61SpCvTrL7SP97jmXCNur67B3FjtOSIK9OCbav2iyeVP8tKYQ6Jf/ObiRV1330yLc22YmRdWknF+MAgXHnor7dfgwY89Nuh2H1igguVOiSaRK8oqV94xBoBbNgRDA/u5Ex+IARfx++IuMpoisSKWlKCIMnVhZDWSBlI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 01/15] xen: Clean up asm-generic/device.h
Date: Thu, 5 Jun 2025 21:47:53 +0200
Message-ID: <20250605194810.2782031-2-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: a59c1263-a5a8-4539-92c3-08dda469fad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vDIhsNdrI+3eujkFCT3CvpeGvRK0mbh5K73lYh7GeQJe9WAQyubWO5cB/0nc?=
 =?us-ascii?Q?qLQHX9N73X9KEdCBwwKIOThuuZPmBI5YSQSdnYtMB75rk9xgt8rxV8308jEs?=
 =?us-ascii?Q?LzblDRoTKPEjlIaa3PxiitnN44UGi498EYw6+kR+H/vxJH2ylsL8fwT3UOK6?=
 =?us-ascii?Q?NFbCDQVQLMkex+wHvs/QEyCcDG69NggEyhLfAQbVCebhceOQXB+NF/owSc3X?=
 =?us-ascii?Q?t8E/nbfghWmy8SghX26KvY4gxCx9sTfMb3qCZ/5ljjpXcKN9YN/oXgA3CoGe?=
 =?us-ascii?Q?1iyAGD0UTLWaLOhFVKVDhycUGAQN4vNx6ipLjBkkSBArJt6sT8SYVreqSQ+J?=
 =?us-ascii?Q?qDy9Kt+4SLtIwm8kGuFQq9I9ZFaP9d1z4v4jCwMQ32p5YRv7Ik1xpkhm3frF?=
 =?us-ascii?Q?D+t83janXvt1kSDAbiU/cHimOo8c9yO+4mRZDFY3bWCiwuPSG7Q0+iDmiJiH?=
 =?us-ascii?Q?uMndviypPU5a4fo2Nzdh3N0UJN927xz7CW4/D6pHFCNwRzsgk90zFXHVVLMg?=
 =?us-ascii?Q?SZfkd3T1C3XFAduE3XjlYVOpENeVFXW6tLuvYrGEKThD3tV1vGGV6OTMHVnG?=
 =?us-ascii?Q?NG6GIlt2W4eTrbl5rnFIOKJZd3qwOp+oC/is736kGLPJrml0i9Eqs68WzADm?=
 =?us-ascii?Q?I9tuUgkMHBnYNP4ekxPhmL1fnHeemSveUaVi18C/lMh8mbjayo8w9oyQ1JNW?=
 =?us-ascii?Q?30FiadWKBpqPpyva5eAnln6jVBgASBqTLkyGg/GOXOHOCfLDXZ9YDQ+I2Eud?=
 =?us-ascii?Q?4h8/pjNzsRxxpoNR1yKtWI1tx73OMkH1eyvaGgm4E9KckPLbxT/pvuHp5dpu?=
 =?us-ascii?Q?laQN4rtq0IpRVhdIbp68X+Y1uFZ6/ewakLF6TG034tQ5CqX2zh3CETGyh++Q?=
 =?us-ascii?Q?OufF2su/j74+p69zo+BRRGWEYL+hcsBohwRBm7clOcCwijujJCTPR0/REe2k?=
 =?us-ascii?Q?6Q9LfFXecta4Gkfinnpv7lQtIBYIKGps5A10/q+sp5ayRyW9xxDluvI7tmpy?=
 =?us-ascii?Q?wMFMZLw9I1u0UqAFitNjavoUcrS+HJWSJYJMgj+Rx7V6FzWLuQmLGRhP0GMq?=
 =?us-ascii?Q?w1nGuGQbfw95uDE3Bb91D72BNrUkGD4wTJFH6MeiDn4Zwf3fVVrPKfP0eoSK?=
 =?us-ascii?Q?pmlBFUzO2WlqC5n7MtBg6ejtnn82IGlS10beMH61eVNBtTUrWVRndAfFvQsN?=
 =?us-ascii?Q?5/BnU/qeefb1KoZAwC48IO3EPDp+nsgIWobGVdUbQEOqJn7MAvPka0rohfKl?=
 =?us-ascii?Q?bUJiABFooc42lgB44NVtxt6KUwnB5Bw/i+QQ4rL/QgGd8t8/FaN+d2bYsyV6?=
 =?us-ascii?Q?w2og6bcJgNa4igfP5WDNiLW1xLMBTOXNYAVcnsETVbrKGMiZELqRDt/z5m2F?=
 =?us-ascii?Q?HzZseg1Wr0Ze8rOwMaPxxexCDWudskkmgJG30ustuRKKf5lIDSbV6Q2ISMjG?=
 =?us-ascii?Q?xPQXIDZX3gKDMSATMJ1G22WZvdbWkmaYn1X5gL4Y6pU1OaC055qiUfo+sCBS?=
 =?us-ascii?Q?DUe3CMHsdDY32C5xI6iTt13Johr/kH6q2eCn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:48:44.3121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a59c1263-a5a8-4539-92c3-08dda469fad9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313

There's some pretense this header may be used without
CONFIG_HAS_DEVICE_TREE, but that's just wishful thinking. Only x86 lacks
that option, and it fully overrides this header, typedeffing struct
pci_dev to be device_t.

Furthermore there's an include for xen/device_tree.h halfway through the
header, but that header already includes asm/device.h, creating a cycle.

Clean up the header removing ifdef guards, merging the typedef onto the
struct definition for device_t and removing the spurious include.

The only affected file is aplic.c, in riscv, which is forced now to
include device_tree.h directly.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2:
  * Add new comment and ifdef guard with #error
---
 xen/arch/riscv/aplic.c           |  3 ++-
 xen/include/asm-generic/device.h | 26 ++++++++++----------------
 2 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 10ae81f7ac..dd7a274c52 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,13 +9,14 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/lib.h>
 #include <xen/irq.h>
 #include <xen/sections.h>
 #include <xen/types.h>
 
-#include <asm/device.h>
 #include <asm/intc.h>
 
 static struct intc_info __ro_after_init aplic_info = {
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index 1acd1ba1d8..631dab046a 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -1,14 +1,20 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * This header helps DTB-based architectures abstract away where a particular
+ * device came from, be it the DTB itself or enumerated on a PCI bus.
+ */
 #ifndef __ASM_GENERIC_DEVICE_H__
 #define __ASM_GENERIC_DEVICE_H__
 
+#ifndef CONFIG_HAS_DEVICE_TREE
+#error "Header for exclusive use of DTB-based architectures"
+#endif
+
 #include <xen/stdbool.h>
 
 enum device_type
 {
-#ifdef CONFIG_HAS_DEVICE_TREE
     DEV_DT,
-#endif
     DEV_PCI
 };
 
@@ -23,23 +29,15 @@ enum device_class
 };
 
 /* struct device - The basic device structure */
-struct device
+typedef struct device
 {
     enum device_type type;
-#ifdef CONFIG_HAS_DEVICE_TREE
     struct dt_device_node *of_node; /* Used by drivers imported from Linux */
-#endif
 #ifdef CONFIG_HAS_PASSTHROUGH
     void *iommu; /* IOMMU private data */;
     struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
 #endif
-};
-
-typedef struct device device_t;
-
-#ifdef CONFIG_HAS_DEVICE_TREE
-
-#include <xen/device_tree.h>
+} device_t;
 
 #define dev_is_dt(dev)  ((dev)->type == DEV_DT)
 
@@ -87,10 +85,6 @@ struct device_desc {
     int (*init)(struct dt_device_node *dev, const void *data);
 };
 
-#else /* !CONFIG_HAS_DEVICE_TREE */
-#define dev_is_dt(dev) ((void)(dev), false)
-#endif /* CONFIG_HAS_DEVICE_TREE */
-
 #define dev_is_pci(dev) ((dev)->type == DEV_PCI)
 
 #ifdef CONFIG_ACPI
-- 
2.43.0


