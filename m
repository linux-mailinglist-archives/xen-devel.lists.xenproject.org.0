Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0F9A9B3BA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966585.1356785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zJc-0006pn-Ar; Thu, 24 Apr 2025 16:20:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966585.1356785; Thu, 24 Apr 2025 16:20:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zJc-0006nC-83; Thu, 24 Apr 2025 16:20:44 +0000
Received: by outflank-mailman (input) for mailman id 966585;
 Thu, 24 Apr 2025 16:20:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAV-0001nH-IG
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [2a01:111:f403:2415::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfa4974c-2126-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:11:16 +0200 (CEST)
Received: from BY5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:1e0::20)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.24; Thu, 24 Apr
 2025 16:11:12 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::32) by BY5PR03CA0010.outlook.office365.com
 (2603:10b6:a03:1e0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Thu,
 24 Apr 2025 16:11:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:11:12 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:11:08 -0500
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
X-Inumbo-ID: bfa4974c-2126-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRHSv4eHvZfbR7M1kwjxv4CMcCkXMzJE2Az3N/UD1JNXklJyFNY57k05JFL/9bX1Qv1racOIOxIwlPNOIusyCvEBtYIWTJ3Zplkihd90guSq4oRdD8vUUbsHy2MKoRSOLRiAKJnQUy2kmvfrv2ktYBax/FbrXXlfEBP20VeODwtIMztS77788Sk88bi5CMw5kjXK4blhtLZwUZjvZDZftO2HD5t2iivfQ1w+p2Tgg5Uk11T+lGP/D3caS6gBiJcAr3tCMp95JcWFBFGLunTeSUM9+aVyvSzJ3WIL+UuV13iVi2EOGuZ/H32tDoWqmg0bezjitQMBRvQGaHfCdgqLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28gi/6IP4vO+Xxp1YWVLmOZxY0y3ZtVcvqKxcgVuVdw=;
 b=HOrU3yZdRNdc9n46mzedqAc+It9Dcg1mSSzSRu/r0+l824TfpaPTfS06JXtt2J0HDa1RtVZodNAjKgbGaxXsrjQh2PmvxoAjOF5jBSKDQkK5Td7IegQEegXe+yTtVK3x7XuZst5g9k/9z+WQBQeO1zyj0T+a5ekXACGVnZfewP87u1w8X6DVK9Xn7g1qH03JWQ3hmanQgob9ztqUx5ZgGSUB4TvMjzRqG7fHM2sWWBfEG30w7dVu69QH3R+O2NbQaCgYc0ObJkEo9PTMwDoEJw8/jbGWl8uEAycI7pfP+CDFVm3UVXFuM6Jo6zFQLOzCOWnZl38oNpI4o3v/Si0R3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28gi/6IP4vO+Xxp1YWVLmOZxY0y3ZtVcvqKxcgVuVdw=;
 b=tl4RarlaeQFnIVVOBWGOH4VU17AttqY7ybqrARSJOyv6WEooLTfNpkYmZwTa42Prq6fhI9jn8isfbK86662bk3PJPU9MOKL8m0GETFL6Op+VR50tOsyNBLh74ioFxrJN7hxidn2KvadhQFRYCNU87HQVdfZWmiM0IU4ziGVRyAg=
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
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>,
	"Denis Mukhin" <dmukhin@ford.com>
Subject: [PATCH v5 09/12] x86/hyperlaunch: specify dom0 mode with device tree
Date: Thu, 24 Apr 2025 17:10:19 +0100
Message-ID: <20250424161027.92942-10-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9c9049-c628-4850-154e-08dd834aa209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ySbd4GVpph3UTND9Mz30SAg6rKKHYyk7ir9tF/5nvVqAMMiyU0Iw7Msiuwrg?=
 =?us-ascii?Q?S2rzQ7c8MsW2WP2qlqPggqhW3YIxeAnCghFVyvisJW1pPPLK3FCfPH9sTZcr?=
 =?us-ascii?Q?392qIJAZDIlGshk0ZijgwxDK7UFaSa+uQKNycwenEvyHDzptg1PCDcC5Pze5?=
 =?us-ascii?Q?B8xTK2GMqgjihOit+v7vyACf3vs8PpK774UwIqm+WYwLcbA9Hsx25zbH1YQq?=
 =?us-ascii?Q?u4LI+6XJa7L3e6INtVHXpceFeMXphkfBEb9e762hFWCvPp9NkMwx9HRAVJ2E?=
 =?us-ascii?Q?7hhUvV7/Og2y4AjFDhcYwgYlFzyNS+6eDK3t6l09NV/x1CcgDEMT8LDrQ+V7?=
 =?us-ascii?Q?BUWui3BQviEHZO8kcw8FbF405+e4fxeu0CeXy5X6c6bPF5EOkQRAYNWHWT0d?=
 =?us-ascii?Q?7BFuDC7QJZKbuoQKtGsUYsbZ23toRiJRJKYxESQOxtUipWjoLSVu6jHuDq1y?=
 =?us-ascii?Q?WfvoAyxL/+mBFi3wJ7mn5vxjspLjaNLMb0UBZ/z44HkvqMvumimtMf/H+nBE?=
 =?us-ascii?Q?NWFVsKpEZg54vIpE0taWkcJcU7uXm24G8pYwByGOCs2MVUHbuoT9eK0yLcM8?=
 =?us-ascii?Q?awokhxzyb17HlAclW/3C6ptcD/5mDT439vsW7eT+g0dm266LUxZfnG1KFwKC?=
 =?us-ascii?Q?hurHbxpUVPEZqhRem1vCdS/UuKo/cilTmVMFED2vBACjLO+QVI3r5JePgL5V?=
 =?us-ascii?Q?RDHjEgTum/xULtkliGQkaYyLGDSvW6xk9hqH59H4mo/imDx2NEqJ1bqyl+zz?=
 =?us-ascii?Q?RtDO7G1hbMb9lOp6Xv5BhcUvH0vwokK4SDTXb2IEmdXqv9oPdqT5TPQK0t4L?=
 =?us-ascii?Q?2DgoEV84TQ9AHttxRjugrilMDG/jqOAAaXe7f9Wq9m/l+rQJRiMYssFDrAFG?=
 =?us-ascii?Q?WFalSPi/Yqfd60UEChL+CHg0yR/WI7uq+UGIIj1SM73XN2VaBPCyZsEJ/bVK?=
 =?us-ascii?Q?yO3MtIUNeiL9MwUyv4Oaw1RaOxS8KAmEd8ZTS6KBmrCV4jsHIem6bP6Gmb/l?=
 =?us-ascii?Q?qQzPVHZrr/eK/ikOSprbCeu9TiqyXZJUkgCiiRiLWy5kjfbQAGzkj3mZlgl5?=
 =?us-ascii?Q?IPdajgiSbB0R+QpGvQR9kKciW78F+8XPh/CWZjfXqiHT0F4Kg98fqj2XAXhX?=
 =?us-ascii?Q?laUAQpxfo4W3uKBwwzSaA5t6rxoWwb0oijILJCuvu4VbL1ggsX6ZDTh2oXJg?=
 =?us-ascii?Q?MqIpUFEbYgcjkI1LQvYsC6cURvWbO27zQmN7MnEvXoh3WX+ToDgAm2kAy4QY?=
 =?us-ascii?Q?egZvVlmKRrjIM5wonG7MD/UHUT3WPvLI0PYoQ9z9mGqTf7mxaHgpmKTjNbsW?=
 =?us-ascii?Q?S0b3nTw+UW6GXqys4paGKgT1TpGJhYXXPZvDCK/XvYPz5nOFlALGgy1kMFSr?=
 =?us-ascii?Q?WWwQ1rudiPvdCLj2HNl9aQ2lZMZC+RCGW7jMpSt+hTtEXeCH5Nvx+mEl+Zyr?=
 =?us-ascii?Q?QO9G/z9udp5I8fyRqEhiM2sczPd/dwtBzmXwOWDmroNcyKSV+PJP04vFo9JC?=
 =?us-ascii?Q?kRRccyjnaFRGzZT+fUMSqfjbHfX1UksMqsrz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:11:12.4395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9c9049-c628-4850-154e-08dd834aa209
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Enable selecting the mode in which the domain will be built and ran. This
includes:

  - whether it will be either a 32/64 bit domain
  - if it will be run as a PV or HVM domain
  - and if it will require a device model (not applicable for dom0)

In the device tree, this will be represented as a bit map that will be carried
through into struct boot_domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/boot-domain.h |  5 +++++
 xen/arch/x86/setup.c                   |  3 ++-
 xen/common/domain-builder/fdt.c        | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index d7c6042e25..e316d4bcde 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -13,6 +13,11 @@
 struct boot_domain {
     domid_t domid;
 
+                                          /* On     | Off    */
+#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
+#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
+    uint32_t mode;
+
     struct boot_module *kernel;
     struct boot_module *module;
     const char *cmdline;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ece77079d8..d3a4f89a6a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1029,7 +1029,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
 
-    if ( opt_dom0_pvh )
+    if ( opt_dom0_pvh ||
+         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 5a5b3c8806..75f68de448 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -235,6 +235,27 @@ static int __init process_domain_node(
             bd->domid = val;
             printk(XENLOG_INFO "  domid: %d\n", bd->domid);
         }
+        else if ( !strncmp(prop_name, "mode", name_len) )
+        {
+            if ( (rc = fdt_prop_as_u32(prop, &bd->mode)) )
+            {
+                printk(XENLOG_ERR
+                       "  failed processing mode for domain %s\n", name);
+                return rc;
+            }
+
+            if ( (bd->mode & BUILD_MODE_PARAVIRT)  &&
+                 (bd->mode & BUILD_MODE_ENABLE_DM) )
+            {
+                printk(XENLOG_ERR "  mode: invalid (pv+hvm)\n");
+                return -EINVAL;
+            }
+
+            printk(XENLOG_INFO "  mode: %s\n",
+                   (bd->mode & BUILD_MODE_PARAVIRT)  ? "pv"  :
+                   (bd->mode & BUILD_MODE_ENABLE_DM) ? "hvm" :
+                                                       "pvh");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
-- 
2.43.0


