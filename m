Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F49AA0BE2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972437.1360793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHk-0005JK-DZ; Tue, 29 Apr 2025 12:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972437.1360793; Tue, 29 Apr 2025 12:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kHk-0005HE-Az; Tue, 29 Apr 2025 12:42:04 +0000
Received: by outflank-mailman (input) for mailman id 972437;
 Tue, 29 Apr 2025 12:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9kDr-0007KK-HX
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:38:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:200a::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9608161-24f6-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:38:02 +0200 (CEST)
Received: from BN9PR03CA0710.namprd03.prod.outlook.com (2603:10b6:408:ef::25)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 12:37:55 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::b5) by BN9PR03CA0710.outlook.office365.com
 (2603:10b6:408:ef::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 12:37:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 12:37:55 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 07:37:51 -0500
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
X-Inumbo-ID: c9608161-24f6-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTHqwIOhPC0UkysD4e4F4bzbQoYqlfwaE78RmKwAZ7yEE61Wk5AKRL63VAZgyt2Ud+ifwtURbSF0ux54OM86iSlr3fPvkA94LOW5rTFZQ3mybc8bxoOuiZL3H+w2O7ABJXvD9CH6hbijuWsMrcysZacrefmYMeuoOe4UyMBF6rFjDkG85J29a25tWUy+b59yugbqPJ05pBn6Llu4no762p58kJ1IhTlLnvQ0Ww5yrEbwCaoY+xD8HuT2LpFBwqHXt5IFmfmwvQbxUFH4jpFzjbu/DAekwAN+nnTYX0nWQ6C3BA5oK3UVW2J68jNkQOAjRsmVySuPQuO1fSIqBHEoxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ohQ5gUwvFY4l0X5A4KS0w190NIPE0tD/1TucyppGhs=;
 b=F1mOHv3nWNnK/5zyaopk9gBgJ2PdYGxiAGO0ZNte4vh6uUkCsmQ1PjFOGW8ZpJ7ngwb3ISyw/TLk47es45O9mS1zmxV9l7Xu19rQXitbwxBykLkBwy+Ef0vS3XEU7jYxd1qK2a0pUlaWSaZve8P9qJS/7xod7Tq7Q0vLZJ+MO3Alvz0cRk5qub5oZopeJdXq9uhJLlA2qJhrDe63HI0EVTPU6JtFoL/ZYm8pjxim7HDniLzTgctLlr3QI411aSy1UzpBNr+xvQ3RTaOZoZ825V9T+bbJJG4KXFEQbEd1f434N/rxpreF0XjLe8xMqMIQv2W2U+r6YjwY8sAd1ks0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ohQ5gUwvFY4l0X5A4KS0w190NIPE0tD/1TucyppGhs=;
 b=1gkawsEwHaB7AMAQ4JnDNu3RZyOobYaEncIzZjxd3J1g2clZsZCtfSQdwKzz2KivmDxKXgYpHs7retSJ+sdSJgkDkDlfOTPX292Qb+dePusjxRHmzbv0uVLfKq2gHZU8zywSsYP7fQF+dfe5x0vwdAsV9w34M9Or2aZw1ISwChg=
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
Subject: [PATCH v6 11/12] x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
Date: Tue, 29 Apr 2025 13:36:22 +0100
Message-ID: <20250429123629.20839-12-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc510ad-5d17-4a9f-af65-08dd871aaa71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?32lbXCbMnPXdxiXOweGvN1k6BOhaH5ijsJQYqoTB02YpDpOLiSAMGs8dsTi9?=
 =?us-ascii?Q?qBoJb2xfJcctAZtaEym+diOp2INXuNQ+7KABeP2c2gXLG7is+zmYcKKDQkMe?=
 =?us-ascii?Q?9G+NabSm3pWAt3oumFn3YVIL50pyfsEKNWPjBITybKpQRwEsyCOISSXTlwYE?=
 =?us-ascii?Q?Dm9BAPm5iWdgN2ri5UlooUzRH4A3KrC0eBnjb7J49m08recuczb0cAkYRDXl?=
 =?us-ascii?Q?VOXDgel/ZylLOB6/+7qDIi8NPKG44HURABRxUdlK2w7Zalpq8zlHk8cz6NlR?=
 =?us-ascii?Q?xaO5I43nSvJI2k4uqTpMwnQxcc37qG2AlZV3ogrq6dmPyZIRCfiw5aDIA2ZJ?=
 =?us-ascii?Q?/XsUyZiLv27hAdbVmVkALOGKhQOzFfSkoj2DaYCtenyf0xEPz31ibxxa8fyX?=
 =?us-ascii?Q?JrLPulOgdWuyNjCPpM6u3jYX8ow34hxFdkLl0XeDAYDvr7B7h5vOFJA/hQtS?=
 =?us-ascii?Q?Avt5SpWrLU+KrUVsn8AnBwQ8nhEjW5WeXWdivboWShZbQXWsi5OqxFaAOXQ8?=
 =?us-ascii?Q?4V1FoGgryqUudR5N0z4R3xBjt2aC/RBmnH+EUw4s/SUSBHgMBTjXW4+jPcQ8?=
 =?us-ascii?Q?m+PYK/K9U7IzE+E2TCczGwbX2TGbw/i2rLCXt5PLOZoY5yYGnfuZ33Lz2nOT?=
 =?us-ascii?Q?5lKEJD/I3basDB1JgyY+VXYStF/Vnbaex4Rl2YanHpxP69AQGEXRXt3Pfp2a?=
 =?us-ascii?Q?miaQdMwmqhLPBcwXF55ahXChAm9Y01eRBRUeGr5wbJzkqf4jIl3ffvuMupVR?=
 =?us-ascii?Q?vGz6oejnp8DShygBRRUjqtDncNKJrOxI2fin6ZBU3Per98tp2otB7fdVANcp?=
 =?us-ascii?Q?yjHCIy6LNyr9gMS5MA3MSG3JV/pP0A8mwNrRjRvOrLLfsVR2TFLJlW80XOY2?=
 =?us-ascii?Q?ZJZXQ7afSU3j4Z6dHcJv6oFCk5a68dZbTfJPi5lVqQj+3w+QVWt7eIu+5eVr?=
 =?us-ascii?Q?u58Hm7qjgsm4QPvdqfUIHzkZ6zhKKgjUP2Wp64M3U8eZhUuvknwsHHzNMkJV?=
 =?us-ascii?Q?LBAZRWqAUSGuEgv3dx9DS7HQ6EjuMXn+Sf5IZlpHVHyMySbSTkwIc0cE5Z/x?=
 =?us-ascii?Q?npvq4VN2Vg3OYLWhmVT9LwF3FQMMir9oNGWGJEhF9SGNFHBy3vQ6AJA+nCVq?=
 =?us-ascii?Q?vTU3KhRXXj+0mlmmI8WRQvZUzoGKF1uXjrsbnt0d/n4q5EDbMqdn17VfA297?=
 =?us-ascii?Q?bU3WB2u030ztkfO71vkCJDOVcD2BxES9ay07vdy5gYl2Kqcm30/DQ4CHc8zI?=
 =?us-ascii?Q?1AKmLYndvxRDdX7QnXtsBHVuxZsiBCRiS/ZljgYmWHhrfEY9p40Nbd2MPLAF?=
 =?us-ascii?Q?X/C+MV1nkAgqNoyKy4MIp3y2np5nZPsqF1GIzsMEWgtUwUheD3iEckjnIkxH?=
 =?us-ascii?Q?fgyaGFJwZN0PFpM5RM8FxygpzlXfnZyf/Xqx9w5TvKqbe2L3mDby9hQ05q0e?=
 =?us-ascii?Q?O1zY79nKebm6EViSdI7Jeg4Ck6ZHg7+i1Hvqrec++bHCju/CiMNux7j6ql9F?=
 =?us-ascii?Q?c/IDWHyoo6b9SMvIQnz+PD12Up3lEBe8+0Xg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:37:55.4516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc510ad-5d17-4a9f-af65-08dd871aaa71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the `cpus` property, named as such for dom0less compatibility, that
represents the maximum number of vcpus to allocate for a domain. In the device
tree, it will be encoded as a u32 value.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/dom0_build.c              |  3 +++
 xen/arch/x86/include/asm/boot-domain.h |  2 ++
 xen/common/domain-builder/fdt.c        | 11 +++++++++++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 8db24dbc0a..f734104c74 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -635,6 +635,9 @@ int __init construct_dom0(const struct boot_domain *bd)
     if ( !get_memsize(&dom0_max_size, ULONG_MAX) && bd->max_pages )
         dom0_max_size.nr_pages = bd->max_pages;
 
+    if ( opt_dom0_max_vcpus_max == UINT_MAX && bd->max_vcpus )
+        opt_dom0_max_vcpus_max = bd->max_vcpus;
+
     if ( is_hvm_domain(d) )
         rc = dom0_construct_pvh(bd);
     else if ( is_pv_domain(d) )
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index fa8ea1cc66..969c02a6ea 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -22,6 +22,8 @@ struct boot_domain {
     unsigned long min_pages;
     unsigned long max_pages;
 
+    unsigned int max_vcpus;
+
     struct boot_module *kernel;
     struct boot_module *module;
     const char *cmdline;
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index d9babe9d56..02cfe8085d 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -302,6 +302,17 @@ static int __init fdt_process_domain_node(
             bd->max_pages = PFN_DOWN(kb * SZ_1K);
             printk(XENLOG_INFO "  max memory: %lu KiB\n", kb);
         }
+        else if ( !strncmp(prop_name, "cpus", name_len) )
+        {
+            uint32_t val = UINT32_MAX;
+            if ( (rc = fdt_prop_as_u32(prop, &val)) )
+            {
+                printk(XENLOG_ERR "  bad \"cpus\" prop on domain %s\n", name);
+                return rc;
+            }
+            bd->max_vcpus = val;
+            printk(XENLOG_INFO "  cpus: %d\n", bd->max_vcpus);
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
-- 
2.43.0


