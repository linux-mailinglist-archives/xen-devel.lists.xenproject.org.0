Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC9AC8D4A
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000715.1380948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySN-0000CO-OV; Fri, 30 May 2025 12:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000715.1380948; Fri, 30 May 2025 12:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySN-000098-Kk; Fri, 30 May 2025 12:03:27 +0000
Received: by outflank-mailman (input) for mailman id 1000715;
 Fri, 30 May 2025 12:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySL-00076q-VE
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:2418::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16949eaa-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:25 +0200 (CEST)
Received: from MW4P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::19)
 by IA1PR12MB6163.namprd12.prod.outlook.com (2603:10b6:208:3e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 12:03:20 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::7e) by MW4P222CA0014.outlook.office365.com
 (2603:10b6:303:114::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 30 May 2025 12:03:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:19 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:16 -0500
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
X-Inumbo-ID: 16949eaa-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XScqiqPgssSj1MjcUsiWEqanqpx+mIg040FX0yu762svZwmjhpwUsUItA2g0a8IS5sevXd3Es/+352JMcNm953ULhy+WcEDn56CN4Lw0Td9sTOv/dPXWiMx39Zb3fQHrEJrKOj/woUC31olG6roTTMqTo1pm9UqAHhkJW6QfU5VH6n/O8VXy0FeoyXviNV2XzlGX2P1o3ToON4qed0jrs2Ajk8ycFg1aHAKbClJWaovSJNCXhWF2Dlnvsi1ouT9i6AA0z03UbIBEWPNtpDBqnBnNdWgL3SXzJGCC4tvQG9IlpRLlQ4OYwzVmKoyK/E+atUTgjCDXXjt10NmjnYvDYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVbXefuGXvR0oYEIOeTnmJPdVj5num7GvQxtWu/G3Ng=;
 b=palHz8Q83K4QIIKYpmfjZeLTmZ5DLGRWLJjoiVonY717hbaeghr16Pxnb8D1K6PyMFGBFOIXsXt/Y3Yf2vgegrGZnEkh83lTUovLd0gFlnsDUWgI/CRQg6L8k+TxpNRzxjoVIZmkyMnkDaI/CHNo04QaKevrd/AMz6mkqqvbv8bylnCMsKLERi+SzgIY+BJUMsgLVC5dMeOMEV8s3O8PB1Doc1S/3ssvcJXfdUiPpweQm0hfPUli8RZaP9B17H2hgMypLyYsNjOI32zx3h9cMTWFxgIGd7soT71h46EY+p+zgWUKpzTdqJuQDKgvxW8xzmfmap+DGnrkYdfTugaBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVbXefuGXvR0oYEIOeTnmJPdVj5num7GvQxtWu/G3Ng=;
 b=QSsqKRITfgVSU3lkZ6WMcdOacxpN6ZzQoHNEWAgZMKbBwI0z3f/mkTvgsH7yfu5VoACN8XSo10FP1209eeR3mHrqqoeNxeFcNLUPopyXWX1WYoHwVDBD5E5BXDnFXoRJboeE1ckIurIqSKTQQxl5n/u1zuEQKR/aa1sV/afuW3s=
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
Subject: [PATCH 06/19] xen: Clean up asm-generic/device.h
Date: Fri, 30 May 2025 14:02:14 +0200
Message-ID: <20250530120242.39398-7-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|IA1PR12MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bb117a-b1af-4175-f686-08dd9f71f81f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IZYyICNHHP043awSqAUNCWg7LCG16YO4T4x32Az6z1r0XSt0SVd1ksfEY2tS?=
 =?us-ascii?Q?VdTqG8JB0QEC8HcY4K++Jq9X5pmZuAtAxPjXvKhmiwso+uimstwZwY06d3iS?=
 =?us-ascii?Q?v52my8eEVQUZbCkf4TU0ZA4+mrVG2tXI8/iBkp6PoUSS5GWO/p15JgOjy9HY?=
 =?us-ascii?Q?SzzJ/43uZFRjG3H1R4ayfNzbZmN2LhPcaTG+rIlc6ATzWGRyZNXTsDaGvC9N?=
 =?us-ascii?Q?xS5CFkBHqWwpxhFgaCfOJr13QjiJvzrJ9aDwk2iO4o3xfLjcKOzHMeSgdCQH?=
 =?us-ascii?Q?hq1GSFIxmdsm9ycBKKi2euGtIYVtkagN8jXs4QuJ2mEAtA2Lz6ejzmhbd7Q5?=
 =?us-ascii?Q?7Eanzz+JEDNqBc159O2DNOPVGx461mAgjaEJCuD7HZfMVVUVlQZDssubwfv5?=
 =?us-ascii?Q?cAVoXRAQAKMXqLoIowyHNQ9dtuEHvoRaGdNgfhSVYYLcraIwkRmxXUKIY5Vb?=
 =?us-ascii?Q?n1lSzhXxzmJsf1IvHOdqqEZ36RXZglooE6XSIzdKxIeyxaH/o9F1Igx9AqSd?=
 =?us-ascii?Q?xqWLFpsPzQvruCwloU6DZfmoTwlrcmK6M1C8Tm5DRV/272USBvQ6Yh5LBtQq?=
 =?us-ascii?Q?7hqgojOp+Md8UWN8lWrHwn5b2rH/Zw4Dxf+Gl4EgwXwRuLpmTl/cxEBJIPAK?=
 =?us-ascii?Q?hH6EQ6vODycTLCeEBOvZMT3gpIvSB1v+rg4hZAWxURY2rTv6LZTSRvXaF8QN?=
 =?us-ascii?Q?nzayq+k5ds8OQD23kOlrqJRD7p2eSXXBi80PvNfZkJRgHoJX0NUyjKiUQvpH?=
 =?us-ascii?Q?w2E4dFcaQeDvatXuSRv0BDTEEG6kieH28zEgzetBDzf3U9p/673e/N+sOYvk?=
 =?us-ascii?Q?lSdtsSgonz/APOW3YOae0iVcAfR5JdXxr4o+Vl/FbNSTbInHLl+v9tCDYkNM?=
 =?us-ascii?Q?chdudvlhK3R7WiGdH6LCHQmgceEzK2aGn87Hz2izlRgVdTimY878C/ndKzbr?=
 =?us-ascii?Q?6/Dc2pYcVb8sDFnfmr/u9M4wsbQLNBiWZYOao+crZpP0g/E37kT2G5Pz+WXa?=
 =?us-ascii?Q?Qymozz83OjCykR4bh75co3dsdBOIbLZv6l8kf7XLpWlqWS6oJ36sbcnp+Vfy?=
 =?us-ascii?Q?DMVEAc/dd6RBG8YZf2LbE5UjoLXyJLNxdEZVlg5xB6AJc4dCZw9e0ZAm3y/4?=
 =?us-ascii?Q?fcnvEMV8qq4JXyDDnlGdG0Bcj3FEt7AQiNWa1Y6HNZK2AEDz1WNeZYhwvfAi?=
 =?us-ascii?Q?InbX0ySPNpsvrgSxENRmpUQdL4qIzgMyllLaVQU7BekewRqsamAQnoSRaB85?=
 =?us-ascii?Q?0UbbkDxcQNoOdlpLM8h0nAJkRDHxbX5F3k74+Gky58SIdslYYRdYxMoIpnC7?=
 =?us-ascii?Q?dSKGZuzn9/BrYnGzoH3uxWN00LngL2VtD+F0ZDoTbYyRc0zShRM0llq7IWw4?=
 =?us-ascii?Q?F7XlJqRgkfHlBq5iBFpFgPz39CikQtcSXgr7tMjRaZMJL7vHdw1rFy3L9n3m?=
 =?us-ascii?Q?te7dhbtcI4jJQr04aDKwMpeeIkZIzSGNZvZMCkvumPL6028gRwWZZT4mgsci?=
 =?us-ascii?Q?FrSsAwBsQA5jOZ2YNQZaTL5rZcRsipG+YejQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:19.8897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bb117a-b1af-4175-f686-08dd9f71f81f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6163

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
---
 xen/arch/riscv/aplic.c           |  3 ++-
 xen/include/asm-generic/device.h | 18 ++----------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index caba8f8993..90bf222eeb 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -9,12 +9,13 @@
  * Copyright (c) 2024-2025 Vates
  */
 
+#include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/lib.h>
 #include <xen/sections.h>
 #include <xen/types.h>
 
-#include <asm/device.h>
 #include <asm/intc.h>
 
 static struct intc_info __ro_after_init aplic_info = {
diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
index 1acd1ba1d8..d485fb97dc 100644
--- a/xen/include/asm-generic/device.h
+++ b/xen/include/asm-generic/device.h
@@ -6,9 +6,7 @@
 
 enum device_type
 {
-#ifdef CONFIG_HAS_DEVICE_TREE
     DEV_DT,
-#endif
     DEV_PCI
 };
 
@@ -23,23 +21,15 @@ enum device_class
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
 
@@ -87,10 +77,6 @@ struct device_desc {
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


