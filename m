Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C011AA0BE4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:42:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972448.1360808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHs-0005jg-Ur; Tue, 29 Apr 2025 12:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972448.1360808; Tue, 29 Apr 2025 12:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHs-0005fw-RP; Tue, 29 Apr 2025 12:42:12 +0000
Received: by outflank-mailman (input) for mailman id 972448;
 Tue, 29 Apr 2025 12:42:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kDe-0007KK-Lg
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:37:50 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2414::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1fdbeb4-24f6-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:37:50 +0200 (CEST)
Received: from BN9PR03CA0353.namprd03.prod.outlook.com (2603:10b6:408:f6::28)
 by LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 12:37:39 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:408:f6:cafe::8b) by BN9PR03CA0353.outlook.office365.com
 (2603:10b6:408:f6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 12:37:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:38 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:33 -0500
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
X-Inumbo-ID: c1fdbeb4-24f6-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AANoegKma5VKluTCMCNgIW07SLA3uV6GgMAXQWPqEm0plsXiuhacSJIaRFlKBHCCPbMHckP0Qs9a1muIdqhltofOC3BtA9kUJYYGnEool2Q5fZvD9TqvWT4guplU1NTUaLCyDL7NqoqAaB3rkKT9D/pUu3jdcUsWlGla6lvSrd5kaAoLL9eRdvUQv17DFpjjrj/FTD3m8+N6hWTOAmk3Nbd4G36HO3etySgoqiIzM/NO2hbiM4+3n6N83qgXb17sEsuaGStj0LmtKukiVOVEIberhXoN3hBYXm9jn0xp0bry4uGxkorYU555/pQgU39842441+eK4XXkfin6GPTuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCIp0SvGgKMTJckyMieSwQqF1Ax5pTMnvlnYTe9ZbcM=;
 b=lCPtiVw1qFiHmn+2Q54B/wr6php7K2jdbxwlV2L0dsMiwwev2g3ou1BR/ZG4PadamZWvS+tODsTCR1sOHY1+ZL7SBbzisPrG2DXH1NoIPUHOTrlX+bRMtQNT4vES4Kew6HASdg+XZzzJx3QDK2sP7CnHtZy7dnmAk2IOMXH/UQxaA2S41t/giqN+v/ujpcH9RdqlIlfIcQiEdS+wq3j0SYPiI5ixBuXy6UDYvTVLH3M3pJ1kjDY1+YJWnOkOawrLRVpKrFaC64L3XwecVGJ1uZgaonPlyasjqbPi9s5fYqDQboPmWkgGHzgEzjCbTZMsQjWccZwy3a8IzOThIz+4PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCIp0SvGgKMTJckyMieSwQqF1Ax5pTMnvlnYTe9ZbcM=;
 b=5F+OS8w4G1Q40tT+TFpPTfKV7UiA2eLHbNLJk0vdyV6yeXOCCAO0q5pFFdtt/aSIIJVuGycb/8EUIYq/C5R1Qyk0p1qlT0S6qAa03UBSnQtd5stYcW80Z/5W0bagSqYMeZmHq/agT7mGhUU0vhuVLt2crmdPcetWv2jRt/iCPrY=
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
	Alejandro Vallejo <agarciav@amd.com>, Denis Mukhin <dmukhin@ford.com>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v6 08/12] x86/hyperlaunch: add domain id parsing to domain config
Date: Tue, 29 Apr 2025 13:36:19 +0100
Message-ID: <20250429123629.20839-9-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429123629.20839-1-agarciav@amd.com>
References: <20250429123629.20839-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: df1abd05-6c69-4c5c-1764-08dd871aa09c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t3R6lYRxqbajRvIeY+OZdEze7LqvI+4PlWYeU2B/NLlQkO/hQ/GeKl7nLjKY?=
 =?us-ascii?Q?2AXmExKAFXsHq/el3VEG23ZV3bKOJQDQvmi3udX+WG3v3S4zJSi7BQMg3R9Z?=
 =?us-ascii?Q?CxOI1GbvOfVa+9Qr3pxd+R6pPfw/5ORL895w+gc2ohj9e139pC1rYQ6jjgQw?=
 =?us-ascii?Q?ESPw1NIzMihkHH0DJcIOJFhCSQeKSxT0W290+YrzI2zYNqAVet2DPcVuIV6u?=
 =?us-ascii?Q?IbOUO6hHg86XipKx9LFoPs6JDYulwVIXxAQqgeWveCOHeYzPnCPoN80R3D+T?=
 =?us-ascii?Q?oHs5XLY8OdISyxpp5rwqwE5hp1hB61c5vV41t5Ttjgf9ZEU0aO/ju7xt6zmw?=
 =?us-ascii?Q?1O6sL1rGM0bTXuZaYxPCIM2svjplQ69QMpgQzV6WdRRv0DkyMYlzoPzQa7AG?=
 =?us-ascii?Q?OsoJdZ4p7rQpnyXxnqv+XZh6jHPpKFNhEHd7G+sNfOuDNFcampaZLraHUoIm?=
 =?us-ascii?Q?anQcWxWS7wwE6wTkD+OXdhe1+kqK16nUI90kQ/7DN6k8yBbs49YAA+aUtSiz?=
 =?us-ascii?Q?2Xy3gtQurP/z9BCk/iR65gQRpqk+WAvAupvrV9MEsH+/eXYazMLiNVWMh2kz?=
 =?us-ascii?Q?lfnyGzeukIolJFyDUhevKLXl9fDoAF6DR5o1gGtTMDipl5q/bq7HqmK7wEpi?=
 =?us-ascii?Q?8bzC5TkkoyA6KV+qzCjDDQVG2wOlaf72jKRQdVHRJ3QivXOxtEKjmtxsjIpb?=
 =?us-ascii?Q?vq5W6dz9hCsFe6C/qCT82V1lY7R96lKyDvTAkLpHpyXzkBZAzGxvA1mqd+pB?=
 =?us-ascii?Q?5Bb/AYQHFm7SOFctONm5KWDeaQ1wb4QA1k1W1bAozcpwgURb75uZ6Awq4hnT?=
 =?us-ascii?Q?mTzUxe8HtTDiqFgl4BtwYlHKysgKBVZQ1iKjGAAhOIdKYVj8fZ1RLgJiUvQr?=
 =?us-ascii?Q?xhfA/91J6j0qL9usUZOStFlFgcvWtGNX2f3rA9lGkmPLM95xwzDo0nZhaiM7?=
 =?us-ascii?Q?tIe6jCaCXtfwSyeulbh9CgMCS9KgbpxoSxTkfSuXFIjHhu+xPqaAUkghzIKA?=
 =?us-ascii?Q?IcJDylPOjuQhJ/fQGcb4wPvhGv9DNsPHQ2P8bnoLUsf96UTUBIPrbuhW1kzd?=
 =?us-ascii?Q?+HiBvR2OIxJ/h8mqbw/4diIwmhfKHIfdLgPXxNgTYclexLmeEoCk6YR5VQeV?=
 =?us-ascii?Q?/xOPUm5a/JwJe1GmKY9yRWqxbSmFZ5OkUwPlFJcI8FbubRPJhKgWNZG8Qsti?=
 =?us-ascii?Q?3RaMao3pw1auzuin+U/Dr7ALifkxxDHUGakNcznbQWjjZ7ei5ScBiuzErRwx?=
 =?us-ascii?Q?INfAOSaId2VatLa+OvhwpVtFbwStC67FBXWNfQJJJUecQAX/VG7cTf02aevl?=
 =?us-ascii?Q?A2bXi0+phyYbI4DoW9TZFqJO8KcYxuM85q7/+3RPTk+V2YPKq3qJocBI8h4D?=
 =?us-ascii?Q?vsT97q4FyUNj3WjIFzZpKwzXF7mDF47jL1QC45xde+soAOl0LDWpBjSRxL98?=
 =?us-ascii?Q?36VvhSIuMKjU+c9YaT//8qaNu/llcZLz1xQ7H0grgH5vyYK5f3RK/ex/iMU/?=
 =?us-ascii?Q?2k3my97ohGdrFFhBEPlotsL/sOfj5HuGcoH9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:38.9521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df1abd05-6c69-4c5c-1764-08dd871aa09c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the ability to specify the desired domain id for the domain
definition. The domain id will be populated in the domid property of the
domain node in the device tree configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/setup.c            |  5 ++--
 xen/common/domain-builder/fdt.c | 52 ++++++++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c8de028439..10ff67ac37 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1043,8 +1043,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    /* Create initial domain.  Not d0 for pvshim. */
-    bd->domid = get_initial_domain_id();
+    if ( bd->domid == DOMID_INVALID )
+        /* Create initial domain.  Not d0 for pvshim. */
+        bd->domid = get_initial_domain_id();
     d = domain_create(bd->domid, &dom0_cfg,
                       pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 507f383f8e..2c05b0a22d 100644
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
@@ -188,12 +189,54 @@ static int __init fdt_read_multiboot_module(const void *fdt, int node,
 static int __init fdt_process_domain_node(
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
+
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
@@ -258,6 +301,13 @@ static int __init fdt_process_domain_node(
         return -ENODATA;
     }
 
+    if ( bd->domid == DOMID_INVALID )
+        bd->domid = get_initial_domain_id();
+    else if ( bd->domid != get_initial_domain_id() )
+        printk(XENLOG_WARNING
+               "warning: d%u is not the expected initial domain (d%u)\n",
+               bd->domid, get_initial_domain_id());
+
     return 0;
 }
 
-- 
2.43.0


