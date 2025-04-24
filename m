Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD7A9B3C0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966616.1356804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zK9-0007yc-Pq; Thu, 24 Apr 2025 16:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966616.1356804; Thu, 24 Apr 2025 16:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zK9-0007wI-Mc; Thu, 24 Apr 2025 16:21:17 +0000
Received: by outflank-mailman (input) for mailman id 966616;
 Thu, 24 Apr 2025 16:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAT-0001nH-Hi
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2009::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be89a138-2126-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:11:13 +0200 (CEST)
Received: from MW4PR04CA0294.namprd04.prod.outlook.com (2603:10b6:303:89::29)
 by DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 16:11:09 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::4d) by MW4PR04CA0294.outlook.office365.com
 (2603:10b6:303:89::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 16:11:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:11:09 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:11:05 -0500
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
X-Inumbo-ID: be89a138-2126-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/63QOD/WDcAPlBXya9Hgxzw6neik0jVdIYDWsAHppAvxKMMy27tRx4SnRCvxpa7bZdA9Fci7NaSoy4aCUxJuTTjPpFotrKvKZX1Fz5mBHszYLGSpuHF/wMU6I8lHDJ2hmlUvC4zWbUwT19lj5HNQYjSEXKm8nx7dee186AI+xhI+VXbnuS2YtY8uhF8srix5uz5OoQD5v9iZoKx8JDFAw22XPQGQ00Dei7VDreOKS1p6wyDDk/bQlGYWFgkL3I5aTrRE1hQWH3j/DknbGWkKqVGJWY8YseNthwYMX9zRdf+vlhqfokqQ6pUpoAcDn3E1GusAhsr4ZtuEB5VdFCOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIhJ8nbyFnianlR3LJ/mEEa1RiFi8WH+5AR9mcXRzQo=;
 b=LD18mgOqq1fjZ0rUrIpzhbzcG8LsK22T+HOeEujCx2//+tT/pN6kgeXwzve+qy/zLUA7prUzLHGtCsJwPVrtugvLAqYSFGD4TkONzv3YqtAK+Ppx0AzFtU/CMsBaDqCNUviThhDhuAI+t2BMkNuzc9IXK70czAmTdYPivjgmYi2wOqJZIOZjxPHhi0RDygFHXaqdTlrMu9xgfFDEtdIOYbIbAppc8rcMdG2SwASlj4Oe3Ot7hGmAbwNHalthhzIaW9RnXT/SRDDb53365phCEhLr5DlU931a0IZpLConT+D5V+QHO84GW1JMkJcOPNkCERJrLmn1Bd6+P5/MvYj/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIhJ8nbyFnianlR3LJ/mEEa1RiFi8WH+5AR9mcXRzQo=;
 b=insDBlao1ROBg4b+WE8FzgZb34qNcm1pJPuZsBJIM7NIasvFXiBe5USd3hqfXa70SQrfN6BMUingBqGUKn9Xo4cti7MvErKiiu2f1ujUnhjqoUWeKKxhgw2L6/NP04+LTQ4cP4/GlQgf30+U7q1IxoP/iYKkgz1omUy9qtDpYlA=
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
Subject: [PATCH v5 08/12] x86/hyperlaunch: add domain id parsing to domain config
Date: Thu, 24 Apr 2025 17:10:18 +0100
Message-ID: <20250424161027.92942-9-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424161027.92942-1-agarciav@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|DM6PR12MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: d8261fd0-4ed6-498c-4ea6-08dd834aa018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dFgxyY9CgBgbJMSH0+1k5/AjM+4xqE7l7nPmVdyKmsp3+F3GqMiDnRH5Ag5j?=
 =?us-ascii?Q?0AT3QILWva9aBIw9mMdJyXiGyKLqpc/DzEfY5fXYcBF8IQ/ZO7Bmq4+GNy1t?=
 =?us-ascii?Q?GLlIYNis2amwfZWyhFLBCASKg45NJdyeTOIBtn3AKDmrIsVA2uz6/IpCpGIe?=
 =?us-ascii?Q?ILdJ3KIFe4WB4UMGNnniP01D/CCSEJiQYdHchM5JiwBeH1mfuhYtUdS5cgtw?=
 =?us-ascii?Q?RZA024hhh0kq5D1c/a1mKg++2d3oAkvjFcGgE/dM/ZNvWT1zG/cQYlaaujia?=
 =?us-ascii?Q?0meHE2cKuZ/SxtkGem1cPkO8KGjFKbPuUR9Co1JgMVG8aUa1qvbmsKWitB80?=
 =?us-ascii?Q?t7JMGOGE8+uNY90G4eBrGXZZcqm1N/iQSFQ11xOLHJ3mXOv5vbi+0SfjKHRe?=
 =?us-ascii?Q?hZBpPFErBNvqCGKsqsdxvTASQoyZpsMEJAfykLO5oQSw0wz8CBsVJLcjjoFn?=
 =?us-ascii?Q?lzkF0RltkOlpUiuMnhE6a33sZ3SJ57raLuVqvndYU/LTN9Mm58tiqADW+dGW?=
 =?us-ascii?Q?XIhGvlUchWwmDZwB553+wCDzdhNviOINZ+CGpecH9WF9cnBs93QP40Elv0tS?=
 =?us-ascii?Q?LFkAOBBrY4C/wrdM95aypKHkP0SNioAHJMEo63BX/jxuGUAGCAQrtijNHCYA?=
 =?us-ascii?Q?5IeJ24R6WU6SQcX1PK8xCaf5kCyvIUFMnNspPcMIGSj6NRA3dZrJsj9Dkcgd?=
 =?us-ascii?Q?qjlJ87MhFbE3RxbkhY/M55lsM8JPdtl5vlnHqmSH7cburSb9MQXWoOrsATjT?=
 =?us-ascii?Q?DJdXUsVTWRvHTzID/fThmWxjyMM3JUNJUKu/HyaS6IEd2UYoNMhVKI4zIu99?=
 =?us-ascii?Q?UWSCxNMMyou6kqpMRBClpQAB88pyjwBahbIgKtpSfuxOf10hWEO/cRR96TFD?=
 =?us-ascii?Q?oRQGiuvGS+XYLAfzz9RElJJWD1hCnhSHNjU8cy90ttJCVwNwgElEtFj6w6Xe?=
 =?us-ascii?Q?x3xPWqR3KiPwVrEk5tJ4M3qygELHIoqsP43EkxEz+BlkxeQNaLZgk3szj+eV?=
 =?us-ascii?Q?+MUWte7NGTXAjlbcosDMGMXjFh4llOv8Qac4B6gBKwVtSA1FLmzGGcVgkN2f?=
 =?us-ascii?Q?ihmpfnfwZKhMeysrtPLKmfmkhKfKwavkhAdTSqTNTZBhfNjJ9ZuDDq8W911W?=
 =?us-ascii?Q?eNTJXLOHQc+xcX91VoSB+5bGGHppVaoRf3CVSSmpiJ7ZGL+StKK9FHJqBD2F?=
 =?us-ascii?Q?zJg84mA2K96/GAdRYGWZV1Q27NbFXXpADOAuNkc3Ixnu/Q2Nzbe8SrBFlSR4?=
 =?us-ascii?Q?wpacGccxCuIRRXEenI8vb8ASwuBtIWTU4Nxy6lioC8HPlOatmlRj4Ur0wfvM?=
 =?us-ascii?Q?SQDcy+nJFFrreRq/+xwiIcQuDfAmFiykVhM3Ax0WUm7EiSCsl6hVvP+9Dn+/?=
 =?us-ascii?Q?p9ABBFpDfZEG3tEubSF4Em9CRidzxoZA20oaDZpjCNANylxZGAr9AS+n8KE9?=
 =?us-ascii?Q?6CICeLDERxJnY0FeqxD1bIgNGea5QzmsYYgUNXoUQB/jRkfbKGDR2+IdQ1dl?=
 =?us-ascii?Q?jQWj8SnHN/ZdzIUebYPrja1CuVZta9tgiImR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:11:09.1838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8261fd0-4ed6-498c-4ea6-08dd834aa018
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the ability to specify the desired domain id for the domain
definition. The domain id will be populated in the domid property of the
domain node in the device tree configuration.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * Added missing domid to printk (also rewrote it).
---
 xen/arch/x86/setup.c            |  5 ++--
 xen/common/domain-builder/fdt.c | 52 ++++++++++++++++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 661b80138a..ece77079d8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1042,8 +1042,9 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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
index 144fcc75b5..5a5b3c8806 100644
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
@@ -258,6 +301,13 @@ static int __init process_domain_node(
         return -ENODATA;
     }
 
+    if ( bd->domid == DOMID_INVALID )
+        bd->domid = get_initial_domain_id();
+    else if ( bd->domid != get_initial_domain_id() )
+        printk(XENLOG_WARNING
+               "warning: unsupported boot. d%d is not the initial domain.\n",
+               bd->domid);
+
     return 0;
 }
 
-- 
2.43.0


