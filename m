Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC4A91CE7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957571.1350734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OhQ-0003g1-3N; Thu, 17 Apr 2025 12:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957571.1350734; Thu, 17 Apr 2025 12:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OhQ-0003dj-0h; Thu, 17 Apr 2025 12:50:36 +0000
Received: by outflank-mailman (input) for mailman id 957571;
 Thu, 17 Apr 2025 12:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgY-00057t-Vs
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:42 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2408::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a289ece-1b8a-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 14:49:35 +0200 (CEST)
Received: from CH2PR08CA0012.namprd08.prod.outlook.com (2603:10b6:610:5a::22)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 12:49:28 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::ae) by CH2PR08CA0012.outlook.office365.com
 (2603:10b6:610:5a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Thu,
 17 Apr 2025 12:49:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:28 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:26 -0500
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
X-Inumbo-ID: 6a289ece-1b8a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqKBY9uuzrZeG8VyCQrcc2AMyuBdQy2crY0Zmvpln6yZAxEeuH13TNhe2fkgwFJRYVPBD1FHMxYNFjPHVofl94Hx1d8Fr4lI8dE+G9awf9VcGIe0Lwqb2At1Vba5k4l+64MPnVkHXIlPm3d9B/mGkhCa62SWx+pkyptfQ0QuF5KVT15SMD33UxUEwZ+Eptx5FSUOGFEVLhg3FXz797OYvUnfjPXzypW71vOWFaVlml38RyiEnx2y0sgyHbExvYTSJ63nQjhp9c6zueAUGuZt1/J6tH0b7aiNkB9DD6PQY3iDI2ysFodEUT6KuPuErBzsFeQcLEMFxgmTxJrni5bTUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIJkN+3c1EWUrjFtQMc+TsOgczooD2A+KBZlgPJDObc=;
 b=DyZ2BW+QhaeVdkoX5jUOl4iV2sQ/f8UX8tsUmKSI10SQVvS46L16P/MuWc/DZfMwHFRJmpbO6aor3qmGrXZhcLzAmwpSPljcuSXSFdP2GaSwPMCQKf2Cc7ooO5OLqekROMDzFzZwTKK4AtBVZhQaJePJZBn8PR+e6/vSD79Rxw6K20trnRYgj3MlECVFAD2YI0ytr4niImOIHYsF8SPywTEi3VUGSUPv68UhxJ2XRUDsWASlco1MmzKITvdMLVk0+BSkAB1hFJaj+2Adm4o+84pHEsEZk7+koWik0uTdgc/hzYUp1Ia20X06SxlZsMPKMCUoi5pqDpquLqANBxHKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIJkN+3c1EWUrjFtQMc+TsOgczooD2A+KBZlgPJDObc=;
 b=MlqXcHi4yRSvVMc60IUcAFy+cBgtOOrH7I+TaA1M/TWdgLMXrDIGaU0pMa72biv+DjlWv9kHRTPbIEDqEsN7RJ/vPP2d6/X1BgaNXuX377sAlJ1OpOlEKubtJtS4edx9hVUqItIXsyQeAHzt8t4juwo6d6NQcFpau9/DXALmF2s=
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
Subject: [PATCH v4 12/13] x86/hyperlaunch: add max vcpu parsing of hyperlaunch device tree
Date: Thu, 17 Apr 2025 13:48:34 +0100
Message-ID: <20250417124844.11143-13-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f54461a-9e62-4578-e7f8-08dd7dae4a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ldXQztjZoEawu0Rkep53b/6TnfDeDTA+zW+BLNFsc9V1aV6rJXJQ/TbmJNK6?=
 =?us-ascii?Q?D/vKmvNxCSNfAs468FzF4cDbIPibo9O6vcPVIVdSsCklF35PMxw6SDABGDtl?=
 =?us-ascii?Q?GAJl2oye/ay7dAde+XRo+2riQzTmCjjMzoJJstk54HAOZc5ypw3FownB4Zhb?=
 =?us-ascii?Q?MEQ3QRUsu6znItUJKcd2WXYBNThmopIQWBsCFVAjRTlIaLFBowXtt7GWcLf7?=
 =?us-ascii?Q?a9W2q1ukYZeZsJB7i/DYjA4lR5IiktbZTfAYGp3+Tn7Ix6ptv0DT3gkxB6j0?=
 =?us-ascii?Q?dlxmpq05+2L+jjm3M3KtD0cNorOOo7WQYijuJhzC1Fn9GL2UjMKd920HjbSh?=
 =?us-ascii?Q?LTjaX0Bek0+QaXOJjH2uxw4FkgfRchr71Nv/FnaKnycXVjkQdfHuXzDnpXO5?=
 =?us-ascii?Q?xnjaMHimgjImJrNYdgl/UbU3H5X9uRzgMrVXmW1o1EYGc8x5VtQUpfSTZGAh?=
 =?us-ascii?Q?UHsCKiNdhAJ4qyyQCQgGcUHkkQztUI0idRNk0ucBw7SaZH2q9Bo1yDTj1H8L?=
 =?us-ascii?Q?XKeeQQLdfuorpd6biVZOgxRdo/+YxwUi928aO/zzQ/tZtYzTYjSe2oziNbt+?=
 =?us-ascii?Q?90Cu1JOSALcZE3AHndS8aoBKSLkgyS7+Taxe15nEJAQAXf2CGux5iN9w4uGf?=
 =?us-ascii?Q?h7uJaHkB/Z/FcOYoa/yYNuyKo3+C8aIhH9nTbj8G4ce4+NI4XfGoxd5UFl8s?=
 =?us-ascii?Q?kYrwQmsjY3dcvWaE+TZoq0T8kcm4ZWbHYYPfFixLxLOnM+pgmccuwetAUKzu?=
 =?us-ascii?Q?3PSJ8SIdM68BJWVlaUiqDYmu7+XMa3V4WeJNH7xvY8oUs3QDTjcoGG7XdnRq?=
 =?us-ascii?Q?fpYjukCJ6d9CKfEqPjnqQqFh6UnLykusNk30u/ZmxF5REHsPFCPZsE+f0E9C?=
 =?us-ascii?Q?tUosS9Y/N75TBzDirYyqOhURooBTwsVBEy6E+xTsUgQLYj/n+NGezW7nD+3z?=
 =?us-ascii?Q?lcjz6qWyfFbqggBdpn2qvMzb5v2p7TmMX8dz4z2c+nfvduwrXDWTTBuotsmt?=
 =?us-ascii?Q?luS5bPJRZrftxiTOdMd8jmq2kReSI/Q6UMIoaFE8Qeqt2HU5KO1lPoQISbYk?=
 =?us-ascii?Q?HkeCrQfQtptfj1TsmNG7aCaHOyde5qGmHHgpqajtPbXAXbeoTyvwDL+OtWsf?=
 =?us-ascii?Q?+Vh2ERgvZJy7Upa82jGRH/S0FwpkGGy63ED/8O5T+L+PTdvArEWPyZ65CB9J?=
 =?us-ascii?Q?rcofO0RK8OsLc9HnmMOe2FnI5fPjAdgyNSPa6VWJLRBByICJH9mPI64y5llQ?=
 =?us-ascii?Q?hj2HGMPLM0QOoExiMVxce1Yj88IqtkaaBhIm9cDEYJZA6+yXZMfanc0pVr25?=
 =?us-ascii?Q?aqemY/UPjKdscKINqcVS2GVcKpGEDnB9qVXcmQGRjfGWZytY0emIRFlMo+T6?=
 =?us-ascii?Q?ElRKvwMb2aBn3lycoWkwTx5Vie3tgmJCTIGQiCMljYekEvkn17Bjix9hT/on?=
 =?us-ascii?Q?xZkhyCT+wpXc7k+IHKQ/nkyoOBi24CdsPPjtYBKSVnaUx5q/t8Psa8RVQ9IX?=
 =?us-ascii?Q?7MII6n/SQtRUxCzZywubhx+V7zHBX4mn0vcW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:28.4555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f54461a-9e62-4578-e7f8-08dd7dae4a8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the `cpus` property, named as such for dom0less compatibility, that
represents the maximum number of vcpus to allocate for a domain. In the device
tree, it will be encoded as a u32 value.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * s/UINT_MAX/UINT32_MAX/ (cosmetic, but...)
  * s/vpcpus/vcpus/ in commit message.
  * Reworded printk()
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
index 90218d120a..295ab6e8b3 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -282,6 +282,17 @@ static int __init process_domain_node(
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


