Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3160A91CF5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957648.1350744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Oiy-0005Mn-Co; Thu, 17 Apr 2025 12:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957648.1350744; Thu, 17 Apr 2025 12:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Oiy-0005Kn-9w; Thu, 17 Apr 2025 12:52:12 +0000
Received: by outflank-mailman (input) for mailman id 957648;
 Thu, 17 Apr 2025 12:52:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgR-0004z9-9b
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20606.outbound.protection.outlook.com
 [2a01:111:f403:2414::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 697859d8-1b8a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:49:34 +0200 (CEST)
Received: from CH2PR08CA0016.namprd08.prod.outlook.com (2603:10b6:610:5a::26)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 12:49:30 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::31) by CH2PR08CA0016.outlook.office365.com
 (2603:10b6:610:5a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 12:49:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:30 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:28 -0500
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
X-Inumbo-ID: 697859d8-1b8a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVQc2Aeg9jbdv4EX449XO2GYgknC7hJ0/9ccEQBvUq8/bkyO7kFLFTwcFiqo9AduS39bLU2iMBwamfSPK+EU7YQP/We8C35mr02sMNqVgAKGmjWDWgm158UTGr4cAtcE7U2Prk41Pgxt7PIzWFremFqncq63x6wOoxRc0xP1yAuNG6HrrLeE+6FFveFDhd7yM462W1g1N0j7rD+seV90ZN2hWfPLrYMGaSmHHkvNjZDDM2m0AVKgFVUqWiFYtlQkYpLIjOuUJS7v9w1t5j3cX61oEoayiY3Ba+PhsqLp3g3XKmTMLnwA5awNF/KL/85QCJ1cZsJhgyCjyJ1jL9C0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2nnxNvapsA9yUyBZa5Q7RA8+C8ztd0XPgOdNnop0rE=;
 b=Jki6TgJ4RLsmvfpLE23ZazzmYtlrsWVy2xLSI7e/EcbTQrn9IT1bYOQLL1f4PFMgImb0e70Y5kx7GjuugkWpt6O7a9Miz2gYSIKlz/VOYm8P5AxHhNKcD2qDR+YG1rvFqjoNSOW0w1/LiHTzEgkdIvacd0WszMjco1lKPQqs7x9OW7KfJrwhBMNhyy81PtkwGYyD5wtxg5L36StdT+wb0jnONKy9M8zXSMZBiNUNZe6mYgO0waKKNttyuTRw9pAx/LuQTwtFLAaxgvCF/oyy/odNaIyct4SN9xr3SmgWVyYqQAA/Cg+k+m/HqOVbCd5P/YKuAYr0DCPKwQlrV0aodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2nnxNvapsA9yUyBZa5Q7RA8+C8ztd0XPgOdNnop0rE=;
 b=Y7Lb8TaEFF9i5TTjvDyeMtuB15gIkOSCuRVsf/Gjjl3lvwT4ZhFYRCY/jj5FLiioSkS3Noj31Zosb3SNvPNuCoxGB/fXrrjZNBlo18rGPQmn5nuAKth4ewd2IXn4JwYnABjFyjgmAAGxGUE6kwpef8ucplNEcmnhVLiEdvpIs6k=
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
Subject: [PATCH v4 13/13] x86/hyperlaunch: add capabilities to boot domain
Date: Thu, 17 Apr 2025 13:48:35 +0100
Message-ID: <20250417124844.11143-14-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: f117c596-c7ab-4ac6-5e14-08dd7dae4b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IkFbHBk/L+k0Ki3LbIxisTfRBwAGVc02Zn/IBw1l6lJOJl37lJ2/ND++cLmT?=
 =?us-ascii?Q?KUg3J1/E7cPxkU0XKd76EMOataaIpvRyvP51aqV1z+ztM32HHKSHuKbf4axV?=
 =?us-ascii?Q?4FPirxqNtFiE+LD9t+SQ1Db8VhzaFixMwWgDndoyVJB+OWk+OhQ5jV5ENDNh?=
 =?us-ascii?Q?zmwMHiGtWyHAgk9XcamU/c3r0NiDoZlJv1mkdBDe+S5SESI6G3MDUjS90nAu?=
 =?us-ascii?Q?goVTKfTJnU0FPpcwNgtuAIRw2dQFVrsj1T+AqCrdhQMWrnAwhg6zQ1WK1bCq?=
 =?us-ascii?Q?/V+x1RGjGDwftHecW5Qki9yzeS+pvfkrUO+0GAuTuDJkneOEEiqFRp/IjByQ?=
 =?us-ascii?Q?G+AQhV+uftOpgeMCBYMQI4XGdOz8VTtDxGEuEgVo4ZzA+Ddr0PjXnBOJ++vD?=
 =?us-ascii?Q?+0lrhMMQnviWWGHatpA1uc09hnHnFCCupi2SiwmpAJZZ3YzSfVYCXHPkhM6Y?=
 =?us-ascii?Q?wxZJrNjKqklcrL+FXPqla+q8UhSrvgiP9cHyqlNHzQg9vi1uv0lrOTLse7aT?=
 =?us-ascii?Q?SzyWwoExgSDc3P5T/ih15H8ZpaR4Pf5KwH6nyg07l3YkqutJRLIsUGQb9XDj?=
 =?us-ascii?Q?VJpwJ82T/s6q9EM2aX8j9E8kOQ3i/WRuygDaWLFIp6i2sy4vEkmBoNoSiYh3?=
 =?us-ascii?Q?89x3mNBa2IZauYwKdEWXDu/eu76lFVwBEfnmXqSOOZErIOrUsS/4ENMWgHWo?=
 =?us-ascii?Q?b/gIiMQe81F2680FZISZYHuXPhoatHTvv8oXbeV0+q7BbOVQFBZ4nUbB2Y7X?=
 =?us-ascii?Q?iHj+dqJ3aKedf0DL21Ymeeb2mqvgY1X9/OfJKB5+f8XeEfCKm73+n3f8vXy9?=
 =?us-ascii?Q?gghHeaHsbHhXRjNrBWvaUgte1eDtzZHOtoFgzDXCSQJxG9VRym6Gn3JWx8OW?=
 =?us-ascii?Q?Yoy3sMpR71dt1jBRGA9dtNOGqOSZgD0WYa5KuDbhrK+b6MOeffRzn+25UY6c?=
 =?us-ascii?Q?lTbfvYfcPilp82jOYFBWKYrikE3vkRDOcyy+9b3IGQeNF0ifG4LbLgkGJ+t0?=
 =?us-ascii?Q?u77mAFc3v2vca+g0uxbAicMNQrjk+bZJ/q0aZD6g5Oo9XSCtDpanXVURxRGo?=
 =?us-ascii?Q?ZN6DYHUwogQwkYybZjvLyOF2Q7JbrP2awC2Tp6pVcb/qLjC4gOE5omrv1B1r?=
 =?us-ascii?Q?rMP8Glcr/gYaEHhanbmqZKT5a8MpZS8GCdEO194W1xB+Q9ANm7dvTZyJjkZD?=
 =?us-ascii?Q?b5AOd2mLEoUmsXsCUGTcgwBQiGkZnsA4++BPAnIrf6XxI3j7LLkUZCnWx+0m?=
 =?us-ascii?Q?Chi1ALo7kYyfTJzH7cvWJnF+vmuK8iQDdkhy/8FUIKRSjBh2iEx0dU3vP9F8?=
 =?us-ascii?Q?yWOC4nkxvah0zDKBQVaBmP5Q0V1mJUtxCut6ptR7SclDEutwnutE2uX4fVZ2?=
 =?us-ascii?Q?BpH6hs4wMpmTFqA0kOYzdkStj5AAEfRGXTvJnqQzeyErMuFWj2rcMDl/oygJ?=
 =?us-ascii?Q?y4tYbghn7T06ly9C9Tbngh5+Cdi8ZGsVLwKiLw/f2i1KA+aJ8IBbk1J9UFF+?=
 =?us-ascii?Q?q3QV/LcZDqWw5rx7fPbIwOicumHcyK0EuY96?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:30.0838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f117c596-c7ab-4ac6-5e14-08dd7dae4b88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the ability to assign capabilities to a domain via its definition in
device tree. The first capability enabled to select is the control domain
capability. The capability property is a bitfield in both the device tree and
`struct boot_domain`.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Dropped Jason's R-by.
  * Refactored caps printinng logic
    * It just wasn't xenlog-compatible as it was.
  * Moved pv_shim check to builder_init, so the capability is just not given.
    * And inlined the create_flags variable now that's tractable.
  * Validated input capabilities after coming out of the DT.
---
 xen/arch/x86/include/asm/boot-domain.h |  5 +++++
 xen/arch/x86/setup.c                   |  3 ++-
 xen/common/domain-builder/core.c       |  2 ++
 xen/common/domain-builder/fdt.c        | 20 ++++++++++++++++++++
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 969c02a6ea..5c143d82af 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -13,6 +13,11 @@
 struct boot_domain {
     domid_t domid;
 
+#define BUILD_CAPS_NONE          (0U)
+#define BUILD_CAPS_CONTROL       (1U << 0)
+#define BUILD_CAPS__ALL          BUILD_CAPS_CONTROL
+    uint32_t capabilities;
+
                                           /* On     | Off    */
 #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
 #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 455dad454c..3cdd8bc2f9 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1040,7 +1040,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( bd->domid == DOMID_INVALID )
         /* Create initial domain.  Not d0 for pvshim. */
         bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    d = domain_create(bd->domid, &dom0_cfg,
+            (bd->capabilities & BUILD_CAPS_CONTROL) ? CDF_privileged : 0);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index 4b4230f2ff..d1a5d6125e 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -8,6 +8,7 @@
 #include <xen/lib.h>
 
 #include <asm/bootinfo.h>
+#include <asm/pv/shim.h>
 #include <asm/setup.h>
 
 #include "fdt.h"
@@ -93,6 +94,7 @@ void __init builder_init(struct boot_info *bi)
 
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
+        bi->domains[0].capabilities |= pv_shim ? 0 : BUILD_CAPS_CONTROL;
         bi->nr_domains = 1;
     }
 }
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 295ab6e8b3..3e3a84e2d0 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -293,6 +293,26 @@ static int __init process_domain_node(
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
+            if ( bd->capabilities & ~BUILD_CAPS__ALL )
+            {
+                printk(XENLOG_WARNING "  unknown capabilities: %#x\n",
+                       bd->capabilities & ~BUILD_CAPS__ALL);
+
+                bd->capabilities &= BUILD_CAPS__ALL;
+            }
+
+            printk(XENLOG_INFO "  caps: %s\n",
+                   bd->capabilities & BUILD_CAPS_CONTROL ? "c" : "");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
-- 
2.43.0


