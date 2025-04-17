Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DEA91CCF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957521.1350694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgN-00077s-7C; Thu, 17 Apr 2025 12:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957521.1350694; Thu, 17 Apr 2025 12:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgM-00072Y-W8; Thu, 17 Apr 2025 12:49:31 +0000
Received: by outflank-mailman (input) for mailman id 957521;
 Thu, 17 Apr 2025 12:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgL-0004z9-4n
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2406::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65bcd473-1b8a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:49:28 +0200 (CEST)
Received: from CH5P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::11)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 12:49:24 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::4f) by CH5P221CA0020.outlook.office365.com
 (2603:10b6:610:1f2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 12:49:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:23 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:22 -0500
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
X-Inumbo-ID: 65bcd473-1b8a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHPlcpwvFKLLU6jznuSwnBDoa0O6eRXR40KZ0CA6fA7RVbse/ntZ7g6NdwRy7nMyZtJ6UnUbDIz7ecT6p7HjcEJjMFJ0q4JVV6F32q1WgHQ0veBVMB/MFmuLTtuUvM2/ZuEHF9x7daQsgMRoiD8njvSYBDtaCYntj7xfMslijgIzOCiipiA2J3ZEEU1lVBmCSH3py3dIjezN3vLxVX90NgaKGxGGJUJqhNOA3BulL+vtjm6qxmf9mzN3c2F5PMC5tkb6CaMJzAniUZlpxpnRVKrGT0ORmK29fdZtORxuMVJkivJU/0GU8h6EeivLt/Tt2oKN7TR33VoTRfVqxKxhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m817Z8mbAQ6qi2tIdrjmLnKGXqF4Yyr5waBB1b3EjGc=;
 b=KKf9xXLmKx2hrLyD1A5lZni9rZc0lX7kOgtyRU4VfDeOMk0G/k4fPJA5zRIvwBMMbfMlkJgGUwW3lwEcLzuhlxrVXzj5yrhAu62hr643NJ/KnYG54mnAaJr89SHfsBRQxyXoSpDtvAO+wcTv0BXUnAvFhGgzG9kAtoll6Hk0ZboiIRjSeptS+PcBzFmffD/3Q2n9S3hk/5zizqZ4H/7ff5rQ0Gqtnz1pEE7N3xTQ7sqtaJJuS1YPVEcgo2bBtICvTK4FgGsVUNtE3zNHTv5fD79lBipD227AdVmFC5A0fW5acShU3/iNGuyBS4WF558vYxGvUQXFPvgCXgfL28mhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m817Z8mbAQ6qi2tIdrjmLnKGXqF4Yyr5waBB1b3EjGc=;
 b=pR3VH1D/veZm4y00LImEciU6PwlfTvvU5Uya3sjZ0QfccVSw3zcWIoopUoKsoegVqCbCuJ16KUX1EVE/+Rw8A+Etn6E9C3j72GqeRJnxqRWpGtpCq2pyIUSODZB5fltN7uJ5LZNKz6+LYamCISKYOb7KLbBrVKgrjYP7w09EPwg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v4 09/13] x86/hyperlaunch: add domain id parsing to domain config
Date: Thu, 17 Apr 2025 13:48:31 +0100
Message-ID: <20250417124844.11143-10-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417124844.11143-1-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 31aa6957-a103-4e5a-088e-08dd7dae47bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uBpcaXgDQ9GsVpY8VIjvBqeApBNHu15oiT3YtmvIy1IXhmjKNXvuyuaECnaV?=
 =?us-ascii?Q?E+YBlgUOUKzWXxwpfRLRtWN53nrZ33kdrY+2iqz06eP5FeHpj+YqEyoTf5Vh?=
 =?us-ascii?Q?oTI5d3wyQ4ewK4NrBZumFHxJBlkIp/E3cbKCKYHKqtdbFlCp5bKgJg98IfOf?=
 =?us-ascii?Q?UR0vqchi89EZiba+q8gcn4xLjWaeU7kTPUx3XQqczK3Im6BpZ3ANlw4JDsPh?=
 =?us-ascii?Q?orMZQTjetJ3VuxGgWK1AwUVknXqPTripUqZ/YLxsArjt47rQZzO+t4WOoi3F?=
 =?us-ascii?Q?h32vOX2bCTCi/ceL30d6Kat+HyOlSDjnlitnnIbB5kqxiO07uhP2Hpalgglj?=
 =?us-ascii?Q?/lmTnY/AGWqe064Sm6YIwoajAAJ19ywtubhUKHgOLuTaECpXBtTP4BVomBfr?=
 =?us-ascii?Q?cKR/LsJmTLhNdMQQ/SfG8JWMUKNbked3+0q5vRi8ml6JXs0Bu4L0ZBNWT8n6?=
 =?us-ascii?Q?ZS1yg2LxKbrNX8Y/crr+uxKUnuM6jwnrSDhe3MJ5Ms1fYChwTKG/QobcmbVj?=
 =?us-ascii?Q?ejfRQ0vnDTOvgIzvkbGIRo9wpqHezPjncXmLG+VNt4hdiKf2/K1FIRgM98/o?=
 =?us-ascii?Q?8Vcp6K3/1t+h6z1TE6jcYM06kcxYi733Oz/DtR+lYl/VbK+GJ6S11KQZ+Oy6?=
 =?us-ascii?Q?JDNhXrXNNKNHpxXNQ3T/b0bKAy6kmGmceatzpJleruA2x1v1pZydq5Ymjhsu?=
 =?us-ascii?Q?1TybCjZZ/puAIQmw0QtxhazQjXSbwimSh1A+DLfICY78VmYL91TACkh8ZQBW?=
 =?us-ascii?Q?SlmPgZfM02X6amNd9J8ikFdeM6QRxshXUT/3wIKNI3dQ7OOCEHBLHLbRfqjc?=
 =?us-ascii?Q?i/urylRmhqDx6TWtuPVSVftwPZ40JTxSQh+SKdLVnah4b3bsXAtFQGc+Ld5m?=
 =?us-ascii?Q?EFPCqaaOcgqzgTzR4X8XWnmxq7KAaYdU5mMyXa4IoFSnz7D3i5Pg2gry4fyt?=
 =?us-ascii?Q?KRqNNu69GnPGg6lUvB+/HTnr6rSY5USGtn2lP4Ou8mNMrazBV2wseRT0lYCS?=
 =?us-ascii?Q?rQ9oo9XImqylGhNryF3lFRxmsQX4WIpFFRrbG20d4WJcNBxZSX1PBxtFaW6h?=
 =?us-ascii?Q?sbC6JrfIYZWBC7JrJaW+9edYW3eCeM4piKASWnNz4eYunuwd4VSehZfJ7FZ+?=
 =?us-ascii?Q?rxHkmsLQprccnay5at9vQXP3xiJmh55Dr4ue7ZnPSIGzKS9eNGTOA5Fs4HID?=
 =?us-ascii?Q?L8+0AGkRYXvwXqL/hLRfKN6idgFc2XWOrmWonFkcAgauxuCXTLYoQNbrUo4s?=
 =?us-ascii?Q?ciM/ESZMdzJpoQqnCFtePQUkin56RJgtmWmsGo4GSvJwm0IltiF7/18RlX0t?=
 =?us-ascii?Q?u5Duh418urBvdRXGfX3HEa309+5F6n1IUaKLRzX7ooN+eV+eBmGhf4z5NTjB?=
 =?us-ascii?Q?nyA2OcN+A/N829LZIeyfdUCzoLdms27eMUqU/0mVCGIy8GMxU94Drx2CEEqH?=
 =?us-ascii?Q?ibckgooc6W1B5gZ07cfZ8eOf1511fypM6CnLpdEjllrEJ+cV00f8Z1awI7Rh?=
 =?us-ascii?Q?KkEdI4oYfAGB3vnmLXTP4ENAP1XBZFvLiSRx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:23.7168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31aa6957-a103-4e5a-088e-08dd7dae47bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the ability to specify the desired domain id for the domain
definition. The domain id will be populated in the domid property of the
domain node in the device tree configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Add missing newline
  * Adjusted printks
  * Checked domid node against list of outstanding domids.
---
 xen/arch/x86/setup.c            |  5 ++--
 xen/common/domain-builder/fdt.c | 51 ++++++++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 76ceb5221f..04ad2d0937 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1033,8 +1033,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
+    if ( bd->domid == DOMID_INVALID )
+        /* Create initial domain.  Not d0 for pvshim. */
+        bd->domid = get_initial_domain_id();
     d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index c0f526a4ce..0d3c713041 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2024, Apertus Solutions, LLC
  */
+#include <xen/domain.h>
 #include <xen/err.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -178,12 +179,54 @@ static int __init fdt_read_multiboot_module(const void *fdt, int node,
 static int __init process_domain_node(
     struct boot_info *bi, const void *fdt, int dom_node)
 {
-    int node;
+    int node, property;
     struct boot_domain *bd = &bi->domains[bi->nr_domains];
     const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
     int address_cells = fdt_address_cells(fdt, dom_node);
     int size_cells = fdt_size_cells(fdt, dom_node);
 
+    fdt_for_each_property_offset(property, fdt, dom_node)
+    {
+        const struct fdt_property *prop;
+        const char *prop_name;
+        int name_len, rc;
+
+        prop = fdt_get_property_by_offset(fdt, property, NULL);
+        if ( !prop )
+            continue; /* silently skip */
+
+        prop_name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
+
+        if ( !strncmp(prop_name, "domid", name_len) )
+        {
+            uint32_t val = DOMID_INVALID;
+
+            if ( (rc = fdt_prop_as_u32(prop, &val)) )
+            {
+                printk(XENLOG_ERR
+                       "  failed processing domain id for domain %s\n", name);
+                return rc;
+            }
+            if ( val >= DOMID_FIRST_RESERVED )
+            {
+                printk(XENLOG_ERR "  invalid domain id for domain %s\n", name);
+                return -EINVAL;
+            }
+
+            for ( unsigned int i = 0; i < bi->nr_domains; i++ )
+            {
+                if ( bi->domains[i].domid == val )
+                {
+                    printk(XENLOG_ERR "  duplicate id for domain %s\n", name);
+                    return -EINVAL;
+                }
+            }
+
+            bd->domid = val;
+            printk(XENLOG_INFO "  domid: %d\n", bd->domid);
+        }
+    }
+
     fdt_for_each_subnode(node, fdt, dom_node)
     {
         if ( !fdt_node_check_compatible(fdt, node, "multiboot,kernel") )
@@ -249,6 +292,12 @@ static int __init process_domain_node(
         return -ENODATA;
     }
 
+    if ( bd->domid == DOMID_INVALID )
+        bd->domid = get_initial_domain_id();
+    else if ( bd->domid != get_initial_domain_id() )
+        printk(XENLOG_WARNING
+               "Warning: Unsuported boot with missing initial domid\n");
+
     return 0;
 }
 
-- 
2.43.0


