Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6565A91CD2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957514.1350643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgG-0005j7-54; Thu, 17 Apr 2025 12:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957514.1350643; Thu, 17 Apr 2025 12:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgG-0005gX-0l; Thu, 17 Apr 2025 12:49:24 +0000
Received: by outflank-mailman (input) for mailman id 957514;
 Thu, 17 Apr 2025 12:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgE-0004z9-T4
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:22 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:200a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6265ff7c-1b8a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:49:22 +0200 (CEST)
Received: from CH2PR05CA0054.namprd05.prod.outlook.com (2603:10b6:610:38::31)
 by PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 12:49:16 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::78) by CH2PR05CA0054.outlook.office365.com
 (2603:10b6:610:38::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.13 via Frontend Transport; Thu,
 17 Apr 2025 12:49:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:15 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:14 -0500
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
X-Inumbo-ID: 6265ff7c-1b8a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXlG+a1pNTTUr+pQM4CajbK+/5WSYT+W3uN+9iqEtyNOyNcmDp0eDrFeTF57iieFLvy27zNUIhDnujzpYXgOioUSGQWkuP09lQSwaZN3txD+QAgc2dC1Ae1gE50Hds0LvRmyP26KpSKcslLYBRcnGYUe9nr1aG8o4EYSpN3V0SpNn86ikVZr/ZnDorXr4NVyC0fHyaDh8dHJyK9gkmXu/DOhW8g8mfWDW8o5Pvmc0o5jKBOKpRgelyzRfDbYXVGvBZec7TPn6Dolj5bl9V6s/+DGp2IPyC6EWQ5hebvMkAdyHF/PMEcozQtKlfiYRTLwcVMvN3pm+nw29Wu4nI14EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqcYxmLh/A5uCJx4yM7Ep5bOtDXg6ZeSzjmQRQDNChI=;
 b=oBCwm9lVkLRSv2RiBf7ZnJDhOshKkoWK9ftFDZlpEM3Wgqzc2PmFoV+UJ6k/xkaNoEkBPg3LkW5RkgCQKQjx2MudV2DTctR7n/3jZYKRuwqRejjlszA+bfC0YxtLDGU9CpQ35c+EZ8Pf9CEdW2IZVBdmtehrIDYOZzZJ4Cl8YVqzNbZ9yaCol1skId0PVlsCKWHM6Tx4U4dwTgqo8nceWTaFpxF1T5EImaCbh5KUy0jPVQoznH7pM8RQMr/5AQ3UCod8EYQUQBH7+7wDY0FKDMWu/YbH2XXFX4Ub+ojsDVgRTFBzwaxFkqB0kl+GFuUW5K7ad+OuuQ77bzGIjl5naw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqcYxmLh/A5uCJx4yM7Ep5bOtDXg6ZeSzjmQRQDNChI=;
 b=1CkrwIQnw1TnjHzKEoAhLCIGjXvaHmcBixI21/CUBH+4gVpWeSPvcMqEnJtq3m1K776KSB3aqGeAIhRF1GzPhVF19DaSHY7twPn9+lA83pMTB6rT7DSyKF7LvETKDHhRAYW+3fO2BHd7nnYMInpW9lz5QC2EuEk0272Ti2+6CX8=
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
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v4 04/13] x86/hyperlaunch: initial support for hyperlaunch device tree
Date: Thu, 17 Apr 2025 13:48:26 +0100
Message-ID: <20250417124844.11143-5-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|PH8PR12MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c18cbe8-275d-4ba3-0958-08dd7dae42f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2HYrgQ+1yz0Th2DSfVJOrOfG23L8Mvd+qXzH5T4jsvTPpCI7fdNlnJw8ZZiE?=
 =?us-ascii?Q?sJ6hrUhpHIvBI5JFMnI3uv6Pn8aaMZg8NYGgBT/rUemb344LuQK4Mb3mmbDE?=
 =?us-ascii?Q?p2EjizAOaSbUlewDuEENZfnVg4aQJk23DCUs7E+4zKUlLdgYXuLibfeMPSqZ?=
 =?us-ascii?Q?6htFRzjMPoyveAqLPkWZFW7jYNTjmJ/SWeOaNIKdowmYuWBcGveaS4mz1Ij/?=
 =?us-ascii?Q?eyaAQfcnJvCc2d8zl1QQKkluP/JVzDIl0g/G7b2WWIm/MJQAIlBfGQ2CjAmF?=
 =?us-ascii?Q?m8u1U3AswT0XSqQoro9xNED9cdL0R2bo/Mn2nTORr7RHkp5P3wEbso9l/B2k?=
 =?us-ascii?Q?B+h0CV2xasAFcDHU6GGqmveTXoutWqbaKjMyU/ELW1vCGRQx3/dStgN5llNj?=
 =?us-ascii?Q?s87taJUGSxCdTIsimRAumYdaSdj7fE+VbU9Vrk12gUs1zNKfL20bBl4b3D+a?=
 =?us-ascii?Q?FNaqaJkf0QsSD3JxBBuSmDXZHSubHV12iKnoXeat+pglCmMGDV90w72Ju8Fm?=
 =?us-ascii?Q?WQDRwwKteQ/pEP//tOTIMWAt9OyrDuhFj0hrMpwllXMms1kUb1w0+JRF56CA?=
 =?us-ascii?Q?Uhl3TQOMDJtmkjBJQ/Y7RxJpoGae0OkFaSm+Fc1yv+jI7bx8PnCxXrTaZeSA?=
 =?us-ascii?Q?x9DqsDjrDhLJboFGA5w3/OFhQOGSLN8t8anweO3lm2owOPTpIG7NudAp9znt?=
 =?us-ascii?Q?mu9EymE5RaHqdBAvX8f3Ldlnxx5lnas+TbcORqWndXN4RcWsvrPfBsk7IV7U?=
 =?us-ascii?Q?hsXOVXHULaHdzI+BtNcVF6ybZfhRlk/1X35kVmnPSwW4yOmz9ckSA0lxUXxR?=
 =?us-ascii?Q?78UNFFHas2bgXCsnLWkPeEKD2cpdufPxhaY1BSeUCm+/wPKlU46/9aJfjrMe?=
 =?us-ascii?Q?sIeFAKThIqKtCtz6E4PmzZNyjJUV9lc2zAp0WMXnfS3959DrtOulHCu9CtH+?=
 =?us-ascii?Q?EYUn3+l+mRcQLJXVoUfuf5sermwgGgmqtWOihvT/Dtjh0ilVCBXpRR7hLBIW?=
 =?us-ascii?Q?V9KeafT/T9QVknGvYfDMwhbDXOTOjppOJSVqvwp7YgFj/MGFjwFaIdZrz0Az?=
 =?us-ascii?Q?ksy/jxf7L1l8JPqgA9FLlOfdW0Ykr262bWLrqu9qqZlmYI694MCngqUt9sZL?=
 =?us-ascii?Q?nwU9FqhO77nNcU6IWw8c597au0KoyIv8tgYolJIB9iI4PB0qK7pw1XRB2syJ?=
 =?us-ascii?Q?fB9vXK/DkIdGokSkEwg4I8Qeoi9D1ABbXjBXAn0vQMMPsooAEh2uUFIBcv9i?=
 =?us-ascii?Q?JE9QNRVx1j2OlMFGCz90PUGmhHjEYHzVVnDK/Y7ipMta4uYoh2udtTh8yBDc?=
 =?us-ascii?Q?WZEV6oR9qrLHmbf12M83qdPDYgR9pvfPQRzajN1pWWK0HKz/LhR3GyPDluPu?=
 =?us-ascii?Q?oMZxHanpxZluQNNsV7PS0zbCRVQuDX28HC1BptnLCxNFPlybaZu9lToiLQCU?=
 =?us-ascii?Q?I0awtqUYld7cfRDbvyrfSqnLSC6ozwBMUJ3OMLFndIwFsPFOP/Lc/9JUVNa/?=
 =?us-ascii?Q?mtvdaJKUXy1alKYsK2AvQOyGyBL+r8yIVHlA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:15.6794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c18cbe8-275d-4ba3-0958-08dd7dae42f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add the ability to detect both a formal hyperlaunch device tree or a dom0less
device tree. If the hyperlaunch device tree is found, then count the number of
domain entries, reporting an error if more than one is found.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Panic if we're booting on hyperlaunch, but walking the DTB fails.
  * Remove inconsequential "else" clause in fdt.c
  * Remove stub, as it's not required due to DCE
  * Use min() rather than open-code it
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/common/domain-builder/core.c    | 11 +++++
 xen/common/domain-builder/fdt.c     | 63 +++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h     |  1 +
 4 files changed, 76 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 82c2650fcf..1e3d582e45 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -84,6 +84,7 @@ struct boot_info {
     bool hyperlaunch_enabled;
 
     unsigned int nr_modules;
+    unsigned int nr_domains;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
     struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index a5b21fc179..3b062e85ec 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -43,6 +43,17 @@ void __init builder_init(struct boot_info *bi)
             break;
         }
     }
+
+    if ( bi->hyperlaunch_enabled )
+    {
+        int ret;
+
+        printk(XENLOG_INFO "Hyperlaunch configuration:\n");
+        if ( (ret = walk_hyperlaunch_fdt(bi)) < 0 )
+            panic("Walk of device tree failed (%d)\n", ret);
+
+        printk(XENLOG_INFO "  number of domains: %u\n", bi->nr_domains);
+    }
 }
 
 /*
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index aaf8c1cc16..b5ff8220da 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -13,6 +13,36 @@
 
 #include "fdt.h"
 
+static int __init find_hyperlaunch_node(const void *fdt)
+{
+    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
+
+    if ( hv_node >= 0 )
+    {
+        /* Anything other than zero indicates no match */
+        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
+            return -ENODATA;
+
+        return hv_node;
+    }
+    else
+    {
+        /* Look for dom0less config */
+        int node, chosen_node = fdt_path_offset(fdt, "/chosen");
+
+        if ( chosen_node < 0 )
+            return -ENOENT;
+
+        fdt_for_each_subnode(node, fdt, chosen_node)
+        {
+            if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+                return chosen_node;
+        }
+    }
+
+    return -ENODATA;
+}
+
 int __init has_hyperlaunch_fdt(const struct boot_info *bi)
 {
     int ret = 0;
@@ -20,7 +50,40 @@ int __init has_hyperlaunch_fdt(const struct boot_info *bi)
 
     if ( !fdt || fdt_check_header(fdt) < 0 )
         ret = -EINVAL;
+    else
+        ret = find_hyperlaunch_node(fdt);
+
+    bootstrap_unmap();
+
+    return min(0, ret);
+}
+
+int __init walk_hyperlaunch_fdt(struct boot_info *bi)
+{
+    int ret = 0, hv_node, node;
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    if ( unlikely(!fdt) )
+        return -EINVAL;
+
+    hv_node = find_hyperlaunch_node(fdt);
+    if ( hv_node < 0 )
+    {
+        ret = hv_node;
+        goto err_out;
+    }
+
+    fdt_for_each_subnode(node, fdt, hv_node)
+    {
+        if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+            bi->nr_domains++;
+    }
+
+    /* Until multi-domain construction is added, throw an error */
+    if ( bi->nr_domains != 1 )
+        printk(XENLOG_ERR "hyperlaunch only supports dom0 construction\n");
 
+ err_out:
     bootstrap_unmap();
 
     return ret;
diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
index 97a45a6ec4..955aead497 100644
--- a/xen/common/domain-builder/fdt.h
+++ b/xen/common/domain-builder/fdt.h
@@ -8,5 +8,6 @@ struct boot_info;
 #define HYPERLAUNCH_MODULE_IDX 0
 
 int has_hyperlaunch_fdt(const struct boot_info *bi);
+int walk_hyperlaunch_fdt(struct boot_info *bi);
 
 #endif /* __XEN_DOMAIN_BUILDER_FDT_H__ */
-- 
2.43.0


