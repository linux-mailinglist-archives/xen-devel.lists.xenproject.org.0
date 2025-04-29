Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD0CAA0BE7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972458.1360833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kI9-0006zf-Mg; Tue, 29 Apr 2025 12:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972458.1360833; Tue, 29 Apr 2025 12:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kI9-0006wr-J2; Tue, 29 Apr 2025 12:42:29 +0000
Received: by outflank-mailman (input) for mailman id 972458;
 Tue, 29 Apr 2025 12:42:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kE0-0007L9-Rk
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:38:12 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2413::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cef6e47f-24f6-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:38:10 +0200 (CEST)
Received: from BN9PR03CA0695.namprd03.prod.outlook.com (2603:10b6:408:ef::10)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.32; Tue, 29 Apr
 2025 12:38:02 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::20) by BN9PR03CA0695.outlook.office365.com
 (2603:10b6:408:ef::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 12:38:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:38:02 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:55 -0500
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
X-Inumbo-ID: cef6e47f-24f6-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oe/2NEjmfmHomz83XHK0zJVSu4ZQ7WXuIjnJWiZgQEDieBBv8oQyQ7Rg4cpgUOHfGkdKf4w6MbCQFSBjXj/j754KH6GkQewUwx7ozA/AG3ZncKfX8ndFmIzkZuLt1EowXtfKDV2WS1C4XFUgMwn7aT8l8aiLxAhu8S6ykjNLa2GLjP8rN/xrQJsRJij6S0cSh1DECQCqshvj55qvX607uDJ8ueESzelTg6ELSEepWdJgFgzaDym+2Q8tXDylHtDcaDLGkrN65IwtHzZdn81kYxV+S4uzxue1VCzEdlv6DA0mNPvMTdy8Qd3g68qfdL7qTtX1smYb82NickxkorO2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdrPcd9zoT/BI4gBU0jIi7gC5wzisujq/d8JbDCHFRU=;
 b=Hn5gzArXqE8lMrkJkPn+XG6XJtWeHnel5IVA2Yf4cPzs3IhSAZL+QW2ES+3oSXUnot/N5EZK3BKXbuhhShwafn3nKR56b8pGUoCLVpSwB3kqH0HynSe7OuR0RDBNeSVL19ON2iuUC9m+FzeKYMjpkSIlS+ptA7JWDhuo1jB26pjQKUH8I3DgviVpZAwN26bcIZdfDThYOeJig0KjpKhO+J7wyEt3DUVj3o72fn5Up42KarfP62/LM0a5mrfvYn7Z7PlYejWepYOLMfUeqxFQAQvDfEjJ+Pwpmv6B3S00eM4oFrMuDcpLekNteL4UuQVlF5+05lLv6tpR1r42CYBxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdrPcd9zoT/BI4gBU0jIi7gC5wzisujq/d8JbDCHFRU=;
 b=Wgj61LudpQdUMZtjz3/qmMF+3KNlgzVhroi7nlhPkQAGJaS2vIL3tSQAjf915jEEc9yCbW+DXK68W3tn+SzSC/zy232yC2lZ6KcSkjGV0bViF0x4dqBxV4rwrsDS/bTygr19wMBlQwMXDF6Dmc1URS6Tn4sUfe9f/RC8DexxFtY=
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
Subject: [PATCH v6 12/12] x86/hyperlaunch: add capabilities to boot domain
Date: Tue, 29 Apr 2025 13:36:23 +0100
Message-ID: <20250429123629.20839-13-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|DS0PR12MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: af00c7bb-24b6-4137-1092-08dd871aaebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jVSdnhJkxZWgGakZn0rvXHBy3lGgw7KMi99+07pIhDSMFLDDbANsVADi7TcI?=
 =?us-ascii?Q?kS5eJA1Erp/s4mvFKLldTCEzFWBPikUtuVhWKFRNCliCYp4DOqjuKWlbfC3U?=
 =?us-ascii?Q?dYGUUXZL9g/A2j5FPGvOkNNDOOuKeVCwrcFTC0winI+OeL3YIX5CVvz5zDSg?=
 =?us-ascii?Q?8LUskrfQovlLUn7w8QOcsUo9++brUCpmrn3IS1MJcDUP2UDM1vhhy7zrQLX7?=
 =?us-ascii?Q?EOez2zlyzHh5EghqE9ZsYDdk3Q/uk6Up/jwYE4O9tDxrax81NrIH7ezwGZRI?=
 =?us-ascii?Q?ESLW8590E6cuWMSrgsZCwyNXfjph0oZ1RBJbBnrjHI3/ie0Tj9en5OJuewNm?=
 =?us-ascii?Q?ybbgjPCS+BySo2ep8AFWsk6k4UG5OeTe68zZMZMwwRucMG0cyt+X58/2W96p?=
 =?us-ascii?Q?oZys8bR2GrgLL8X6n8ktSLeUM4QcjqMBE87rQvM2/gzjMxzD0FEVbWXl5d3G?=
 =?us-ascii?Q?eFPZ5BQXRnkXYVsyq9SojzZSMLVjA+UXELCwWZQI+kikDlPXRxqadt5FPQLB?=
 =?us-ascii?Q?PxSXB5ExBFloAHDxjIYj6Usik1NMEdsi419pZNhxs1aBZqauBUComxqYz4SF?=
 =?us-ascii?Q?0/plLRup+q7zfMvpbdUOAdOhZ9TBVILxXzab3BKzuktIz5Yy0IiHXTaflyye?=
 =?us-ascii?Q?ZS7H/z0Hm/umQHLfvzQOZIwJXTmyr+uxP6tM1t0BJ6nacwQ6enc4FyshpkdN?=
 =?us-ascii?Q?r/Dp0Ila+Pb5hM1H7I45aGlTzLbJrX1vcdz0xIYghUCN1nzwBTB+A6LcNaTV?=
 =?us-ascii?Q?Fb9Z0b5Qw+4VvDbkMXXcJbWxuMmTy7XcBO5dzXCN20oF1LTT8ZaW380ZDkSW?=
 =?us-ascii?Q?RSS8hrv7HxFzBX4xbSkuFWujYdFSd5d9gUXz35CqTiVR041VU01RW8XyC5Ne?=
 =?us-ascii?Q?I1m4gtHkKw4R+cg63sxWVlTvHtcBNxqXPgTwGNjMxZk+53PEriS/b218LQoc?=
 =?us-ascii?Q?Slx8Sui8Zd0qGJPH73xo7r0+YZ96c3VGlZffudUpkpec6XX/6g98x4Uj32/6?=
 =?us-ascii?Q?j+tqkmsQyBrS+N5Vblh9Jm6eero9Buj1TO9WDFl0KNO9xB1YjvhrCp1E8EMW?=
 =?us-ascii?Q?/Exj7Dyz9C2h6QT3FvGO1nFccOeEiQnxhLOm03S1fePW6vpoVLBynh5P5dx5?=
 =?us-ascii?Q?8vMCBlcGJat7LHZVOUafsPJitB+sCsQWwi/njvDn03wSkQCzxAVnimur6A+C?=
 =?us-ascii?Q?qncuch+UkchAldkMfaKY9ogqYqMZLOCdBNe+fOXNovdReftCaVDadAKTpVTu?=
 =?us-ascii?Q?qNfFCfHcDEkt97Tbt9bCjg+T+qwFInQFqvcnBrIs4L15itd5pHObWfyLsV5i?=
 =?us-ascii?Q?Xi0PGpgpFFaC3NsQxIDr+PYyWnr9dFx9GT7SBtWd9CQqfkIQ2YTdCTvNCTpu?=
 =?us-ascii?Q?iZ7qGeiUG+DMJXG+TYfQXuaBEFChV21AwffCemi92PMCt00OActZlEb7iowr?=
 =?us-ascii?Q?UAYbHiVQQss+Jy1DWCxZq7/ZLVmEvBJ95w1PbcIfEJXPMxt3MXGfS+hqf4Eu?=
 =?us-ascii?Q?1BWmTBT5febpw+z3Ky6RJuADTR7zSabKtnPs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:38:02.6428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af00c7bb-24b6-4137-1092-08dd871aaebb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the ability to assign capabilities to a domain via its definition in
device tree. The capability property is a bitfield in both the device tree and
`struct boot_domain`.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
v6:
  * Reworded the commit message to reflect the fact that the
    DOMAIN_CAPS_HARDWARE is also done here.
  * Conditionalise setting CDF_iommu to DOMAIN_CAPS_HARDWARE being set.
---
 xen/arch/x86/include/asm/boot-domain.h |  3 +++
 xen/arch/x86/setup.c                   |  7 +++++--
 xen/common/domain-builder/fdt.c        | 23 +++++++++++++++++++++++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 969c02a6ea..cb5351241a 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -13,6 +13,9 @@
 struct boot_domain {
     domid_t domid;
 
+    /* Bitmap. See DOMAIN_CAPS_MASK for a list */
+    uint32_t capabilities;
+
                                           /* On     | Off    */
 #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
 #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4a3c41ad71..6a1e874b2e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -62,6 +62,7 @@
 
 #include <xsm/xsm.h>
 
+#include <public/bootfdt.h>
 #include <public/version.h>
 #ifdef CONFIG_COMPAT
 #include <compat/platform.h>
@@ -1044,14 +1045,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
             XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;
     }
 
-    if ( iommu_enabled )
+    if ( iommu_enabled && (bd->capabilities & DOMAIN_CAPS_HARDWARE) )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
     if ( bd->domid == DOMID_INVALID )
         /* Create initial domain.  Not d0 for pvshim. */
         bd->domid = get_initial_domain_id();
     d = domain_create(bd->domid, &dom0_cfg,
-                      pv_shim ? 0 : CDF_privileged | CDF_hardware);
+            ((bd->capabilities & DOMAIN_CAPS_CONTROL)  ? CDF_privileged : 0) |
+            ((bd->capabilities & DOMAIN_CAPS_HARDWARE) ? CDF_hardware   : 0));
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
@@ -1314,6 +1316,7 @@ void asmlinkage __init noreturn __start_xen(void)
         i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
+        bi->domains[0].capabilities = pv_shim ? 0 : DOMAIN_CAPS_MASK;
         bi->nr_domains = 1;
         bi->hyperlaunch_enabled = false;
     }
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 02cfe8085d..232621ae46 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt.h>
+#include <public/bootfdt.h>
 #include <xen/sizes.h>
 
 #include <asm/bootinfo.h>
@@ -313,6 +314,28 @@ static int __init fdt_process_domain_node(
             bd->max_vcpus = val;
             printk(XENLOG_INFO "  cpus: %d\n", bd->max_vcpus);
         }
+        else if ( !strncmp(prop_name, "capabilities", name_len) )
+        {
+            if ( (rc = fdt_prop_as_u32(prop, &bd->capabilities)) )
+            {
+                printk(XENLOG_ERR
+                       "  bad \"capabilities\" on domain %s\n", name);
+                return rc;
+            }
+
+            if ( bd->capabilities & ~DOMAIN_CAPS_MASK )
+            {
+                printk(XENLOG_WARNING "  unknown capabilities: %#x\n",
+                       bd->capabilities & ~DOMAIN_CAPS_MASK);
+
+                bd->capabilities &= DOMAIN_CAPS_MASK;
+            }
+
+            printk(XENLOG_INFO "  caps: %s%s%s\n",
+                   (bd->capabilities & DOMAIN_CAPS_CONTROL)  ? "c" : "",
+                   (bd->capabilities & DOMAIN_CAPS_HARDWARE) ? "h" : "",
+                   (bd->capabilities & DOMAIN_CAPS_XENSTORE) ? "x" : "");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
-- 
2.43.0


